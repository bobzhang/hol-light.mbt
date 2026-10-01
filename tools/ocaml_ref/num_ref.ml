(* Reference behaviour of the Num operations HOL Light uses.
   Keep in sync with num/num_ref_test.mbt. *)
let n = num_of_int;;
let q a b = n a // n b;;
let vals = [n 7; n (-7); q 7 2; q (-7) 2; q 1 3; n 0; q (-2) 6;
            num_of_string "123456789012345678901234567890";
            minus_num (num_of_string "98765432109876543210")];;
let divs = [n 2; n (-2); q 2 3; q (-3) 4; num_of_string "10000000000000000000000"];;
List.iter (fun x -> out ("v " ^ string_of_num x)) vals;;
List.iter (fun x -> List.iter (fun y ->
  attempt ("quo " ^ string_of_num x ^ " " ^ string_of_num y) (fun () -> string_of_num (quo_num x y));
  attempt ("mod " ^ string_of_num x ^ " " ^ string_of_num y) (fun () -> string_of_num (mod_num x y));
  attempt ("div " ^ string_of_num x ^ " " ^ string_of_num y) (fun () -> string_of_num (x // y))) divs) vals;;
List.iter (fun x ->
  let s = string_of_num x in
  attempt ("floor " ^ s) (fun () -> string_of_num (floor_num x));
  attempt ("ceiling " ^ s) (fun () -> string_of_num (ceiling_num x));
  attempt ("round " ^ s) (fun () -> string_of_num (round_num x));
  attempt ("integer " ^ s) (fun () -> string_of_num (integer_num x));
  attempt ("is_integer " ^ s) (fun () -> string_of_bool (is_integer_num x));
  attempt ("sign " ^ s) (fun () -> string_of_int (sign_num x));
  attempt ("abs " ^ s) (fun () -> string_of_num (abs_num x));
  attempt ("int_of " ^ s) (fun () -> string_of_int (int_of_num x));
  attempt ("numdom " ^ s) (fun () -> let a,b = numdom x in string_of_num a ^ "," ^ string_of_num b);
  attempt ("pow3 " ^ s) (fun () -> string_of_num (power_num x (n 3)));
  attempt ("pow-2 " ^ s) (fun () -> string_of_num (power_num x (n (-2))));
  attempt ("succ " ^ s) (fun () -> string_of_num (succ_num x));
  attempt ("pred " ^ s) (fun () -> string_of_num (pred_num x))) vals;;
attempt "div0" (fun () -> string_of_num (n 1 // n 0));;
attempt "quo0" (fun () -> string_of_num (quo_num (n 1) (n 0)));;
attempt "mod0" (fun () -> string_of_num (mod_num (n 1) (n 0)));;
attempt "gcd" (fun () -> String.concat "," (List.map string_of_num
  [gcd_num (n 12) (n 18); gcd_num (n (-12)) (n 18); gcd_num (n 0) (n 0); gcd_num (n 0) (n (-5))]));;
attempt "gcd_ratio" (fun () -> string_of_num (gcd_num (q 1 2) (n 3)));;
attempt "lcm" (fun () -> String.concat "," (List.map string_of_num
  [lcm_num (n 4) (n 6); lcm_num (n (-4)) (n 6); lcm_num (n 0) (n 0); lcm_num (n 0) (n 3)]));;
attempt "cmp" (fun () -> String.concat "," (List.map string_of_int
  [compare_num (q 1 3) (q 1 2); compare_num (n 2) (q 4 2); compare_num (n (-1)) (n 0)]));;
attempt "nary" (fun () -> String.concat "," [string_of_num_nary 2 (n 10); string_of_num_hex (n 255); string_of_num_nary 16 (n 0)]);;
attempt "of_string" (fun () -> String.concat "," (List.map (fun s -> string_of_num (num_of_string s))
  ["0"; "007"; "0x1F"; "0xff"; "0b1011"; "12345678901234567890123"]));;
attempt "of_string_bad1" (fun () -> string_of_num (num_of_string "0x"));;
attempt "of_string_bad2" (fun () -> string_of_num (num_of_string "12a"));;
attempt "of_string_bad3" (fun () -> string_of_num (num_of_string ""));;
attempt "of_string_bad4" (fun () -> string_of_num (num_of_string "0b2"));;
attempt "pow2" (fun () -> string_of_num (pow2 100));;
attempt "pow10" (fun () -> string_of_num (pow10 (-2)));;
attempt "int_big" (fun () -> string_of_int (int_of_num (num_of_string "4611686018427387903")));;
attempt "int_too_big" (fun () -> string_of_int (int_of_num (num_of_string "4611686018427387904")));;
attempt "max_min" (fun () -> string_of_num (max_num (q 1 2) (q 2 3)) ^ "," ^ string_of_num (min_num (q 1 2) (q 2 3)));;
