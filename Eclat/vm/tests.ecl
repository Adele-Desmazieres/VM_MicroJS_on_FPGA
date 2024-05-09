let bc_add () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_PUSH (Int 42);
  code.(2) <- I_GSTORE 0;
  code.(3) <- I_GALLOC();
  code.(4) <- I_PUSH (Int 1);
  code.(5) <- I_GSTORE 1;
  code.(6) <- I_GFETCH 1;
  code.(7) <- I_GFETCH 0;
  code.(8) <- I_PUSH (Prim (P_ADD()));
  code.(9) <- I_CALL (2);
  code.(10) <- I_POP();
  ()
;; (* 43 *)

let bc_delta () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_JUMP 18;
  code.(2) <- I_FETCH 2;
  code.(3) <- I_FETCH 0;
  code.(4) <- I_PUSH (Int 4);
  code.(5) <- I_PUSH (Prim (P_MUL()));
  code.(6) <- I_CALL (2);
  code.(7) <- I_PUSH (Prim (P_MUL()));
  code.(8) <- I_CALL (2);
  code.(9) <- I_FETCH 1;
  code.(10) <- I_FETCH 1;
  code.(11) <- I_PUSH (Prim (P_MUL()));
  code.(12) <- I_CALL (2);
  code.(13) <- I_PUSH (Prim (P_SUB()));
  code.(14) <- I_CALL (2);
  code.(15) <- I_RETURN();
  code.(16) <- I_PUSH (Nil());
  code.(17) <- I_RETURN();
  code.(18) <- I_PUSH_FUN (2);
  code.(19) <- I_GSTORE 0;
  code.(20) <- I_PUSH (Int 3);
  code.(21) <- I_PUSH (Int 2);
  code.(22) <- I_PUSH (Int 1);
  code.(23) <- I_GFETCH 0;
  code.(24) <- I_CALL (3);
  code.(25) <- I_POP();
  ()
;; (* -8 *)

let bc_fact_de_6 () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_JUMP 22;
  code.(2) <- I_PUSH (Int 2);
  code.(3) <- I_FETCH 0;
  code.(4) <- I_PUSH (Prim (P_LT()));
  code.(5) <- I_CALL (2);
  code.(6) <- I_JFALSE 10;
  code.(7) <- I_PUSH (Int 1);
  code.(8) <- I_RETURN();
  code.(9) <- I_JUMP 20;
  code.(10) <- I_PUSH (Int 1);
  code.(11) <- I_FETCH 0;
  code.(12) <- I_PUSH (Prim (P_SUB()));
  code.(13) <- I_CALL (2);
  code.(14) <- I_GFETCH 0;
  code.(15) <- I_CALL (1);
  code.(16) <- I_FETCH 0;
  code.(17) <- I_PUSH (Prim (P_MUL()));
  code.(18) <- I_CALL (2);
  code.(19) <- I_RETURN();
  code.(20) <- I_PUSH (Nil());
  code.(21) <- I_RETURN();
  code.(22) <- I_PUSH_FUN (2);
  code.(23) <- I_GSTORE 0;
  code.(24) <- I_PUSH (Int 6);
  code.(25) <- I_GFETCH 0;
  code.(26) <- I_CALL (1);
  code.(27) <- I_POP();
  ()
;; (* 720 *)

let bc_gt () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_JUMP 9;
  code.(2) <- I_FETCH 1;
  code.(3) <- I_FETCH 0;
  code.(4) <- I_PUSH (Prim (P_GT()));
  code.(5) <- I_CALL (2);
  code.(6) <- I_RETURN();
  code.(7) <- I_PUSH (Nil());
  code.(8) <- I_RETURN();
  code.(9) <- I_PUSH_FUN (2);
  code.(10) <- I_GSTORE 0;
  code.(11) <- I_PUSH (Int 5);
  code.(12) <- I_PUSH (Int 10);
  code.(13) <- I_GFETCH 0;
  code.(14) <- I_CALL (2);
  code.(15) <- I_POP();
  ()
;; (* true *)

let bc_inc () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_JUMP 9;
  code.(2) <- I_PUSH (Int 1);
  code.(3) <- I_FETCH 0;
  code.(4) <- I_PUSH (Prim (P_ADD()));
  code.(5) <- I_CALL (2);
  code.(6) <- I_RETURN();
  code.(7) <- I_PUSH (Nil());
  code.(8) <- I_RETURN();
  code.(9) <- I_PUSH_FUN (2);
  code.(10) <- I_GSTORE 0;
  code.(11) <- I_PUSH (Int 42);
  code.(12) <- I_GFETCH 0;
  code.(13) <- I_CALL (1);
  code.(14) <- I_POP();
  ()
;; (* 43 *)

