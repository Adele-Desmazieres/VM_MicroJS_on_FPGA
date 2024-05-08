(* le type des instructions de la VM *)
type instr =
  I_GALLOC of unit
  | I_GSTORE of ptr
  | I_GFETCH of ptr
  | I_STORE of ptr
  | I_FETCH of ptr
  | I_PUSH of value
  | I_PUSH_FUN of ptr
  | I_POP of unit
  | I_CALL of long (* arity *)
  | I_RETURN of unit
  | I_JUMP of ptr
  | I_JTRUE of ptr
  | I_JFALSE of ptr

(* l'état de la VM comprend (dans l'ordre) :
   - un bloc d'activation
   - un pointeur [gp] sur la prochaine variable globale à allouer
   - un pointeur [hp] sur la prochaine adresse libre dans le tas
   - un buffer d'écriture postée [wb],comportement un booléen 
        (qui indique quand une écriture doit avoir lieu),
        une adresse à écrire et la nouvelle valeur.
   - un booléen [finished] qui passe à vrai à la fin de l'exécution,
     en particulier lors de l'exécution d'une instruction POP
     sur une pile de 1 élément. *)

type vm_state = (frame * ptr * ptr * (bool * (ptr * value)) * bool)

(* fonctions utilitaires *)
let rec power((base, exp, accu): int<32> * int<32> * int<32>): int<32> =
  if exp = 0 then 1 * accu
  else power(base, exp-1, accu * base)
;;

let get_int_from_stack(curr_sp:int<32>) : int<32> =
  match stack.(curr_sp) with
  | Int i -> i
  | _ -> print_value (stack.(curr_sp)); fatal_error(" not an integer value")
  end
;;

let equality((v1, v2): value * value) : bool =
  match v1 with
  | Bool b1 ->
    match v2 with
    | Bool b2 -> not(b1 xor b2)
    | _ -> fatal_error("Type error: comparison between incompatible types.")
    end
  | Int n1 -> 
    match v2 with
    | Int n2 -> n1 = n2
    | _ -> fatal_error("Type error: comparison between incompatible types.")
    end
  | Nil () ->
    match v2 with
    | Nil () -> true
    | _ -> fatal_error("Type error: comparison between incompatible types.")
    end
  | _ -> fatal_error("Type error: incompatible type for equality check.")
  end
;;

let rec env_fetch((env, offset):  ptr * ptr) : value =
  let curr = heap.(env) in
  if offset = 0 then
    match curr with
    | Header other_env -> env_fetch (other_env, 0)
    | _ -> curr
    end
  else
    match curr with
    | Header other_env -> env_fetch (other_env, offset)
    | _ -> env_fetch (env+1, offset-1)
    end
;;

(* fonctions déboggage *)
let print_instr (instruction : instr) : unit =
  match instruction with
  | I_GALLOC _ -> print_string "galloc"
  | I_GSTORE _ -> print_string "gstore"
  | I_GFETCH _ -> print_string "gfetch"
  | I_STORE _ -> print_string "store"
  | I_FETCH _ -> print_string "fetch"
  | I_PUSH _ -> print_string "push"
  | I_PUSH_FUN _ -> print_string "push_fun"
  | I_POP _ -> print_string "pop"
  | I_CALL _ -> print_string "call"
  | I_RETURN _ -> print_string "return"
  | I_JUMP _ -> print_string "jump"
  | I_JTRUE _ -> print_string "jtrue"
  | I_JFALSE _ -> print_string "jfalse"
  end
;;

let print_stack (sp) : unit =
  print_string "Stack   : ";
  for i = 0 to (sp-1) do
    print_value (stack.(i));
    print_string " "
  done;
  print_newline ()
;;

let print_heap (hp) : unit =
  print_string "Heap    : ";
  for i = 0 to (hp-1) do
    print_value (heap.(i));
    print_string " "
  done;
  print_newline ()
;;

let print_globals (gp) : unit =
  print_string "Globals : ";
  for i = 0 to (gp-1) do
    print_value (globals.(i));
    print_string " "
  done;
  print_newline ()
;;

let print_vm_state ((frame,gp,hp,_,_):vm_state) : unit =
  let (sp, env, pc, fp) = frame in
  let instr = code.(pc) in
  print_frame frame;
  print_string "|gp:"; print_int gp;
  print_string "|hp:"; print_int hp;
  print_string "|code:"; print_instr instr;
  print_newline()
;;

