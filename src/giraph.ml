let read_file filename =
    let ch = open_in filename in
    let s = really_input_string ch (in_channel_length ch) in
    close_in ch;
    s

let _ =
    try
    let src = read_file (Sys.argv.(1)) in
    let lexbuf = Lexing.from_string src in
    while true do
        let result = Parser.main Lexer.token lexbuf in
        print_string (result ()); flush stdout
    done
    with Lexer.Eof ->
    exit 0
