// Translated from upstream EC/secp256k1.ml; edit this file directly.

///|
/// EC/secp256k1.ml:9
fn step_1() -> Unit raise {
  @computegroup.add_curve(@weierstrass.weierstrass_curve())
}

///|
/// EC/secp256k1.ml:10
fn step_2() -> Unit raise {
  @computegroup.add_curveneg(@weierstrass.weierstrass_neg())
}

///|
/// EC/secp256k1.ml:11
fn step_3() -> Unit raise {
  @computegroup.add_curveadd(@weierstrass.weierstrass_add())
}

///|
/// p_256k1
fn step_4() -> Unit raise {
  p_256k1_c.set(@define.define_(@term_syntax.parse_term("(p_256k1 : Num) == 115792089237316195423570985008687907853269984665640564039457584007908834671663")))
}

///|
let p_256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p_256k1")

///|
/// `p_256k1`
pub fn p_256k1() -> @kernel.Thm {
  p_256k1_c.get()
}

///|
/// n_256k1
fn step_5() -> Unit raise {
  n_256k1_c.set(@define.define_(@term_syntax.parse_term("(n_256k1 : Num) == 115792089237316195423570985008687907852837564279074904382605163141518161494337")))
}

///|
let n_256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("n_256k1")

///|
/// `n_256k1`
pub fn n_256k1() -> @kernel.Thm {
  n_256k1_c.get()
}

///|
/// G_256K1
fn step_6() -> Unit raise {
  g_256k1_c.set(@define.define_(@term_syntax.parse_term("(G_256K1 : Option[(Int, Int)]) == SOME((int_of_num(55066263022277343669578718895168534326250603453777594175500187360389116729240), int_of_num(32670510020758816978083085130507043184471273380659243275938904335757337482424)))")))
}

///|
let g_256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("G_256K1")

///|
/// `G_256K1`
pub fn g_256k1() -> @kernel.Thm {
  g_256k1_c.get()
}

///|
/// secp256k1
fn step_7() -> Unit raise {
  secp256k1_c.set(@define.define_(@term_syntax.parse_term("(secp256k1 : (Ring[Int], Int, Int)) == (integer_mod_ring(p_256k1), int_of_num(0), int_of_num(7))")))
}

///|
let secp256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("secp256k1")

///|
/// `secp256k1`
pub fn secp256k1() -> @kernel.Thm {
  secp256k1_c.get()
}

///|
/// p256k1_beta
fn step_8() -> Unit raise {
  p256k1_beta_c.set(@define.define_(@term_syntax.parse_term("(p256k1_beta : Num) == 55594575648329892869085402983802832744385952214688224221778511981742606582254")))
}

///|
let p256k1_beta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p256k1_beta")

///|
/// `p256k1_beta`
pub fn p256k1_beta() -> @kernel.Thm {
  p256k1_beta_c.get()
}

///|
/// p256k1_lambda
fn step_9() -> Unit raise {
  p256k1_lambda_c.set(@define.define_(@term_syntax.parse_term("(p256k1_lambda : Num) == 37718080363155996902926221483475020450927657555482586988616620542887997980018")))
}

///|
let p256k1_lambda_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p256k1_lambda")

///|
/// `p256k1_lambda`
pub fn p256k1_lambda() -> @kernel.Thm {
  p256k1_lambda_c.get()
}

///|
/// P_256K1
fn step_10() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([p_256k1()])), t1)
  p_256k1_v1_c.set(@tactics.prove(@term_syntax.parse_term("p_256k1 == EXP(2, 256) - EXP(2, 32) - 977"), t2))
}

///|
let p_256k1_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P_256K1")

///|
/// `P_256K1`
pub fn p_256k1_v1() -> @kernel.Thm {
  p_256k1_v1_c.get()
}

///|
/// P_256K1_ALT
fn step_11() -> Unit raise {
  let t3 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([p_256k1()])), t3)
  p_256k1_alt_c.set(@tactics.prove(@term_syntax.parse_term("p_256k1 == EXP(2, 256) - EXP(2, 32) - EXP(2, 9) - EXP(2, 8) - EXP(2, 7) - EXP(2, 6) - EXP(2, 4) - 1"), t4))
}

///|
let p_256k1_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P_256K1_ALT")

