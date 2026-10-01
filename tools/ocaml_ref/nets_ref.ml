(* Reference behaviour of nets.ml. Keep in sync with nets/nets_ref_test.mbt.
   Elements are (int, string, closure) triples: the closure makes OCaml's
   compare raise Invalid_argument when the first two components agree. *)
let a = mk_vartype "A";;
let fn x y = mk_fun_ty x y;;
let _ = new_constant("c", a);;
let _ = new_constant("h", fn a (fn a a));;
let c = mk_const("c",[]) and h = mk_const("h",[]);;
let x = mk_var("x",a) and y = mk_var("y",a) and z = mk_var("z",a);;
let f = mk_var("f",fn a (fn a a)) and g = mk_var("g",fn a a);;
let app2 k u v = mk_comb(mk_comb(k,u),v);;
let shared = fun (s:string) -> s;;
let elem n s = (n, s, (fun (t:string) -> t ^ s));;
let pats = [
  app2 h x y, elem 1 "hxy";
  app2 h c y, elem 2 "hcy";
  app2 h (mk_comb(g,x)) y, elem 1 "hgxy";
  app2 f x y, elem 3 "fxy";
  mk_comb(g,x), elem 1 "gx";
  x, elem 5 "x";
  c, elem 1 "c";
  mk_abs(x, mk_comb(g,x)), elem 2 "lam";
  mk_comb(mk_abs(x,x), c), elem 4 "redex";
  app2 h x y, elem 1 "hxy2";
  app2 h x y, (1, "dup", shared);
  app2 h x y, (1, "dup", shared);
  app2 h x y, (0, "first", shared)];;
let net = itlist (fun (p,e) n -> enter [] (p,e) n) pats empty_net;;
let net_l = itlist (fun (p,e) n -> enter [g] (p,e) n) pats empty_net;;
let show l = "[" ^ String.concat ";" (map (fun (n,s,_) -> string_of_int n ^ s) l) ^ "]";;
let queries = [
  "h_c_c", app2 h c c; "h_x_c", app2 h x c; "h_gc_c", app2 h (mk_comb(g,c)) c;
  "f_c_c", app2 f c c; "g_c", mk_comb(g,c); "c", c; "x", x;
  "lam", mk_abs(y, mk_comb(g,y)); "redex", mk_comb(mk_abs(y,y), c)];;
List.iter (fun (name,q) -> attempt ("lookup " ^ name) (fun () -> show (lookup q net))) queries;;
List.iter (fun (name,q) -> attempt ("lookup_l " ^ name) (fun () -> show (lookup q net_l))) queries;;
let n1 = itlist (fun (p,e) n -> enter [] (p,e) n) (rev (tl (tl (tl pats)))) empty_net;;
let n2 = itlist (fun (p,e) n -> enter [] (p,e) n) [app2 h x y, elem 7 "m"; c, elem 0 "m0"; app2 h x y, elem 1 "hxy"] empty_net;;
let merged = merge_nets (n1, n2);;
List.iter (fun (name,q) -> attempt ("merged " ^ name) (fun () -> show (lookup q merged))) queries;;
let lam_l = enter [x] (mk_abs(x, mk_comb(g,x)), elem 9 "lamlc") empty_net;;
attempt "genvar_counter" (fun () -> stm (genvar a));;
