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

let check_arity ((arity1, arity2): long * long) : unit =
  if arity1 != arity2 then 
    fatal_error("Arité de la primitive erronnée")
  else ()
;;

let rec power((base, exp, accu): int<32> * int<32> * int<32>): int<32> =
  if exp = 0 then 1 * accu
  else power(base, exp-1, accu * base)
;;

(* value array<'a> * int *)
let get_int_from_stack(curr_sp:int<32>) : int<32> =
  (* print_value (stack.(curr_sp)); *)
  match stack.(curr_sp) with
  | Int i -> i
  | _ -> fatal_error("Not an integer value")
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

let print_stack_content (sp) : unit = 
  for i = 0 to (sp-1) do
    print_value (stack.(i));
    print_string " "
  done;
  print_newline ()
;;

let print_stack (sp) : unit =
  print_string "Stack (bottom to top) : ";
  print_stack_content sp;
  print_newline ()
;;

let print_vm_state ((frame,gp,hp,_,_):vm_state) : unit =
  let (sp, env, pc, fp) = frame in
  let instr = code.(pc) in
  print_frame frame;
  print_string "|gp:"; print_int gp;
  print_string "|hp:"; print_int gp;
  print_string "|code:"; print_instr instr;
  print_newline()
;;

(* exécution d'une instruction du programme, le [pc] 
   courrant est dans l'état de la VM (state) *)
let vm_run_instr (state : vm_state) : vm_state =
  let (frame, gp, hp, wb, finished) = state in
  let (sp, env, pc, fp) = frame in
  let instr = code.(pc) in
  match instr with
    | I_GALLOC () ->
        if gp+1 > global_size then fatal_error("Globals memory full")
        else (frame, gp+1, hp, wb, finished)
    | I_GSTORE p -> (globals.(p) <- stack.(sp-1); ((sp-1, env, pc, fp), gp, hp, wb, finished))
    | I_GFETCH p -> (stack.(sp) <- globals.(p); ((sp+1, env, pc, fp), gp, hp, wb, finished))
    | I_STORE p -> (heap.(env+p) <- stack.(sp-1); ((sp-1, env, pc, fp), gp, hp, wb, finished))
    | I_FETCH p -> (stack.(sp) <- heap.(env+p); ((sp+1, env, pc, fp), gp, hp, wb, finished))
    | I_PUSH v -> stack.(sp) <- v; ((sp+1, env, pc, fp), gp, hp, wb, finished)
    | I_POP () ->
        let r = stack.(sp-1) in
        if sp-1 = 0 then
          (print_value r; print_newline (); (frame, gp, hp, wb, true))
        else ((sp-1, env, pc, fp), gp, hp, wb, finished)

    | I_CALL n (* arity *) ->
        let v = stack.(sp-1) in 
        match v with
        | Prim pt ->
          let res =
            match pt with
            | P_ADD () -> check_arity (n, 2); Int (get_int_from_stack(sp-2) + get_int_from_stack(sp-3))
            | P_SUB () -> check_arity (n, 2); Int (get_int_from_stack(sp-2) - get_int_from_stack(sp-3))
            | P_MUL () -> check_arity (n, 2); Int (get_int_from_stack(sp-2) * get_int_from_stack(sp-3))
            | P_DIV () -> check_arity (n, 2); Int (get_int_from_stack(sp-2) / get_int_from_stack(sp-3))
            | P_POW () -> check_arity (n, 2); Int (power(get_int_from_stack(sp-2), get_int_from_stack(sp-3), 1))
            | P_EQ () -> check_arity (n, 2); Bool (equality (stack.(sp-2), stack.(sp-3)))
            | P_LT () -> check_arity (n, 2); Bool (get_int_from_stack(sp-2) < get_int_from_stack(sp-3))
            | _ -> Bool false
            end
          in
          (stack.(sp-n-1) <- res;
          ((sp-n, env, pc, fp), gp, hp, wb, finished))

        | Closure (code_ptr, old_env) ->
            let new_hp = hp + n + 1 in
            if new_hp > heap_size then
              fatal_error("not enough heap memory")
            else (
              let new_env = hp in
              heap.(new_env) <- Header old_env;
              for i = 1 to n do
                heap.(new_env + i) <- stack.(sp-i-1)
              done;
              frames.(fp+1) <- (sp-1-n, new_env, code_ptr, fp);
              let new_frame = (sp-n, new_env, code_ptr-1, fp+1) in
              (new_frame, gp, new_hp, wb, finished)
            )
        | _ -> fatal_error("I_CALL on something else than a primitive.")
        end


    | I_JUMP p -> ((sp, env, p-1, fp), gp, hp, wb, finished)
    | I_JTRUE ptr1 ->
        (* print_value (stack.(sp-1)); *)
        match stack.(sp-1) with
        | Bool condi ->
            if condi then
              ((sp-1, env, ptr1-1, fp), gp, hp, wb, finished)
            else
              ((sp-1, env, pc, fp), gp, hp, wb, finished)
        | _ -> fatal_error("jtrue on non boolean")
        end
    | I_JFALSE ptr2 ->
        match stack.(sp-1) with
        | Bool condi ->
            if not condi then
              ((sp-1, env, ptr2-1, fp), gp, hp, wb, finished)
            else
              ((sp-1, env, pc, fp), gp, hp, wb, finished)
        | _ -> fatal_error("jfalse on non boolean")
        end

    | I_PUSH_FUN p -> (stack.(sp) <- Closure(p, env); ((sp+1, env, p-1, fp), gp, hp, wb, finished))
    | I_RETURN () ->
        let return_val = stack.(sp-1)
        and old_frame = frames.(fp-1) in
        let (o_sp, o_env, o_pc, o_fp) = old_frame in
        stack.(o_sp) <- return_val;
        ((o_sp+1, o_env, o_pc+1, o_fp), gp, hp, wb, finished)
  end
;;

(* exécution d'un programme (stocké dans le tableau global [bytecode] *)
let rec vm_run_code ((state,debug) : vm_state * bool) : unit =
  (if debug then print_vm_state state else ()); (* affichage de l'état de la VM *)
  let (frame,gp,hp,write_buf,finished) = vm_run_instr(state) in
  if finished then () else 
  let (sp,env,pc,fp) = frame in
  let next_pc = pc+1 in
  (* fait [pc+1] après chaque instruction exécutée : 
     en cas de changement de pc par l'instruction d'avant (branchements, etc.), 
     il faudra vers [nouveau_pc-1]) *)
  
  (if debug then print_stack sp else ()); (* affichage de l'état de la VM *)
  vm_run_code(((sp,env,next_pc,fp),gp,hp,write_buf,finished),debug) ;; 
