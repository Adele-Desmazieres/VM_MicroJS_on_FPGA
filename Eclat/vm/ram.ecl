
(* les tailles des tableaux sont personnalisables *)

let global_size = 100;;

let heap = array_create 100 ;;    (* tas *)
let stack = array_create 100 ;;   (* pile *)
let globals = array_create global_size ;; (* variables globales *)
let code = array_create 100 ;;    (* bytecode *)


