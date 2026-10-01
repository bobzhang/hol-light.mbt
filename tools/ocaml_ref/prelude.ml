(* Loads the upstream lib.ml + fusion.ml into a plain OCaml toplevel. *)
let needs (_:string) = ();;
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
