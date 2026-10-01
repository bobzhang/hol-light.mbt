(* Load-fidelity and behaviour test for drule.ml. Keep in sync with
   drule/drule_ref_test.mbt. *)
#use "bool.ml";;
start_trace ();;
#use "drule.ml";;
show_trace "drule";;
let th name f = attempt name (fun () -> sthm (f ()));;
let tm s = parse_term s;;
let sinst (bcs,tmin,tyin) =
  "[" ^ String.concat "; " (map (fun (n,t) -> string_of_int n ^ "," ^ stm t) bcs) ^ "] [" ^
  String.concat "; " (map (fun (t,v) -> stm t ^ "/" ^ stm v) tmin) ^ "] [" ^
  String.concat "; " (map (fun (t,v) -> sty t ^ "/" ^ sty v) tyin) ^ "]";;
let tmatch name lc v c = attempt name (fun () -> sinst (term_match (map tm lc) (tm v) (tm c)));;
th "MK_CONJ" (fun () -> MK_CONJ (ASSUME (tm "a <=> b")) (ASSUME (tm "c <=> d")));;
th "MK_DISJ" (fun () -> MK_DISJ (ASSUME (tm "a <=> b")) (ASSUME (tm "c <=> d")));;
th "MK_FORALL" (fun () -> MK_FORALL (tm "x:A") (REFL (tm "(P:A->bool) x")));;
th "MK_FORALL_bad" (fun () -> MK_FORALL (tm "x:A") (ASSUME (tm "(P:A->bool) x <=> Q x")));;
th "MK_EXISTS" (fun () -> MK_EXISTS (tm "x:A") (REFL (tm "(P:A->bool) x")));;
th "MP_CONV" (fun () -> MP_CONV BETA_CONV (ASSUME (tm "(\\x:bool. x) T ==> b")));;
th "MP_CONV2" (fun () -> MP_CONV (fun t -> ASSUME t) (ASSUME (tm "a ==> b")));;
th "BETAS_CONV" (fun () -> BETAS_CONV (tm "(\\x y. (f:A->A->A) x y) a b"));;
th "BETAS_CONV_bad" (fun () -> BETAS_CONV (tm "(f:A->A) a"));;
tmatch "match_fo" [] "(f:A->B) x" "(g:num->bool) n";;
tmatch "match_const" [] "x /\\ y" "a /\\ (b \\/ c)";;
tmatch "match_poly" [] "(x:A) = y" "T = F";;
tmatch "match_bound" [] "\\x:A. (f:A->B) x" "\\y:num. (g:num->bool) y";;
tmatch "match_lconst" ["x:bool"] "x /\\ y" "x /\\ T";;
tmatch "match_lconst_bad" ["x:bool"] "x /\\ y" "y /\\ T";;
tmatch "match_bad" [] "x /\\ y" "a \\/ b";;
tmatch "match_ho" [] "!x:A. (P:A->bool) x" "!n:num. n = n";;
tmatch "match_ho2" [] "?x:A. (P:A->B->bool) x y" "?n:num. n = m /\\ m = n";;
tmatch "match_ho_app" [] "(P:A->bool) (f (x:A))" "Q (g (y:B)):bool";;
tmatch "match_ho_beta" [] "\\x:A. (P:A->A->bool) x c" "\\n:num. n = c";;
tmatch "match_repeat" [] "(x:A) = x" "T = T";;
tmatch "match_repeat_bad" [] "(x:A) = x" "T = F";;
let i1 = term_match [] (tm "!x:A. (P:A->bool) x") (tm "!n:num. n = n");;
attempt "instantiate_ho" (fun () -> stm (instantiate i1 (tm "(P:A->bool) (z:A)")));;
th "INSTANTIATE_ho" (fun () -> INSTANTIATE i1 (REFL (tm "(P:A->bool) (z:A)")));;
th "INSTANTIATE_bad" (fun () -> INSTANTIATE ([],[tm "T", tm "q:bool"],[]) (ASSUME (tm "q:bool")));;
th "INSTANTIATE_ALL" (fun () -> INSTANTIATE_ALL ([],[tm "T", tm "q:bool"],[]) (ASSUME (tm "q:bool")));;
th "INSTANTIATE_ALL_ty" (fun () -> INSTANTIATE_ALL ([],[],[bool_ty, aty]) (ASSUME (tm "(x:A) = x")));;
(* Arguments are bound left to right explicitly (OCaml would evaluate them
   right to left), so the MoonBit test can mirror the order. *)
