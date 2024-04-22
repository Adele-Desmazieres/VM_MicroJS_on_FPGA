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
   - un buffer d'écriture postée [write_buf],comportement un booléen 
        (qui indique quand une écriture doit avoir lieu), 
        une adresse à écrire et la nouvelle valeur.
   - un booléen [finished] qui passe à vrai à la fin de l'exécution,
     en particulier lors de l'exécution d'une instruction POP
     sur une pile de 1 élément. *)

type vm_state = (frame * ptr * ptr * (bool * (ptr * value)) * bool)


let print_vm_state ((frame,gp,hp,_,_):vm_state) : unit =
  print_frame frame;
  print_string "|gp:"; print_int gp;
  print_string "|hp:"; print_int gp;
  print_newline();;
  
(* exécution d'une instruction du programme, le [pc] 
   courrant est dans l'état de la VM (state) *)
let vm_run_instr (state : vm_state) : vm_state =
  let (frame,gp,hp,wb,finished) = state in
  let (sp,env,pc,fp) = frame in
  let instr = code.(pc) in
  
  if (finished) then
    (print_int v; print_newline (); exit ())
  else
    match instr with
      | I_GALLOC u ->
          if gp+1 > global_size then fatal_error("Globals memory full")
          else (frame, gp+1, hp, wb, finished)
      | I_GSTORE p -> (globals.(gp) <- p; (frame, gp+1, hp, write_buf, finished))
      | I_GFETCH p -> (globale)
      | I_STORE p -> (j)
      | I_FETCH p -> ()
      | I_PUSH v -> stack.(sp) <- v; (((sp+1), env, pc+1, fp), gp, hp write_buf, finished)
      (* | I_PUSH_FUN p -> () *)
      | I_POP () ->
        let r = stack.(sp-1) in
        if sp-1 = 0 then (frame, gp, hp, write_buf, true)
        else (((sp-1), env, pc+1, fp), gp, hp write_buf, finished)
      | _ -> fatal_error("Not implemented")
      (* | I_CALL l (* arity *) -> ()
      | I_RETURN () -> ()
      | I_JUMP p -> ()
      | I_JTRUE p -> ()
      | I_JFALSE p -> () *)
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
  vm_run_code(((sp,env,next_pc,fp),gp,hp,write_buf,finished),debug) ;; 
