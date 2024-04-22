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
  | IDENTIFIER of (
# 10 "parser.mly"
        string
# 16 "parser.mli"
)
  | INT of (
# 11 "parser.mly"
        int
# 21 "parser.mli"
)
  | BOOL of (
# 12 "parser.mly"
        bool
# 26 "parser.mli"
)
  | OPEQ of (
# 14 "parser.mly"
        string
# 31 "parser.mli"
)
  | AND of (
# 14 "parser.mly"
        string
# 36 "parser.mli"
)
  | OR of (
# 14 "parser.mly"
        string
# 41 "parser.mli"
)
  | EQUALITY of (
# 14 "parser.mly"
        string
# 46 "parser.mli"
)
  | COMPARE of (
# 14 "parser.mly"
        string
# 51 "parser.mli"
)
  | PLUS_MINUS of (
# 14 "parser.mly"
        string
# 56 "parser.mli"
)
  | MOD of (
# 14 "parser.mly"
        string
# 61 "parser.mli"
)
  | TIMES_DIV of (
# 14 "parser.mly"
        string
# 66 "parser.mli"
)
  | POW of (
# 14 "parser.mly"
        string
# 71 "parser.mli"
)
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
