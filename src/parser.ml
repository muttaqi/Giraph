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

open Parsing;;
let _ = parse_error;;
# 2 "src/definitions/parser.mly"
    let variables = Hashtbl.create 1000
# 33 "src/parser.ml"
let yytransl_const = [|
  258 (* PLUS *);
  259 (* MINUS *);
  260 (* TIMES *);
  261 (* DIV *);
  262 (* LPAREN *);
  263 (* RPAREN *);
  264 (* LBRACE *);
  265 (* RBRACE *);
  266 (* EQUAL *);
  267 (* GREATER *);
  268 (* LESSER *);
  269 (* OR *);
  270 (* AND *);
  271 (* XOR *);
  272 (* EXCL *);
  273 (* COLON *);
  274 (* COMMA *);
  275 (* INTTYPE *);
  276 (* STATE *);
  277 (* MAIN *);
  278 (* TRUE *);
  279 (* FALSE *);
  281 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  280 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\004\000\004\000\003\000\003\000\003\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\002\000\002\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\006\000\000\000"

let yylen = "\002\000\
\006\000\008\000\001\000\004\000\006\000\007\000\003\000\001\000\
\001\000\001\000\003\000\003\000\003\000\004\000\004\000\004\000\
\003\000\003\000\006\000\007\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\003\000\029\000\000\000\000\000\000\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\008\000\002\000\000\000\000\000\021\000\000\000\000\000\009\000\
\010\000\022\000\000\000\000\000\000\000\000\000\028\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\023\000\000\000\000\000\
\000\000\000\000\000\000\026\000\027\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\019\000\000\000\000\000\000\000\
\000\000\000\000\020\000\000\000\000\000\000\000\006\000\000\000\
\004\000\000\000\005\000"

let yydgoto = "\002\000\
\005\000\012\000\018\000\063\000\027\000\028\000"

let yysindex = "\255\255\
\027\255\000\000\248\254\000\000\000\000\021\255\030\255\037\255\
\254\254\016\255\024\255\000\000\025\255\039\255\053\255\008\255\
\000\000\000\000\009\255\009\255\000\000\009\255\009\255\000\000\
\000\000\000\000\041\255\066\255\056\255\106\255\000\000\081\255\
\070\255\008\255\008\255\009\255\009\255\009\255\009\255\009\255\
\033\255\043\255\069\255\089\255\076\255\000\000\096\255\049\255\
\049\255\068\255\068\255\000\000\000\000\106\255\009\255\106\255\
\009\255\106\255\009\255\025\255\000\000\108\255\092\255\106\255\
\106\255\106\255\000\000\110\255\025\255\007\255\000\000\094\255\
\000\000\025\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\008\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\111\255\
\112\255\001\000\018\000\000\000\000\000\077\255\000\000\079\255\
\000\000\084\255\000\000\000\000\000\000\000\000\000\000\086\255\
\091\255\093\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\215\255\006\000\000\000\078\000\239\255"

let yytablesize = 299
let yytable = "\001\000\
\024\000\029\000\030\000\061\000\031\000\032\000\010\000\007\000\
\021\000\021\000\022\000\022\000\006\000\023\000\023\000\072\000\
\011\000\025\000\050\000\051\000\052\000\053\000\054\000\056\000\
\058\000\011\000\007\000\015\000\073\000\024\000\025\000\026\000\
\026\000\021\000\016\000\022\000\008\000\064\000\023\000\065\000\
\013\000\066\000\055\000\021\000\009\000\022\000\003\000\014\000\
\023\000\017\000\033\000\004\000\057\000\034\000\035\000\019\000\
\026\000\036\000\037\000\038\000\039\000\034\000\035\000\020\000\
\044\000\067\000\026\000\036\000\037\000\038\000\039\000\038\000\
\039\000\045\000\071\000\040\000\041\000\042\000\059\000\075\000\
\047\000\043\000\036\000\037\000\038\000\039\000\011\000\046\000\
\012\000\011\000\011\000\012\000\012\000\013\000\011\000\014\000\
\013\000\013\000\014\000\014\000\015\000\062\000\016\000\015\000\
\015\000\016\000\016\000\036\000\037\000\038\000\039\000\048\000\
\049\000\060\000\068\000\000\000\069\000\070\000\074\000\000\000\
\018\000\017\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\024\000\024\000\000\000\000\000\000\000\024\000\
\000\000\024\000\024\000\024\000\024\000\024\000\024\000\000\000\
\024\000\000\000\024\000\025\000\025\000\000\000\000\000\000\000\
\025\000\024\000\025\000\025\000\025\000\025\000\025\000\025\000\
\007\000\025\000\000\000\025\000\000\000\000\000\000\000\000\000\
\000\000\000\000\025\000"

let yycheck = "\001\000\
\000\000\019\000\020\000\045\000\022\000\023\000\009\001\000\000\
\001\001\001\001\003\001\003\001\021\001\006\001\006\001\009\001\
\019\001\000\000\036\000\037\000\038\000\039\000\040\000\041\000\
\042\000\019\001\006\001\003\001\070\000\022\001\023\001\024\001\
\024\001\001\001\010\001\003\001\007\001\055\000\006\001\057\000\
\025\001\059\000\010\001\001\001\008\001\003\001\020\001\024\001\
\006\001\025\001\010\001\025\001\010\001\013\001\014\001\017\001\
\024\001\002\001\003\001\004\001\005\001\013\001\014\001\011\001\
\009\001\060\000\024\001\002\001\003\001\004\001\005\001\004\001\
\005\001\018\001\069\000\010\001\011\001\012\001\010\001\074\000\
\011\001\016\001\002\001\003\001\004\001\005\001\010\001\007\001\
\010\001\013\001\014\001\013\001\014\001\010\001\019\001\010\001\
\013\001\014\001\013\001\014\001\010\001\006\001\010\001\013\001\
\014\001\013\001\014\001\002\001\003\001\004\001\005\001\034\000\
\035\000\025\001\007\001\255\255\025\001\008\001\025\001\255\255\
\010\001\010\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\002\001\003\001\255\255\255\255\255\255\007\001\
\255\255\009\001\010\001\011\001\012\001\013\001\014\001\255\255\
\016\001\255\255\018\001\002\001\003\001\255\255\255\255\255\255\
\007\001\025\001\009\001\010\001\011\001\012\001\013\001\014\001\
\025\001\016\001\255\255\018\001\255\255\255\255\255\255\255\255\
\255\255\255\255\025\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  EQUAL\000\
  GREATER\000\
  LESSER\000\
  OR\000\
  AND\000\
  XOR\000\
  EXCL\000\
  COLON\000\
  COMMA\000\
  INTTYPE\000\
  STATE\000\
  MAIN\000\
  TRUE\000\
  FALSE\000\
  EOL\000\
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'fields_and_edges) in
    Obj.repr(
# 28 "src/definitions/parser.mly"
                                                       (
        _6
    )
# 240 "src/parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 31 "src/definitions/parser.mly"
                                                                   (
        _8
    )
# 249 "src/parser.ml"
               : string))
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "src/definitions/parser.mly"
          ( "" )
