type token =
  | RETURN
  | IF
  | VAR
  | ELSE
  | IN
  | WHILE
  | DO
  | FUNCTION
  | LAMBDA
  | LET
  | IDENTIFIER of (string)
  | INT of (int)
  | BOOL of (bool)
  | OPEQ of (string)
  | AND of (string)
  | OR of (string)
  | EQUALITY of (string)
  | COMPARE of (string)
  | PLUS_MINUS of (string)
  | MOD of (string)
  | TIMES_DIV of (string)
  | POW of (string)
  | EQ
  | QUESTION_MARK
  | COLON
  | EOF
  | DOT
  | COMMA
  | SEMICOL
  | LCURLY
  | RCURLY
  | LBRACKET
  | RBRACKET
  | LPAREN
  | RPAREN

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  let current_pos () = 
    Parseutils.make_position (Parsing.symbol_start_pos ())     
                             (Parsing.symbol_end_pos ())
# 45 "parser.ml"
let yytransl_const = [|
  257 (* RETURN *);
  258 (* IF *);
  259 (* VAR *);
  260 (* ELSE *);
  261 (* IN *);
  262 (* WHILE *);
  263 (* DO *);
  264 (* FUNCTION *);
  265 (* LAMBDA *);
  266 (* LET *);
  279 (* EQ *);
  280 (* QUESTION_MARK *);
  281 (* COLON *);
    0 (* EOF *);
  282 (* DOT *);
  283 (* COMMA *);
  284 (* SEMICOL *);
  285 (* LCURLY *);
  286 (* RCURLY *);
  287 (* LBRACKET *);
  288 (* RBRACKET *);
  289 (* LPAREN *);
  290 (* RPAREN *);
    0|]

