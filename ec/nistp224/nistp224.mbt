// Translated from upstream EC/nistp224.ml; edit this file directly.

///|
/// EC/nistp224.ml:9
fn step_1() -> Unit raise {
  @computegroup.add_curve(@weierstrass.weierstrass_curve())
}

///|
/// EC/nistp224.ml:10
fn step_2() -> Unit raise {
  @computegroup.add_curveneg(@weierstrass.weierstrass_neg())
}

///|
/// EC/nistp224.ml:11
fn step_3() -> Unit raise {
  @computegroup.add_curveadd(@weierstrass.weierstrass_add())
}

///|
/// p_224
fn step_4() -> Unit raise {
  p_224_c.set(@pair.new_definition(@term_syntax.parse_term("(p_224 : Num) == 26959946667150639794667015087019630673557916260026308143510066298881")))
}

///|
let p_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p_224")

///|
/// `p_224`
pub fn p_224() -> @kernel.Thm {
  p_224_c.get()
}

///|
/// n_224
fn step_5() -> Unit raise {
  n_224_c.set(@pair.new_definition(@term_syntax.parse_term("(n_224 : Num) == 26959946667150639794667015087019625940457807714424391721682722368061")))
}

///|
let n_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("n_224")

///|
/// `n_224`
pub fn n_224() -> @kernel.Thm {
  n_224_c.get()
}

///|
/// SEED_224
fn step_6() -> Unit raise {
  seed_224_c.set(@pair.new_definition(@term_syntax.parse_term("(SEED_224 : Num) == 1081523794096538032233653362262598443316043615173")))
}

///|
let seed_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEED_224")

///|
/// `SEED_224`
pub fn seed_224() -> @kernel.Thm {
  seed_224_c.get()
}

///|
/// c_224
fn step_7() -> Unit raise {
  c_224_c.set(@pair.new_definition(@term_syntax.parse_term("(c_224 : Num) == 9585649763196999776159690989286240671136085803543320687376622326267")))
}

///|
let c_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("c_224")

///|
/// `c_224`
pub fn c_224() -> @kernel.Thm {
  c_224_c.get()
}

///|
/// b_224
fn step_8() -> Unit raise {
  b_224_c.set(@pair.new_definition(@term_syntax.parse_term("(b_224 : Num) == 18958286285566608000408668544493926415504680968679321075787234672564")))
}

///|
let b_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("b_224")

///|
/// `b_224`
pub fn b_224() -> @kernel.Thm {
  b_224_c.get()
}

///|
/// G_224
fn step_9() -> Unit raise {
  g_224_c.set(@pair.new_definition(@term_syntax.parse_term("(G_224 : Option[(Int, Int)]) == SOME((int_of_num(19277929113566293071110308034699488026831934219452440156649784352033), int_of_num(19926808758034470970197974370888749184205991990603949537637343198772)))")))
}

///|
let g_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("G_224")

///|
/// `G_224`
pub fn g_224() -> @kernel.Thm {
  g_224_c.get()
}

///|
/// P_224
fn step_10() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([p_224()])), t1)
  p_224_v1_c.set(@tactics.prove(@term_syntax.parse_term("p_224 == EXP(2, 224) - EXP(2, 96) + 1"), t2))
}

///|
let p_224_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P_224")

///|
/// `P_224`
pub fn p_224_v1() -> @kernel.Thm {
  p_224_v1_c.get()
}

///|
/// PRIME_P224
fn step_11() -> Unit raise {
  let t8 = (fn(x5 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s6 = @tactics.conv_tac(x5)
    fn(x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s6(x7)
    }
  })(@pocklington.prime_rule(@list.List(["2", "3", "5", "7", "11", "17", "23", "31", "43", "47", "173", "257", "347", "373", "641", "727", "16657", "17449", "65537", "166571", "274177", "2998279", "6700417", "67280421310721"])))
  let t4 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t9 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([p_224()])), t4), t8)
  prime_p224_c.set(@lib.time(fn(x3 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x3.0, x3.1)
  }, (@term_syntax.parse_term("prime(p_224)"), t9)))
}