attempt "term_unify" (fun () -> let x = tm "x:A" in let y = tm "y:A" in let t1 = tm "(f:A->A->A) x (g y)" in let t2 = tm "(f:A->A->A) (g z) y" in sinst (term_unify [x; y] t1 t2));;
attempt "term_unify_occurs" (fun () -> sinst (term_unify [tm "x:A"] (tm "x:A") (tm "(g:A->A) x")));;
attempt "term_unify_abs" (fun () -> sinst (term_unify [tm "x:A"] (tm "\\u:A. (f:A->A->A) u x") (tm "\\v:A. (f:A->A->A) v c")));;
attempt "type_unify" (fun () -> String.concat "; " (map (fun (t,v) -> sty t ^ "/" ^ sty v) (type_unify (parse_type "A->B") (parse_type "bool->C") [])));;
attempt "type_unify_bad" (fun () -> String.concat "; " (map (fun (t,v) -> sty t ^ "/" ^ sty v) (type_unify (parse_type "A->A") (parse_type "bool->(A->bool)") [])));;
attempt "term_type_unify" (fun () -> sinst (term_type_unify (tm "(f:A->B) x") (tm "(g:bool->C) T") ([],[],[])));;
attempt "deep_alpha" (fun () -> stm (deep_alpha ["y","x"; "b","a"] (tm "\\x:A. \\a:A. (f:A->A->A) x a")));;
let addth = ASSUME (tm "!x y. (f:A->A->A) x y = f y x");;
th "PART_MATCH" (fun () -> PART_MATCH lhs addth (tm "(f:A->A->A) u v"));;
th "PART_MATCH_bad" (fun () -> PART_MATCH lhs addth (tm "(g:A->A->A) u v"));;
th "GEN_PART_MATCH" (fun () -> GEN_PART_MATCH lhs (ASSUME (tm "!x. (f:A->A->A) x y = f y x")) (tm "(f:A->A->A) u v"));;
th "MATCH_MP" (fun () -> MATCH_MP (ASSUME (tm "!x:A. (P:A->bool) x ==> Q x")) (ASSUME (tm "(P:A->bool) c")));;
th "MATCH_MP_ty" (fun () -> MATCH_MP (ASSUME (tm "!x:A. (x = x) ==> T")) (REFL (tm "F")));;
th "MATCH_MP_bad" (fun () -> MATCH_MP (ASSUME (tm "!x:A. (P:A->bool) x ==> Q x")) (ASSUME (tm "(R:A->bool) c")));;
th "MATCH_MP_notimp" (fun () -> let a1 = ASSUME (tm "a:bool") in MATCH_MP a1 (ASSUME (tm "a:bool")));;
th "MATCH_MP_partial" (fun () -> MATCH_MP (ASSUME (tm "!x y:A. (P:A->bool) x ==> (R:A->A->bool) x y")) (ASSUME (tm "(P:A->bool) c")));;
let hr = ASSUME (tm "!x:A. (P:A->bool) ((f:A->A) x) <=> Q x");;
th "HIGHER_REWRITE_CONV" (fun () -> HIGHER_REWRITE_CONV [hr] true (tm "a /\\ (R:A->bool) ((f:A->A) c)"));;
th "new_definition" (fun () -> new_definition (tm "TWICE (f:A->A) x = f (f x)"));;
th "new_definition_bad" (fun () -> new_definition (tm "a /\\ b"));;
th "mk_thm" (fun () -> mk_thm ([tm "a:bool"; tm "b:bool"], tm "c:bool"));;
attempt "axioms" (fun () -> String.concat " ;; " (map sthm (axioms())));;
attempt "constants" (fun () -> String.concat " " (map fst (constants())));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
attempt "term_unify_abs_bad" (fun () -> let t1 = tm "\\x:bool. x" in let t2 = tm "(~)" in sinst (term_unify [] t1 t2));;
attempt "term_type_unify_abs_bad" (fun () -> let t1 = tm "\\x:bool. x" in let t2 = tm "(~)" in sinst (term_type_unify t1 t2 ([],[],[])));;
