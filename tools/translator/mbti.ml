(* Reader for the MoonBit interface files (pkg.generated.mbti) of the ported
   packages: the exact name, parameter groups and return type of every
   public function and value, which the translator needs to adapt OCaml's
   curried applications to the MoonBit API. Plain OCaml. *)
module Mbti = struct
  type ty =
    | Named of string * ty list          (* path (e.g. "@kernel.Thm"), args *)
    | Tuple of ty list
    | Fun of ty list * ty * bool         (* params, result, raises *)

  type decl =
    | Func of string list * ty list * ty * bool  (* generics, params, result, raises *)
    | Value of ty
    | Alias of ty                                (* pub type Name = ty *)

  (* --- Lexer ----------------------------------------------------------- *)

  type tok = Id of string | Sym of string

  let is_id_char c =
    (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')
    || c = '_' || c = '@' || c = '/' || c = '.'

  let lex s =
    let n = String.length s in
    let rec go i acc =
      if i >= n then List.rev acc
      else
        let c = s.[i] in
        if c = ' ' || c = '\t' then go (i + 1) acc
        else if c = '-' && i + 1 < n && s.[i + 1] = '>' then go (i + 2) (Sym "->" :: acc)
        else if is_id_char c then begin
          let j = ref i in
          while !j < n && is_id_char s.[!j] do incr j done;
          (* `@kernel.Thm` is one token; a trailing `.` never occurs. *)
          go !j (Id (String.sub s i (!j - i)) :: acc)
        end
        else go (i + 1) (Sym (String.make 1 c) :: acc)
    in
    go 0 []

  (* --- Parser ---------------------------------------------------------- *)

  exception Parse_error of string

  let rec parse_ty toks =
    let base, rest =
      match toks with
      | Sym "(" :: rest ->
          let tys, rest = parse_list ")" rest in
          (match rest with
           | Sym "-" :: _ -> raise (Parse_error "dangling -")
           | Sym "->" :: rest ->
               let res, rest = parse_ty rest in
               let raises, rest = parse_raise rest in
               (Fun (tys, res, raises), rest)
           | _ ->
               (match tys with
                | [t] -> (t, rest)
                | _ -> (Tuple tys, rest)))
      | Id name :: Sym "[" :: rest ->
          let args, rest = parse_list "]" rest in
          (Named (name, args), rest)
      | Id name :: rest -> (Named (name, []), rest)
      | _ -> raise (Parse_error "type expected")
    in
    let rec options t = function
      | Sym "?" :: rest -> options (Named ("Option", [t])) rest
      | rest -> (t, rest)
    in
    options base rest

  and parse_raise toks =
    match toks with
    | Id "raise" :: Sym "?" :: rest -> (true, rest)
    | Id "raise" :: Id _ :: rest -> (true, rest)   (* `raise E` *)
    | Id "raise" :: rest -> (true, rest)
    | Id "noraise" :: rest -> (false, rest)
    | rest -> (false, rest)

  and parse_list close toks =
    match toks with
    | Sym c :: rest when c = close -> ([], rest)
    | _ ->
        let rec go acc toks =
          let t, rest = parse_ty toks in
          match rest with
          | Sym "," :: Sym c :: rest when c = close -> (List.rev (t :: acc), rest)
          | Sym "," :: rest -> go (t :: acc) rest
          | Sym c :: rest when c = close -> (List.rev (t :: acc), rest)
          | _ -> raise (Parse_error ("expected , or " ^ close))
        in
        go [] toks

  (* A parameter may carry a label: `name~ : T` or `name? : T`. *)
  let rec parse_params toks =
    match toks with
    | Sym ")" :: rest -> ([], rest)
    | _ ->
        let toks =
          match toks with
          | Id _ :: Sym "~" :: Sym ":" :: rest -> rest
          | Id _ :: Sym "?" :: Sym ":" :: rest -> rest
          | Id _ :: Sym ":" :: rest -> rest
          | _ -> toks
        in
        let t, rest = parse_ty toks in
        (match rest with
         | Sym "," :: rest -> let ts, rest = parse_params rest in (t :: ts, rest)
         | Sym ")" :: rest -> ([t], rest)
         | _ -> raise (Parse_error "parameter list"))

  (* functions whose generics carry trait bounds: "pkg.name" *)
  let bounded_fns : (string, unit) Hashtbl.t = Hashtbl.create 64
  let last_bounded = ref false

  let parse_decl line =
    let toks = lex line in
    last_bounded := false;
    match toks with
    | Id "pub" :: Id "fn" :: rest ->
        let generics, rest =
          match rest with
          | Sym "[" :: rest ->
              let rec go acc = function
                | Id g :: Sym "," :: rest -> go (g :: acc) rest
                | Id g :: Sym ":" :: rest ->
                    last_bounded := true;
                    (* bounds: skip to , or ] *)
                    let rec skip = function
                      | Sym "," :: rest -> go (g :: acc) rest
                      | Sym "]" :: rest -> (List.rev (g :: acc), rest)
                      | _ :: rest -> skip rest
                      | [] -> raise (Parse_error "generics")
                    in
                    skip rest
                | Id g :: Sym "]" :: rest -> (List.rev (g :: acc), rest)
                | _ -> raise (Parse_error "generics")
              in
              go [] rest
          | _ -> ([], rest)
        in
        (match rest with
         | Id name :: Sym "(" :: rest when not (String.contains name ':') ->
             let params, rest = parse_params rest in
             let result, rest =
               match rest with
               | Sym "->" :: rest -> parse_ty rest
               | _ -> (Named ("Unit", []), rest)
             in
             let raises, _ = parse_raise rest in
             Some (name, Func (generics, params, result, raises))
         | _ -> None)
    | Id "pub" :: Id "let" :: Id name :: Sym ":" :: rest ->
        let t, _ = parse_ty rest in
        Some (name, Value t)
    | Id "pub" :: Id "type" :: Id name :: Sym "=" :: rest ->
        let t, _ = parse_ty rest in
        Some (name, Alias t)
    | _ -> None

  (* package name (e.g. "tactics") -> declarations *)
  let packages : (string, (string, decl) Hashtbl.t) Hashtbl.t = Hashtbl.create 32

  let load ~root pkg =
    match Hashtbl.find_opt packages pkg with
    | Some t -> t
    | None ->
        let t = Hashtbl.create 256 in
        let file = Filename.concat (Filename.concat root pkg) "pkg.generated.mbti" in
        if Sys.file_exists file then begin
        let ic = open_in file in
        (try
           while true do
             let line = input_line ic in
             (* methods `pub fn T::m(...)` do not parse as declarations *)
             match (try parse_decl line with Parse_error m ->
                        prerr_endline ("mbti: " ^ m ^ ": " ^ line); None) with
               | Some (name, d) ->
                   Hashtbl.replace t name d;
                   if !last_bounded then begin
                     Hashtbl.replace bounded_fns (pkg ^ "." ^ name) ();
                     (* as it is referred to: by the package's alias
                        (`@support.sort_on_snd` of boyer_moore/support) *)
                     Hashtbl.replace bounded_fns (Filename.basename pkg ^ "." ^ name) ()
                   end
               | None -> ()
           done
         with End_of_file -> close_in ic)
        end;
        Hashtbl.replace packages pkg t;
        t

  let builtin =
    [ "Int"; "Int64"; "UInt"; "UInt64"; "Int16"; "UInt16"; "Byte"; "Bool"; "Char";
      "String"; "Unit"; "Double"; "Float"; "Bytes"; "Array"; "FixedArray"; "Map";
      "Ref"; "Option"; "Result"; "Error"; "Self"; "StringBuilder"; "ArrayView";
      "BytesView"; "StringView"; "Json"; "Iter" ]

  (* Types a package's interface names without qualification are its own. *)
  (* `generics`: the declaration's own type parameters (`fn[TA, B] ...`) *)
  let rec qualify ?(generics = []) pkg = function
    | Named (n, args) ->
        let n =
          if String.contains n '@' || List.mem n builtin || String.length n = 1 || List.mem n generics then n
          else "@" ^ Filename.basename pkg ^ "." ^ n
        in
        Named (n, List.map (qualify ~generics pkg) args)
    | Tuple ts -> Tuple (List.map (qualify ~generics pkg) ts)
    | Fun (ps, r, raises) -> Fun (List.map (qualify ~generics pkg) ps, qualify ~generics pkg r, raises)

  let qualify_decl pkg = function
    | Func (g, ps, r, raises) ->
        let generics = List.map (fun v -> String.trim (match String.index_opt v ':' with Some i -> String.sub v 0 i | None -> v)) g in
        Func (g, List.map (qualify ~generics pkg) ps, qualify ~generics pkg r, raises)
    | Value t -> Value (qualify pkg t)
    | Alias t -> Alias (qualify pkg t)

  let find ~root pkg name =
    Option.map (qualify_decl pkg) (Hashtbl.find_opt (load ~root pkg) name)

  (* The parameter groups a value of this declaration is applied to, in
     order: `f(a, b)(c)` is [[a; b]; [c]]. A value of function type has
     the groups of its type. *)
  let rec groups_of_ty = function
    | Fun (ps, r, _) -> ps :: groups_of_ty r
    | _ -> []

  let groups = function
    | Func (_, ps, r, _) -> ps :: groups_of_ty r
    | Value t | Alias t -> groups_of_ty t

  let rec show = function
    | Named (n, []) -> n
    | Named (n, args) -> n ^ "[" ^ String.concat ", " (List.map show args) ^ "]"
    | Tuple ts -> "(" ^ String.concat ", " (List.map show ts) ^ ")"
    | Fun (ps, r, raises) ->
        "(" ^ String.concat ", " (List.map show ps) ^ ") -> " ^ show r
        ^ (if raises then " raise" else "")
end
