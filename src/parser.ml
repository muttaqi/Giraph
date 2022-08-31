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

open Parsing;;
let _ = parse_error;;
# 2 "src/definitions/parser.mly"
    open List
    open Float

    let variables = Hashtbl.create 1000;;
# 35 "src/parser.ml"
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
    0|]

let yytransl_block = [|
  257 (* INT *);
  280 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\004\000\002\000\002\000\002\000\006\000\006\000\003\000\
\003\000\003\000\003\000\003\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\000\000"

let yylen = "\002\000\
\008\000\006\000\006\000\002\000\003\000\004\000\002\000\006\000\
\005\000\004\000\003\000\000\000\001\000\001\000\003\000\003\000\
\003\000\003\000\004\000\004\000\004\000\003\000\003\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\032\000\000\000\000\000\000\000\000\000\
\000\000\004\000\000\000\000\000\000\000\000\000\000\000\005\000\
\000\000\000\000\000\000\024\000\000\000\000\000\025\000\000\000\
\000\000\000\000\000\000\006\000\031\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\013\000\014\000\000\000\
\000\000\001\000\026\000\000\000\000\000\029\000\030\000\003\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\010\000\015\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\008\000\000\000\000\000\000\000\
\002\000"

let yydgoto = "\002\000\
\004\000\009\000\027\000\075\000\040\000\012\000\041\000"

let yysindex = "\006\000\
\002\255\000\000\247\254\000\000\027\255\015\255\248\254\017\255\
\036\255\000\000\021\255\049\255\047\255\055\255\053\255\000\000\
\020\255\074\255\080\255\000\000\020\255\020\255\000\000\063\255\
\082\255\007\255\092\255\000\000\000\000\170\255\020\255\020\255\
\020\255\020\255\015\255\020\255\007\255\000\000\000\000\125\255\
\166\255\000\000\000\000\114\255\114\255\000\000\000\000\000\000\
\070\255\110\255\084\255\020\255\046\255\052\255\098\255\099\255\
\007\255\007\255\058\255\000\000\000\000\129\255\020\255\129\255\
\020\255\129\255\020\255\117\255\011\255\011\255\129\255\129\255\
\129\255\015\255\074\255\109\255\000\000\116\255\074\255\131\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\127\255\000\000\
\000\000\134\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\076\255\093\255\000\000\000\000\000\000\
\139\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\132\255\000\000\137\255\
\000\000\142\255\000\000\000\000\255\254\044\255\147\255\152\255\
\157\255\000\000\144\255\000\000\000\000\000\000\134\255\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\222\255\209\255\000\000\239\255\106\000\237\255"

let yytablesize = 180
let yytable = "\024\000\
\048\000\060\000\010\000\029\000\030\000\023\000\001\000\020\000\
\023\000\021\000\011\000\005\000\037\000\044\000\045\000\046\000\
\047\000\051\000\049\000\050\000\020\000\003\000\021\000\057\000\
\058\000\022\000\007\000\077\000\038\000\039\000\023\000\080\000\
\006\000\008\000\062\000\064\000\066\000\069\000\070\000\076\000\
\013\000\045\000\014\000\023\000\015\000\071\000\020\000\072\000\
\021\000\073\000\022\000\022\000\020\000\022\000\021\000\063\000\
\017\000\022\000\020\000\016\000\021\000\065\000\018\000\022\000\
\031\000\032\000\033\000\034\000\036\000\023\000\019\000\031\000\
\059\000\033\000\034\000\023\000\025\000\027\000\027\000\026\000\
\035\000\023\000\027\000\026\000\027\000\027\000\027\000\027\000\
\027\000\027\000\061\000\027\000\036\000\027\000\028\000\028\000\
\057\000\058\000\011\000\028\000\042\000\028\000\028\000\028\000\
\028\000\028\000\028\000\067\000\028\000\068\000\028\000\031\000\
\032\000\033\000\034\000\078\000\043\000\033\000\034\000\052\000\
\053\000\054\000\074\000\079\000\028\000\055\000\031\000\032\000\
\033\000\034\000\031\000\032\000\033\000\034\000\052\000\053\000\
\054\000\007\000\016\000\081\000\055\000\016\000\012\000\017\000\
\016\000\016\000\017\000\011\000\018\000\017\000\017\000\018\000\
\009\000\019\000\018\000\018\000\019\000\000\000\020\000\019\000\
\019\000\020\000\000\000\021\000\020\000\020\000\021\000\000\000\
\000\000\021\000\021\000\031\000\032\000\033\000\034\000\056\000\
\043\000\000\000\057\000\058\000"

let yycheck = "\017\000\
\035\000\049\000\011\001\021\000\022\000\007\001\001\000\001\001\
\010\001\003\001\019\001\021\001\006\001\031\000\032\000\033\000\
\034\000\037\000\036\000\037\000\001\001\020\001\003\001\013\001\
\014\001\006\001\012\001\075\000\022\001\023\001\024\001\079\000\
\006\001\019\001\052\000\053\000\054\000\057\000\058\000\074\000\
\024\001\059\000\007\001\024\001\024\001\063\000\001\001\065\000\
\003\001\067\000\007\001\006\001\001\001\010\001\003\001\010\001\
\010\001\006\001\001\001\011\001\003\001\010\001\008\001\006\001\
\002\001\003\001\004\001\005\001\011\001\024\001\018\001\002\001\
\003\001\004\001\005\001\024\001\003\001\002\001\003\001\010\001\
\018\001\024\001\007\001\010\001\009\001\010\001\011\001\012\001\
\013\001\014\001\007\001\016\001\011\001\018\001\002\001\003\001\
\013\001\014\001\019\001\007\001\009\001\009\001\010\001\011\001\
\012\001\013\001\014\001\010\001\016\001\011\001\018\001\002\001\
\003\001\004\001\005\001\007\001\007\001\004\001\005\001\010\001\
\011\001\012\001\006\001\008\001\019\000\016\001\002\001\003\001\
\004\001\005\001\002\001\003\001\004\001\005\001\010\001\011\001\
\012\001\011\001\007\001\009\001\016\001\010\001\009\001\007\001\
\013\001\014\001\010\001\009\001\007\001\013\001\014\001\010\001\
\009\001\007\001\013\001\014\001\010\001\255\255\007\001\013\001\
\014\001\010\001\255\255\007\001\013\001\014\001\010\001\255\255\
\255\255\013\001\014\001\002\001\003\001\004\001\005\001\010\001\
\007\001\255\255\013\001\014\001"

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
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'fields) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'conditional_edges) in
    Obj.repr(
# 30 "src/definitions/parser.mly"
                                                                    (
        fun () ->
            let _ = _4 in
            _7
    )
# 216 "src/parser.ml"
               : unit -> string))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'fields) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'conditional_edges) in
    Obj.repr(
# 38 "src/definitions/parser.mly"
                                                         (
        let _ = _2 in
        _5
    )
# 227 "src/parser.ml"
               : 'state))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 45 "src/definitions/parser.mly"
                                          (
        let _ = Hashtbl.add variables _2 _4 in
        _6
    )
# 239 "src/parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "src/definitions/parser.mly"
                     (
        ""
    )
# 247 "src/parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'input_fields) in
    Obj.repr(
# 52 "src/definitions/parser.mly"
                                  (
        _2
    )
# 256 "src/parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'input_fields) in
    Obj.repr(
# 58 "src/definitions/parser.mly"
                                     (
        let var = read_int() in
        let _ = Hashtbl.add variables _2 var in
        _4
    )
# 268 "src/parser.ml"
               : 'input_fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "src/definitions/parser.mly"
                    (
        let var = read_int() in
        let _ = Hashtbl.add variables _2 var in
        ""
    )
# 279 "src/parser.ml"
               : 'input_fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'cond) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'state) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 71 "src/definitions/parser.mly"
                                                       (
        if _2 then
            _5
        else
            _6
    )
# 293 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'cond) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'state) in
    Obj.repr(
# 77 "src/definitions/parser.mly"
                                     (
        if _2 then
            _5
        else
            ""
    )
# 306 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 83 "src/definitions/parser.mly"
                                           (
        let to_return = _4 in
        (Printf.sprintf "%d\n" _3) ^ to_return
    )
# 317 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "src/definitions/parser.mly"
                         (
        Printf.sprintf "%d\n" _3
    )
# 326 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "src/definitions/parser.mly"
        ( "\n" )
# 332 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "src/definitions/parser.mly"
                                    ( true )
# 338 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "src/definitions/parser.mly"
                                    ( false )
# 344 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cond) in
    Obj.repr(
# 96 "src/definitions/parser.mly"
                                    ( _2 )
# 351 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "src/definitions/parser.mly"
                                    ( _1 = _3 )
# 359 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "src/definitions/parser.mly"
                                    ( _1 > _3 )
# 367 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "src/definitions/parser.mly"
                                    ( _1 < _3 )
# 375 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "src/definitions/parser.mly"
                                    ( _1 >= _4 )
# 383 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "src/definitions/parser.mly"
                                    ( _1 <= _4 )
# 391 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "src/definitions/parser.mly"
                                    ( _1 <> _4 )
# 399 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cond) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cond) in
    Obj.repr(
# 103 "src/definitions/parser.mly"
                                    ( _1 && _3 )
# 407 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cond) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cond) in
    Obj.repr(
# 104 "src/definitions/parser.mly"
                                    ( _1 <> _3)
# 415 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 108 "src/definitions/parser.mly"
                                    ( _1 )
# 422 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "src/definitions/parser.mly"
                                    ( Hashtbl.find variables _1 )
# 429 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 110 "src/definitions/parser.mly"
                                    ( _2 )
# 436 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "src/definitions/parser.mly"
                                    ( _1 + _3 )
# 444 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "src/definitions/parser.mly"
                                    ( _1 - _3 )
# 452 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "src/definitions/parser.mly"
                                    ( _1 * _3 )
# 460 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "src/definitions/parser.mly"
                                    ( _1 / _3 )
# 468 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "src/definitions/parser.mly"
                                    ( - _2 )
# 475 "src/parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit -> string)