let yytransl_block = [|
  267 (* IDENTIFIER *);
  268 (* INT *);
  269 (* BOOL *);
  270 (* OPEQ *);
  271 (* AND *);
  272 (* OR *);
  273 (* EQUALITY *);
  274 (* COMPARE *);
  275 (* PLUS_MINUS *);
  276 (* MOD *);
  277 (* TIMES_DIV *);
  278 (* POW *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\002\000\002\000\
\003\000\003\000\003\000\009\000\009\000\009\000\009\000\009\000\
\009\000\010\000\010\000\010\000\010\000\005\000\005\000\006\000\
\006\000\007\000\007\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\008\000\008\000\000\000"

let yylen = "\002\000\
\000\000\001\000\001\000\002\000\001\000\002\000\005\000\006\000\
\001\000\002\000\001\000\003\000\003\000\004\000\001\000\002\000\
\006\000\005\000\007\000\005\000\001\000\005\000\006\000\002\000\
\003\000\001\000\003\000\001\000\001\000\004\000\003\000\005\000\
\004\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\005\000\005\000\003\000\003\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\028\000\029\000\009\000\000\000\000\000\
\000\000\048\000\002\000\000\000\000\000\021\000\000\000\000\000\
\011\000\034\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\024\000\000\000\000\000\000\000\
\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\006\000\010\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\025\000\000\000\045\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\044\000\031\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\033\000\000\000\
\000\000\000\000\000\000\000\000\030\000\000\000\020\000\000\000\
\022\000\000\000\027\000\032\000\000\000\043\000\000\000\047\000\
\000\000\017\000\023\000\008\000\019\000"

let yydgoto = "\002\000\
\018\000\019\000\020\000\021\000\022\000\023\000\061\000\079\000\
\024\000\025\000"

let yysindex = "\008\000\
\010\255\000\000\059\255\247\254\015\255\250\254\001\255\022\255\
\002\255\025\255\011\255\000\000\000\000\000\000\099\255\059\255\
\059\255\000\000\000\000\010\255\173\000\000\000\010\255\016\255\
\000\000\000\000\173\000\059\255\023\255\059\255\039\255\017\255\
\253\254\026\255\059\255\059\255\000\000\021\255\098\255\158\255\
\000\000\059\255\059\255\059\255\059\255\059\255\059\255\059\255\
\059\255\041\255\053\255\000\000\000\000\178\255\059\255\198\255\
\036\255\003\255\049\255\001\255\045\255\059\255\173\000\173\000\
\000\000\059\255\000\000\195\000\228\255\201\000\210\000\250\255\
\063\255\063\255\090\000\000\000\000\000\103\000\046\255\001\255\
\173\000\001\255\059\255\001\255\048\255\072\255\000\000\001\255\
\116\000\135\000\059\255\059\255\000\000\089\255\000\000\218\255\
\000\000\001\255\000\000\000\000\010\255\000\000\173\000\000\000\
\001\255\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\094\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\154\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\003\000\069\255\000\000\005\000\000\000\
\000\000\000\000\071\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\084\255\000\000\000\000\000\000\093\255\095\255\
\000\000\000\000\000\000\070\000\177\000\056\000\042\000\022\000\
\118\255\138\255\000\000\000\000\000\000\092\255\000\000\000\000\
\110\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\
\000\000\000\000\000\000\000\000\006\000\000\000\212\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\243\255\000\000\012\000\000\000\249\255\202\255\048\000\
\000\000\000\000"

let yytablesize = 502
let yytable = "\031\000\
\018\000\038\000\003\000\085\000\005\000\007\000\041\000\059\000\
\001\000\052\000\003\000\004\000\005\000\059\000\027\000\006\000\
\007\000\008\000\009\000\010\000\011\000\012\000\013\000\028\000\
\035\000\029\000\030\000\039\000\040\000\015\000\060\000\099\000\
\032\000\036\000\033\000\034\000\084\000\014\000\015\000\054\000\
\016\000\056\000\017\000\053\000\057\000\055\000\063\000\064\000\
\062\000\058\000\065\000\076\000\087\000\068\000\069\000\070\000\
\071\000\072\000\073\000\074\000\075\000\009\000\078\000\026\000\
\012\000\013\000\081\000\009\000\083\000\026\000\012\000\013\000\
\094\000\089\000\095\000\086\000\097\000\090\000\088\000\093\000\
\100\000\098\000\059\000\016\000\048\000\017\000\077\000\108\000\
\050\000\016\000\107\000\017\000\105\000\001\000\096\000\051\000\
\015\000\109\000\016\000\003\000\004\000\005\000\103\000\078\000\
\006\000\007\000\008\000\009\000\010\000\011\000\012\000\013\000\
\042\000\043\000\044\000\045\000\046\000\026\000\047\000\048\000\
\013\000\049\000\012\000\050\000\066\000\046\000\014\000\015\000\
\037\000\016\000\051\000\017\000\036\000\036\000\036\000\036\000\
\036\000\014\000\036\000\104\000\000\000\036\000\036\000\000\000\
\036\000\036\000\000\000\000\000\000\000\036\000\000\000\036\000\
\035\000\035\000\035\000\035\000\035\000\000\000\035\000\000\000\
\000\000\035\000\035\000\000\000\035\000\035\000\000\000\000\000\
\000\000\035\000\000\000\035\000\042\000\043\000\044\000\045\000\
\046\000\000\000\047\000\048\000\000\000\049\000\000\000\050\000\
\000\000\000\000\000\000\000\000\000\000\000\000\051\000\067\000\
\042\000\043\000\044\000\045\000\046\000\000\000\047\000\048\000\
\000\000\049\000\000\000\050\000\000\000\000\000\000\000\000\000\
\000\000\000\000\051\000\080\000\042\000\043\000\044\000\045\000\
\046\000\000\000\047\000\048\000\000\000\049\000\000\000\050\000\
\000\000\000\000\000\000\000\000\000\000\000\000\051\000\082\000\
\042\000\043\000\044\000\045\000\046\000\000\000\047\000\048\000\
\000\000\049\000\042\000\050\000\044\000\045\000\046\000\000\000\
\047\000\048\000\051\000\106\000\000\000\050\000\000\000\000\000\
\000\000\018\000\018\000\018\000\051\000\000\000\018\000\018\000\
\018\000\018\000\018\000\018\000\018\000\018\000\047\000\048\000\
\000\000\000\000\000\000\050\000\000\000\000\000\000\000\000\000\
\000\000\000\000\051\000\000\000\018\000\018\000\018\000\018\000\
\003\000\018\000\005\000\007\000\037\000\037\000\037\000\037\000\
\037\000\000\000\000\000\000\000\000\000\037\000\037\000\000\000\
\037\000\037\000\000\000\000\000\000\000\037\000\000\000\037\000\
\038\000\038\000\038\000\038\000\000\000\000\000\000\000\000\000\
\000\000\038\000\038\000\000\000\038\000\038\000\039\000\039\000\
\039\000\038\000\000\000\038\000\000\000\000\000\000\000\039\000\
\039\000\000\000\039\000\039\000\041\000\041\000\000\000\039\000\
\000\000\039\000\000\000\000\000\000\000\041\000\041\000\000\000\
\041\000\041\000\000\000\000\000\000\000\041\000\000\000\041\000\
\042\000\043\000\044\000\045\000\046\000\000\000\047\000\048\000\
\000\000\049\000\091\000\050\000\000\000\042\000\043\000\044\000\
\045\000\046\000\051\000\047\000\048\000\000\000\049\000\000\000\
\050\000\092\000\042\000\043\000\044\000\045\000\046\000\051\000\
\047\000\048\000\000\000\049\000\000\000\050\000\000\000\101\000\
\000\000\000\000\000\000\000\000\051\000\042\000\043\000\044\000\
\045\000\046\000\000\000\047\000\048\000\000\000\049\000\000\000\
\050\000\000\000\000\000\000\000\000\000\000\000\102\000\051\000\
\034\000\034\000\034\000\034\000\034\000\000\000\034\000\034\000\
\000\000\034\000\000\000\034\000\000\000\034\000\000\000\000\000\
\000\000\000\000\034\000\042\000\043\000\044\000\045\000\046\000\
\040\000\047\000\048\000\000\000\049\000\000\000\050\000\000\000\
\040\000\040\000\000\000\040\000\040\000\051\000\000\000\000\000\
\040\000\000\000\040\000\044\000\045\000\046\000\000\000\047\000\
\048\000\000\000\045\000\046\000\050\000\047\000\048\000\000\000\
\000\000\000\000\050\000\051\000\046\000\000\000\047\000\048\000\
\000\000\051\000\000\000\050\000\042\000\000\000\042\000\042\000\
\000\000\000\000\051\000\042\000\000\000\042\000"

let yycheck = "\007\000\
\000\000\015\000\000\000\058\000\000\000\000\000\020\000\011\001\
\001\000\023\000\001\001\002\001\003\001\011\001\003\000\006\001\
\007\001\008\001\009\001\010\001\011\001\012\001\013\001\033\001\
\014\001\011\001\033\001\016\000\017\000\029\001\034\001\086\000\
\011\001\023\001\033\001\011\001\034\001\028\001\029\001\028\000\
\031\001\030\000\033\001\028\001\006\001\023\001\035\000\036\000\
\023\001\033\001\030\001\011\001\060\000\042\000\043\000\044\000\
\045\000\046\000\047\000\048\000\049\000\009\001\051\000\011\001\
\012\001\013\001\055\000\009\001\033\001\011\001\012\001\013\001\
\080\000\062\000\082\000\027\001\084\000\066\000\034\001\034\001\
\088\000\034\001\011\001\031\001\022\001\033\001\034\001\101\000\
\026\001\031\001\098\000\033\001\004\001\000\000\083\000\033\001\
\028\001\105\000\028\001\001\001\002\001\003\001\091\000\092\000\
\006\001\007\001\008\001\009\001\010\001\011\001\012\001\013\001\
\015\001\016\001\017\001\018\001\019\001\034\001\021\001\022\001\
\028\001\024\001\028\001\026\001\027\001\034\001\028\001\029\001\
\030\001\031\001\033\001\033\001\015\001\016\001\017\001\018\001\
\019\001\028\001\021\001\092\000\255\255\024\001\025\001\255\255\
\027\001\028\001\255\255\255\255\255\255\032\001\255\255\034\001\
\015\001\016\001\017\001\018\001\019\001\255\255\021\001\255\255\
\255\255\024\001\025\001\255\255\027\001\028\001\255\255\255\255\
\255\255\032\001\255\255\034\001\015\001\016\001\017\001\018\001\
\019\001\255\255\021\001\022\001\255\255\024\001\255\255\026\001\
\255\255\255\255\255\255\255\255\255\255\255\255\033\001\034\001\
\015\001\016\001\017\001\018\001\019\001\255\255\021\001\022\001\
\255\255\024\001\255\255\026\001\255\255\255\255\255\255\255\255\
\255\255\255\255\033\001\034\001\015\001\016\001\017\001\018\001\
\019\001\255\255\021\001\022\001\255\255\024\001\255\255\026\001\
\255\255\255\255\255\255\255\255\255\255\255\255\033\001\034\001\
\015\001\016\001\017\001\018\001\019\001\255\255\021\001\022\001\
\255\255\024\001\015\001\026\001\017\001\018\001\019\001\255\255\
\021\001\022\001\033\001\034\001\255\255\026\001\255\255\255\255\
\255\255\001\001\002\001\003\001\033\001\255\255\006\001\007\001\
\008\001\009\001\010\001\011\001\012\001\013\001\021\001\022\001\
\255\255\255\255\255\255\026\001\255\255\255\255\255\255\255\255\
\255\255\255\255\033\001\255\255\028\001\029\001\030\001\031\001\
\030\001\033\001\030\001\030\001\015\001\016\001\017\001\018\001\
\019\001\255\255\255\255\255\255\255\255\024\001\025\001\255\255\
\027\001\028\001\255\255\255\255\255\255\032\001\255\255\034\001\
\015\001\016\001\017\001\018\001\255\255\255\255\255\255\255\255\
\255\255\024\001\025\001\255\255\027\001\028\001\015\001\016\001\
\017\001\032\001\255\255\034\001\255\255\255\255\255\255\024\001\
\025\001\255\255\027\001\028\001\015\001\016\001\255\255\032\001\
\255\255\034\001\255\255\255\255\255\255\024\001\025\001\255\255\
\027\001\028\001\255\255\255\255\255\255\032\001\255\255\034\001\
\015\001\016\001\017\001\018\001\019\001\255\255\021\001\022\001\
\255\255\024\001\025\001\026\001\255\255\015\001\016\001\017\001\
\018\001\019\001\033\001\021\001\022\001\255\255\024\001\255\255\
\026\001\027\001\015\001\016\001\017\001\018\001\019\001\033\001\
\021\001\022\001\255\255\024\001\255\255\026\001\255\255\028\001\
\255\255\255\255\255\255\255\255\033\001\015\001\016\001\017\001\
\018\001\019\001\255\255\021\001\022\001\255\255\024\001\255\255\
\026\001\255\255\255\255\255\255\255\255\255\255\032\001\033\001\
\015\001\016\001\017\001\018\001\019\001\255\255\021\001\022\001\
\255\255\024\001\255\255\026\001\255\255\028\001\255\255\255\255\
\255\255\255\255\033\001\015\001\016\001\017\001\018\001\019\001\
\016\001\021\001\022\001\255\255\024\001\255\255\026\001\255\255\
\024\001\025\001\255\255\027\001\028\001\033\001\255\255\255\255\
\032\001\255\255\034\001\017\001\018\001\019\001\255\255\021\001\
\022\001\255\255\018\001\019\001\026\001\021\001\022\001\255\255\
\255\255\255\255\026\001\033\001\019\001\255\255\021\001\022\001\
\255\255\033\001\255\255\026\001\025\001\255\255\027\001\028\001\
\255\255\255\255\033\001\032\001\255\255\034\001"

let yynames_const = "\
  RETURN\000\
  IF\000\
  VAR\000\
  ELSE\000\
  IN\000\
  WHILE\000\
  DO\000\
  FUNCTION\000\
  LAMBDA\000\
  LET\000\
  EQ\000\
  QUESTION_MARK\000\
  COLON\000\
  EOF\000\
  DOT\000\
  COMMA\000\
  SEMICOL\000\
  LCURLY\000\
  RCURLY\000\
  LBRACKET\000\
  RBRACKET\000\
  LPAREN\000\
  RPAREN\000\
  "

let yynames_block = "\
  IDENTIFIER\000\
  INT\000\
  BOOL\000\
  OPEQ\000\
  AND\000\
  OR\000\
  EQUALITY\000\
  COMPARE\000\
  PLUS_MINUS\000\
  MOD\000\
  TIMES_DIV\000\
  POW\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
                 ( { filename = ""; body = [] } )
# 337 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 51 "parser.mly"
                 ( { filename = ""; body = _1 } )
# 344 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.statement) in
    Obj.repr(
# 55 "parser.mly"
                        ( [_1] )
# 351 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.statement) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 56 "parser.mly"
                        ( _1 :: _2 )
# 359 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 57 "parser.mly"
                        (_1)
# 366 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.statements) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 58 "parser.mly"
                    ( _1 @ _2 )
# 374 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 59 "parser.mly"
                                  ( [ Let(_2, _4,[], current_pos ()) ] )
# 382 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 60 "parser.mly"
                                             ( [ Let(_2,_4,_6, current_pos ()) ] )
# 391 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
                              ( Empty (current_pos ()))
# 397 "parser.ml"
               : Ast.statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'opened_statement) in
    Obj.repr(
# 65 "parser.mly"
                              ( _1 )
# 404 "parser.ml"
               : Ast.statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'closed_statement) in
    Obj.repr(
# 66 "parser.mly"
                              ( _1 )
# 411 "parser.ml"
               : Ast.statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 70 "parser.mly"
                                         ( Assign (_1, _3, current_pos ()) )
# 419 "parser.ml"
               : 'opened_statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 71 "parser.mly"
                                         ( OpAssign (_2, _1, _3, current_pos ()) )
# 428 "parser.ml"
               : 'opened_statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 72 "parser.mly"
                                         ( Var(_2, _4, current_pos ()) )
# 436 "parser.ml"
               : 'opened_statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 73 "parser.mly"
                                         ( VoidExpr (_1, current_pos ()) )
# 443 "parser.ml"
               : 'opened_statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 74 "parser.mly"
                                         ( Return(_2, current_pos ()) )
# 450 "parser.ml"
               : 'opened_statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : Ast.statements) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 75 "parser.mly"
                                         ( DoWhile(_5, _2, current_pos ()) )
# 458 "parser.ml"
               : 'opened_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 79 "parser.mly"
                                          ( If(_3, _5,[], current_pos ()) )
# 466 "parser.ml"
               : 'closed_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.statements) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 80 "parser.mly"
                                          ( If(_3, _5, _7, current_pos ()) )
# 475 "parser.ml"
               : 'closed_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 81 "parser.mly"
                                          ( While(_3, _5, current_pos ()) )
# 483 "parser.ml"
               : 'closed_statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.statement) in
    Obj.repr(
# 82 "parser.mly"
                                          ( _1 )
# 490 "parser.ml"
               : 'closed_statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 87 "parser.mly"
    ( Fundef(_2,[], _5, current_pos ()) )
# 498 "parser.ml"
               : Ast.statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : string list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 89 "parser.mly"
    ( Fundef(_2,_4, _6, current_pos ()) )
# 507 "parser.ml"
               : Ast.statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
                            ( [] )
# 513 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.statements) in
    Obj.repr(
# 94 "parser.mly"
                            ( _2 )
# 520 "parser.ml"
               : Ast.statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 99 "parser.mly"
              ( [_1] )
# 527 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string list) in
    Obj.repr(
# 100 "parser.mly"
                               ( _1::_3 )
# 535 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 104 "parser.mly"
                                         ( IntConst(_1, current_pos ()) )
# 542 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 105 "parser.mly"
                                         ( BoolConst(_1, current_pos ()) )
# 549 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr list) in
    Obj.repr(
# 106 "parser.mly"
                                         ( Funcall(_1,_3, current_pos ()) )
# 557 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    Obj.repr(
# 107 "parser.mly"
                                         ( Funcall(_1,[], current_pos ()) )
# 564 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string list) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 108 "parser.mly"
                                         ( Lambda(_3,_5,current_pos ()) )
# 572 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.statements) in
    Obj.repr(
# 109 "parser.mly"
                                         ( Lambda([],_4,current_pos ()) )
# 579 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "parser.mly"
                                         ( EVar (_1, current_pos ()) )
# 586 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 111 "parser.mly"
                                         ( BinOp(_2, _1, _3, current_pos ()) )
# 595 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 112 "parser.mly"
                                         ( BinOp(_2, _1, _3, current_pos ()) )
# 604 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 113 "parser.mly"
                                         ( BinOp(_2, _1, _3, current_pos ()) )
# 613 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 114 "parser.mly"
                                         ( BinOp(_2, _1, _3, current_pos ()) )
# 622 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 115 "parser.mly"
                                         ( BinOp(_2, _1, _3, current_pos ()) )
# 631 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 116 "parser.mly"
                                         ( BinOp(_2, _1, _3, current_pos ()) )
# 640 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 117 "parser.mly"
                                         ( BinOp(_2, _1, _3, current_pos ()) )
# 649 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 118 "parser.mly"
                                         ( TernaryOperator(_1,_3,_5, current_pos ()) )
# 658 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 119 "parser.mly"
                                         ( Pair(_2,_4,current_pos ()) )
# 666 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 120 "parser.mly"
                                         ( Access(_1,_3, current_pos ()) )
# 674 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 121 "parser.mly"
                                         ( _2 )
# 681 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 126 "parser.mly"
        ( [_1] )
# 688 "parser.ml"
               : Ast.expr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr list) in
    Obj.repr(
# 127 "parser.mly"
                        ( _1::_3 )
# 696 "parser.ml"
               : Ast.expr list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
