%{
    let variables = Hashtbl.create 1000
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
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */

%start main             /* the entry point */
%type <string> main
%%

main:
    STATE MAIN LPAREN RPAREN LBRACE fields_and_edges   {
        $6
    }
    | STATE MAIN LPAREN RPAREN LBRACE RBRACE EOL conditional_edges {
        $8
    }
    | EOL { "" }
;

state:
    LPAREN RPAREN LBRACE fields_and_edges {
        $4
    }
    | LPAREN RPAREN LBRACE RBRACE EOL conditional_edges {
        $6
    }
;

conditional_edges:
    EQUAL cond EQUAL GREATER state EOL conditional_edges   {
            if $2
            then 
            $5
            else
            $7
        }
    | MINUS GREATER expr    {
        Printf.sprintf "%d\n" $3
    }
    | EOL { "" }
;

cond:
    TRUE                            { true }
    | FALSE                         { false }
    | expr EQUAL expr               { $1 = $3 }
    | expr GREATER expr             { $1 > $3 }
    | expr LESSER expr              { $1 < $3 }
    | expr GREATER EQUAL expr       { $1 >= $4 }
    | expr LESSER EQUAL expr        { $1 <= $4 }
    | expr EXCL EQUAL expr          { $1 <> $4 }
    | cond AND cond                 { $1 && $3 }
    | cond OR cond                  { $1 <> $3}
;

fields_and_edges:
    INTTYPE IDENT COLON expr COMMA fields_and_edges {
        let _ = Hashtbl.add variables $2 $4 in
        $6
    }
    | INTTYPE IDENT COLON expr RBRACE EOL conditional_edges {
        let _ = Hashtbl.add variables $2 $4 in
        $7
    }
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