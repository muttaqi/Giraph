type token =
  | INT of (int)
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | EQUAL
  | GREATER
  | LESSER
  | OR
  | AND
  | XOR
  | EXCL
  | COLON
  | COMMA
  | INTTYPE
  | STATE
  | MAIN
  | TRUE
  | FALSE
  | IDENT of (string)
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string
