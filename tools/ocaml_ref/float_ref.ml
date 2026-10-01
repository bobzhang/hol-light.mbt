let f name x = out (name ^ " = " ^ Printf.sprintf "%h" (float_of_num x));;
f "pow2_-1022" (pow2 (-1022));; f "pow2_-1074" (pow2 (-1074));; f "pow2_1023" (pow2 1023);;
f "pow2_1024" (pow2 1024);; f "neg_pow2_1024" (minus_num (pow2 1024));;
f "third" (num 1 // num 3);; f "tenth" (num 1 // num 10);; f "big_ratio" (pow10 400 // num 3);;
f "near_half" ((pow2 53 +/ num 1) // pow2 54);; f "int_round" (pow2 53 +/ num 1);;
f "int_round_up" (pow2 53 +/ num 3);; f "tiny_ratio" (num 1 // pow10 320);;
attempt "power_frac" (fun () -> string_of_num (power_num (num 4) (num 1 // num 2)));;