(* exécution d'une instruction du programme, le [pc] 
   courrant est dans l'état de la VM (state) *)
let vm_run_instr (state : vm_state) : vm_state =
  let (frame, gp, hp, wb, finished) = state in
  let (sp, env, pc, fp) = frame in
  let (wb_should_write, (wb_ptr, wb_val)) = wb in
  let instr = code.(pc)
  and stack_head = if sp = 0 then (Bool false) else (stack.(sp-1))
  and () = (if wb_should_write then globals.(wb_ptr) <- wb_val else ()) in
  match instr with
    | I_GALLOC () ->
        if gp+1 > global_size then fatal_error("Globals memory full")
        else (frame, gp+1, hp, wb, finished)
    | I_GSTORE p ->
        let new_wb = (true, (p, stack_head)) in
        globals.(p) <- stack_head; ((sp-1, env, pc, fp), gp, hp, new_wb, finished)
    | I_GFETCH p -> stack.(sp) <- globals.(p); ((sp+1, env, pc, fp), gp, hp, wb, finished)
    | I_STORE p -> heap.(env+p) <- stack_head; ((sp-1, env, pc, fp), gp, hp, wb, finished)
    | I_FETCH p -> stack.(sp) <- (env_fetch (env, p)); ((sp+1, env, pc, fp), gp, hp, wb, finished)
    | I_PUSH v -> stack.(sp) <- v; ((sp+1, env, pc, fp), gp, hp, wb, finished)
    | I_POP () ->
        let r = stack_head in
        if sp-1 = 0 then
          (print_value r; print_newline (); (frame, gp, hp, wb, true))
        else ((sp-1, env, pc, fp), gp, hp, wb, finished)

    | I_CALL n (* arity *) ->
        let v = stack_head in 
        match v with
        | Prim pt ->
          let res = match pt with
          | P_ADD () -> Int (get_int_from_stack(sp-2) + get_int_from_stack(sp-3))
          | P_SUB () -> Int (get_int_from_stack(sp-2) - get_int_from_stack(sp-3))
          | P_MUL () -> Int (get_int_from_stack(sp-2) * get_int_from_stack(sp-3))
          | P_DIV () -> Int (get_int_from_stack(sp-2) / get_int_from_stack(sp-3))
          | P_POW () -> Int (power(get_int_from_stack(sp-2), get_int_from_stack(sp-3), 1))
          | P_EQ () -> Bool (equality (stack.(sp-2), stack.(sp-3)))
          | P_LT () -> Bool (get_int_from_stack(sp-2) < get_int_from_stack(sp-3))
          | P_GT () -> Bool (get_int_from_stack(sp-2) > get_int_from_stack(sp-3))
          end
          in
          (stack.(sp-n-1) <- res;
          ((sp-n, env, pc, fp), gp, hp, wb, finished))

        | Closure (closue_pc, closue_env) ->
            let new_hp = hp + n + 1 in
            if new_hp > heap_size then
              fatal_error("not enough heap memory")
            else (
              let new_env = hp in
              for i = 0 to n-1 do
                heap.(new_env+i) <- stack.(sp-i-2)
              done;
              heap.(new_env + n) <- Header closue_env;
              let new_sp = sp-n-1 in
              let new_fp = fp+1 in
              frames.(new_fp) <- (new_sp, env, pc, fp);
              let new_frame = (new_sp, new_env, closue_pc-1, new_fp) in
              (new_frame, gp, new_hp, wb, finished)
            )
        | _ -> fatal_error("I_CALL on something else than a primitive or a closure.")
        end

    | I_JUMP p -> ((sp, env, p-1, fp), gp, hp, wb, finished)
    | I_JTRUE ptr1 ->
        match stack_head with
        | Bool condi ->
            if condi then
              ((sp-1, env, ptr1-1, fp), gp, hp, wb, finished)
            else
              ((sp-1, env, pc, fp), gp, hp, wb, finished)
        | _ -> fatal_error("jtrue on non boolean")
        end
    | I_JFALSE ptr2 ->
        match stack_head with
        | Bool condi ->
            if not condi then
              ((sp-1, env, ptr2-1, fp), gp, hp, wb, finished)
            else
              ((sp-1, env, pc, fp), gp, hp, wb, finished)
        | _ -> fatal_error("jfalse on non boolean")
        end

    | I_PUSH_FUN p -> (stack.(sp) <- Closure(p, env); ((sp+1, env, pc, fp), gp, hp, wb, finished))
    | I_RETURN () ->
        let old_frame = frames.(fp) in
        let (o_sp, o_env, o_pc, o_fp) = old_frame in
        stack.(o_sp) <- stack_head;
        ((o_sp+1, o_env, o_pc, o_fp), gp, hp, wb, finished)
  end
;;

(* exécution d'un programme (stocké dans le tableau global [bytecode] *)
let rec vm_run_code ((state,debug) : vm_state * bool) : unit =
  ( (* affichage de l'état de la VM *)
    if debug then
      let (frame,gp,hp,write_buf,finished) = state in
      let (sp,env,pc,fp) = frame in
      print_globals gp;
      print_stack sp;
      print_heap hp;
      print_vm_state state;
      print_newline ()
    else ()
  );
  let (frame,gp,hp,write_buf,finished) = vm_run_instr(state) in
  if finished then () else 
  let (sp,env,pc,fp) = frame in
  let next_pc = pc+1 in
  (* fait [pc+1] après chaque instruction exécutée : 
     en cas de changement de pc par l'instruction d'avant (branchements, etc.), 
     il faudra vers [nouveau_pc-1]) *)
  vm_run_code(((sp,env,next_pc,fp),gp,hp,write_buf,finished),debug) ;; 