///|
/// `P_256K1_ALT`
pub fn p_256k1_alt() -> @kernel.Thm {
  p_256k1_alt_c.get()
}

///|
/// PRIME_P256K1
fn step_12() -> Unit raise {
  let t10 = (fn(x7 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s8 = @tactics.conv_tac(x7)
    fn(x9 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s8(x9)
    }
  })(@pocklington.prime_rule(@list.List(["2", "3", "5", "7", "11", "13", "17", "19", "29", "31", "41", "53", "67", "83", "97", "101", "103", "131", "239", "271", "419", "443", "887", "971", "1373", "1627", "2621", "2657", "4423", "5323", "7723", "13441", "20113", "24809", "41201", "96557", "1206781", "7240687", "13331831", "107590001", "173378833005251801", "22149492674086928081353", "132896956044521568488119", "255515944373312847190720520512484175977", "205115282021455665897114700593932402728804164701536103180137503955397371"])))
  let t6 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t11 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([p_256k1()])), t6), t10)
  prime_p256k1_c.set(@lib.time(fn(x5 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x5.0, x5.1)
  }, (@term_syntax.parse_term("prime(p_256k1)"), t11)))
}

///|
let prime_p256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_P256K1")

///|
/// `PRIME_P256K1`
pub fn prime_p256k1() -> @kernel.Thm {
  prime_p256k1_c.get()
}

///|
/// PRIME_N256K1
fn step_13() -> Unit raise {
  let t17 = (fn(x14 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s15 = @tactics.conv_tac(x14)
    fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s15(x16)
    }
  })(@pocklington.prime_rule(@list.List(["2", "3", "5", "7", "11", "13", "17", "19", "23", "29", "37", "41", "59", "67", "73", "97", "109", "113", "149", "199", "293", "461", "631", "797", "1409", "1871", "2011", "2731", "2861", "4051", "9349", "16699", "28181", "85831", "120233", "305873", "1627771", "4681609", "44706919", "545358713", "297159362677", "107361793816595537", "174723607534414371449", "29047611873442575647497758179", "341948486974166000522343609283189"])))
  let t13 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t18 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([n_256k1()])), t13), t17)
  prime_n256k1_c.set(@lib.time(fn(x12 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x12.0, x12.1)
  }, (@term_syntax.parse_term("prime(n_256k1)"), t18)))
}

///|
let prime_n256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_N256K1")

///|
/// `PRIME_N256K1`
pub fn prime_n256k1() -> @kernel.Thm {
  prime_n256k1_c.get()
}

///|
/// p256k1_group
fn step_14() -> Unit raise {
  p256k1_group_c.set(@define.define_(@term_syntax.parse_term("(p256k1_group : Group[Option[(Int, Int)]]) == weierstrass_group((integer_mod_ring(p_256k1), int_of_num(0), int_of_num(7)))")))
}

///|
let p256k1_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p256k1_group")

///|
/// `p256k1_group`
pub fn p256k1_group() -> @kernel.Thm {
  p256k1_group_c.get()
}

///|
/// P256K1_GROUP
fn step_15() -> Unit raise {
  let t23 = @tactics.conv_tac(@int.int_reduce_conv)
  let t22 = @simp.simp_tac(@list.List([@ringtheory.integer_mod_ring_clauses(), @calc_num.arith(), @sets.in_elim_thm()]))
  let t21 = @simp.rewrite_tac(@list.List([p_256k1(), @weierstrass.weierstrass_nonsingular()]))
  let t20 = @simp.rewrite_tac(@list.List([@ringtheory.field_integer_mod_ring(), @ringtheory.integer_mod_ring_char(), prime_p256k1()]))
  let t19 = @tactics.match_mp_tac(@weierstrass.weierstrass_group_v1())
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([p256k1_group()])), t19), t20), t21), t22), t23)
  p256k1_group_v1_c.set(@tactics.prove(@term_syntax.parse_term("group_carrier(p256k1_group) == weierstrass_curve((integer_mod_ring(p_256k1), int_of_num(0), int_of_num(7))) && group_id(p256k1_group) == NONE && group_inv(p256k1_group) == weierstrass_neg((integer_mod_ring(p_256k1), int_of_num(0), int_of_num(7))) && group_mul(p256k1_group) == weierstrass_add((integer_mod_ring(p_256k1), int_of_num(0), int_of_num(7)))"), t24))
}