let bc_inc2 () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_JUMP 9;
  code.(2) <- I_PUSH (Int 1);
  code.(3) <- I_FETCH 0;
  code.(4) <- I_PUSH (Prim (P_ADD()));
  code.(5) <- I_CALL (2);
  code.(6) <- I_RETURN();
  code.(7) <- I_PUSH (Nil());
  code.(8) <- I_RETURN();
  code.(9) <- I_PUSH_FUN (2);
  code.(10) <- I_GSTORE 0;
  code.(11) <- I_PUSH (Int 42);
  code.(12) <- I_GFETCH 0;
  code.(13) <- I_CALL (1);
  code.(14) <- I_GFETCH 0;
  code.(15) <- I_CALL (1);
  code.(16) <- I_POP();
  ()
;; (* 44 *)

let bc_multiple_add () =
  code.(0) <- I_PUSH (Int 5);
  code.(1) <- I_PUSH (Int 4);
  code.(2) <- I_PUSH (Int 3);
  code.(3) <- I_PUSH (Int 2);
  code.(4) <- I_PUSH (Int 1);
  code.(5) <- I_PUSH (Prim (P_ADD()));
  code.(6) <- I_CALL (2);
  code.(7) <- I_PUSH (Prim (P_ADD()));
  code.(8) <- I_CALL (2);
  code.(9) <- I_PUSH (Prim (P_ADD()));
  code.(10) <- I_CALL (2);
  code.(11) <- I_PUSH (Prim (P_ADD()));
  code.(12) <- I_CALL (2);
  code.(13) <- I_POP();
  ()
;; (* 15 *)

let bc_multiple_env () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_PUSH (Int 10);
  code.(2) <- I_GSTORE 0;
  code.(3) <- I_GALLOC();
  code.(4) <- I_JUMP 12;
  code.(5) <- I_FETCH 0;
  code.(6) <- I_GFETCH 0;
  code.(7) <- I_PUSH (Prim (P_ADD()));
  code.(8) <- I_CALL (2);
  code.(9) <- I_RETURN();
  code.(10) <- I_PUSH (Nil());
  code.(11) <- I_RETURN();
  code.(12) <- I_PUSH_FUN (5);
  code.(13) <- I_GSTORE 1;
  code.(14) <- I_GALLOC();
  code.(15) <- I_JUMP 22;
  code.(16) <- I_FETCH 0;
  code.(17) <- I_GFETCH 1;
  code.(18) <- I_CALL (1);
  code.(19) <- I_RETURN();
  code.(20) <- I_PUSH (Nil());
  code.(21) <- I_RETURN();
  code.(22) <- I_PUSH_FUN (16);
  code.(23) <- I_GSTORE 2;
  code.(24) <- I_PUSH (Int 20);
  code.(25) <- I_GFETCH 2;
  code.(26) <- I_CALL (1);
  code.(27) <- I_POP();
  ()
;; (* 30 *)

let bc_var_local () =
  code.(0) <- I_PUSH (Int 10);
  code.(1) <- I_JUMP 16;
  code.(2) <- I_PUSH (Int 20);
  code.(3) <- I_JUMP 11;
  code.(4) <- I_FETCH 1;
  code.(5) <- I_FETCH 0;
  code.(6) <- I_PUSH (Prim (P_SUB()));
  code.(7) <- I_CALL (2);
  code.(8) <- I_POP();
  code.(9) <- I_PUSH (Nil());
  code.(10) <- I_RETURN();
  code.(11) <- I_PUSH_FUN (4);
  code.(12) <- I_CALL (1);
  code.(13) <- I_POP();
  code.(14) <- I_PUSH (Nil());
  code.(15) <- I_RETURN();
  code.(16) <- I_PUSH_FUN (2);
  code.(17) <- I_CALL (1);
  code.(18) <- I_POP();
  ()
;; (* 10 *)

let bc_var_local_func () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_JUMP 16;
  code.(2) <- I_PUSH (Int 10);
  code.(3) <- I_JUMP 11;
  code.(4) <- I_FETCH 0;
  code.(5) <- I_FETCH 1;
  code.(6) <- I_PUSH (Prim (P_ADD()));
  code.(7) <- I_CALL (2);
  code.(8) <- I_RETURN();
  code.(9) <- I_PUSH (Nil());
  code.(10) <- I_RETURN();
  code.(11) <- I_PUSH_FUN (4);
  code.(12) <- I_CALL (1);
  code.(13) <- I_POP();
  code.(14) <- I_PUSH (Nil());
  code.(15) <- I_RETURN();
  code.(16) <- I_PUSH_FUN (2);
  code.(17) <- I_GSTORE 0;
  code.(18) <- I_PUSH (Int 20);
  code.(19) <- I_GFETCH 0;
  code.(20) <- I_CALL (1);
  code.(21) <- I_POP();
  ()
