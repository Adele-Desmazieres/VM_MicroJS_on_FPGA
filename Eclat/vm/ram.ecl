
(* les tailles des tableaux sont personnalisables *)

let globals_limit = 100 ;;

let heap = array_create 100 ;;    (* tas *)
let stack = array_create 100 ;;   (* pile *)
let globals = array_create globals_limit ;; (* variables globales *)
let code = array_create 100 ;;    (* bytecode *)


