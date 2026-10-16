(* Run from the repository root:
   opam exec --switch=hol-light -- ocaml -noinit -w -a -alert -all tools/translator/lexer_test.ml *)
#directory "+compiler-libs";;
#load "ocamlcommon.cma";;
#load "unix.cma";;
#load "str.cma";;
#use "tools/translator/mbti.ml";;
#use "tools/translator/ir.ml";;
#use "tools/translator/translator.ml";;
#use "tools/translator/lower.ml";;

Names.root := Sys.getcwd ();;
let prelude = {|
  type lexcode = Ident of string | Resword of string
  let lex (_ : string list) : lexcode list = []
  let explode (s : string) = [s]
  let o f g x = f (g x)
  type pretype = Utv of string
  let parse_pretype (xs : lexcode list) = (Utv "", xs)
  let a x xs = match xs with h :: t when h = x -> (h, t) | _ -> failwith "no parse"
  let finished xs = if xs = [] then (0, xs) else failwith "unparsed"
|};;
let lower source =
  let ast = Parse.implementation (Lexing.from_string (prelude ^ "\nlet result = (" ^ source ^ ");;")) in
  let items = (Loader.typecheck ast).Typedtree.str_items in
  let result = ref None in
  List.iter (fun item -> match item.Typedtree.str_desc with
    | Typedtree.Tstr_value (_, [vb]) ->
        List.iter (fun id ->
          let name = Ident.name id in
          if name = "result" then result := Some vb.Typedtree.vb_expr
          else Hashtbl.replace Prov.table (Ident.unique_name id)
            ((if List.mem name ["lex"; "parse_pretype"; "a"; "finished"] then "parser.ml" else "lib.ml"), name))
          (Typedtree.pat_bound_idents vb.Typedtree.vb_pat)
    | _ -> ()) items;
  let ss, e, _ = Lower.lower (Option.get !result) in
  Ir.string_of_exp (Ir.Blk (ss, e));;
let contains s part =
  try ignore (Str.search_forward (Str.regexp_string part) s 0); true
  with Not_found -> false;;
let check source required forbidden =
  Printf.printf "Checking %s\n%!" source;
  let out = lower source in
  List.iter (fun s -> if not (contains out s) then failwith (source ^ ": missing " ^ s ^ " in " ^ out)) required;
  List.iter (fun s -> if contains out s then failwith (source ^ ": unexpected " ^ s ^ " in " ^ out)) forbidden;
  out;;

(* Direct calls, composed function values, applications, and longer chains. *)
List.iter (fun source ->
  ignore (check source ["@lexer.lex"] ["@lib.explode"; "@lib.implode"]))
  [ "lex (explode \"x + y\")";
    "o lex explode";
    "o lex explode \"x + y\"";
    "(o lex explode) \"x + y\"";
    "o List.length (o lex explode)";
    "o List.length (o lex explode) \"x + y\"" ];

(* The source is evaluated once, including side effects or exceptions. *)
let out = check
  "let count = ref 0 in lex (explode (incr count; string_of_int !count))"
  ["@lib.incr"; "@lexer.lex"] ["@lib.explode"; "@lib.implode"] in
assert (List.length (Str.split_delim (Str.regexp_string "@lib.incr") out) = 2);
ignore (check "lex (explode (failwith \"input failed\"))"
  ["input failed"] ["@lib.explode"; "@lib.implode"]);

(* An arbitrary upstream list or a first-class lex still joins its input. *)
List.iter (fun source -> ignore (check source ["@lexer.lex"; "@lib.implode"] []))
  [ "lex"; "lex [\"a\"; \"b\"]"; "List.map lex [[\"a\"]]" ];

(* Same spelling is insufficient: local functions must keep their behavior. *)
ignore (check "let lex xs = List.length xs in lex (explode \"a\")"
  ["@lib.explode"] ["@lexer.lex"]);
ignore (check "let explode s = [s; s] in lex (explode \"a\")"
  ["@lexer.lex"; "@lib.implode"] []);
ignore (check "let o f g s = f (g (s ^ s)) in o lex explode \"a\""
  ["@lib.explode"; "@lib.implode"] []);
(* Source lists still work at the hand-ported array/view API boundaries.
   In particular, literals and callback tuple remainders need conversion. *)
ignore (check "parse_pretype (lex (explode \"A\"))"
  ["@parser.parse_pretype"; "Array::exact_view"] ["@lib.explode"]);
ignore (check "(fun p -> p (lex (explode \"A\"))) parse_pretype"
  ["@list.List::to_array"; "@list.List("] []);
ignore (check "a \"x\" [\"x\"; \"y\"]"
  ["Array::exact_view"; "@list.List::to_array"] []);
ignore (check "finished ([] : string list)"
  ["Array::exact_view"; "@list.List::to_array"] []);
ignore (check "match snd (parse_pretype (lex (explode \"A\"))) with [] -> true | _ -> false"
  ["@list.List("] []);
print_endline "Lexer translator regression tests passed.";;
