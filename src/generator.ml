open Scanner

type generator =
  { vars : (string, int) Hashtbl.t
  ; file : string
  ; chan : out_channel
  }

let new_generator file =
  let fs = Filename.chop_extension file ^ ".s" in
  { vars = Hashtbl.create 100; file = fs; chan = open_out fs }
;;

let close_generator g = close_out g.chan

let gen g v =
  output_string g.chan v;
  output_string g.chan "\n"
;;

let bottom_var _ g = Hashtbl.fold (fun _ v c -> if v >= c then v + 4 else c) g.vars 0
let empty_var s g i = bottom_var s g + (4 * (i - 1))

let var_addr s g v =
  if String.length v > 6 && String.sub v 0 6 = "__temp"
  then (
    let i = String.sub v 6 (String.length v - 6) in
    "[rsp+" ^ i ^ "]")
  else (
    try "[rsp+" ^ string_of_int (Hashtbl.find g.vars v) ^ "]" with
    | Not_found -> syntax_error s ("identifier " ^ v ^ " not defined"))
;;

let var s g v = "qword " ^ var_addr s g v
let temp_var s g i = Identifier ("__temp" ^ string_of_int (empty_var s g i))
let is_alloc_var _ g v = Hashtbl.mem g.vars v

let alloc_var s g v =
  if is_alloc_var s g v
  then var s g v
  else (
    let _ = Hashtbl.replace g.vars v (empty_var s g 1) in
    var s g v)
;;

let token_var s g v =
  match v with
  | Identifier i -> var s g i
  | _ -> syntax_error s "identifier expected"
;;

let op g opcode a = gen g ("    " ^ opcode ^ "  " ^ a)
let op2 g opcode a b = gen g ("    " ^ opcode ^ "  " ^ a ^ ", " ^ b)
let push g a = op g "push" a

let generate_begin _ g = gen g
"extern printf
extern scanf

section .data
    inf: db '%d', 0
    ouf: db '%d', 10, 0

section .text
    global main

main:
    sub   rsp, 1000"

let generate_end _ g =
  gen
    g
    "    add   rsp, 1000\n\n\
     exit:\n\n\
    \    mov  rax, 1 ; sys_exit\n\n\
    \    mov  ebx, 0\n\n\
    \    int  80h"
;;

let generate_read s g id =
  match id with
  | Identifier i ->
    op2 g "lea" "rax" (var_addr s g i);
    op2 g "mov" "rdi" "inf";
    op2 g "mov" "rsi" "rax";
    op2 g "xor" "rax" "rax";
    op g "call" "scanf"
  | _ -> syntax_error s "generate read called with invalid argument"
;;

let rec generate_reads s g = List.iter (generate_read s g)

let generate_write s g id =
  match id with
  | Identifier i ->
    op2 g "mov" "rax" (var s g i);
    op2 g "mov" "rdi" "ouf";
    op2 g "mov" "rsi" "rax";
    op2 g "xor" "rax" "rax";
    op g "call" "printf"
  | _ -> syntax_error s "generate write called with invalid argument"
;;

let generate_copy s g a b =
  match a with
  | Identifier i ->
    (match b with
    | Identifier i2 ->
      op2 g "mov " "rax" (var s g i2);
      op2 g "mov " (var s g i) "rax"
    | Literal l -> op2 g "mov " (var s g i) (string_of_int l)
    | _ -> syntax_error s "generate copy called with invalid argument")
  | _ -> syntax_error s "generate copy called with invalid argument"
;;

let generate_assign s g a b =
  match a with
  | Identifier i ->
    let _ = alloc_var s g i in
    generate_copy s g a b
  | _ -> syntax_error s "generate assign called with invalid argument"
;;

let generate_add s g d id1 id2 =
  match id1, id2 with
  | Identifier i1, Identifier i2 ->
    let v = temp_var s g d in
    let vi = token_var s g v in
    let _ = generate_copy s g v id1 in
    let _ = op2 g "add " vi (var s g i2) in
    v
  | Identifier i1, Literal l2 ->
    let v = temp_var s g d in
    let vi = token_var s g v in
    let _ = generate_copy s g v id1 in
    let _ = op2 g "add " vi (string_of_int l2) in
    v
  | _ -> syntax_error s "generate exp called with invalid argument"
;;

let generate_sub s g d id1 id2 =
  match id1, id2 with
  | Identifier i1, Identifier i2 ->
    let v = temp_var s g d in
    let vi = token_var s g v in
    let _ = generate_copy s g v id1 in
    let _ = op2 g "sub " vi (var s g i2) in
    v
  | Identifier i1, Literal l2 ->
    let v = temp_var s g d in
    let vi = token_var s g v in
    let _ = generate_copy s g v id1 in
    let _ = op2 g "sub " vi (string_of_int l2) in
    v
  | Literal l1, Identifier i2 ->
    let v = temp_var s g d in
    let vi = token_var s g v in
    let _ = generate_copy s g v id1 in
    let _ = op2 g "sub " vi (var s g i2) in
    v
  | _ -> syntax_error s "generate exp called with invalid argument"
;;
