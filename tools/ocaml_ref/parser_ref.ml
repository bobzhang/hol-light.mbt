(* Runs tools/ocaml_ref/parse_cases.txt through the upstream parser and
   printer. Keep the interpreter in sync with parser/parser_ref_test.mbt. *)
let starts_with p s = String.length s >= String.length p && String.sub s 0 (String.length p) = p;;
let after p s = String.sub s (String.length p) (String.length s - String.length p);;
let words s = filter (fun w -> w <> "") (String.split_on_char ' ' s);;
let split_colon s =
  let i = String.index s ':' in
  String.trim (String.sub s 0 i), String.trim (String.sub s (i+1) (String.length s - i - 1));;
let run line =
  if line = "" || starts_with "#" line then () else
  if starts_with "Y: " line then
    attempt line (fun () -> let ty = parse_type (after "Y: " line) in
                            sty ty ^ " | " ^ string_of_type ty)
  else if starts_with "T: " line then
    attempt line (fun () -> let tm = parse_term (after "T: " line) in
                            stm tm ^ " | " ^ string_of_term tm)
  else try match words line with
    ["newtype"; n; a] -> new_type(n, int_of_string a)
  | "const" :: _ -> let n,t = split_colon (after "const " line) in new_constant(n, parse_type t)
  | ["infix"; n; p; a] -> parse_as_infix(n,(int_of_string p,a))
  | ["binder"; n] -> parse_as_binder n
  | ["prefix"; n] -> parse_as_prefix n
  | "overloadable" :: _ -> let n,t = split_colon (after "overloadable " line) in make_overloadable n (parse_type t)
  | "overload" :: s :: _ -> overload_interface(s, parse_term (after ("overload " ^ s ^ " ") line))
  | "override" :: s :: _ -> override_interface(s, parse_term (after ("override " ^ s ^ " ") line))
  | "abbrev" :: _ -> let n,t = split_colon (after "abbrev " line) in new_type_abbrev(n, parse_type t)
  | ["hide"; n] -> hide_constant n
  | "prioritize" :: _ -> prioritize_overload (parse_type (after "prioritize " line))
  | ["margin"; n] -> set_margin (int_of_string n)
  | _ -> failwith ("bad command: " ^ line)
  with Failure s -> out (line ^ " ! " ^ s);;
let ic = open_in "parse_cases.txt";;
let () = try while true do run (input_line ic) done with End_of_file -> ();;