///|
let p256k1_group_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P256K1_GROUP")

///|
/// `P256K1_GROUP`
pub fn p256k1_group_v1() -> @kernel.Thm {
  p256k1_group_v1_c.get()
}

///|
/// EC/secp256k1.ml:92
fn step_16() -> Unit raise {
  @computegroup.add_ecgroup(@list.List([p_256k1()]), p256k1_group_v1())
}

///|
/// NO_ROOTS_256K1
fn step_17() -> Unit raise {
  let t25 = @excluderoots.exclude_modular_cubic_roots_tac(prime_p256k1(), @list.List([p_256k1()]))
  no_roots_256k1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Int, !op_eq_eq(pow(x, 3) + int_of_num(7), int_of_num(0), mod(int_of_num(p_256k1)))"), t25))
}

///|
let no_roots_256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NO_ROOTS_256K1")

///|
/// `NO_ROOTS_256K1`
pub fn no_roots_256k1() -> @kernel.Thm {
  no_roots_256k1_c.get()
}

///|
/// GENERATOR_IN_GROUP_CARRIER_256K1
fn step_18() -> Unit raise {
  let t26 = @tactics.conv_tac(@computegroup.ecgroup_carrier_conv)
  let t27 = @tactics.then_tac(@simp.rewrite_tac(@list.List([g_256k1()])), t26)
  generator_in_group_carrier_256k1_c.set(@tactics.prove(@term_syntax.parse_term("IN(G_256K1, group_carrier(p256k1_group))"), t27))
}

///|
let generator_in_group_carrier_256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENERATOR_IN_GROUP_CARRIER_256K1")

///|
/// `GENERATOR_IN_GROUP_CARRIER_256K1`
pub fn generator_in_group_carrier_256k1() -> @kernel.Thm {
  generator_in_group_carrier_256k1_c.get()
}

///|
/// GROUP_ELEMENT_ORDER_G256K1
fn step_19() -> Unit raise {
  let t30 = @tactics.conv_tac(@equal.land_conv(@computegroup.ecgroup_pow_conv))
  let t29 = @simp.rewrite_tac(@list.List([n_256k1()]))
  let t28 = @simp.rewrite_tac(@list.List([g_256k1(), @lib.el(1, @bool.conjuncts_rule(p256k1_group_v1())), @ind_types.option_distinct()]))
  let t31 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@grouptheory.group_element_order_unique_prime(), generator_in_group_carrier_256k1(), prime_n256k1()])), t28), t29), t30), @tactics.refl_tac)
  group_element_order_g256k1_c.set(@tactics.prove(@term_syntax.parse_term("group_element_order(p256k1_group, G_256K1) == n_256k1"), t31))
}

///|
let group_element_order_g256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GROUP_ELEMENT_ORDER_G256K1")

///|
/// `GROUP_ELEMENT_ORDER_G256K1`
pub fn group_element_order_g256k1() -> @kernel.Thm {
  group_element_order_g256k1_c.get()
}

///|
/// FINITE_GROUP_CARRIER_P256K1
fn step_20() -> Unit raise {
  let t35 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t34 = @simp.rewrite_tac(@list.List([p_256k1()]))
  let t33 = @simp.rewrite_tac(@list.List([@ringtheory.finite_integer_mod_ring(), @ringtheory.field_integer_mod_ring(), prime_p256k1()]))
  let t32 = @tactics.match_mp_tac(@weierstrass.finite_weierstrass_curve())
  let t36 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([p256k1_group_v1()])), t32), t33), t34), t35)
  finite_group_carrier_p256k1_c.set(@tactics.prove(@term_syntax.parse_term("FINITE(group_carrier(p256k1_group))"), t36))
}

///|
let finite_group_carrier_p256k1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_GROUP_CARRIER_P256K1")

///|
/// `FINITE_GROUP_CARRIER_P256K1`
pub fn finite_group_carrier_p256k1() -> @kernel.Thm {
  finite_group_carrier_p256k1_c.get()
}