///|
let prime_p224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_P224")

///|
/// `PRIME_P224`
pub fn prime_p224() -> @kernel.Thm {
  prime_p224_c.get()
}

///|
/// PRIME_N224
fn step_12() -> Unit raise {
  let t15 = (fn(x12 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s13 = @tactics.conv_tac(x12)
    fn(x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s13(x14)
    }
  })(@pocklington.prime_rule(@list.List(["2", "3", "5", "7", "11", "13", "17", "23", "29", "31", "37", "41", "43", "47", "61", "67", "89", "101", "127", "139", "173", "239", "269", "347", "349", "509", "631", "659", "1303", "1319", "2089", "2153", "2707", "3433", "10909", "20599", "30859", "85999", "87739", "145091", "166823", "11105363", "13928737", "821796863", "432621809776543", "136401162692544977256234449", "34646440928557194402992574983797", "375503554633724504423937478103159147573209", "50520606258875818707470860153287666700917696099933389351507"])))
  let t11 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t16 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([n_224()])), t11), t15)
  prime_n224_c.set(@lib.time(fn(x10 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x10.0, x10.1)
  }, (@term_syntax.parse_term("prime(n_224)"), t16)))
}

///|
let prime_n224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_N224")

///|
/// `PRIME_N224`
pub fn prime_n224() -> @kernel.Thm {
  prime_n224_c.get()
}

///|
/// SANITY_CHECK_224
fn step_13() -> Unit raise {
  let t18 = @tactics.conv_tac(@int.int_reduce_conv)
  let t17 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_rem_eq())]))
  let t19 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([g_224(), p_224(), b_224(), c_224()])), t17), t18)
  sanity_check_224_c.set(@tactics.prove(@term_syntax.parse_term("op_eq_eq(pow(int_of_num(b_224), 2) * int_of_num(c_224), -int_of_num(27), mod(int_of_num(p_224)))"), t19))
}

///|
let sanity_check_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SANITY_CHECK_224")

///|
/// `SANITY_CHECK_224`
pub fn sanity_check_224() -> @kernel.Thm {
  sanity_check_224_c.get()
}

///|
/// p224_group
fn step_14() -> Unit raise {
  p224_group_c.set(@define.define_(@term_syntax.parse_term("(p224_group : Group[Option[(Int, Int)]]) == weierstrass_group((integer_mod_ring(p_224), ring_neg(integer_mod_ring(p_224), int_of_num(3)), int_of_num(b_224)))")))
}

///|
let p224_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p224_group")

///|
/// `p224_group`
pub fn p224_group() -> @kernel.Thm {
  p224_group_c.get()
}

///|
/// P224_GROUP
fn step_15() -> Unit raise {
  let t24 = @tactics.conv_tac(@int.int_reduce_conv)
  let t23 = @simp.simp_tac(@list.List([@ringtheory.integer_mod_ring_clauses(), @calc_num.arith(), @sets.in_elim_thm()]))
  let t22 = @simp.rewrite_tac(@list.List([p_224(), b_224(), @weierstrass.weierstrass_nonsingular()]))
  let t21 = @simp.rewrite_tac(@list.List([@ringtheory.field_integer_mod_ring(), @ringtheory.integer_mod_ring_char(), prime_p224()]))
  let t20 = @tactics.match_mp_tac(@weierstrass.weierstrass_group_v1())
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([p224_group()])), t20), t21), t22), t23), t24)
  p224_group_v1_c.set(@tactics.prove(@term_syntax.parse_term("group_carrier(p224_group) == weierstrass_curve((integer_mod_ring(p_224), ring_neg(integer_mod_ring(p_224), int_of_num(3)), int_of_num(b_224))) && group_id(p224_group) == NONE && group_inv(p224_group) == weierstrass_neg((integer_mod_ring(p_224), ring_neg(integer_mod_ring(p_224), int_of_num(3)), int_of_num(b_224))) && group_mul(p224_group) == weierstrass_add((integer_mod_ring(p_224), ring_neg(integer_mod_ring(p_224), int_of_num(3)), int_of_num(b_224)))"), t25))
}

