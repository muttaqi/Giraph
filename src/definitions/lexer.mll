
{
open Parser        (* The type token is defined in parser.mli *)
open String
exception Eof
}
rule token = parse
    | [' ' '\t' '\n']                { token lexbuf }     (* skip blanks *)
    | ['0'-'9']+ as lxm         { INT(int_of_string lxm) }
    | '+'                       { PLUS }
    | '-'                       { MINUS }
    | '*'                       { TIMES }
    | '/'                       { DIV }
    | '('                       { LPAREN }
    | ')'                       { RPAREN }
    | '{'                       { LBRACE }
    | '}'                       { RBRACE }
    | '='                       { EQUAL }
    | '>'                       { GREATER }
    | '<'                       { LESSER }
    | '|'                       { OR }
    | '&'                       { AND }
    | '^'                       { XOR }
    | '!'                       { EXCL }
    | ':'                       { COLON }
    | ','                       { COMMA }
    | "int"                     { INTTYPE }
    | "state"                   { STATE }
    | "main"                    { MAIN }
    | "true"                    { TRUE }
    | "false"                   { FALSE }
    | ['A'-'Z' 'a'-'z'] ['A'-'Z' 'a'-'z' '0'-'9' '_'] * as id   
                                { IDENT id }
    | eof                       { raise Eof }