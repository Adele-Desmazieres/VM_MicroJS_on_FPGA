
open Constants
open Bytecode
open Prim
 
let assoc_prim n =
  (match (List.nth Prim.init_prim_lst n).name with
                 | "+" -> "P_ADD()"
                 | "-" -> "P_SUB()"
                 | "*" -> "P_MUL()"
                 | "/" -> "P_DIV()"
                 | "**" -> "P_POW()"
                 | "==" -> "P_EQ()"
                 | "<" -> "P_LT()"
                 | ">" -> "P_GT()"
                 | "<=" -> "P_LE()"
                 | ">=" -> "P_GE()")

let string_of_value = function
  | BC_UNIT -> "Nil()"
  | BC_TRUE -> "Bool true"
  | BC_FALSE -> "Bool false"
  | BC_INT n -> "Int "^string_of_int n
  | BC_PRIM n -> "Prim ("^assoc_prim n ^")"
  | BC_FUN _ -> invalid_arg "string_of_value"

let string_of_instr = function
  | BC_GALLOC -> "I_GALLOC()"
  | BC_GFETCH n -> "I_GFETCH "^string_of_int n
  | BC_GSTORE n -> "I_GSTORE "^string_of_int n
  | BC_PUSH v -> (match v with 
                 | BC_FUN l -> "I_PUSH_FUN (" ^ string_of_int l^")"
                 | _ -> "I_PUSH (" ^string_of_value v ^")")
  | BC_POP ->      "I_POP()"
  | BC_FETCH n ->  "I_FETCH " ^ string_of_int n
  | BC_STORE n ->  "I_STORE " ^ string_of_int n
  | BC_CALL n ->   "I_CALL (" ^ string_of_int n ^")"
  | BC_RETURN ->   "I_RETURN()"
  | BC_LABEL s ->  assert false (* to be removed before *)
  | BC_JUMP s ->   "I_JUMP " ^string_of_int s
  | BC_JFALSE s -> "I_JFALSE " ^string_of_int s
  | BC_JTRUE s ->  "I_JTRUE " ^ string_of_int s


let prepare_bytecode bc =
  List.filter (function BC_LABEL _ -> false | _ -> true) bc ;;


let gen_code bc =
  let r = ref (-1) in
  let table = Hashtbl.create 10 in
  List.iteri (fun i instr -> match instr with 
                          | BC_LABEL n -> incr r; Hashtbl.add table n (i - !r) | _ -> ()) bc;
  let bc = prepare_bytecode bc in
  let bc = List.map (function BC_PUSH(BC_FUN l) -> BC_PUSH(BC_FUN (Hashtbl.find table l))
                    | BC_JUMP n -> BC_JUMP (Hashtbl.find table n)
                     | BC_JFALSE n -> BC_JFALSE (Hashtbl.find table n)
                      | BC_JTRUE n -> BC_JTRUE (Hashtbl.find table n)
                    | b -> b) bc in
  let open Printf in
  printf "\n\n(* ======================================== *) \n";
  printf "(* code généré par le compilateur MicroJS *)\n";
  printf "let load_bytecode () =\n";
  
  List.iteri (fun pos instr ->
    printf "  code.(%d) <- %s;\n" pos (string_of_instr instr)
  ) bc;
  
  printf "  () ;;\n(* ======================================== *)\n\n"