///|
let p224_group_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P224_GROUP")

///|
/// `P224_GROUP`
pub fn p224_group_v1() -> @kernel.Thm {
  p224_group_v1_c.get()
}

///|
/// EC/nistp224.ml:93
fn step_16() -> Unit raise {
  @computegroup.add_ecgroup(@list.List([p_224(), b_224()]), p224_group_v1())
}

///|
/// NO_ROOTS_P224
fn step_17() -> Unit raise {
  let t26 = @excluderoots.exclude_modular_cubic_roots_tac(prime_p224(), @list.List([p_224(), b_224()]))
  no_roots_p224_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Int, !op_eq_eq(pow(x, 3) - int_of_num(3) * x + int_of_num(b_224), int_of_num(0), mod(int_of_num(p_224)))"), t26))
}

///|
let no_roots_p224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NO_ROOTS_P224")

///|
/// `NO_ROOTS_P224`
pub fn no_roots_p224() -> @kernel.Thm {
  no_roots_p224_c.get()
}

///|
/// GENERATOR_IN_GROUP_CARRIER_224
fn step_18() -> Unit raise {
  let t27 = @tactics.conv_tac(@computegroup.ecgroup_carrier_conv)
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([g_224()])), t27)
  generator_in_group_carrier_224_c.set(@tactics.prove(@term_syntax.parse_term("IN(G_224, group_carrier(p224_group))"), t28))
}

///|
let generator_in_group_carrier_224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENERATOR_IN_GROUP_CARRIER_224")

///|
/// `GENERATOR_IN_GROUP_CARRIER_224`
pub fn generator_in_group_carrier_224() -> @kernel.Thm {
  generator_in_group_carrier_224_c.get()
}

///|
/// GROUP_ELEMENT_ORDER_G224
fn step_19() -> Unit raise {
  let t31 = @tactics.conv_tac(@equal.land_conv(@computegroup.ecgroup_pow_conv))
  let t30 = @simp.rewrite_tac(@list.List([n_224()]))
  let t29 = @simp.rewrite_tac(@list.List([g_224(), @lib.el(1, @bool.conjuncts_rule(p224_group_v1())), @ind_types.option_distinct()]))
  let t32 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@grouptheory.group_element_order_unique_prime(), generator_in_group_carrier_224(), prime_n224()])), t29), t30), t31), @tactics.refl_tac)
  group_element_order_g224_c.set(@tactics.prove(@term_syntax.parse_term("group_element_order(p224_group, G_224) == n_224"), t32))
}

///|
let group_element_order_g224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GROUP_ELEMENT_ORDER_G224")

///|
/// `GROUP_ELEMENT_ORDER_G224`
pub fn group_element_order_g224() -> @kernel.Thm {
  group_element_order_g224_c.get()
}

///|
/// FINITE_GROUP_CARRIER_P224
fn step_20() -> Unit raise {
  let t36 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t35 = @simp.rewrite_tac(@list.List([p_224()]))
  let t34 = @simp.rewrite_tac(@list.List([@ringtheory.finite_integer_mod_ring(), @ringtheory.field_integer_mod_ring(), prime_p224()]))
  let t33 = @tactics.match_mp_tac(@weierstrass.finite_weierstrass_curve())
  let t37 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([p224_group_v1()])), t33), t34), t35), t36)
  finite_group_carrier_p224_c.set(@tactics.prove(@term_syntax.parse_term("FINITE(group_carrier(p224_group))"), t37))
}

///|
let finite_group_carrier_p224_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_GROUP_CARRIER_P224")

///|
/// `FINITE_GROUP_CARRIER_P224`
pub fn finite_group_carrier_p224() -> @kernel.Thm {
  finite_group_carrier_p224_c.get()
}