# 255 "src/parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fields_and_edges) in
    Obj.repr(
# 38 "src/definitions/parser.mly"
                                          (
        _4
    )
# 264 "src/parser.ml"
               : 'state))
; (fun __caml_parser_env ->
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 41 "src/definitions/parser.mly"
                                                        (
        _6
    )
# 273 "src/parser.ml"
               : 'state))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'cond) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'state) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 47 "src/definitions/parser.mly"
                                                           (
            if _2
            then 
            _5
            else
            _7
        )
# 288 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 54 "src/definitions/parser.mly"
                            (
        Printf.sprintf "%d\n" _3
    )
# 297 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "src/definitions/parser.mly"
          ( "" )
# 303 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "src/definitions/parser.mly"
                                    ( true )
# 309 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "src/definitions/parser.mly"
                                    ( false )
# 315 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 63 "src/definitions/parser.mly"
                                    ( _1 = _3 )
# 323 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 64 "src/definitions/parser.mly"
                                    ( _1 > _3 )
# 331 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 65 "src/definitions/parser.mly"
                                    ( _1 < _3 )
# 339 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 66 "src/definitions/parser.mly"
                                    ( _1 >= _4 )
# 347 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 67 "src/definitions/parser.mly"
                                    ( _1 <= _4 )
# 355 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 68 "src/definitions/parser.mly"
                                    ( _1 <> _4 )
# 363 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cond) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cond) in
    Obj.repr(
# 69 "src/definitions/parser.mly"
                                    ( _1 && _3 )
# 371 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cond) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cond) in
    Obj.repr(
# 70 "src/definitions/parser.mly"
                                    ( _1 <> _3)
# 379 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'fields_and_edges) in
    Obj.repr(
# 74 "src/definitions/parser.mly"
                                                    (
        let _ = Hashtbl.add variables _2 _4 in
        _6
    )
# 391 "src/parser.ml"
               : 'fields_and_edges))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 78 "src/definitions/parser.mly"
                                                            (
        let _ = Hashtbl.add variables _2 _4 in
        _7
    )
# 403 "src/parser.ml"
               : 'fields_and_edges))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 85 "src/definitions/parser.mly"
                                    ( _1 )
# 410 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 86 "src/definitions/parser.mly"
                                    ( Hashtbl.find variables _1 )
# 417 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 87 "src/definitions/parser.mly"
                                    ( _2 )
# 424 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "src/definitions/parser.mly"
                                    ( _1 + _3 )
# 432 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "src/definitions/parser.mly"
                                    ( _1 - _3 )
# 440 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "src/definitions/parser.mly"
                                    ( _1 * _3 )
# 448 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "src/definitions/parser.mly"
                                    ( _1 / _3 )
# 456 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "src/definitions/parser.mly"
                                    ( - _2 )
# 463 "src/parser.ml"
               : 'expr))
(* Entry main *)
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
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : string)
