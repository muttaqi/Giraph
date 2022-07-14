%{
    open List
    open Float

    let variables = Hashtbl.create 1000;;
%}

%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token LBRACE RBRACE
%token EQUAL GREATER LESSER
%token OR AND XOR EXCL
%token COLON
%token COMMA
%token INTTYPE
%token STATE
%token MAIN
%token TRUE FALSE
%token <string> IDENT
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */

%start main             /* the entry point */
%type <string> main
%%

main:
    STATE MAIN LPAREN fields RPAREN LBRACE conditional_edges RBRACE {
        let _ = $4 in
        $7
    }
;

state:
    LPAREN fields RPAREN LBRACE conditional_edges RBRACE {
        let _ = $2 in
        $5
    }
;

fields:
    INTTYPE IDENT EQUAL expr COMMA fields {
        let _ = Hashtbl.add variables $2 $4 in
        $6
    }
    | LESSER GREATER {
        ""
    }
;

conditional_edges:
    EQUAL cond EQUAL GREATER state conditional_edges   {
        if $2 then
            $5
        else
            $6
    }
    | EQUAL cond EQUAL GREATER state {
        if $2 then
            $5
        else
            ""
    }
    | MINUS GREATER expr conditional_edges {
        let to_return = $4 in
        (Printf.sprintf "%d\n" $3) ^ to_return
    }
    | MINUS GREATER expr {
        Printf.sprintf "%d\n" $3
    }
    | ; { "done\n" }
;

cond:
    TRUE                            { true }
    | FALSE                         { false }
    | LPAREN cond RPAREN            { $2 }
    | expr EQUAL expr               { $1 = $3 }
    | expr GREATER expr             { $1 > $3 }
    | expr LESSER expr              { $1 < $3 }
    | expr GREATER EQUAL expr       { $1 >= $4 }
    | expr LESSER EQUAL expr        { $1 <= $4 }
    | expr EXCL EQUAL expr          { $1 <> $4 }
    | cond AND cond                 { $1 && $3 }
    | cond OR cond                  { $1 <> $3}
;

expr:
    INT                             { $1 }
    | IDENT                         { Hashtbl.find variables $1 }
    | LPAREN expr RPAREN            { $2 }
    | expr PLUS expr                { $1 + $3 }
    | expr MINUS expr               { $1 - $3 }
    | expr TIMES expr               { $1 * $3 }
    | expr DIV expr                 { $1 / $3 }
    | MINUS expr %prec UMINUS       { - $2 }
;