///|
/// SIZE_P224_GROUP
fn step_21() -> Unit raise {
  let t97 = @drule.match_mp(@integer.int_divides_le())
  let t99 = @tactics.disch_then(fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s95 = @tactics.mp_tac(x94)
      fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s95(x96)
      }
    })(t97(x98))
  })
  let t93 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.num_coprime()), @calc_num.arith(), @prime.coprime_2()]))
  let t90 = @drule.match_mp(@int.integer_rule(@term_syntax.parse_term("divides((p : Int), (a : Int) * (b : Int)) → coprime((a, p)) → divides(p, b)")))
  let t92 = @tactics.disch_then(fn(x91 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s88 = @tactics.mp_tac(x87)
      fn(x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s88(x89)
      }
    })(t90(x91))
  })
  let t86 = @simp.rewrite_tac(@list.List([@int.int_rem_eq(), @int.integer_rule(@term_syntax.parse_term("op_eq_eq(-(y : Int), y, mod((p : Int))) == divides(p, int_of_num(2) * y)"))]))
  let t85 = @list.List([@simp.asm_simp_tac(@list.List([@int.int_rem_lt()])), @tactics.all_tac])
  let t83 = @drule.match_mp(@int.int_arith(@term_syntax.parse_term("rem(-(y : Int), (p : Int)) == y → rem(y, p) == y → rem(-y, p) == rem(y, p)")))
  let t100 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.first_x_assum(fn(x84 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x80 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s81 = @tactics.mp_tac(x80)
      fn(x82 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s81(x82)
      }
    })(t83(x84))
  })), @tactics.ants_tac), t85), t86), t92), t93), t99), @int.asm_int_arith_tac)
  let t79 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_rem_eq()), p_224(), @int.int_rem_zero()]))
  let t78 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(y : Int) - int_of_num(3) * (x : Int) + (b : Int) == y + (-int_of_num(3) * x + b)"))]))
  let t77 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Int)"), no_roots_p224()))
  let t76 = @tactics.conv_tac(@int.int_rem_down_conv)
  let t75 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s72 = @tactics.mp_tac(x71)
      fn(x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s72(x73)
      }
    })(@equal.sym(x74))
  }))
  let t70 = @tactics.conv_tac(@int.int_reduce_conv)
  let t101 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t70), t75), t76), t77), t78), t79), t100])
  let t69 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Int) == int_of_num(0)"))
  let t66 = @tactics.conv_tac(@int.int_reduce_conv)
  let t65 = @simp.rewrite_tac(@list.List([p_224(), @pair.pair_eq()]))
  let t64 = @tactics.conv_tac(@int.int_rem_down_conv)
  let t63 = @simp.rewrite_tac(@list.List([@ringtheory.in_integer_mod_ring_carrier(), @ringtheory.integer_mod_ring_clauses()]))
  let t62 = @simp.rewrite_tac(@list.List([@ind_types.option_inj()]))
  let t60 = @term_syntax.parse_term("(y : Int)")
  let t61 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Int)"), t60]))
  let t59 = @simp.rewrite_tac(@list.List([@weierstrass.weierstrass_curve(), @weierstrass.weierstrass_neg(), @ind_types.option_distinct()]))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@ind_types.forall_option_thm(), @sets.in_(), @pair.forall_pair_thm()])), t59), t61), t62), t63), t64), t65), t66)
  let t58 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t57 = @simp.rewrite_tac(@list.List([n_224()]))
  let t56 = @simp.simp_tac(@list.List([@ringtheory.card_integer_mod_ring(), p_224(), @calc_num.arith()]))
  let t54 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@arith.let_trans()))
  let t53 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t55 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([p_224()])), t53), t54])
  let t52 = @simp.rewrite_tac(@list.List([prime_p224()]))
  let t51 = @simp.rewrite_tac(@list.List([@ringtheory.finite_integer_mod_ring(), @ringtheory.field_integer_mod_ring()]))
  let t45 = @drule.part_match(fn(x44 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x44))
  }, @weierstrass.card_bound_weierstrass_curve())
  let t68 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x47 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x46 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s42 = @tactics.mp_tac(x41)
            fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s42(x43)
            }
          })(t45(x46))
        })(@equal.lhand(x47))
      })((fn(x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x48.1
      })(x49))
    })(x50)(x50)
  }, t51), t52), @tactics.ants_tac), t55), t56), t57), t58), t67])
  let t40 = @simp.rewrite_tac(@list.List([p224_group_v1()]))
  let t39 = @simp.rewrite_tac(@list.List([generator_in_group_carrier_224(), group_element_order_g224(), finite_group_carrier_p224()]))
  let t38 = @tactics.exists_tac(@term_syntax.parse_term("G_224"))
  let t102 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.group_adhoc_order_unique_lemma()), t38), t39), t40), @tactics.conj_tac), t68), t69), t101)
  size_p224_group_c.set(@tactics.prove(@term_syntax.parse_term("HAS_SIZE(group_carrier(p224_group), n_224)"), t102))
}

