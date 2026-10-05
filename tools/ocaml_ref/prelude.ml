(* Loads the upstream lib.ml + fusion.ml into a plain OCaml toplevel. *)
let needs (_:string) = ();;
(* a top-level `loadt "f"` is a dependency, loaded before (as `needs`) *)
let loadt (_:string) = ();;
(* likewise `loads "f"` (Rqe/make.ml, IsabelleLight/isalight.ml) *)
let loads (_:string) = ();;
let float_sqrt = sqrt;;
let float_fabs = abs_float;;
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
let show_trace name =
  out (name ^ " quotations (" ^ string_of_int (length !quotation_trace) ^ "):");
  List.iter (fun s -> out ("  " ^ String.escaped s)) (rev !quotation_trace);;