///|
/// SIZE_P256K1_GROUP
fn step_21() -> Unit raise {
  let t96 = @drule.match_mp(@integer.int_divides_le())
  let t98 = @tactics.disch_then(fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x93 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s94 = @tactics.mp_tac(x93)
      fn(x95 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s94(x95)
      }
    })(t96(x97))
  })
  let t92 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.num_coprime()), @calc_num.arith(), @prime.coprime_2()]))
  let t89 = @drule.match_mp(@int.integer_rule(@term_syntax.parse_term("divides((p : Int), (a : Int) * (b : Int)) → coprime((a, p)) → divides(p, b)")))
  let t91 = @tactics.disch_then(fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s87 = @tactics.mp_tac(x86)
      fn(x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s87(x88)
      }
    })(t89(x90))
  })
  let t85 = @simp.rewrite_tac(@list.List([@int.int_rem_eq(), @int.integer_rule(@term_syntax.parse_term("op_eq_eq(-(y : Int), y, mod((p : Int))) == divides(p, int_of_num(2) * y)"))]))
  let t84 = @list.List([@simp.asm_simp_tac(@list.List([@int.int_rem_lt()])), @tactics.all_tac])
  let t82 = @drule.match_mp(@int.int_arith(@term_syntax.parse_term("rem(-(y : Int), (p : Int)) == y → rem(y, p) == y → rem(-y, p) == rem(y, p)")))
  let t99 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.first_x_assum(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s80 = @tactics.mp_tac(x79)
      fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s80(x81)
      }
    })(t82(x83))
  })), @tactics.ants_tac), t84), t85), t91), t92), t98), @int.asm_int_arith_tac)
  let t78 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_rem_eq()), p_256k1(), @int.int_rem_zero()]))
  let t77 = @simp.rewrite_tac(@list.List([@int.int_mul_lzero(), @int.int_add_lid()]))
  let t76 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Int)"), no_roots_256k1()))
  let t75 = @tactics.conv_tac(@int.int_rem_down_conv)
  let t74 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s71 = @tactics.mp_tac(x70)
      fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s71(x72)
      }
    })(@equal.sym(x73))
  }))
  let t69 = @tactics.conv_tac(@int.int_reduce_conv)
  let t100 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t69), t74), t75), t76), t77), t78), t99])
  let t68 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Int) == int_of_num(0)"))
  let t65 = @tactics.conv_tac(@int.int_reduce_conv)
  let t64 = @simp.rewrite_tac(@list.List([p_256k1(), @pair.pair_eq()]))
  let t63 = @tactics.conv_tac(@int.int_rem_down_conv)
  let t62 = @simp.rewrite_tac(@list.List([@ringtheory.in_integer_mod_ring_carrier(), @ringtheory.integer_mod_ring_clauses()]))
  let t61 = @simp.rewrite_tac(@list.List([@ind_types.option_inj()]))
  let t59 = @term_syntax.parse_term("(y : Int)")
  let t60 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Int)"), t59]))
  let t58 = @simp.rewrite_tac(@list.List([@weierstrass.weierstrass_curve(), @weierstrass.weierstrass_neg(), @ind_types.option_distinct()]))
  let t66 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@ind_types.forall_option_thm(), @sets.in_(), @pair.forall_pair_thm()])), t58), t60), t61), t62), t63), t64), t65)
  let t57 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t56 = @simp.rewrite_tac(@list.List([n_256k1()]))
  let t55 = @simp.simp_tac(@list.List([@ringtheory.card_integer_mod_ring(), p_256k1(), @calc_num.arith()]))
  let t53 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@arith.let_trans()))
  let t52 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t54 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([p_256k1()])), t52), t53])
  let t51 = @simp.rewrite_tac(@list.List([prime_p256k1()]))
  let t50 = @simp.rewrite_tac(@list.List([@ringtheory.finite_integer_mod_ring(), @ringtheory.field_integer_mod_ring()]))
  let t44 = @drule.part_match(fn(x43 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x43))
  }, @weierstrass.card_bound_weierstrass_curve())
  let t67 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x46 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x45 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x40 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s41 = @tactics.mp_tac(x40)
            fn(x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s41(x42)
            }
          })(t44(x45))
        })(@equal.lhand(x46))
      })((fn(x47 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x47.1
      })(x48))
    })(x49)(x49)
  }, t50), t51), @tactics.ants_tac), t54), t55), t56), t57), t66])
  let t39 = @simp.rewrite_tac(@list.List([p256k1_group_v1()]))
  let t38 = @simp.rewrite_tac(@list.List([generator_in_group_carrier_256k1(), group_element_order_g256k1(), finite_group_carrier_p256k1()]))
  let t37 = @tactics.exists_tac(@term_syntax.parse_term("G_256K1"))
  let t101 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.group_adhoc_order_unique_lemma()), t37), t38), t39), @tactics.conj_tac), t67), t68), t100)
  size_p256k1_group_c.set(@tactics.prove(@term_syntax.parse_term("HAS_SIZE(group_carrier(p256k1_group), n_256k1)"), t101))
}

