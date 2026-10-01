(* Runs the Format documents in fmt_cases.txt through OCaml's Format.
   Usage: ocaml fmt_ref.ml < fmt_cases.txt  (plain OCaml, no HOL needed) *)
let run margin maxb doc =
  let buf = Buffer.create 64 in
  let fmt = Format.formatter_of_buffer buf in
  Format.pp_set_max_boxes fmt maxb;
  Format.pp_set_margin fmt margin;
  let ops = String.split_on_char '|' doc in
  List.iter (fun op ->
    if op = "" then () else
    match op.[0] with
    | '[' ->
        let n = int_of_string (String.sub op 2 (String.length op - 2)) in
        (match op.[1] with
         | 'h' -> Format.pp_open_hbox fmt ()
         | 'v' -> Format.pp_open_vbox fmt n
         | 'H' -> Format.pp_open_hvbox fmt n
         | 'o' -> Format.pp_open_hovbox fmt n
         | _ -> Format.pp_open_box fmt n)
    | ']' -> Format.pp_close_box fmt ()
    | 's' ->
        (match String.split_on_char ',' (String.sub op 1 (String.length op - 1)) with
         | [w; o] -> Format.pp_print_break fmt (int_of_string w) (int_of_string o)
         | _ -> failwith "bad break")
    | 'n' -> Format.pp_force_newline fmt ()
    | 't' -> Format.pp_print_string fmt (String.sub op 1 (String.length op - 1))
    | _ -> failwith "bad op") ops;
  Format.pp_print_flush fmt ();
  Buffer.contents buf

let () =
  let i = ref 0 in
  try while true do
    let line = input_line stdin in
    (match String.split_on_char ';' line with
     | [m; b; doc] ->
         let out = run (int_of_string m) (int_of_string b) doc in
         Printf.printf "case %d\n" !i;
         List.iter (fun l -> Printf.printf "|%s|\n" l) (String.split_on_char '\n' out)
     | _ -> failwith "bad case");
    incr i
  done with End_of_file -> ()
