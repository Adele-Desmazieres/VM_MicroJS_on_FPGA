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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
