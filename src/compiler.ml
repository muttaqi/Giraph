open Generator
open CodeStream
open Scanner

let help () = print_string "micro <file>\n"

let addop s g d l r =
  match l, r with
  | Literal l1, Literal l2 -> Literal (l1 + l2)
  | Identifier i1, Literal l2 -> generate_add s g d l r
  | Literal l1, Identifier i2 -> generate_add s g d r l
  | _ -> syntax_error s "expected literal or identifier for add operation"
;;
 
let subop s g d l r =
  match l, r with
  | Literal l1, Literal l2 -> Literal (l1 - l2)
  | Identifier i1, Literal l2 -> generate_sub s g d l r
  | Literal l1, Identifier i2 -> generate_sub s g d l r
  | _ -> syntax_error s "expected literal or identifier for sub operation"
;;

let rec expression s g d =
  let primary s =
    match next_token s with
    | LeftParen ->
      let _ = match_token s LeftParen in
      let e = expression s g (d + 1) in
      if match_token s RightParen
      then Some e
      else syntax_error s "right paren expected in expression"
    | Identifier i ->
      let _ = match_token s (Identifier i) in
      Some (Identifier i)
    | Literal l ->
      let _ = match_token s (Literal l) in
      Some (Literal l)
    | _ -> None
  in
  let lp = primary s in
  match lp with
  | Some l ->
    (match next_token s with
    | AddOp ->
      let _ = match_token s AddOp in
      addop s g d l (expression s g (d + 1))
    | SubOp ->
      let _ = match_token s SubOp in
      subop s g d l (expression s g (d + 1))
    | _ -> l)
  | None -> syntax_error s "literal or identifier expected"
;;

let identifiers s =
  let rec idens ids =
    match next_token s with
    | Identifier i ->
      let _ = match_next s in
      let n = next_token s in
      if n = Comma
      then (
        let _ = match_token s Comma in
        idens (Identifier i :: ids))
      else idens (Identifier i :: ids)
    | _ -> ids
  in
  idens []
;;

let read s g =
  if match_token s Read
  then
    if match_token s LeftParen
    then (
      let ids = identifiers s in
      if ids = []
      then syntax_error s "read statement expects comma seperated identifier(s)"
      else if match_token s RightParen
      then (
        let _ = generate_reads s g (List.rev ids) in
        true)
      else syntax_error s "right paren expected in read statement")
    else syntax_error s "left paren expected in read statement"
  else syntax_error s "read statement expected"
;;

let write s g =
  let rec expressions c =
    let e = expression s g 1 in
    if match e with
       | Identifier _ ->
         let _ = generate_write s g e in
         true
       | Literal _ ->
         let _ = generate_write s g e in
         true
       | _ -> false
    then
      if next_token s = Comma
      then (
        let _ = match_token s Comma in
        expressions (c + 1))
      else c + 1
    else c
  in
  if match_token s Write
  then
    if match_token s LeftParen
    then
      if expressions 0 > 0
      then
        if match_token s RightParen
        then true
        else syntax_error s "right paren expected in write statement"
      else syntax_error s "write statement expected atleast one expression"
    else syntax_error s "left paren expected in write statement"
  else syntax_error s "write statement expected"
;;

(*
let assignment s g =
  let id = match_next s in
  match id with
  | Identifier i ->
    if match_token s Assign
    then (
      let new_var = if is_alloc_var s g i then 0 else 1 in
      let id2 = expression s g (1 + new_var) in
      match id2 with
      | Literal l2 ->
        let _ = generate_assign s g id id2 in
        true
      | Identifier i2 ->
        let _ = generate_assign s g id id2 in
        true
      | _ -> syntax_error s "literal or identifier expected")
    else syntax_error s "assign symbol expected"
  | _ -> syntax_error s "identifier expected"
;;
*)

let conditional_edge s g =
  let edge = match_next s in
  match edge with
  | Equal ->
  | Dash ->
  | _ -> syntax_error s "conditional edge expected a dash or equal sign"

let rec conditional_edges s g = if conditional_edge s g then conditional_edges s g else ()

let field s g =
  let id = match_next s in
  match id with
  | Identifier i ->
    if match_token s Colon
    then (
      let id2 = match_next s in
      match id2 with
      | Literal l ->
        let _ = generate_assign s g id id2
        true
    )
    else syntax_error s "field expected a colon after field name"
  | RightBrace -> false
  | _ -> syntax_error s "fields expected an identifier or right brace"
;;

(*
let statement s g =
  let t = next_token s in
  if match t with
     | Read -> read s g
     | Write -> write s g
     | Identifier i -> assignment s g
     | _ -> false
  then
    if match_token s Semicolon
    then true
    else syntax_error s "statement must end with semicolon"
  else false
;;
*)

let rec statements s g = if statement s g then statements s g else ()

let rec fields s g = if field s g then fields s g else ()

let main_state s g =
  if match_token s LeftParen
  then (
    if match_token s RightParen
    then (
      if match_token s LeftBrace
      then (
        fields s g
        conditional_edges s g
      )
      else syntax_error s "state expected left brace"
    )
    else syntax_error s "state arguments aren't supported yet"
  )
  else syntax_error s "main state expected a left parenthesis"
;;

(*
let program s g =
  if match_token s Begin
  then (
    let _ = generate_begin s g in
    let _ = statements s g in
    if match_token s End
    then (
      let _ = generate_end s g in
      ())
    else syntax_error s "program should end with end keyword")
  else syntax_error s "program should start with begin keyword"
;;
*)

let program s g =
  if match_token s State
  then (
    if match_token s Main
    then (
      let _ = main_state s g in
    )
    else syntax_error s "program cannot have a non-main named state"
  )
  else syntax_error s "program should start with a main state"
;;

let parse stm g =
  let s = new_scanner stm in
  try program s g with
  | End_of_file -> syntax_error s "program reached end of file before end keyword"
;;

let compile file =
  try
    let g = new_generator file in
    let stm = open_stream file in
    let out = Filename.chop_extension file in
    parse stm g;
    close_stream stm;
    close_generator g;
    let _ = Sys.command ("nasm -f elf64 " ^ g.file) in
    let _ = Sys.command ("gcc -no-pie -o " ^ out ^ " " ^ out ^ ".o") in
    ()
  with
  | Syntax_error e ->
    Format.printf "syntax error: %s\n" e;
    Format.print_flush ()
  | Sys_error _ -> print_string "no such file found\n"
;;

let () =
  if Array.length Sys.argv = 1
  then help ()
  else (
    let file = Array.get Sys.argv 1 in
    Format.printf "compiling %s\n" file;
    Format.print_flush ();
    compile file)
;;
