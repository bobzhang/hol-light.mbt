(* The MoonBit-side IR the translator lowers to, and its printer. The
   printed code is formatted afterwards by `moon fmt`. *)
module Ir = struct
  type exp =
    | Atom of string                 (* identifier, literal or accessor read *)
    | Call of exp * exp list
    | Lam of string list * block
    | Tuple of exp list
    | ListLit of exp list
    | Prepend of exp * exp           (* tail, head *)
    | Concat of exp * exp
    | If of exp * block * block
    | Match of exp * (string * block) list
    | Try of block * (string * block) list
    | Raise of exp
    | Field of exp * int
    | Not of exp
    | Deref of exp                   (* r.val *)
    | RefNew of exp                  (* Ref::{ val: e } *)
    | Binop of string * exp * exp
    | Blk of block

  and stmt =
    | Let of string * exp
    | LetTyped of string * string * exp
    | Do of exp
    | Assign of exp * exp                 (* r.val = e *)
    | LetFn of string * (string * string) list * string * block
                                          (* local recursive function *)
    | LetRec of (string * (string * string) list * string option * block) list
                                          (* mutually recursive closures *)

  and block = stmt list * exp

  (* Whether evaluating the expression may have an observable effect
     (including raising), so that its position in the evaluation order
     matters. Closures, constants, variables and accessor reads do not. *)
  let rec ordered = function
    | Atom _ | Lam _ -> false
    | Tuple es | ListLit es -> List.exists ordered es
    | Prepend (a, b) | Concat (a, b) -> ordered a || ordered b
    | Field (e, _) | Not e -> ordered e
    | RefNew _ -> true (* a fresh mutable cell: its identity matters *)
    | Deref _ -> true (* reads mutable state *)
    | Binop (("==" | "!=" | "&&" | "||"), a, b) -> ordered a || ordered b
    | Binop _ -> true (* arithmetic can overflow/divide by zero *)
    | Call _ | If _ | Match _ | Try _ | Raise _ | Blk _ -> true

  let buf = Buffer.create 4096
  let indent = ref 0
  let nl () = Buffer.add_char buf '\n'; Buffer.add_string buf (String.make (2 * !indent) ' ')
  let p s = Buffer.add_string buf s

  let rec pexp = function
    | Atom s -> p s
    | Call (f, args) ->
        pfun f; p "("; plist args; p ")"
    | Lam (ps, b) ->
        (match ps with
         | [ x ] when not (String.contains x ':') -> p x
         | _ -> p "("; p (String.concat ", " ps); p ")");
        p " => "; pbody b
    | Tuple es -> p "("; plist es; p ")"
    | ListLit [] -> p "@list.empty()"
    | ListLit es -> p "@list.List(["; plist es; p "])"
    | Prepend (tl, hd) -> pfun tl; p ".prepend("; pexp hd; p ")"
    | Concat (a, b) -> pfun a; p ".concat("; pexp b; p ")"
    | If (c, a, b) -> p "if "; pexp c; p " "; pblock a; p " else "; pblock b
    | Match (e, arms) ->
        p "match "; pexp e; p " {";
        incr indent;
        List.iter (fun (pat, b) -> nl (); p pat; p " => "; pbody b) arms;
        decr indent; nl (); p "}"
    | Try (b, arms) ->
        p "try "; pblock b; p " catch {";
        incr indent;
        List.iter (fun (pat, h) -> nl (); p pat; p " => "; pbody h) arms;
        decr indent; nl (); p "}"
    | Raise e -> p "raise "; pfun e
    | Field (e, i) -> pfun e; p "."; p (string_of_int i)
    | Not e -> p "!"; pfun e
    | Deref e -> pfun e; p ".val"
    | RefNew e -> p "Ref::{ val: "; pexp e; p " }"
    | Binop (op, a, b) -> p "("; pexp a; p " "; p op; p " "; pexp b; p ")"
    | Blk b -> pblock b

  (* An expression in function or receiver position. *)
  and pfun e =
    match e with
    | Atom _ | Call _ | Field _ | Tuple _ | Deref _ -> pexp e
    | _ -> p "("; pexp e; p ")"

  and plist es =
    List.iteri (fun i e -> if i > 0 then p ", "; pexp e) es

  (* The body of an arm or a lambda: a bare expression when there are no
     statements (`{ x }` would read as a struct literal). *)
  and pbody (stmts, e) =
    match stmts, e with
    | [], (Atom _ | Call _ | Field _ | Tuple _ | ListLit _ | Prepend _ | Concat _ | Not _ | Binop _ | Raise _ | Lam _) -> pexp e
    | _ -> pblock (stmts, e)

  and pblock (stmts, e) =
    p "{";
    incr indent;
    List.iter pstmt stmts;
    nl (); pexp e;
    decr indent; nl (); p "}"

  and pstmt = function
    | Let (x, e) -> nl (); p "let "; p x; p " = "; pexp e
    | LetTyped (x, t, e) -> nl (); p "let "; p x; p " : "; p t; p " = "; pexp e
    | Do e -> nl (); pexp e
    | Assign (r, e) -> nl (); pfun r; p ".val = "; pexp e
    | LetFn (name, params, ret, b) ->
        nl (); p "fn "; p name; p "(";
        p (String.concat ", " (List.map (fun (x, t) -> x ^ " : " ^ t) params));
        p ") -> "; p ret; p " raise "; pblock b
    | LetRec fns ->
        (* `fn(...) -> R raise { }`: a lambda in a letrec is not inferred to
           raise *)
        List.iteri
          (fun i (name, params, ret, b) ->
            nl (); p (if i = 0 then "letrec " else "and "); p name;
            let ps = String.concat ", " (List.map (fun (x, t) -> if t = "_" then x else x ^ " : " ^ t) params) in
            (match ret with
             | Some r -> p " = fn("; p ps; p ") -> "; p r; p " raise "
             | None -> p " = ("; p ps; p ") => ");
            pblock b)
          fns

  let to_string f =
    Buffer.clear buf; indent := 0; f (); Buffer.contents buf

  let string_of_exp e = to_string (fun () -> pexp e)
  let string_of_stmts ss = to_string (fun () -> List.iter pstmt ss)

  (* A MoonBit string literal. *)
  let string_lit s =
    let b = Buffer.create (String.length s + 2) in
    Buffer.add_char b '"';
    String.iter
      (fun c ->
        match c with
        | '"' -> Buffer.add_string b "\\\""
        | '\\' -> Buffer.add_string b "\\\\"
        | '\n' -> Buffer.add_string b "\\n"
        | '\t' -> Buffer.add_string b "\\t"
        | '\r' -> Buffer.add_string b "\\r"
        | c when Char.code c < 32 -> Buffer.add_string b (Printf.sprintf "\\u{%x}" (Char.code c))
        | c -> Buffer.add_char b c)
      s;
    Buffer.add_char b '"';
    Buffer.contents b
end