///|
let size_p256k1_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_P256K1_GROUP")

///|
/// `SIZE_P256K1_GROUP`
pub fn size_p256k1_group() -> @kernel.Thm {
  size_p256k1_group_c.get()
}

///|
/// P256K1_GROUP_ORDER
fn step_22() -> Unit raise {
  let t102 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@sets.has_size()]))(size_p256k1_group())]))
  p256k1_group_order_c.set(@tactics.prove(@term_syntax.parse_term("CARD(group_carrier(p256k1_group)) == n_256k1"), t102))
}

///|
let p256k1_group_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P256K1_GROUP_ORDER")

///|
/// `P256K1_GROUP_ORDER`
pub fn p256k1_group_order() -> @kernel.Thm {
  p256k1_group_order_c.get()
}

///|
/// P256K1_GROUP_ELEMENT_ORDER
fn step_23() -> Unit raise {
  let t103 = @meson.meson_tac(@list.List([size_p256k1_group(), @sets.has_size(), @grouptheory.group_element_order_prime(), prime_n256k1()]))
  p256k1_group_element_order_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : Option[(Int, Int)], IN(P, group_carrier(p256k1_group)) → group_element_order(p256k1_group, P) == (if P == group_id(p256k1_group) { 1 } else { n_256k1 })"), t103))
}

///|
let p256k1_group_element_order_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P256K1_GROUP_ELEMENT_ORDER")

///|
/// `P256K1_GROUP_ELEMENT_ORDER`
pub fn p256k1_group_element_order() -> @kernel.Thm {
  p256k1_group_element_order_c.get()
}

///|
/// GENERATED_P256K1_GROUP
fn step_24() -> Unit raise {
  let t104 = @simp.rewrite_tac(@list.List([group_element_order_g256k1(), @simp.rewrite_rule(@list.List([@sets.has_size()]))(size_p256k1_group())]))
  let t105 = @tactics.then_tac(@simp.simp_tac(@list.List([@grouptheory.subgroup_generated_element_order(), generator_in_group_carrier_256k1(), finite_group_carrier_p256k1()])), t104)
  generated_p256k1_group_c.set(@tactics.prove(@term_syntax.parse_term("subgroup_generated(p256k1_group, {G_256K1}) == p256k1_group"), t105))
}

///|
let generated_p256k1_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENERATED_P256K1_GROUP")

///|
/// `GENERATED_P256K1_GROUP`
pub fn generated_p256k1_group() -> @kernel.Thm {
  generated_p256k1_group_c.get()
}

///|
/// CYCLIC_P256K1_GROUP
fn step_25() -> Unit raise {
  let t106 = @meson.meson_tac(@list.List([@grouptheory.cyclic_group_alt(), generated_p256k1_group()]))
  cyclic_p256k1_group_c.set(@tactics.prove(@term_syntax.parse_term("cyclic_group(p256k1_group)"), t106))
}

///|
let cyclic_p256k1_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CYCLIC_P256K1_GROUP")

///|
/// `CYCLIC_P256K1_GROUP`
pub fn cyclic_p256k1_group() -> @kernel.Thm {
  cyclic_p256k1_group_c.get()
}

///|
/// ABELIAN_P256K1_GROUP
fn step_26() -> Unit raise {
  let t107 = @meson.meson_tac(@list.List([cyclic_p256k1_group(), @grouptheory.cyclic_imp_abelian_group()]))
  abelian_p256k1_group_c.set(@tactics.prove(@term_syntax.parse_term("abelian_group(p256k1_group)"), t107))
}

///|
let abelian_p256k1_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABELIAN_P256K1_GROUP")

///|
/// `ABELIAN_P256K1_GROUP`
pub fn abelian_p256k1_group() -> @kernel.Thm {
  abelian_p256k1_group_c.get()
}

