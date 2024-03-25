(* un bloc d'activation (frame est la structure de base)
   qui permet à une fonction appelante de continuer son éxécution
   une fois que l'appelée a retourné une valeur.

  Chaque bloc contient (dans l'ordre) :
  - un pointeur de pile [sp] (c'est une position dans le tableau [stack])
  - un environnement [env] (c'est une position dans le tableau [heap] à partir 
                            de la quelle se situe les variables)
  - un pointeur de code [pc] (c'est une position dans le tableau) [code]
  - un pointeur [fp] vers le bloc d'activation suivante *)
type frame = ptr * ptr * ptr * ptr

let frames = array_create 100 ;;
 (* la longueur du tableau fixe la profondeur d'appels de fonction imbriqués *)

let print_frame (sp,env,pc,fp) =
  print_string "[sp:"; print_int sp;
  print_string "|env:"; print_int env;
  print_string "|pc:"; print_int pc;
  print_string "|fp:"; print_int fp;
  print_string "]" ;;