(* Behaviour test for the generic OCaml 4.14 Map/Set code
   (tools/translator/stdlib/ocaml_{map,set}.ml, translated to omap/ and
   oset/). Plain OCaml; run with `ocaml tools/ocaml_ref/omap_ref.ml`.
   Stdlib Map.Make/Set.Make build the same trees (checked separately by
   Marshal equality). Keep in sync with omap/omap_ref_test.mbt. *)
#use "tools/translator/stdlib/ocaml_map.ml";;
#use "tools/translator/stdlib/ocaml_set.ml";;
let ord (x : int) y = compare x y
let rec dm = function
  | Ocaml_map.Empty -> "."
  | Ocaml_map.Node (l, k, v, r, h) -> Printf.sprintf "(%s %d:%d/%d %s)" (dm l) k v h (dm r)
let rec ds = function
  | Ocaml_set.Empty -> "."
  | Ocaml_set.Node (l, k, r, h) -> Printf.sprintf "(%s %d/%d %s)" (ds l) k h (ds r)
let () =
  Random.init 7;
  let m = ref Ocaml_map.empty and s = ref Ocaml_set.empty in
  let log = Buffer.create 1000 in
  let note k = Buffer.add_string log (string_of_int k); Buffer.add_char log ' ' in
  for i = 1 to 600 do
    let k = Random.int 60 in
    let v = Random.int 5 in
    (match Random.int 9 with
     | 0 | 1 | 2 -> m := Ocaml_map.add ord k v !m; s := Ocaml_set.add ord k !s
     | 3 -> m := Ocaml_map.remove ord k !m; s := Ocaml_set.remove ord k !s
     | 4 -> m := Ocaml_map.filter (fun k' _ -> note k'; k' mod 3 <> 0) !m;
            s := Ocaml_set.filter (fun x -> x mod 5 <> 0) !s
     | 5 -> m := Ocaml_map.merge ord (fun k a b -> note k; match a, b with Some x, _ -> Some x | None, y -> y) !m (Ocaml_map.singleton k v)
     | 6 -> m := Ocaml_map.union ord (fun _ a b -> Some (a + b)) !m (Ocaml_map.singleton k v);
            s := Ocaml_set.union ord !s (Ocaml_set.singleton k)
     | 7 -> s := Ocaml_set.diff ord !s (Ocaml_set.add ord (k + 1) (Ocaml_set.singleton k));
            ignore (Ocaml_map.exists (fun k _ -> note k; k = v) !m)
     | _ -> s := Ocaml_set.inter ord !s (List.fold_left (fun a j -> Ocaml_set.add ord (j * 3) a) Ocaml_set.empty (List.init 20 (fun j -> j)));
            ignore (Ocaml_map.fold (fun k d acc -> note k; acc + d) !m 0));
    if i mod 100 = 0 then begin
      print_endline (dm !m);
      print_endline (ds !s)
    end
  done;
  print_endline (Buffer.contents log);
  print_endline (String.concat " " (List.map (fun (k, v) -> Printf.sprintf "%d:%d" k v) (Ocaml_map.bindings !m)));
  print_endline (String.concat " " (List.map string_of_int (Ocaml_set.elements !s)));
  Printf.printf "%b %b %d\n" (Ocaml_set.mem ord 3 !s) (Ocaml_map.mem ord 3 !m) (Ocaml_set.compare ord !s (Ocaml_set.singleton 1))