///|
/// GROUP_ENDOMORPHISM_TRIPLEX_BETA
fn step_27() -> Unit raise {
  let t111 = @tactics.conv_tac(@int.int_reduce_conv)
  let t110 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([p_256k1()]))(prime_p256k1())]))
  let t109 = @simp.simp_tac(@list.List([@ringtheory.integer_mod_ring_v1(), @ringtheory.integer_mod_ring_char(), @ringtheory.integer_mod_ring_pow(), p_256k1(), @sets.in_insert(), @ringtheory.field_integer_mod_ring(), @calc_num.arith(), p256k1_beta(), @sets.in_elim_thm(), @weierstrass.weierstrass_nonsingular(), @ringtheory.integer_mod_ring_of_num()]))
  let t108 = @tactics.match_mp_tac(@weierstrass.group_endomorphism_triplex())
  let t112 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([p256k1_group()])), t108), t109), t110), t111)
  group_endomorphism_triplex_beta_c.set(@tactics.prove(@term_syntax.parse_term("group_endomorphism(p256k1_group, weierstrass_triplex(integer_mod_ring(p_256k1), int_of_num(p256k1_beta)))"), t112))
}

///|
let group_endomorphism_triplex_beta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GROUP_ENDOMORPHISM_TRIPLEX_BETA")

///|
/// `GROUP_ENDOMORPHISM_TRIPLEX_BETA`
pub fn group_endomorphism_triplex_beta() -> @kernel.Thm {
  group_endomorphism_triplex_beta_c.get()
}

///|
/// P256K1_TRIPLEX_BETA
fn step_28() -> Unit raise {
  let t134 = @tactics.conv_tac(@int.int_reduce_conv)
  let t133 = @simp.rewrite_tac(@list.List([@ringtheory.integer_mod_ring_v1(), p_256k1()]))
  let t132 = @simp.rewrite_tac(@list.List([@ind_types.option_inj(), @pair.pair_eq()]))
  let t131 = @tactics.conv_tac(@equal.rand_conv(@computegroup.ecgroup_pow_conv))
  let t130 = @simp.simp_tac(@list.List([@weierstrass.weierstrass_triplex(), p256k1_beta(), p256k1_lambda(), g_256k1()]))
  let t129 = @simp.rewrite_tac(@list.List([@theorems.imp_conj_alt(), @sets.in_sing(), @theorems.forall_unwind_thm2()]))
  let t128 = @simp.rewrite_tac(@list.List([group_endomorphism_triplex_beta(), @class.eta_ax()]))
  let t127 = @simp.rewrite_tac(@list.List([@equal.gsym(@grouptheory.group_endomorphism())]))
  let t126 = @simp.simp_tac(@list.List([@grouptheory.abelian_group_homomorphism_powering(), abelian_p256k1_group()]))
  let t125 = @tactics.exists_tac(@term_syntax.parse_term("p256k1_group"))
  let t124 = @tactics.match_mp_tac(@grouptheory.group_homomorphisms_eq_on_generators())
  let t135 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x123 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x119 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x113 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s114 = @equal.binder_conv(x113)
        fn(x115 : @kernel.Term) -> @kernel.Thm raise {
          s114(x115)
        }
      })((fn(x116 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s117 = @equal.land_conv(x116)
        fn(x118 : @kernel.Term) -> @kernel.Thm raise {
          s117(x118)
        }
      })(x119))
    })((fn(x120 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s121 = @equal.once_depth_conv(x120)
      fn(x122 : @kernel.Term) -> @kernel.Thm raise {
        s121(x122)
      }
    })(x123))
  }, @list.List([@equal.gsym(generated_p256k1_group())])), t124), t125), t126), t127), t128), t129), @tactics.disch_tac), t130), t131), t132), t133), t134)
  p256k1_triplex_beta_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Option[(Int, Int)], IN(x, group_carrier(p256k1_group)) → weierstrass_triplex(integer_mod_ring(p_256k1), int_of_num(p256k1_beta), x) == group_pow(p256k1_group, x, p256k1_lambda)"), t135))
}

///|
let p256k1_triplex_beta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P256K1_TRIPLEX_BETA")

///|
/// `P256K1_TRIPLEX_BETA`
pub fn p256k1_triplex_beta() -> @kernel.Thm {
  p256k1_triplex_beta_c.get()
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
  step_27()
  step_28()
}
