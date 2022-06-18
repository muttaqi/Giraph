type stream =
  { mutable chr : char option
  ; mutable line_num : int
  ; chan : in_channel
  }

let open_stream file = { chr = None; line_num = 1; chan = open_in file }
let close_stream stm = close_in stm.chan

let read_char stm =
  match stm.chr with
  | None ->
    let c = input_char stm.chan in
    if c = '\n'
    then (
      let _ = stm.line_num <- stm.line_num + 1 in
      c)
    else c
  | Some c ->
    stm.chr <- None;
    c
;;

let unread_char stm c = stm.chr <- Some c
