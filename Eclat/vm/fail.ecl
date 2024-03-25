(* Comme Eclat n'a pas d'exceptions,
   on se contente de simuler une erreur fatale
   en lançant une boucle infinie *)

let fatal_error (s:string) = 
  print_string "fatal error: ";
  print_string s;
  print_newline (); 
  let rec forever () = forever ()
  in forever () ;;

(* on simule aussi de cette manière la fin anticipée 
   du programme (en cas d'erreur) *)

let exit () =
  print_string "(exit) bye bye.";
  print_newline (); 
  let rec forever () = forever ()
  in forever () ;;
