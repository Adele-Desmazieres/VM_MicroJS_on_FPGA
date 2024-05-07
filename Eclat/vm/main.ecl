let load_bytecode0() =
  code.(0) <- I_PUSH (Int 42);
  code.(1) <- I_POP () ;;  
  (* devrait afficher 42 *)


let load_bytecode1() =
  code.(0) <- I_PUSH (Int 42);
  code.(1) <- I_PUSH (Int 1);
  code.(2) <- I_PUSH (Prim (P_ADD()));
  code.(3) <- I_CALL(2);
  code.(4) <- I_POP () ;;
  (* devrait afficher 43 *)


let load_bytecode2() =
  code.(0) <- I_PUSH (Int 42);
  code.(1) <- I_PUSH (Int 1);
  code.(2) <- I_PUSH (Prim (P_ADD()));
  code.(3) <- I_CALL(2);
  code.(4) <- I_PUSH (Int 5);
  code.(5) <- I_PUSH (Prim (P_MUL()));
  code.(6) <- I_CALL(2);
  code.(7) <- I_POP () ;;
  (* devrait afficher 48 *)


let load_bytecode3() =
  code.(0) <- I_GALLOC ();      (* N := 10 *)
  code.(1) <- I_PUSH (Int 10);   
  code.(2) <- I_GSTORE(0);

  code.(3) <- I_GALLOC ();      (* ACC := 0 *)
  code.(4) <- I_PUSH (Int 0);   
  code.(5) <- I_GSTORE(1);

  (* "debut boucle:" *)
  code.(6) <- I_GFETCH(0);      (* ACC := ACC + N *)
  code.(7) <- I_GFETCH(1); 
  code.(8) <- I_PUSH(Prim (P_ADD()));
  code.(9) <- I_CALL(2);
  code.(10) <- I_GSTORE(1);

  code.(11) <- I_GFETCH(0);     (* goto "fin boucle:" si (N == 0) *)
  code.(12) <- I_PUSH (Int 0);
  code.(13) <- I_PUSH (Prim (P_EQ()));
  code.(14) <- I_CALL(2);
  code.(15) <- I_JTRUE 22;

  code.(16) <- I_GFETCH(0);     (* N := N - 1 *)
  code.(17) <- I_PUSH(Int 1);
  code.(18) <- I_PUSH(Prim (P_SUB()));
  code.(19) <- I_CALL(2);
  code.(20) <- I_GSTORE(0);

  code.(21) <- I_JUMP(6);      (* goto "debut boucle:" *)

 (* "fin boucle:" *)
  code.(22) <- I_GFETCH(1);
  code.(23) <- I_POP() ;;
  (* devrait afficher 55 *)


let init_state = ((0,0,0,0),0,0,(false,(0,Nil())),false) ;;

let run_vm (debug:bool) =
  (* array_init (ram,Nil()); *)
  vm_run_code (init_state,debug);;


let counter (b:bool) =
  reg (fun c -> if b then c + 1 else c) last 0 ;;

let load load_bytecode =
  reg (fun is_loaded -> 
      if is_loaded then true else
      let ((),rdy) = exec
                       load_bytecode()
                     default ()
      in rdy)
  last false ;;

let display_start cy =
   print_string "START (cy="; print_int cy; print_string ")"; print_newline () ;;

let display_end cy =
  print_string "END (cy="; print_int cy; print_string ")"; print_newline (); print_newline () ;;



let main debug =
  (** chargement du programme *)
  let is_loaded = load load_bytecode2 in

  let cy = counter (is_loaded) in

  let ((),rdy) = exec 
                    display_start cy; run_vm debug
                 default ()
  in
  if rdy then display_end cy else () ;;



(**

$ make
$ make simul NS=15000

START (cy=0)
DISPLAY> 55 
END (cy=1012) 

 *)