(* Behaviour test for firstorder.ml (translated by tools/translator). Keep in
   sync with firstorder/firstorder_ref_test.mbt. *)
#use "bool.ml";;
#use "drule.ml";;
#use "tactics.ml";;
#use "itab.ml";;
#use "simp.ml";;
#use "theorems.ml";;
#use "ind_defs.ml";;
#use "class.ml";;
#use "trivia.ml";;
#use "canon.ml";;
#use "meson.ml";;
start_trace ();;
#use "firstorder.ml";;
show_trace "firstorder";;
let tm s = parse_term s;;
let sl f l = "[" ^ String.concat "; " (map f l) ^ "]";;
let si = string_of_int;;
attempt "list_rest" (fun () -> sl (fun (x,(a,b)) -> si x ^ ":" ^ sl si a ^ sl si b) (Utils.List.list_rest [1;2;3]));;
attempt "nth_rest" (fun () -> let x,(a,b) = Utils.List.nth_rest 1 [1;2;3] in si x ^ sl si a ^ sl si b);;
attempt "nth_rest_bad" (fun () -> let x,(a,b) = Utils.List.nth_rest 5 [1;2;3] in si x ^ sl si a ^ sl si b);;
attempt "insert_at" (fun () -> sl si (Utils.List.insert_at 1 9 [1;2;3]));;
attempt "take_drop" (fun () -> let a,b = Utils.List.take_drop 2 [1;2;3] in sl si a ^ sl si b);;
attempt "findi" (fun () -> let n,x = Utils.List.findi (fun i x -> i + x > 4) [1;2;3;4] in si n ^ " " ^ si x);;
attempt "fold_map" (fun () -> let s,l = Utils.List.fold_map (fun acc x -> (acc + x, acc * x)) 1 [1;2;3] in si s ^ sl si l);;
attempt "filter_map" (fun () -> sl si (Utils.List.filter_map (fun x -> if x > 1 then Some (x*x) else None) [1;2;3]));;
attempt "union1" (fun () -> sl si (Utils.List.union1 [1;2;3] [3;4;1]));;
attempt "union2" (fun () -> sl si (Utils.List.union2 [1;2;3] [3;4;1]));;
attempt "fold_right1" (fun () -> si (Utils.List.fold_right1 (fun a b -> a - b) [10;3;2]));;
attempt "exists_unique" (fun () -> string_of_bool (Utils.List.exists_unique (fun x -> x > 2) [1;2;3]));;
attempt "roundtrip" (fun () -> Mapping.reset_vars (); Mapping.reset_consts ();
  let t = tm "!x:A. P x (f x y) ==> ~Q (c:A)" in
  let fm = Mapping.fol_of_form [] [] t in
  let a = Mapping.fol_of_atom [] [] (tm "(R:A->A->bool) (g a) b") in
  stm (Mapping.hol_of_literal a) ^ " / " ^ (match fm with Forallq(v, _) -> si v | _ -> "?"));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
