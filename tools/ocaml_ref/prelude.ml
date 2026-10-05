(* Loads the upstream lib.ml + fusion.ml into a plain OCaml toplevel. *)
let needs (_:string) = ();;
(* a top-level `loadt "f"` is a dependency, loaded before (as `needs`) *)
let loadt (_:string) = ();;
(* likewise `loads "f"` (Rqe/make.ml, IsabelleLight/isalight.ml) *)
let loads (_:string) = ();;
let float_sqrt = sqrt;;
let float_fabs = abs_float;;
(* The external programs a file runs (csdp for Examples/sos.ml's REAL_SOS,
   ...) are recorded for the MoonBit side to replay (lib/gp.mbt,
   replay_command; wasm has no processes): each command's shape (its file
   names, the words containing a `/`, replaced by <F1>, <F2>, ...), what
   those files held before, its exit status and the files it wrote, into
   the file `command_log` names (batch.py sets it for a target's load).
   PARI/GP's factorizations are computed there, not replayed. *)
let command_log = ref "";;
module Sys = struct
  include Sys
  let command cmd =
    let seps = " \t\n;()<>|&'\"" in
    let n = String.length cmd in
    let paths = ref [] and buf = Buffer.create n and tok = Buffer.create 64 in
    let flush () =
      let t = Buffer.contents tok in
      Buffer.clear tok;
      if String.contains t '/' then begin
        (if not (List.mem t !paths) then paths := !paths @ [t]);
        let rec idx i l = match l with x :: r -> if x = t then i else idx (i + 1) r | [] -> 0 in
        Buffer.add_string buf ("<F" ^ string_of_int (idx 1 !paths) ^ ">")
      end else Buffer.add_string buf t in
    for i = 0 to n - 1 do
      if String.contains seps (String.get cmd i) then (flush (); Buffer.add_char buf (String.get cmd i))
      else Buffer.add_char tok (String.get cmd i)
    done;
    flush ();
    let read p =
      if Sys.file_exists p && not (Sys.is_directory p)
         && not (String.length p >= 5 && String.sub p 0 5 = "/dev/") then begin
        let ic = open_in_bin p in
        let s = really_input_string ic (in_channel_length ic) in
        close_in ic; Some s
      end else None in
    let before = List.map read !paths in
    let st = Sys.command cmd in
    let after = List.map read !paths in
    (if !command_log <> "" && not (String.length cmd > 22 && String.sub cmd 0 22 = "echo 'print(factorint(") then begin
       let oc = open_out_gen [Open_wronly; Open_creat; Open_append; Open_binary] 0o644 !command_log in
       let blob tag s = output_string oc (tag ^ " " ^ string_of_int (String.length s) ^ "\n" ^ s ^ "\n") in
       blob "CMD" (Buffer.contents buf);
       List.iter (fun b -> match b with Some s -> blob "IN" s | None -> output_string oc "IN -1\n") before;
       output_string oc ("ST " ^ string_of_int st ^ "\n");
       List.iteri (fun i (b, a) -> match a with Some s when a <> b -> blob ("OUT " ^ string_of_int i) s | _ -> ())
         (List.combine before after);
       output_string oc "END\n";
       close_out oc
     end);
    st
end;;
#use "lib.ml";;
#use "fusion.ml";;
#use "basics.ml";;
#use "nets.ml";;
#use "printer.ml";;
#use "preterm.ml";;
#use "parser.ml";;
#use "equal.ml";;

let rec sty ty = match ty with
    Tyvar s -> "'" ^ s
  | Tyapp(s,[]) -> s
  | Tyapp(s,args) -> s ^ "(" ^ String.concat "," (map sty args) ^ ")";;
let rec stm tm = match tm with
    Var(s,ty) -> s ^ ":" ^ sty ty
  | Const(s,ty) -> "#" ^ s ^ ":" ^ sty ty
  | Comb(f,x) -> "(" ^ stm f ^ " " ^ stm x ^ ")"
  | Abs(v,b) -> "(\\" ^ stm v ^ ". " ^ stm b ^ ")";;
let sthm th = let asl,c = dest_thm th in
  String.concat ", " (map stm asl) ^ " |- " ^ stm c;;
let slist f l = "[" ^ String.concat "; " (map f l) ^ "]";;
let out s = print_string s; print_newline();;
let attempt name f = try out (name ^ " = " ^ f ()) with
    Failure s -> out (name ^ " ! " ^ s)
  | Match_failure _ -> out (name ^ " !! Match_failure")
  | e -> out (name ^ " !! " ^ Printexc.to_string e);;
(* Quotation trace: quotations expand to calls of whatever parse_term and
   parse_type are bound when a file loads, so these wrappers record the
   order in which a theory parses its quotations. *)
let quotation_trace = ref ([] : string list);;
let parse_type s = quotation_trace := (":" ^ s) :: !quotation_trace; parse_type s;;
let parse_term s = quotation_trace := s :: !quotation_trace; parse_term s;;
let start_trace () = quotation_trace := [];;
(* A quotation parsed 10000 times or more in a row is shown once, with the
   count (Autoformalization/fifteen_theorem.ml parses `F` 2.4 million
   times). *)
let show_trace name =
  out (name ^ " quotations (" ^ string_of_int (length !quotation_trace) ^ "):");
  let rec go l =
    match l with
      [] -> ()
    | s :: _ ->
        let rec count n l = match l with x :: t when x = s -> count (n + 1) t | _ -> n, l in
        let n, rest = count 0 l in
        if n >= 10000 then
          (out ("  " ^ String.escaped s); out ("  (" ^ string_of_int (n - 1) ^ " more times)"))
        else
          (for i = 1 to n do out ("  " ^ String.escaped s) done);
        go rest in
  go (rev !quotation_trace);;
