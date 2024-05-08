type ptr = int<32> (* type des adresses (positions dans le tas, la pile, 
                      le code, le segment des variables globales, etc.).
                      32 bits, c'est beaucoup; sur FPGA il y a peu de mémoire 
                      (< 100_000 mots de 32 bits). On pourrait se limiter 
                      à 16 bits par exemple. La primitive d'affichage [print_int] 
                      fonctionne pour toute taille d'entier. Le reste du temps
                      il faut faire des conversions explicites avec la
                      primitive resize_int<N> *)
type long = int<32> (* types des valeurs entiers *)

type prim = P_ADD of unit   (* en Eclat, tous les constructeurs doivent être paramétrés *)
          | P_SUB of unit    (*          même si c'est pas le type unit *)
          | P_MUL of unit
          | P_DIV of unit
          | P_POW of unit
          | P_EQ of unit
          | P_LT of unit
          | P_GT of unit
            (* à compléter *)

type value = Bool of bool
           | Int of long
           | Nil of unit
           | Prim of prim
           | Closure of ptr * ptr
           | Header of ptr


let print_prim (p:prim) : unit =
  match p with
  | P_ADD () -> print_string "+"
  | P_SUB () -> print_string "-"
  | P_MUL () -> print_string "*"
  | P_DIV () -> print_string "/"
  | P_POW () -> print_string "pow"
  | P_EQ () -> print_string "=="
  | P_LT () -> print_string "<"
  | P_GT () -> print_string ">"
  end ;;

let print_value(v:value) : unit =
  match v with
  | Bool b -> if b then print_string "true" else print_string "false"
  | Int n -> print_int n
  | Nil() -> print_string "nil"
  | Prim p -> print_prim p
  | Closure (p1, p2) ->
      print_string "{";
      print_int p1; print_string ","; print_int p2; 
      print_string "}"
  | Header p ->
      print_string "h(";
      print_int p;
      print_string ")"
  end ;;
