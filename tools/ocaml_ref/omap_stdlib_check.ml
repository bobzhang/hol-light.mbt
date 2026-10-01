(* Checks that tools/translator/stdlib/ocaml_{map,set}.ml build exactly the
   trees of OCaml's Stdlib Map.Make/Set.Make (same memory layout, so equal
   Marshal output) and call callbacks in the same order, over random
   operations. Run from the repository root:
     ocaml -I . tools/ocaml_ref/omap_stdlib_check.ml *)
#use "tools/translator/stdlib/ocaml_map.ml";;
#use "tools/translator/stdlib/ocaml_set.ml";;
module M = Map.Make(Int)
module S = Set.Make(Int)
let same a b = Marshal.to_string (Obj.repr a) [] = Marshal.to_string (Obj.repr b) []
let ord (x : int) y = compare x y
let () =
  Random.init 42;
  let m = ref M.empty and o = ref Ocaml_map.empty in
  let s = ref S.empty and so = ref Ocaml_set.empty in
  let log1 = Buffer.create 100 and log2 = Buffer.create 100 in
  let ok = ref true in
  for i = 1 to 20000 do
    let k = Random.int 200 and v = Random.int 5 in
    (match Random.int 9 with
     | 0 | 1 | 2 -> m := M.add k v !m; o := Ocaml_map.add ord k v !o; s := S.add k !s; so := Ocaml_set.add ord k !so
     | 3 -> m := M.remove k !m; o := Ocaml_map.remove ord k !o; s := S.remove k !s; so := Ocaml_set.remove ord k !so
     | 4 -> let f = (fun k' _ -> Buffer.add_string log1 (string_of_int k'); k' mod 3 <> 0) and g = (fun k' _ -> Buffer.add_string log2 (string_of_int k'); k' mod 3 <> 0) in
            m := M.filter f !m; o := Ocaml_map.filter g !o;
            s := S.filter (fun x -> x mod 5 <> 0) !s; so := Ocaml_set.filter (fun x -> x mod 5 <> 0) !so
     | 5 -> let m2 = M.singleton k v and o2 = Ocaml_map.singleton k v in
            m := M.merge (fun k a b -> Buffer.add_string log1 (string_of_int k); match a,b with Some x,_ -> Some x | None, y -> y) !m m2;
            o := Ocaml_map.merge ord (fun k a b -> Buffer.add_string log2 (string_of_int k); match a,b with Some x,_ -> Some x | None, y -> y) !o o2
     | 6 -> m := M.union (fun _ a b -> Some (a+b)) !m (M.singleton k v); o := Ocaml_map.union ord (fun _ a b -> Some (a+b)) !o (Ocaml_map.singleton k v);
            s := S.union !s (S.singleton k); so := Ocaml_set.union ord !so (Ocaml_set.singleton k)
     | 7 -> s := S.diff !s (S.add (k+1) (S.singleton k)); so := Ocaml_set.diff ord !so (Ocaml_set.add ord (k+1) (Ocaml_set.singleton k));
            ignore (M.exists (fun k _ -> Buffer.add_string log1 (string_of_int k); k = v) !m); ignore (Ocaml_map.exists (fun k _ -> Buffer.add_string log2 (string_of_int k); k = v) !o)
     | _ -> s := S.inter !s (List.fold_left (fun a j -> S.add (j*3) a) S.empty (List.init 50 (fun j -> j*3))); so := Ocaml_set.inter ord !so (List.fold_left (fun a j -> Ocaml_set.add ord (j*3) a) Ocaml_set.empty (List.init 50 (fun j -> j*3))));
    if not (same !m !o && same !s !so) then ok := false
  done;
  Printf.printf "trees identical: %b, callbacks identical: %b, sizes %d %d\n" !ok (Buffer.contents log1 = Buffer.contents log2) (M.cardinal !m) (S.cardinal !s)
