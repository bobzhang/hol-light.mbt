(* Load-fidelity test for trivia.ml (translated by tools/translator). Keep in
   sync with trivia/trivia_ref_test.mbt (the theorem list part is generated
   by tools/ocaml_ref/gen_theorems_test.py). *)
#use "bool.ml";;
#use "drule.ml";;
#use "tactics.ml";;
#use "itab.ml";;
#use "simp.ml";;
#use "theorems.ml";;
#use "ind_defs.ml";;
#use "class.ml";;
start_trace ();;
#use "trivia.ml";;
show_trace "trivia";;
(* BEGIN generated theorem list *)
attempt "o_DEF" (fun () -> sthm o_DEF);;
attempt "I_DEF" (fun () -> sthm I_DEF);;
attempt "o_THM" (fun () -> sthm o_THM);;
attempt "o_ASSOC" (fun () -> sthm o_ASSOC);;
attempt "I_THM" (fun () -> sthm I_THM);;
attempt "I_O_ID" (fun () -> sthm I_O_ID);;
attempt "EXISTS_ONE_REP" (fun () -> sthm EXISTS_ONE_REP);;
attempt "one_tydef" (fun () -> sthm one_tydef);;
attempt "one_DEF" (fun () -> sthm one_DEF);;
attempt "one" (fun () -> sthm one);;
attempt "one_axiom" (fun () -> sthm one_axiom);;
attempt "one_INDUCT" (fun () -> sthm one_INDUCT);;
attempt "one_RECURSION" (fun () -> sthm one_RECURSION);;
attempt "one_Axiom" (fun () -> sthm one_Axiom);;
attempt "FORALL_ONE_THM" (fun () -> sthm FORALL_ONE_THM);;
attempt "EXISTS_ONE_THM" (fun () -> sthm EXISTS_ONE_THM);;
attempt "ETA_ONE" (fun () -> sthm ETA_ONE);;
(* END generated theorem list *)
let tm s = parse_term s;;
attempt "types" (fun () -> String.concat " " (map (fun (s,n) -> s ^ "/" ^ string_of_int n) (types())));;
attempt "constants" (fun () -> String.concat " " (map fst (constants())));;
attempt "definitions" (fun () -> string_of_int (length (definitions())));;
attempt "inductive_type_store" (fun () -> String.concat " " (map fst (!inductive_type_store)));;
attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;
attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;
