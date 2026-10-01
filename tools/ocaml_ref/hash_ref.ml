(* Reference values of OCaml's polymorphic Hashtbl.hash and compare for the
   value shapes HOL Light uses as keys. Keep in sync with lib/ohash_test.mbt. *)
let h name v = out (name ^ " = " ^ string_of_int (Hashtbl.hash v));;
h "int0" 0;; h "int1" 1;; h "int-1" (-1);; h "int1e6" 1000000;;
h "int_2^40" (1 lsl 40);; h "int_min32" (-2147483648);; h "max_int" max_int;;
h "true" true;; h "false" false;; h "unit" ();;
h "str_empty" "";; h "str_a" "a";; h "str_abcd" "abcd";; h "str_hello" "hello world";;
h "str_utf8" "\xc3\xa9t\xc3\xa9";;
h "nil" ([]:int list);; h "list123" [1;2;3];; h "list_str" ["a";"b"];;
h "list_long" (1--30);;
h "pair" (1,"x");; h "triple" ("a",2,true);;
h "none" (None : int option);; h "some" (Some 3);;
h "nested" [[1;2];[3]];;
let a = mk_vartype "A";;
let fa = mk_type("fun",[a;a]);;
h "tyvar" a;; h "bool_ty" bool_ty;; h "fun_ty" fa;;
let x = mk_var("x",a) and f = mk_var("f",fa);;
h "var" x;; h "const" (mk_const("=",[]));; h "comb" (mk_comb(f,x));;
h "abs" (mk_abs(x,mk_comb(f,x)));;
let rec deep n t = if n = 0 then t else deep (n-1) (mk_comb(f,t));;
h "deep50" (deep 50 x);;
h "term_pair" (x, mk_comb(f,x));;
h "term_list" [x; f; mk_comb(f,x)];;
h "thm" (REFL x);;
