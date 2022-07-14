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
\001\000\004\000\002\000\002\000\003\000\003\000\003\000\003\000\
\003\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\006\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\000\000"

let yylen = "\002\000\
\008\000\006\000\006\000\002\000\006\000\005\000\004\000\003\000\
\000\000\001\000\001\000\003\000\003\000\003\000\003\000\004\000\
\004\000\004\000\003\000\003\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\029\000\000\000\000\000\000\000\000\000\
\000\000\004\000\000\000\000\000\000\000\000\000\021\000\000\000\
\000\000\022\000\000\000\000\000\000\000\000\000\028\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\
\011\000\000\000\000\000\001\000\023\000\000\000\000\000\026\000\
\027\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\007\000\012\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\005\000\000\000\
\000\000\000\000\002\000"

let yydgoto = "\002\000\
\004\000\009\000\022\000\069\000\034\000\035\000"

let yysindex = "\005\000\
\003\255\000\000\009\255\000\000\026\255\253\254\025\255\028\255\
\031\255\000\000\045\255\049\255\004\255\016\255\000\000\004\255\
\004\255\000\000\103\255\055\255\036\255\064\255\000\000\060\255\
\004\255\004\255\004\255\004\255\253\254\004\255\036\255\000\000\
\000\000\122\255\157\255\000\000\000\000\111\255\111\255\000\000\
\000\000\000\000\126\255\107\255\077\255\004\255\019\255\044\255\
\065\255\066\255\036\255\036\255\050\255\000\000\000\000\170\255\
\004\255\170\255\004\255\170\255\004\255\080\255\155\255\155\255\
\170\255\170\255\170\255\253\254\016\255\085\255\000\000\093\255\
\016\255\094\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\104\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\069\255\086\255\000\000\
\000\000\000\000\113\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\130\255\
\000\000\132\255\000\000\140\255\000\000\000\000\001\255\014\255\
\142\255\150\255\152\255\000\000\139\255\000\000\000\000\000\000\
\104\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\229\255\214\255\000\000\243\255\018\000"

let yytablesize = 175
let yytable = "\019\000\
\054\000\042\000\023\000\024\000\015\000\001\000\016\000\020\000\
\007\000\017\000\020\000\038\000\039\000\040\000\041\000\008\000\
\043\000\044\000\020\000\015\000\019\000\016\000\003\000\019\000\
\017\000\021\000\071\000\018\000\057\000\005\000\074\000\006\000\
\056\000\058\000\060\000\010\000\015\000\012\000\016\000\039\000\
\070\000\031\000\018\000\065\000\015\000\066\000\016\000\067\000\
\045\000\017\000\015\000\011\000\016\000\059\000\013\000\017\000\
\014\000\032\000\033\000\018\000\030\000\025\000\026\000\027\000\
\028\000\030\000\037\000\018\000\063\000\064\000\024\000\024\000\
\036\000\018\000\061\000\024\000\062\000\024\000\024\000\024\000\
\024\000\024\000\024\000\055\000\024\000\068\000\024\000\025\000\
\025\000\051\000\052\000\072\000\025\000\000\000\025\000\025\000\
\025\000\025\000\025\000\025\000\073\000\025\000\075\000\025\000\
\025\000\026\000\027\000\028\000\025\000\026\000\027\000\028\000\
\009\000\037\000\027\000\028\000\046\000\047\000\048\000\000\000\
\029\000\008\000\049\000\025\000\026\000\027\000\028\000\025\000\
\053\000\027\000\028\000\046\000\047\000\048\000\000\000\021\000\
\013\000\049\000\014\000\013\000\000\000\014\000\013\000\013\000\
\014\000\014\000\015\000\006\000\016\000\015\000\000\000\016\000\
\015\000\015\000\016\000\016\000\017\000\000\000\018\000\017\000\
\000\000\018\000\017\000\017\000\018\000\018\000\050\000\051\000\
\052\000\051\000\052\000\025\000\026\000\027\000\028\000"