///|
let size_p224_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_P224_GROUP")

///|
/// `SIZE_P224_GROUP`
pub fn size_p224_group() -> @kernel.Thm {
  size_p224_group_c.get()
}

///|
/// P256_GROUP_ORDER
fn step_22() -> Unit raise {
  let t103 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@sets.has_size()]))(size_p224_group())]))
  p256_group_order_c.set(@tactics.prove(@term_syntax.parse_term("CARD(group_carrier(p224_group)) == n_224"), t103))
}

///|
let p256_group_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P256_GROUP_ORDER")

///|
/// `P256_GROUP_ORDER`
pub fn p256_group_order() -> @kernel.Thm {
  p256_group_order_c.get()
}

///|
/// P224_GROUP_ELEMENT_ORDER
fn step_23() -> Unit raise {
  let t104 = @meson.meson_tac(@list.List([size_p224_group(), @sets.has_size(), @grouptheory.group_element_order_prime(), prime_n224()]))
  p224_group_element_order_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : Option[(Int, Int)], IN(P, group_carrier(p224_group)) → group_element_order(p224_group, P) == (if P == group_id(p224_group) { 1 } else { n_224 })"), t104))
}

///|
let p224_group_element_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P224_GROUP_ELEMENT_ORDER")

///|
/// `P224_GROUP_ELEMENT_ORDER`
pub fn p224_group_element_order() -> @kernel.Thm {
  p224_group_element_order_c.get()
}

///|
/// GENERATED_P224_GROUP
fn step_24() -> Unit raise {
  let t105 = @simp.rewrite_tac(@list.List([group_element_order_g224(), @simp.rewrite_rule(@list.List([@sets.has_size()]))(size_p224_group())]))
  let t106 = @tactics.then_tac(@simp.simp_tac(@list.List([@grouptheory.subgroup_generated_element_order(), generator_in_group_carrier_224(), finite_group_carrier_p224()])), t105)
  generated_p224_group_c.set(@tactics.prove(@term_syntax.parse_term("subgroup_generated(p224_group, {G_224}) == p224_group"), t106))
}

///|
let generated_p224_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENERATED_P224_GROUP")

///|
/// `GENERATED_P224_GROUP`
pub fn generated_p224_group() -> @kernel.Thm {
  generated_p224_group_c.get()
}

///|
/// CYCLIC_P224_GROUP
fn step_25() -> Unit raise {
  let t107 = @meson.meson_tac(@list.List([@grouptheory.cyclic_group_alt(), generated_p224_group()]))
  cyclic_p224_group_c.set(@tactics.prove(@term_syntax.parse_term("cyclic_group(p224_group)"), t107))
}

///|
let cyclic_p224_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CYCLIC_P224_GROUP")

///|
/// `CYCLIC_P224_GROUP`
pub fn cyclic_p224_group() -> @kernel.Thm {
  cyclic_p224_group_c.get()
}

///|
/// ABELIAN_P224_GROUP
fn step_26() -> Unit raise {
  let t108 = @meson.meson_tac(@list.List([cyclic_p224_group(), @grouptheory.cyclic_imp_abelian_group()]))
  abelian_p224_group_c.set(@tactics.prove(@term_syntax.parse_term("abelian_group(p224_group)"), t108))
}

///|
let abelian_p224_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABELIAN_P224_GROUP")

///|
/// `ABELIAN_P224_GROUP`
pub fn abelian_p224_group() -> @kernel.Thm {
  abelian_p224_group_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
}