;; (* 30 *)

let bc_while () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_PUSH (Int 0);
  code.(2) <- I_GSTORE 0;
  code.(3) <- I_JUMP 9;
  code.(4) <- I_PUSH (Int 1);
  code.(5) <- I_GFETCH 0;
  code.(6) <- I_PUSH (Prim (P_ADD()));
  code.(7) <- I_CALL (2);
  code.(8) <- I_GSTORE 0;
  code.(9) <- I_PUSH (Int 10);
  code.(10) <- I_GFETCH 0;
  code.(11) <- I_PUSH (Prim (P_LT()));
  code.(12) <- I_CALL (2);
  code.(13) <- I_JTRUE 4;
  code.(14) <- I_GFETCH 0;
  code.(15) <- I_POP();
  ()
;; (* 10 *)

let bc_sub () =
  code.(0) <- I_PUSH (Int 1);
  code.(1) <- I_PUSH (Int 42);
  code.(2) <- I_PUSH (Prim (P_SUB()));
  code.(3) <- I_CALL (2);
  code.(4) <- I_POP();
  () 
;; (* 41 *)

let bc_locals_globals () =
  code.(0) <- I_GALLOC();
  code.(1) <- I_PUSH (Int 10);
  code.(2) <- I_GSTORE 0;
  code.(3) <- I_PUSH (Int 20);
  code.(4) <- I_JUMP 71;
  code.(5) <- I_GALLOC();
  code.(6) <- I_JUMP 30;
  code.(7) <- I_PUSH (Int 60);
  code.(8) <- I_FETCH 0;
  code.(9) <- I_PUSH (Prim (P_ADD()));
  code.(10) <- I_CALL (2);
  code.(11) <- I_JUMP 25;
  code.(12) <- I_FETCH 2;
  code.(13) <- I_FETCH 0;
  code.(14) <- I_FETCH 2;
  code.(15) <- I_GFETCH 0;
  code.(16) <- I_PUSH (Prim (P_ADD()));
  code.(17) <- I_CALL (2);
  code.(18) <- I_PUSH (Prim (P_ADD()));
  code.(19) <- I_CALL (2);
  code.(20) <- I_PUSH (Prim (P_ADD()));
  code.(21) <- I_CALL (2);
  code.(22) <- I_RETURN();
  code.(23) <- I_PUSH (Nil());
  code.(24) <- I_RETURN();
  code.(25) <- I_PUSH_FUN (12);
  code.(26) <- I_CALL (1);
  code.(27) <- I_POP();
  code.(28) <- I_PUSH (Nil());
  code.(29) <- I_RETURN();
  code.(30) <- I_PUSH_FUN (7);
  code.(31) <- I_GSTORE 1;
  code.(32) <- I_GALLOC();
  code.(33) <- I_PUSH (Int 30);
  code.(34) <- I_GSTORE 2;
  code.(35) <- I_GALLOC();
  code.(36) <- I_JUMP 56;
  code.(37) <- I_GALLOC();
  code.(38) <- I_PUSH (Int 50);
  code.(39) <- I_GSTORE 4;
  code.(40) <- I_FETCH 0;
  code.(41) <- I_GFETCH 2;
  code.(42) <- I_PUSH (Prim (P_ADD()));
  code.(43) <- I_CALL (2);
  code.(44) <- I_JUMP 51;
  code.(45) <- I_FETCH 0;
  code.(46) <- I_GFETCH 1;
  code.(47) <- I_CALL (1);
  code.(48) <- I_RETURN();
  code.(49) <- I_PUSH (Nil());
  code.(50) <- I_RETURN();
  code.(51) <- I_PUSH_FUN (45);
  code.(52) <- I_CALL (1);
  code.(53) <- I_POP();
  code.(54) <- I_PUSH (Nil());
  code.(55) <- I_RETURN();
  code.(56) <- I_PUSH_FUN (37);
  code.(57) <- I_GSTORE 3;
  code.(58) <- I_PUSH (Int 40);
  code.(59) <- I_JUMP 66;
  code.(60) <- I_FETCH 0;
  code.(61) <- I_GFETCH 3;
  code.(62) <- I_CALL (1);
  code.(63) <- I_POP();
  code.(64) <- I_PUSH (Nil());
  code.(65) <- I_RETURN();
  code.(66) <- I_PUSH_FUN (60);
  code.(67) <- I_CALL (1);
  code.(68) <- I_POP();
  code.(69) <- I_PUSH (Nil());
  code.(70) <- I_RETURN();
  code.(71) <- I_PUSH_FUN (5);
  code.(72) <- I_CALL (1);
  code.(73) <- I_POP();
  () ;; (* ======================================== *)