let yycheck = "\013\000\
\043\000\029\000\016\000\017\000\001\001\001\000\003\001\007\001\
\012\001\006\001\010\001\025\000\026\000\027\000\028\000\019\001\
\030\000\031\000\003\001\001\001\007\001\003\001\020\001\010\001\
\006\001\010\001\069\000\024\001\010\001\021\001\073\000\006\001\
\046\000\047\000\048\000\011\001\001\001\007\001\003\001\053\000\
\068\000\006\001\024\001\057\000\001\001\059\000\003\001\061\000\
\031\000\006\001\001\001\024\001\003\001\010\001\010\001\006\001\
\008\001\022\001\023\001\024\001\011\001\002\001\003\001\004\001\
\005\001\011\001\007\001\024\001\051\000\052\000\002\001\003\001\
\009\001\024\001\010\001\007\001\011\001\009\001\010\001\011\001\
\012\001\013\001\014\001\007\001\016\001\006\001\018\001\002\001\
\003\001\013\001\014\001\007\001\007\001\255\255\009\001\010\001\
\011\001\012\001\013\001\014\001\008\001\016\001\009\001\018\001\
\002\001\003\001\004\001\005\001\002\001\003\001\004\001\005\001\
\009\001\007\001\004\001\005\001\010\001\011\001\012\001\255\255\
\018\001\009\001\016\001\002\001\003\001\004\001\005\001\002\001\
\003\001\004\001\005\001\010\001\011\001\012\001\255\255\010\001\
\007\001\016\001\007\001\010\001\255\255\010\001\013\001\014\001\
\013\001\014\001\007\001\009\001\007\001\010\001\255\255\010\001\
\013\001\014\001\013\001\014\001\007\001\255\255\007\001\010\001\
\255\255\010\001\013\001\014\001\013\001\014\001\010\001\013\001\
\014\001\013\001\014\001\002\001\003\001\004\001\005\001"

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
        let _ = _4 in
        _7
    )
# 210 "src/parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'fields) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'conditional_edges) in
    Obj.repr(
# 37 "src/definitions/parser.mly"
                                                         (
        let _ = _2 in
        _5
    )
# 221 "src/parser.ml"
               : 'state))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 44 "src/definitions/parser.mly"
                                          (
        let _ = Hashtbl.add variables _2 _4 in
        _6
    )
# 233 "src/parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "src/definitions/parser.mly"
                     (
        ""
    )
# 241 "src/parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'cond) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'state) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 54 "src/definitions/parser.mly"
                                                       (
        if _2 then
            _5
        else
            _6
    )
# 255 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'cond) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'state) in
    Obj.repr(
# 60 "src/definitions/parser.mly"
                                     (
        if _2 then
            _5
        else
            ""
    )
# 268 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'conditional_edges) in
    Obj.repr(
# 66 "src/definitions/parser.mly"
                                           (
        let to_return = _4 in
        (Printf.sprintf "%d\n" _3) ^ to_return
    )
# 279 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "src/definitions/parser.mly"
                         (
        Printf.sprintf "%d\n" _3
    )
# 288 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "src/definitions/parser.mly"
        ( "done\n" )
# 294 "src/parser.ml"
               : 'conditional_edges))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "src/definitions/parser.mly"
                                    ( true )
# 300 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "src/definitions/parser.mly"
                                    ( false )
# 306 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cond) in
    Obj.repr(
# 79 "src/definitions/parser.mly"
                                    ( _2 )
# 313 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "src/definitions/parser.mly"
                                    ( _1 = _3 )
# 321 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "src/definitions/parser.mly"
                                    ( _1 > _3 )
# 329 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "src/definitions/parser.mly"
                                    ( _1 < _3 )
# 337 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "src/definitions/parser.mly"
                                    ( _1 >= _4 )
# 345 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "src/definitions/parser.mly"
                                    ( _1 <= _4 )
# 353 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "src/definitions/parser.mly"
                                    ( _1 <> _4 )
# 361 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cond) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cond) in
    Obj.repr(
# 86 "src/definitions/parser.mly"
                                    ( _1 && _3 )
# 369 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cond) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cond) in
    Obj.repr(
# 87 "src/definitions/parser.mly"
                                    ( _1 <> _3)
# 377 "src/parser.ml"
               : 'cond))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 91 "src/definitions/parser.mly"
                                    ( _1 )
# 384 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 92 "src/definitions/parser.mly"
                                    ( Hashtbl.find variables _1 )
# 391 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 93 "src/definitions/parser.mly"
                                    ( _2 )
# 398 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "src/definitions/parser.mly"
                                    ( _1 + _3 )
# 406 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "src/definitions/parser.mly"
                                    ( _1 - _3 )
# 414 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "src/definitions/parser.mly"
                                    ( _1 * _3 )
# 422 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "src/definitions/parser.mly"
                                    ( _1 / _3 )
# 430 "src/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "src/definitions/parser.mly"
                                    ( - _2 )
# 437 "src/parser.ml"
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
