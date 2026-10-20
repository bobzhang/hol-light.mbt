// Translated from upstream 100/four_squares.ml; edit this file directly.

///|
/// 100/four_squares.ml:8
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// involution
fn step_2() -> Unit raise {
  involution_c.set(@pair.new_definition(@term_syntax.parse_term("(involution : ((_) -> _, (_) -> Bool) -> Bool)((f : (_) -> _), (s : (_) -> Bool)) == (∀ x : _, IN(x, s) → IN(f(x), s) && f(f(x)) == x)")))
}

///|
let involution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("involution")

///|
/// `involution`
pub fn involution() -> @kernel.Thm {
  involution_c.get()
}

///|
/// INVOLUTION_IMAGE
fn step_3() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([involution(), @sets.extension(), @sets.in_image()])), t1)
  involution_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ s : (_) -> Bool, involution(f, s) → IMAGE(f, s) == s"), t2))
}

///|
let involution_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_IMAGE")

///|
/// `INVOLUTION_IMAGE`
pub fn involution_image() -> @kernel.Thm {
  involution_image_c.get()
}

///|
/// INVOLUTION_DELETE
fn step_4() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([]))
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([involution(), @sets.in_delete()])), t3)
  involution_delete_c.set(@tactics.prove(@term_syntax.parse_term("involution((f : (_) -> _), (s : (_) -> Bool)) && IN((a : _), s) && f(a) == a → involution(f, DELETE(s, a))"), t4))
}

///|
let involution_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_DELETE")

///|
/// `INVOLUTION_DELETE`
pub fn involution_delete() -> @kernel.Thm {
  involution_delete_c.get()
}

///|
/// INVOLUTION_STEPDOWN
fn step_5() -> Unit raise {
  let t5 = @meson.meson_tac(@list.List([]))
  let t6 = @tactics.then_tac(@simp.rewrite_tac(@list.List([involution(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()])), t5)
  involution_stepdown_c.set(@tactics.prove(@term_syntax.parse_term("involution((f : (_) -> _), (s : (_) -> Bool)) && IN((a : _), s) → involution(f, DIFF(s, {a, f(a)}))"), t6))
}

///|
let involution_stepdown_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_STEPDOWN")

///|
/// `INVOLUTION_STEPDOWN`
pub fn involution_stepdown() -> @kernel.Thm {
  involution_stepdown_c.get()
}

///|
/// INVOLUTION_NOFIXES
fn step_6() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t8 = @tactics.then_tac(@simp.rewrite_tac(@list.List([involution(), @sets.in_elim_thm()])), t7)
  involution_nofixes_c.set(@tactics.prove(@term_syntax.parse_term("involution((f : (_) -> _), (s : (_) -> Bool)) → involution(f, {(x : _) | IN(x, s) && !(f(x) == x)})"), t8))
}

///|
let involution_nofixes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_NOFIXES")

///|
/// `INVOLUTION_NOFIXES`
pub fn involution_nofixes() -> @kernel.Thm {
  involution_nofixes_c.get()
}

///|
/// INVOLUTION_SUBSET
fn step_7() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([]))
  let t10 = @tactics.then_tac(@simp.rewrite_tac(@list.List([involution(), @sets.subset()])), t9)
  involution_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ s : (_) -> Bool, ∀ t : (_) -> Bool, involution(f, s) && (∀ x : _, IN(x, t) → IN(f(x), t)) && SUBSET(t, s) → involution(f, t)"), t10))
}

///|
let involution_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_SUBSET")

///|
/// `INVOLUTION_SUBSET`
pub fn involution_subset() -> @kernel.Thm {
  involution_subset_c.get()
}

///|
/// INVOLUTION_EVEN
fn step_8() -> Unit raise {
  let t11 = @meson.meson_tac(@list.List([@sets.involution_even_nofixpoints()]))
  let t12 = @tactics.then_tac(@simp.rewrite_tac(@list.List([involution()])), t11)
  involution_even_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) && involution((f : (A) -> A), s) && (∀ x : A, IN(x, s) → !(f(x) == x)) → EVEN(CARD(s))"), t12))
}

///|
let involution_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_EVEN")

///|
/// `INVOLUTION_EVEN`
pub fn involution_even() -> @kernel.Thm {
  involution_even_c.get()
}

///|
/// INVOLUTION_FIX_ODD
fn step_9() -> Unit raise {
  let t22 = @meson.asm_meson_tac(@list.List([]))
  let t21 = @simp.asm_simp_tac(@list.List([involution_delete(), @sets.finite_delete(), @sets.in_delete()]))
  let t20 = @tactics.match_mp_tac(involution_even())
  let t19 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_delete(), @sets.in_delete(), @arith.odd(), @arith.not_odd()]))
  let t17 = @meson.asm_meson_tac(@list.List([]))
  let t18 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.in_delete()])), t17), @tactics.all_tac])
  let t16 = @tactics.subgoal_then(@term_syntax.parse_term("(s : (A) -> Bool) == INSERT((a : A), DELETE(s, a))"), fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s14 = @tactics.subst1_tac(x13)
    fn(x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s14(x15)
    }
  })
  let t23 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@bool.exists_unique_def()])), @tactics.strip_tac), t16), t18), t19), t20), t21), t22)
  involution_fix_odd_c.set(@tactics.prove(@term_syntax.parse_term("FINITE((s : (A) -> Bool)) && involution((f : (A) -> A), s) && existsunique((a : A) => IN(a, s) && f(a) == a) → ODD(CARD(s))"), t23))
}

///|
let involution_fix_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_FIX_ODD")

///|
/// `INVOLUTION_FIX_ODD`
pub fn involution_fix_odd() -> @kernel.Thm {
  involution_fix_odd_c.get()
}

///|
/// INVOLUTION_ODD
fn step_10() -> Unit raise {
  let t24 = @meson.meson_tac(@list.List([involution_even()]))
  let t25 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_even())])), t24)
  involution_odd_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : _, ∀ s : (_) -> Bool, FINITE(s) && involution((f : (_) -> _), s) && ODD(CARD(s)) → (∃ a : _, IN(a, s) && f(a) == a)"), t25))
}

///|
let involution_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_ODD")

///|
/// `INVOLUTION_ODD`
pub fn involution_odd() -> @kernel.Thm {
  involution_odd_c.get()
}

///|
/// INVOLUTION_FIX_FIX
fn step_11() -> Unit raise {
  let t29 = @simp.asm_rewrite_tac(@list.List([]))
  let t28 = @tactics.match_mp_tac(involution_fix_odd())
  let t27 = @simp.asm_rewrite_tac(@list.List([]))
  let t26 = @tactics.match_mp_tac(involution_odd())
  let t30 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t26), t27), t28), t29)
  involution_fix_fix_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ g : (_) -> _, ∀ s : (_) -> Bool, FINITE(s) && involution(f, s) && involution(g, s) && existsunique((x : _) => IN(x, s) && f(x) == x) → (∃ x : _, IN(x, s) && g(x) == x)"), t30))
}

///|
let involution_fix_fix_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVOLUTION_FIX_FIX")

///|
/// `INVOLUTION_FIX_FIX`
pub fn involution_fix_fix() -> @kernel.Thm {
  involution_fix_fix_c.get()
}

///|
/// zset
fn step_12() -> Unit raise {
  zset_c.set(@pair.new_definition(@term_syntax.parse_term("(zset : (Num, (Num, Num, Num)) -> Bool)((a : Num)) == {((x : Num), (y : Num), (z : Num)) | EXP(x, 2) + 4 * (y * z) == a}")))
}

///|
let zset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("zset")

///|
/// `zset`
pub fn zset() -> @kernel.Thm {
  zset_c.get()
}

///|
/// zag
fn step_13() -> Unit raise {
  zag_c.set(@pair.new_definition(@term_syntax.parse_term("(zag : ((Num, Num, Num)) -> (Num, Num, Num))(((x : Num), (y : Num), (z : Num))) == (if x + z < y { (x + 2 * z, z, y - (x + z)) } else { if x < 2 * y { (2 * y - x, y, x + z - y) } else { (x - 2 * y, x + z - y, y) } })")))
}

///|
let zag_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("zag")

///|
/// `zag`
pub fn zag() -> @kernel.Thm {
  zag_c.get()
}

///|
/// tag
fn step_14() -> Unit raise {
  tag_c.set(@pair.new_definition(@term_syntax.parse_term("(tag : ((Num, Num, Num)) -> (Num, Num, Num))(((x : Num), (y : Num), (z : Num))) == (x, z, y)")))
}

///|
let tag_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tag")

///|
/// `tag`
pub fn tag() -> @kernel.Thm {
  tag_c.get()
}

///|
/// ZAG_INVOLUTION_GENERAL
fn step_15() -> Unit raise {
  let t40 = @tactics.pop_assum_list(fn(x39 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x35 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s36 = @tactics.mp_tac(x35)
      fn(x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s36(x37)
      }
    })(((x38 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x38))(x39))
  })
  let t34 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t33 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t32 = @simp.rewrite_tac(@list.List([zag()]))
  let t31 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([zag()])), t31), t32), t33), t34), t40), @int.arith_tac)
  zag_involution_general_c.set(@tactics.prove(@term_syntax.parse_term("0 < (x : Num) && 0 < (y : Num) && 0 < (z : Num) → zag(zag((x, y, z))) == (x, y, z)"), t41))
}

///|
let zag_involution_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZAG_INVOLUTION_GENERAL")

///|
/// `ZAG_INVOLUTION_GENERAL`
pub fn zag_involution_general() -> @kernel.Thm {
  zag_involution_general_c.get()
}

///|
/// IN_TRIPLE
fn step_16() -> Unit raise {
  let t42 = @meson.meson_tac(@list.List([]))
  let t43 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @pair.pair_eq()])), t42)
  in_triple_c.set(@tactics.prove(@term_syntax.parse_term("IN(((a : _), (b : _), (c : _)), {((x : _), (y : _), (z : _)) | (P : (_, _, _) -> Bool)(x, y, z)}) == P(a, b, c)"), t43))
}

///|
let in_triple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_TRIPLE")

///|
/// `IN_TRIPLE`
pub fn in_triple() -> @kernel.Thm {
  in_triple_c.get()
}

///|
/// PRIME_SQUARE
fn step_17() -> Unit raise {
  let t58 = @simp.asm_simp_tac(@list.List([@arith.eq_mult_lcancel()]))
  let t57 = @simp.gen_rewrite_tac(fn(x56 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x50 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s51 = @equal.rand_conv(x50)
      fn(x52 : @kernel.Term) -> @kernel.Thm raise {
        s51(x52)
      }
    })((fn(x53 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s54 = @equal.land_conv(x53)
      fn(x55 : @kernel.Term) -> @kernel.Thm raise {
        s54(x55)
      }
    })(x56))
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == n * 1"))]))
  let t49 = @simp.asm_simp_tac(@list.List([@prime.divides_lmul(), @prime.divides_refl()]))
  let t48 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t47 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t46 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t45 = @simp.rewrite_tac(@list.List([@int.prime(), @class.not_forall_thm(), @class.de_morgan_thm()]))
  let t44 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0(), @arith.mult_clauses()]))
  let t59 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))), t44), t45), t46), t47), @tactics.disj2_tac), t48), t49), t57), t58)
  prime_square_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !prime(n * n)"), t59))
}

///|
let prime_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_SQUARE")

///|
/// `PRIME_SQUARE`
pub fn prime_square() -> @kernel.Thm {
  prime_square_c.get()
}

///|
/// PRIME_4X
fn step_18() -> Unit raise {
  let t67 = @tactics.pop_assum(fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s65 = @tactics.mp_tac(x64)
    fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s65(x66)
    }
  })
  let t63 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t62 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.mult_assoc()), @prime.divides_rmul(), @prime.divides_refl(), @calc_num.arith_eq()]))
  let t61 = @tactics.subst1_tac(@equal.sym(@calc_num.num_reduce_conv(@term_syntax.parse_term("2 * 2"))))
  let t60 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@int.prime(), @class.not_forall_thm(), @class.de_morgan_thm()]))), @tactics.disj2_tac), t60), t61), t62), t63), t67), @int.arith_tac)
  prime_4x_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !prime(4 * n)"), t68))
}

///|
let prime_4x_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_4X")

///|
/// `PRIME_4X`
pub fn prime_4x() -> @kernel.Thm {
  prime_4x_c.get()
}

///|
/// PRIME_XYZ_NONZERO
fn step_19() -> Unit raise {
  let t74 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @arith.mult_clauses(), @arith.add_clauses(), prime_square(), prime_4x()]))
  let t73 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s71 = @tactics.subst1_tac(x70)
    fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s71(x72)
    }
  }))
  let t69 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @int.arith_rule(@term_syntax.parse_term("!(0 < (x : Num)) == (x == 0)"))]))
  let t75 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@class.contrapos_conv), t69), t73), t74)
  prime_xyz_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("prime(EXP((x : Num), 2) + 4 * ((y : Num) * (z : Num))) → 0 < x && 0 < y && 0 < z"), t75))
}

///|
let prime_xyz_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_XYZ_NONZERO")

///|
/// `PRIME_XYZ_NONZERO`
pub fn prime_xyz_nonzero() -> @kernel.Thm {
  prime_xyz_nonzero_c.get()
}

///|
/// ZAG_INVOLUTION
fn step_20() -> Unit raise {
  let t93 = @meson.asm_meson_tac(@list.List([prime_xyz_nonzero()]))
  let t94 = @tactics.then_tac(@tactics.match_mp_tac(zag_involution_general()), t93)
  let t89 = @equal.gsym(@int.int_of_num_sub())
  let t90 = @equal.gsym(@int.int_of_num_mul())
  let t91 = @equal.gsym(@int.int_of_num_add())
  let t92 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.int_of_num_eq()), t91, @arith.exp_2(), t90, t89, @arith.lt_imp_le()]))
  let t88 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.not_lt()])))
  let t87 = @simp.asm_rewrite_tac(@list.List([in_triple()]))
  let t86 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t95 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([zag()])), t86), t87), t88), t92), @int.int_arith_tac), t94])
  let t85 = @tactics.disch_then(fn(x84 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s82 = @tactics.subst_all_tac(x81)
      fn(x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s82(x83)
      }
    })(@equal.sym(x84))
  })
  let t80 = @simp.rewrite_tac(@list.List([zset(), in_triple()]))
  let t77 = @term_syntax.parse_term("(z : Num)")
  let t78 = @term_syntax.parse_term("(y : Num)")
  let t79 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t78, t77]))
  let t76 = @simp.rewrite_tac(@list.List([involution(), @pair.forall_pair_thm()]))
  let t96 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t76), t79), t80), t85), @tactics.conj_tac), t95)
  zag_involution_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → involution(zag, zset(p))"), t96))
}

///|
let zag_involution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZAG_INVOLUTION")

///|
/// `ZAG_INVOLUTION`
pub fn zag_involution() -> @kernel.Thm {
  zag_involution_c.get()
}

///|
/// TAG_INVOLUTION
fn step_21() -> Unit raise {
  let t98 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t97 = @simp.rewrite_tac(@list.List([in_triple()]))
  let t99 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([involution(), tag(), zset(), @pair.forall_pair_thm()])), t97), t98)
  tag_involution_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, involution(tag, zset(a))"), t99))
}

///|
let tag_involution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAG_INVOLUTION")

///|
/// `TAG_INVOLUTION`
pub fn tag_involution() -> @kernel.Thm {
  tag_involution_c.get()
}

///|
/// ZAG_LEMMA
fn step_22() -> Unit raise {
  let t106 = @tactics.pop_assum_list(fn(x105 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s102 = @tactics.mp_tac(x101)
      fn(x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s102(x103)
      }
    })(((x104 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x104))(x105))
  })
  let t100 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_simp_tac(@list.List([@pair.pair_eq()]))))
  let t107 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([zag(), @int.int_pow_2()])), t100), t106), @int.arith_tac)
  zag_lemma_c.set(@tactics.prove(@term_syntax.parse_term("zag(((x : Num), (y : Num), (z : Num))) == (x, y, z) → y == x"), t107))
}

///|
let zag_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZAG_LEMMA")

///|
/// `ZAG_LEMMA`
pub fn zag_lemma() -> @kernel.Thm {
  zag_lemma_c.get()
}

///|
/// ZSET_BOUND
fn step_23() -> Unit raise {
  let t123 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (a : Num) → 1 <= 4 * a"))]))
  let t122 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t121 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((y : Num) <= 4 * ((a : Num) * y)) == (1 * y <= 4 * a * y)"))]))
  let t120 = @list.List([@simp.gen_rewrite_tac(fn(x119 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x113 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s114 = @equal.rand_conv(x113)
      fn(x115 : @kernel.Term) -> @kernel.Thm raise {
        s114(x115)
      }
    })((fn(x116 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s117 = @equal.rand_conv(x116)
      fn(x118 : @kernel.Term) -> @kernel.Thm raise {
        s117(x118)
      }
    })(x119))
  }, @list.List([@arith.mult_sym()])), @tactics.all_tac])
  let t124 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(y : Num) <= (z : Num) → y <= (x : Num) + z")))), t120), t121), t122), t123)
  let t125 = @list.List([@meson.meson_tac(@list.List([@arith.exp_2(), @arith.le_square_refl(), @int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → a <= b + (c : Num)"))])), t124])
  let t112 = @tactics.first_x_assum(fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s109 = @tactics.subst1_tac(x108)
      fn(x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s109(x110)
      }
    })(@equal.sym(x111))
  })
  let t126 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t112), @tactics.conj_tac), t125)
  zset_bound_c.set(@tactics.prove(@term_syntax.parse_term("0 < (y : Num) && 0 < (z : Num) && EXP((x : Num), 2) + 4 * (y * z) == (p : Num) → x <= p && y <= p && z <= p"), t126))
}

///|
let zset_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZSET_BOUND")

///|
/// `ZSET_BOUND`
pub fn zset_bound() -> @kernel.Thm {
  zset_bound_c.get()
}

///|
/// ZSET_FINITE
fn step_24() -> Unit raise {
  let t155 = @meson.asm_meson_tac(@list.List([zset_bound(), prime_xyz_nonzero()]))
  let t154 = @simp.rewrite_tac(@list.List([]))
  let t152 = @term_syntax.parse_term("(z : Num)")
  let t153 = @tactics.map_every(fn(x149 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s150 = @tactics.exists_tac(x149)
    fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s150(x151)
    }
  }, @list.List([@term_syntax.parse_term("(y : Num)"), t152]))
  let t148 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t147 = @simp.asm_rewrite_tac(@list.List([]))
  let t144 = @term_syntax.parse_term("(z : Num)")
  let t145 = @term_syntax.parse_term("(y : Num)")
  let t146 = @tactics.map_every(fn(x141 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s142 = @tactics.exists_tac(x141)
    fn(x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s142(x143)
    }
  }, @list.List([@term_syntax.parse_term("(x : Num)"), t145, t144]))
  let t140 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((x : Num) < (p : Num) + 1) == (x <= p)")), @pair.pair_eq()]))
  let t139 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @pair.exists_pair_thm(), @pair.pair_eq()]))
  let t136 = @term_syntax.parse_term("(z : Num)")
  let t137 = @term_syntax.parse_term("(y : Num)")
  let t138 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t137, t136]))
  let t135 = @simp.rewrite_tac(@list.List([zset(), @sets.subset(), @pair.forall_pair_thm(), in_triple()]))
  let t134 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) == (b → a → c)"))]))(@sets.finite_subset()))
  let t133 = @tactics.disch_then(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x128
    let t131 = @drule.match_mp(@sets.finite_product())
    @tactics.mp_tac(@lib.funpow(2, fn(x132 : @kernel.Thm) -> @kernel.Thm raise {
      t131(((x130 : @kernel.Thm) => @bool.conj(th, x130))(x132))
    }, th))
  })
  let t127 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(p : Num) + 1"), @sets.finite_numseg_lt()))
  let t156 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t127), t133), t134), t135), t138), t139), t140), @tactics.disch_tac), t146), t147), t148), t153), t154), t155)
  zset_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → FINITE(zset(p))"), t156))
}

///|
let zset_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZSET_FINITE")

///|
/// `ZSET_FINITE`
pub fn zset_finite() -> @kernel.Thm {
  zset_finite_c.get()
}

///|
/// SUM_OF_TWO_SQUARES
fn step_25() -> Unit raise {
  let t226 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t225 = @simp.asm_rewrite_tac(@list.List([]))
  let t224 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 1"))
  let t223 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t222 = @tactics.undisch_tac(@term_syntax.parse_term("4 * (k : Num) + 1 == (x : Num) * (4 * (z : Num) + x)"))
  let t221 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((z : Num) == 0)")), @int.arith_tac)])
  let t220 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Num) == 0"))
  let t219 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t227 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("4 * (z : Num) + (x : Num) == 1")), t219), t220), t221), t222), t223), t224), t225), t226), @int.arith_tac)
  let t218 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_eq_0(), @calc_num.arith_eq()]))
  let t228 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("4 * (k : Num) + 1 == (x : Num) * (4 * (z : Num) + x)")), t218), t227])
  let t217 = @simp.asm_simp_tac(@list.List([@arith.eq_mult_lcancel()]))
  let t229 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) == a * (b : Num)) == (a * b == a * 1)"))])), t217), @tactics.strip_tac), t228)
  let t216 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @pair.pair_eq()]))
  let t230 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("4 * (k : Num) + 1 == 1 * (4 * (z : Num) + 1)")), t216), @int.arith_tac), t229])
  let t215 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s210 = @tactics.subst_all_tac(x209)
    fn(x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s210(x211)
    }
  }, fn(x212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s213 = @tactics.mp_tac(x212)
    fn(x214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s213(x214)
    }
  }))
  let t208 = @simp.simp_tac(@list.List([@prime.divides_rmul(), @prime.divides_refl()]))
  let t204 = @term_syntax.parse_term("(x : Num)")
  let t207 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s199 = @tactics.assume_tac(x198)
    fn(x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s199(x200)
    }
  }, fn(x206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s202 = @tactics.mp_tac(x201)
      fn(x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s202(x203)
      }
    })(((x205 : @kernel.Thm) => @bool.spec(t204, x205))(x206))
  }))
  let t197 = @simp.rewrite_tac(@list.List([@int.prime()]))
  let t196 = @simp.asm_rewrite_tac(@list.List([]))
  let t195 = @tactics.undisch_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t194 = @tactics.disch_then(fn(x193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s191 = @tactics.assume_tac(x190)
      fn(x192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s191(x192)
      }
    })(@equal.sym(x193))
  })
  let t189 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @int.arith_rule(@term_syntax.parse_term("(x : Num) * x + 4 * (x * (z : Num)) == x * (4 * z + x)"))]))
  let t188 = @tactics.undisch_tac(@term_syntax.parse_term("EXP((x : Num), 2) + 4 * (x * (z : Num)) == 4 * (k : Num) + 1"))
  let t185 = @drule.match_mp(zag_lemma())
  let t187 = @tactics.first_assum(fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s183 = @tactics.subst_all_tac(x182)
      fn(x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s183(x184)
      }
    })(t185(x186))
  })
  let t181 = @simp.rewrite_tac(@list.List([zset(), in_triple()]))
  let t179 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @int.arith_rule(@term_syntax.parse_term("!(1 + (k : Num) < 1)")), @pair.pair_eq()]))
  let t178 = @simp.rewrite_tac(@list.List([zset(), zag(), in_triple(), @calc_num.arith()]))
  let t180 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s175 = @tactics.subst1_tac(x174)
      fn(x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s175(x176)
      }
    })(@equal.sym(x177))
  }), t178), t179), @int.arith_tac)])
  let t171 = @term_syntax.parse_term("(z : Num)")
  let t172 = @term_syntax.parse_term("(y : Num)")
  let t173 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t172, t171]))
  let t170 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t169 = @tactics.exists_tac(@term_syntax.parse_term("(1, 1, (k : Num))"))
  let t168 = @simp.rewrite_tac(@list.List([@theorems.exists_unique_alt()]))
  let t167 = @simp.asm_simp_tac(@list.List([zag_involution(), tag_involution(), zset_finite()]))
  let t166 = @tactics.exists_tac(@term_syntax.parse_term("zag"))
  let t165 = @tactics.match_mp_tac(involution_fix_fix())
  let t163 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 * ((x : Num) * (y : Num)) == 2 * x * (2 * y)"))]))
  let t162 = @simp.rewrite_tac(@list.List([zset(), in_triple(), @arith.exp_2()]))
  let t164 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @pair.forall_pair_thm(), tag(), @pair.pair_eq()])), t162), t163)])
  let t161 = @tactics.subgoal_then(@term_syntax.parse_term("∃ t : (Num, Num, Num), IN(t, zset((p : Num))) && tag(t) == t"), fn(x158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s159 = @tactics.mp_tac(x158)
    fn(x160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s159(x160)
    }
  })
  let t157 = @tactics.repeat_tac(@tactics.strip_tac)
  let t231 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([])), t157), t161), t164), t165), t166), t167), t168), t169), t170), t173), @tactics.eq_tac), t180), t181), @tactics.strip_tac), t187), t188), t189), t194), t195), t196), t197), t207), t208), t215), t230)
  sum_of_two_squares_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) && p == 4 * k + 1 → (∃ x : Num, ∃ y : Num, p == EXP(x, 2) + EXP(y, 2))"), t231))
}

///|
let sum_of_two_squares_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_OF_TWO_SQUARES")

///|
/// `SUM_OF_TWO_SQUARES`
pub fn sum_of_two_squares() -> @kernel.Thm {
  sum_of_two_squares_c.get()
}

///|
/// PIGEONHOLE_LEMMA
fn step_26() -> Unit raise {
  let t245 = @meson.asm_meson_tac(@list.List([]))
  let t244 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_image()]))
  let t243 = @tactics.match_mp_tac(@sets.card_subset())
  let t242 = @simp.asm_rewrite_tac(@list.List([]))
  let t241 = @tactics.exists_tac(@term_syntax.parse_term("CARD((t : (B) -> Bool))"))
  let t240 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("∀ t : Num, t < 2 * (s : Num) && (p : Num) <= t → !(p == s + s)")))
  let t238 = @meson.meson_tac(@list.List([]))
  let t239 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.in_inter(), @sets.in_image(), @sets.not_in_empty()])), t238), @tactics.all_tac])
  let t237 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(a : Bool) → (c : Bool)) && !(b : Bool) → (a → b) → c")))
  let t236 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t235 = @list.List([@meson.asm_meson_tac(@list.List([@sets.card_image_inj()])), @tactics.all_tac])
  let t234 = @tactics.subgoal_then(@term_syntax.parse_term("CARD(IMAGE((f : (A) -> B), (s : (A) -> Bool))) == CARD(s) && CARD(IMAGE((g : (A) -> B), s)) == CARD(s)"), @tactics.strip_assume_tac)
  let t232 = @term_syntax.parse_term("IMAGE((g : (A) -> B), (s : (A) -> Bool))")
  let t233 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE((f : (A) -> B), (s : (A) -> Bool))"), t232]), @sets.card_union()))
  let t246 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t233), t234), t235), t236), t237), @tactics.conj_tac), t239), t240), t241), t242), t243), t244), t245)
  pigeonhole_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) && (∀ x : A, IN(x, s) → IN(f(x), t)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) && (∀ x : A, IN(x, s) → IN(g(x), t)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && g(x) == g(y) → x == y) && CARD(t) < 2 * CARD(s) → (∃ x : A, ∃ y : A, IN(x, s) && IN(y, s) && f(x) == g(y))"), t246))
}

///|
let pigeonhole_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PIGEONHOLE_LEMMA")

///|
/// `PIGEONHOLE_LEMMA`
pub fn pigeonhole_lemma() -> @kernel.Thm {
  pigeonhole_lemma_c.get()
}

///|
/// PIGEONHOLE_LEMMA_P12
fn step_27() -> Unit raise {
  let t265 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @int.arith_rule(@term_syntax.parse_term("2 * (k : Num) + 1 < 2 * (k + 1)"))]))
  let t264 = @simp.rewrite_tac(@list.List([@sets.finite_numseg_lt(), @sets.card_numseg_lt()]))
  let t263 = @simp.rewrite_tac(@list.List([@arith.add1(), @int.arith_rule(@term_syntax.parse_term("(2 * (x : Num) < 2 * (k : Num) + 1) == (x < k + 1)"))]))
  let t259 = @term_syntax.parse_term("{(x : Num) | x < 2 * (k : Num) + 1}")
  let t260 = @term_syntax.parse_term("{(x : Num) | 2 * x < 2 * (k : Num) + 1}")
  let t261 = @term_syntax.parse_term("(g : (Num) -> Num)")
  let t262 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Num)"), t261, t260, t259]), pigeonhole_lemma()))
  let t258 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(fn(x255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s256 = @tactics.subst1_tac(x255)
    fn(x257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s256(x257)
    }
  }))
  let t254 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s249 = @tactics.assume_tac(x248)
    fn(x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s249(x250)
    }
  }, fn(x251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s252 = @tactics.mp_tac(x251)
    fn(x253 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s252(x253)
    }
  }))
  let t247 = @simp.rewrite_tac(@list.List([@arith.odd_exists()]))
  let t266 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t247), t254), t258), t262), t263), t264), t265)
  pigeonhole_lemma_p12_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ p : Num, ODD(p) && (∀ x : Num, 2 * x < p → f(x) < p) && (∀ x : Num, ∀ y : Num, 2 * x < p && 2 * y < p && f(x) == f(y) → x == y) && (∀ x : Num, 2 * x < p → g(x) < p) && (∀ x : Num, ∀ y : Num, 2 * x < p && 2 * y < p && g(x) == g(y) → x == y) → (∃ x : Num, ∃ y : Num, 2 * x < p && 2 * y < p && f(x) == g(y))"), t266))
}

///|
let pigeonhole_lemma_p12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PIGEONHOLE_LEMMA_P12")

///|
/// `PIGEONHOLE_LEMMA_P12`
pub fn pigeonhole_lemma_p12() -> @kernel.Thm {
  pigeonhole_lemma_p12_c.get()
}

///|
/// SQUAREMOD_INJ_LEMMA
fn step_28() -> Unit raise {
  let t288 = @tactics.undisch_tac(@term_syntax.parse_term("2 * ((x : Num) + (d : Num)) < (p : Num)"))
  let t287 = @simp.simp_tac(@list.List([@arith.add_eq_0()]))
  let t285 = @drule.match_mp(@int.divides_le())
  let t289 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.disj_cases_then(fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s283 = @tactics.mp_tac(x282)
      fn(x284 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s283(x284)
      }
    })(t285(x286))
  })), t287), t288), @int.arith_tac)
  let t281 = @tactics.first_assum(fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x277 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s278 = @tactics.subst1_tac(x277)
      fn(x279 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s278(x279)
      }
    })(@equal.sym(x280))
  })
  let t276 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t275 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) * x"))
  let t274 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("∀ a : Num, a + ((b : Num) + (d : Num)) == a + (c : Num) → b == c - d")))
  let t273 = @simp.rewrite_tac(@list.List([@arith.left_sub_distrib()]))
  let t272 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) - (m : Num)"))
  let t271 = @simp.asm_rewrite_tac(@list.List([@int.divides()]))
  let t290 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@prime.prime_divprod()), t271), t272), t273), t274), t275), t276), t281), @int.arith_tac), t289])
  let t270 = @tactics.subgoal_then(@term_syntax.parse_term("divides((p : Num), (d : Num)) || divides(p, 2 * (x : Num) + d)"), fn(x267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s268 = @tactics.mp_tac(x267)
    fn(x269 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s268(x269)
    }
  })
  let t291 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t270), t290)
  squaremod_inj_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ x : Num, ∀ d : Num, prime(p) && 2 * (x + d) < p && (x + d) * (x + d) + (m : Num) * p == x * x + (n : Num) * p → d == 0"), t291))
}

///|
let squaremod_inj_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREMOD_INJ_LEMMA")

///|
/// `SQUAREMOD_INJ_LEMMA`
pub fn squaremod_inj_lemma() -> @kernel.Thm {
  squaremod_inj_lemma_c.get()
}

///|
/// SQUAREMOD_INJ
fn step_29() -> Unit raise {
  let t326 = @meson.asm_meson_tac(@list.List([squaremod_inj_lemma()]))
  let t325 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @int.arith_rule(@term_syntax.parse_term("((x : Num) + (d : Num) == x) == (d == 0)"))]))
  let t324 = @list.List([@simp.once_rewrite_tac(@list.List([@theorems.eq_sym_eq()])), @tactics.all_tac])
  let t320 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t321 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s318 = @tactics.subst_all_tac(x317)
    fn(x319 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s318(x319)
    }
  })
  let t323 = @tactics.disch_then(fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t321(t320(x322))
  })
  let t314 = @term_syntax.parse_term("(y : Num)")
  let t315 = @bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t314]), @arith.le_cases())
  let t316 = @tactics.disj_cases_then(fn(x311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s312 = @tactics.mp_tac(x311)
    fn(x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s312(x313)
    }
  })(t315)
  let t308 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x2 : Num) + (a : Num) == (xp : Num) + (b : Num) && (y2 : Num) + a == (yp : Num) + b → x2 + yp == y2 + xp")))
  let t310 = @tactics.disch_then(fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s306 = @tactics.mp_tac(x305)
      fn(x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s306(x307)
      }
    })(t308(x309))
  })
  let t304 = @simp.asm_rewrite_tac(@list.List([]))
  let t303 = @list.List([@simp.asm_simp_tac(@list.List([@arith.division()])), @tactics.all_tac])
  let t302 = @tactics.subgoal_then(@term_syntax.parse_term("EXP((x : Num), 2) + (a : Num) == DIV(EXP(x, 2) + a, (p : Num)) * p + MOD(EXP(x, 2) + a, p) && EXP((y : Num), 2) + a == DIV(EXP(y, 2) + a, p) * p + MOD(EXP(y, 2) + a, p)"), fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s300 = @tactics.mp_tac(x299)
    fn(x301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s300(x301)
    }
  })
  let t298 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t295 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) < (a : Num) → !(a == 0)")))
  let t297 = @tactics.first_assum(fn(x296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s293 = @tactics.assume_tac(x292)
      fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s293(x294)
      }
    })(t295(x296))
  })
  let t327 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t297), t298), t302), t303), t304), t310), t316), t323), t324), t325), t326)
  squaremod_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → (∀ x : Num, 2 * x < p → MOD(EXP(x, 2) + (a : Num), p) < p) && (∀ x : Num, ∀ y : Num, 2 * x < p && 2 * y < p && MOD(EXP(x, 2) + a, p) == MOD(EXP(y, 2) + a, p) → x == y)"), t327))
}

///|
let squaremod_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUAREMOD_INJ")

///|
/// `SQUAREMOD_INJ`
pub fn squaremod_inj() -> @kernel.Thm {
  squaremod_inj_c.get()
}

///|
/// REFLECT_INJ
fn step_30() -> Unit raise {
  let t333 = @meson.asm_meson_tac(@list.List([]))
  let t332 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) < (p : Num) && (y : Num) < p && p - 1 - x == p - 1 - y → x == y")))
  let t331 = @simp.asm_rewrite_tac(@list.List([]))
  let t330 = @tactics.first_assum(@tactics.match_mp_tac)
  let t329 = @tactics.repeat_tac(@tactics.strip_tac)
  let t328 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (x : Num) < (p : Num) → p - 1 - (y : Num) < p"))]))
  let t334 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t328), t329), t330), t331), t332), t333)
  reflect_inj_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Num, 2 * x < (p : Num) → (f : (Num) -> Num)(x) < p) && (∀ x : Num, ∀ y : Num, 2 * x < p && 2 * y < p && f(x) == f(y) → x == y) → (∀ x : Num, 2 * x < p → p - 1 - f(x) < p) && (∀ x : Num, ∀ y : Num, 2 * x < p && 2 * y < p && p - 1 - f(x) == p - 1 - f(y) → x == y)"), t334))
}

///|
let reflect_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT_INJ")

///|
/// `REFLECT_INJ`
pub fn reflect_inj() -> @kernel.Thm {
  reflect_inj_c.get()
}

///|
/// LAGRANGE_LEMMA_ODD
fn step_31() -> Unit raise {
  let t401 = @meson.meson_tac(@list.List([]))
  let t400 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  let t397 = @drule.match_mp(@arith.division())
  let t394 = @term_syntax.parse_term("EXP((x : Num), 2) + (EXP((y : Num), 2) + ((a : Num) + 1))")
  let t399 = @tactics.first_assum(fn(x398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s392 = @tactics.mp_tac(x391)
        fn(x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s392(x393)
        }
      })(((x395 : @kernel.Thm) => @bool.spec(t394, x395))(x396))
    })(t397(x398))
  })
  let t390 = @simp.asm_rewrite_tac(@list.List([]))
  let t387 = @term_syntax.parse_term("(y : Num)")
  let t388 = @term_syntax.parse_term("(x : Num)")
  let t389 = @tactics.map_every(fn(x384 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s385 = @tactics.exists_tac(x384)
    fn(x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s385(x386)
    }
  }, @list.List([@term_syntax.parse_term("DIV(EXP((x : Num), 2) + (EXP((y : Num), 2) + ((a : Num) + 1)), (p : Num))"), t388, t387]))
  let t382 = @tactics.undisch_tac(@term_syntax.parse_term("!((p : Num) == 0)"))
  let t381 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t383 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t381), t382), @int.arith_tac), @tactics.all_tac])
  let t380 = @tactics.subgoal_then(@term_syntax.parse_term("MOD((p : Num), p) == 0"), fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s378 = @tactics.subst1_tac(x377)
    fn(x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s378(x379)
    }
  })
  let t375 = @meson.asm_meson_tac(@list.List([@arith.division()]))
  let t374 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x2 : Num) + (a : Num) == (xd : Num) * (p : Num) + (xm : Num) && (y2 : Num) == (yd : Num) * p + (ym : Num) → x2 + (y2 + (a + 1)) == xm + (ym + 1) + (xd + yd) * p")))
  let t373 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t372 = @tactics.exists_tac(@term_syntax.parse_term("DIV(EXP((x : Num), 2) + (a : Num), (p : Num)) + DIV(EXP((y : Num), 2), p)"))
  let t371 = @tactics.match_mp_tac(@arith.mod_eq())
  let t376 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t371), t372), t373), t374), t375), @tactics.all_tac])
  let t370 = @tactics.subgoal_then(@term_syntax.parse_term("MOD(MOD(EXP((x : Num), 2) + (a : Num), (p : Num)) + (MOD(EXP((y : Num), 2) + 0, p) + 1), p) == MOD(EXP(x, 2) + (EXP(y, 2) + (a + 1)), p)"), fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s368 = @tactics.subst1_tac(x367)
    fn(x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s368(x369)
    }
  })
  let t363 = @term_syntax.parse_term("MOD")
  let t360 = @term_syntax.parse_term("(p : Num)")
  let t366 = @tactics.disch_then(fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x355 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s356 = @tactics.mp_tac(x355)
        fn(x357 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s356(x357)
        }
      })((fn(x361 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x358 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x359 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x358, x359)
          }
        })(x361)(t360)
      })(x362))
    })(((x364 : @kernel.Thm) => @equal.ap_term(t363, x364))(x365))
  })
  let t354 = @list.List([@meson.asm_meson_tac(@list.List([@arith.division()])), @tactics.all_tac])
  let t351 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) == (p : Num) - 1 - (y : Num) → y < p → x + (y + 1) == p")))
  let t353 = @tactics.first_assum(fn(x352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x348 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s349 = @tactics.mp_tac(x348)
      fn(x350 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s349(x350)
      }
    })(t351(x352))
  })
  let t346 = @meson.asm_meson_tac(@list.List([squaremod_inj()]))
  let t345 = @list.List([@tactics.all_tac, @tactics.match_mp_tac(reflect_inj())])
  let t344 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool)) && (c : Bool) && (d : Bool) → a && b && c && d")))
  let t347 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t344), @tactics.conj_tac), t345), t346), @tactics.all_tac])
  let t343 = @simp.rewrite_tac(@list.List([]))
  let t340 = @term_syntax.parse_term("(p : Num)")
  let t341 = @term_syntax.parse_term("(x : Num) => (p : Num) - 1 - MOD(EXP(x, 2) + 0, p)")
  let t342 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Num) => MOD(EXP(x, 2) + (a : Num), (p : Num))"), t341, t340]), pigeonhole_lemma_p12()))
  let t339 = @list.List([@meson.asm_meson_tac(@list.List([@arith.odd()])), @tactics.all_tac])
  let t338 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0)"), fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s336 = @tactics.assume_tac(x335)
    fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s336(x337)
    }
  })
  let t402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t338), t339), t342), t343), @tactics.ants_tac), t347), @tactics.strip_tac), t353), @tactics.ants_tac), t354), t366), t370), t376), t380), t383), @tactics.disch_tac), t389), t390), t399), t400), t401)
  lagrange_lemma_odd_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && ODD(p) → (∃ n : Num, ∃ x : Num, ∃ y : Num, 2 * x < p && 2 * y < p && n * p == EXP(x, 2) + (EXP(y, 2) + (a + 1)))"), t402))
}

///|
let lagrange_lemma_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_LEMMA_ODD")

///|
/// `LAGRANGE_LEMMA_ODD`
pub fn lagrange_lemma_odd() -> @kernel.Thm {
  lagrange_lemma_odd_c.get()
}

///|
/// LAGRANGE_LEMMA
fn step_32() -> Unit raise {
  let t468 = @meson.meson_tac(@list.List([@arith.lt_imp_le()]))
  let t467 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_even())]))
  let t465 = @term_syntax.parse_term("(p : Num)")
  let t466 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num) - 1"), t465]), lagrange_lemma_odd()))
  let t462 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → a == a - 1 + 1")))
  let t464 = @tactics.first_assum(fn(x463 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s460 = @tactics.subst1_tac(x459)
      fn(x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s460(x461)
      }
    })(t462(x463))
  })
  let t457 = @simp.asm_rewrite_tac(@list.List([@arith.le_0(), @arith.add_clauses(), @arith.mult_clauses(), @arith.exp_2()]))
  let t455 = @term_syntax.parse_term("0")
  let t456 = @term_syntax.parse_term("0")
  let t458 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x452 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s453 = @tactics.exists_tac(x452)
    fn(x454 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s453(x454)
    }
  }, @list.List([@term_syntax.parse_term("0"), t456, t455])), t457), @tactics.all_tac])
  let t469 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0")), t458), t464), t466), t467), t468)
  let t449 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.add_clauses()]))
  let t446 = @term_syntax.parse_term("0")
  let t447 = @term_syntax.parse_term("1")
  let t448 = @tactics.map_every(fn(x443 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s444 = @tactics.exists_tac(x443)
    fn(x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s444(x445)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num) + 1"), t447, t446]))
  let t442 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(fn(x439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s440 = @tactics.subst_all_tac(x439)
    fn(x441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s440(x441)
    }
  }))
  let t438 = @simp.rewrite_tac(@list.List([@arith.not_even(), @arith.odd_exists()]))
  let t450 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!EVEN((a : Num))")), t438), t442), t448), t449), @int.arith_tac)
  let t437 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.add_clauses()]))
  let t434 = @term_syntax.parse_term("0")
  let t435 = @term_syntax.parse_term("0")
  let t436 = @tactics.map_every(fn(x431 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s432 = @tactics.exists_tac(x431)
    fn(x433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s432(x433)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num)"), t435, t434]))
  let t430 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(fn(x427 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s428 = @tactics.subst_all_tac(x427)
    fn(x429 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s428(x429)
    }
  }))
  let t426 = @simp.rewrite_tac(@list.List([@arith.even_exists()]))
  let t451 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("EVEN((a : Num))")), t426), t430), t436), t437), @int.arith_tac), t450])
  let t425 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((a : Num))"))
  let t424 = @tactics.disch_then(fn(x423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s421 = @tactics.subst_all_tac(x420)
      fn(x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s421(x422)
      }
    })(@equal.sym(x423))
  })
  let t419 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t418 = @list.List([@meson.asm_meson_tac(@list.List([@arith.even_exists(), @int.divides()])), @tactics.all_tac])
  let t413 = @term_syntax.parse_term("2")
  let t417 = @tactics.disch_then(fn(x416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x410 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s411 = @tactics.mp_tac(x410)
        fn(x412 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s411(x412)
        }
      })(((x414 : @kernel.Thm) => @bool.spec(t413, x414))(x415))
    })(@bool.conjunct2(x416))
  })
  let t408 = @simp.gen_rewrite_rule(fn(x407 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x407
  }, @list.List([@int.prime()]))
  let t470 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x409 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s405 = @tactics.mp_tac(x404)
      fn(x406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s405(x406)
      }
    })(t408(x409))
  }), t417), @tactics.ants_tac), t418), t419), t424), t425), t451), t469])
  let t403 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((p : Num))"))
  let t471 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t403), t470)
  lagrange_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) → (∃ n : Num, ∃ x : Num, ∃ y : Num, 2 * x <= p && 2 * y <= p && n * p == EXP(x, 2) + (EXP(y, 2) + a))"), t471))
}

///|
let lagrange_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_LEMMA")

///|
/// `LAGRANGE_LEMMA`
pub fn lagrange_lemma() -> @kernel.Thm {
  lagrange_lemma_c.get()
}

///|
/// 100/four_squares.ml:414
fn step_33() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// REAL_INTEGER_CLOSURES
fn step_34() -> Unit raise {
  let t491 = @meson.meson_tac(@list.List([@arith.le_exists(), @arith.add_sym(), @arith.le_cases()]))
  let t490 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()]))
  let t488 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + -(b : Real) == (c : Real)) == (b + c == a)"))
  let t489 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-(a : Real) + (b : Real) == (c : Real)) == (a + c == b)")), t488]))
  let t486 = @meson.meson_tac(@list.List([]))
  let t487 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac, @tactics.all_tac, t486])
  let t485 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@analysis.real_neg_add()), @realax.real_of_num_add()]))
  let t484 = @tactics.repeat_tac(@tactics.strip_tac)
  let t483 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (a : Real) → (abs((x : Real)) == a) == (x == a || x == -a)")), @analysis.real_pos()]))
  let t476 = @meson.meson_tac(@list.List([]))
  let t477 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_sub()])), t476)
  let t478 = @simp.rewrite_tac(@list.List([@real.real_abs_abs()]))
  let t479 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_neg()]))
  let t475 = @meson.meson_tac(@list.List([@calc_int.real_of_num_pow()]))
  let t480 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_pow()])), t475)
  let t474 = @meson.meson_tac(@list.List([@realax.real_of_num_mul()]))
  let t481 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_mul()])), t474)
  let t473 = @meson.meson_tac(@list.List([]))
  let t482 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_abs_num()])), t473), t481, t480, t479, t478, t477, @tactics.all_tac])
  let t472 = @tactics.repeat_tac(@tactics.conj_tac)
  let t492 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(x : Bool) && (c : Bool) && (d : Bool) && (e : Bool) && (f : Bool) && ((a : Bool) && e → (b : Bool)) && a → x && a && b && c && d && e && f"))), t472), t482), t483), t484), t485), t487), t489), t490), t491)
  real_integer_closures_c.set(@tactics.prove(@term_syntax.parse_term("(∀ n : Num, ∃ p : Num, abs(real_of_num(n)) == real_of_num(p)) && (∀ x : Real, ∀ y : Real, (∃ m : Num, abs(x) == real_of_num(m)) && (∃ n : Num, abs(y) == real_of_num(n)) → (∃ p : Num, abs(x + y) == real_of_num(p))) && (∀ x : Real, ∀ y : Real, (∃ m : Num, abs(x) == real_of_num(m)) && (∃ n : Num, abs(y) == real_of_num(n)) → (∃ p : Num, abs(x - y) == real_of_num(p))) && (∀ x : Real, ∀ y : Real, (∃ m : Num, abs(x) == real_of_num(m)) && (∃ n : Num, abs(y) == real_of_num(n)) → (∃ p : Num, abs(x * y) == real_of_num(p))) && (∀ x : Real, ∀ r : Num, (∃ n : Num, abs(x) == real_of_num(n)) → (∃ p : Num, abs(pow(x, r)) == real_of_num(p))) && (∀ x : Real, (∃ n : Num, abs(x) == real_of_num(n)) → (∃ p : Num, abs(-x) == real_of_num(p))) && (∀ x : Real, (∃ n : Num, abs(x) == real_of_num(n)) → (∃ p : Num, abs(abs(x)) == real_of_num(p)))"), t492))
}

///|
let real_integer_closures_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGER_CLOSURES")

///|
/// `REAL_INTEGER_CLOSURES`
pub fn real_integer_closures() -> @kernel.Thm {
  real_integer_closures_c.get()
}

///|
/// REAL_NUM_ROUND
fn step_35() -> Unit raise {
  let t511 = @meson.meson_tac(@list.List([@realax.real_of_num_add()]))
  let t510 = @simp.simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t507 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (x : Real) && x < a + real_of_num(1) → abs(x - a) * real_of_num(2) <= real_of_num(1) || abs(x - (a + real_of_num(1))) * real_of_num(2) <= real_of_num(1)")))
  let t509 = @tactics.disch_then(fn(x508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s505 = @tactics.mp_tac(x504)
      fn(x506 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s505(x506)
      }
    })(t507(x508))
  })
  let t503 = @tactics.disch_then(@tactics.choose_then(fn(x500 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s501 = @tactics.mp_tac(x500)
    fn(x502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s501(x502)
    }
  }))
  let t499 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), @analysis.real_mul_rid()]))
  let t496 = @drule.match_mp(@drule.match_mp(@analysis.real_arch_least())(@analysis.real_lt_01()))
  let t498 = @tactics.first_assum(fn(x497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s494 = @tactics.mp_tac(x493)
      fn(x495 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s494(x495)
      }
    })(t496(x497))
  })
  let t512 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t498), t499), t503), t509), t510), t511)
  real_num_round_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → (∃ n : Num, abs(x - real_of_num(n)) <= real_of_num(1) / real_of_num(2))"), t512))
}

///|
let real_num_round_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_NUM_ROUND")

///|
/// `REAL_NUM_ROUND`
pub fn real_num_round() -> @kernel.Thm {
  real_num_round_c.get()
}

///|
/// REAL_POS_ABS_MIDDLE
fn step_36() -> Unit raise {
  let t522 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t521 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) - real_of_num(1) + (a : Real) == n - (real_of_num(1) - a)"))]))
  let t523 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s518 = @tactics.subst1_tac(x517)
      fn(x519 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s518(x519)
      }
    })(@equal.sym(x520))
  }), t521), t522), @calc_rat.real_arith_tac)
  let t524 = @list.List([@tactics.then_tac(@tactics.mp_tac(@calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("real_of_num(0) <= real_of_num(1) / real_of_num(2)"))), @calc_rat.real_arith_tac), t523])
  let t516 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t515 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 || 1 <= n")))
  let t513 = @term_syntax.parse_term("(n : Num)")
  let t514 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("1"), t513]), @real.real_of_num_sub()))
  let t525 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t514), t515), t516), t524)
  real_pos_abs_middle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x && abs(x - real_of_num(n)) == real_of_num(1) / real_of_num(2) → x == real_of_num(n - 1) + real_of_num(1) / real_of_num(2) || x == real_of_num(n) + real_of_num(1) / real_of_num(2)"), t525))
}

///|
let real_pos_abs_middle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POS_ABS_MIDDLE")

///|
/// `REAL_POS_ABS_MIDDLE`
pub fn real_pos_abs_middle() -> @kernel.Thm {
  real_pos_abs_middle_c.get()
}

///|
/// REAL_RAT_ABS_MIDDLE
fn step_37() -> Unit raise {
  let t527 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @analysis.real_pos()]))
  let t526 = @tactics.match_mp_tac(real_pos_abs_middle())
  let t528 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t526), t527)
  real_rat_abs_middle_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, abs(real_of_num(m) / real_of_num(p) - real_of_num(n)) == real_of_num(1) / real_of_num(2) → real_of_num(m) / real_of_num(p) == real_of_num(n - 1) + real_of_num(1) / real_of_num(2) || real_of_num(m) / real_of_num(p) == real_of_num(n) + real_of_num(1) / real_of_num(2)"), t528))
}

///|
let real_rat_abs_middle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_RAT_ABS_MIDDLE")

///|
/// `REAL_RAT_ABS_MIDDLE`
pub fn real_rat_abs_middle() -> @kernel.Thm {
  real_rat_abs_middle_c.get()
}

///|
/// AUBREY_LEMMA_4
fn step_38() -> Unit raise {
  let t913 = @simp.asm_rewrite_tac(@list.List([@real.real_pow2_abs()]))
  let t912 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x911 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x908 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s909 = @tactics.subst1_tac(x908)
      fn(x910 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s909(x910)
      }
    })(@equal.sym(x911))
  }))
  let t904 = @term_syntax.parse_term("(d : Num)")
  let t905 = @term_syntax.parse_term("(c : Num)")
  let t906 = @term_syntax.parse_term("(b : Num)")
  let t907 = @tactics.map_every(fn(x901 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_3 = x901
    let t903 = @tactics.x_gen_tac(t_3)
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t903)
  }, @list.List([@term_syntax.parse_term("(a : Num)"), t906, t905, t904]))
  let t900 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @real.real_div_1()]))
  let t898 = @meson.meson_tac(@list.List([real_integer_closures()]))
  let t897 = @tactics.undisch_tac(@term_syntax.parse_term("∃ n : Num, abs((real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num(2)) == real_of_num(n)"))
  let t896 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.left_exists_and_thm()]))
  let t899 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@analysis.expand_tac, @list.List(["s", "t", "u", "v"])), t896), t897), t898), @tactics.all_tac])
  let t895 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Num, ∃ b : Num, ∃ c : Num, ∃ d : Num, abs(real_of_num((n' : Num)) + (s : Real) * ((real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num(2))) == real_of_num(a) && abs(real_of_num((p' : Num)) + (t : Real) * ((real_of_num(N') - real_of_num(N)) / real_of_num(2))) == real_of_num(b) && abs(real_of_num((q' : Num)) + (u : Real) * ((real_of_num(N') - real_of_num(N)) / real_of_num(2))) == real_of_num(c) && abs(real_of_num((r' : Num)) + (v : Real) * ((real_of_num(N') - real_of_num(N)) / real_of_num(2))) == real_of_num(d)"), fn(x892 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s893 = @tactics.mp_tac(x892)
    fn(x894 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s893(x894)
    }
  })
  let t891 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t890 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t888 = @meson.meson_tac(@list.List([real_integer_closures()]))
  let t887 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rid()]))
  let t886 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t885 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t884 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t883 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.real_sub_ldistrib())]))
  let t882 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * (x : Real) + real_of_num(1) - (real_of_num(2) * (y : Real) + real_of_num(1)) == real_of_num(2) * (x - y)"))]))
  let t880 = @equal.gsym(@realax.real_of_num_mul())
  let t881 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), t880]))
  let t879 = @tactics.repeat_tac(@tactics.disch_then(@tactics.choose_then(fn(x876 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s877 = @tactics.subst1_tac(x876)
    fn(x878 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s877(x878)
    }
  })))
  let t875 = @simp.rewrite_tac(@list.List([@arith.not_even(), @arith.even_exists(), @arith.odd_exists()]))
  let t874 = @simp.simp_tac(@list.List([]))
  let t872 = @class.taut(@term_syntax.parse_term("EVEN((N : Num)) || !EVEN(N)"))
  let t873 = @tactics.disj_cases_then(fn(x869 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s870 = @tactics.mp_tac(x869)
    fn(x871 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s870(x871)
    }
  })(t872)
  let t867 = @simp.rewrite_tac(@list.List([@arith.even_add(), @arith.even_exp(), @calc_num.arith_eq()]))
  let t868 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x862
    @simp.gen_rewrite_tac(fn(x864 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s865 = @equal.rand_conv(x864)
      fn(x866 : @kernel.Term) -> @kernel.Thm raise {
        s865(x866)
      }
    }, @list.List([@equal.sym(th_1)]))
  }), t867), @tactics.all_tac])
  let t861 = @tactics.subgoal_then(@term_syntax.parse_term("EVEN(EXP((n' : Num), 2) + (EXP((p' : Num), 2) + (EXP((q' : Num), 2) + EXP((r' : Num), 2)))) == EVEN((N : Num))"), fn(x858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s859 = @tactics.mp_tac(x858)
    fn(x860 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s859(x860)
    }
  })
  let t857 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_add()]))
  let t889 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("pow(real_of_num((n' : Num)), 2) + (pow(real_of_num((p' : Num)), 2) + (pow(real_of_num((q' : Num)), 2) + pow(real_of_num((r' : Num)), 2))) == real_of_num((N' : Num))")))])), t857), t861), t868), t873), t874), t875), t879), t881), t882), t883), t884), t885), t886), t887), t888), @tactics.all_tac])
  let t856 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, abs((real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num(2)) == real_of_num(n)"), fn(x853 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s854 = @tactics.assume_tac(x853)
    fn(x855 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s854(x855)
    }
  })
  let t852 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s847 = @tactics.subst_all_tac(x846)
    fn(x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s847(x848)
    }
  }, fn(x849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s850 = @tactics.mp_tac(x849)
    fn(x851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s850(x851)
    }
  })))
  let t845 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  let t843 = @simp.asm_rewrite_tac(@list.List([]))
  let t842 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @analysis.real_mul_rid()]))
  let t841 = @simp.asm_simp_tac(@list.List([@analysis.real_mul_rinv(), @realax.real_of_num_eq()]))
  let t840 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_add_rdistrib(), @equal.gsym(@realax.real_mul_assoc())]))
  let t839 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_div())]))
  let t838 = @simp.rewrite_tac(@list.List([@real.real_pow_div(), @real.real_pow2_abs()]))
  let t837 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_of_num_lt()])))
  let t836 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x835 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x832 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s833 = @tactics.subst1_tac(x832)
      fn(x834 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s833(x834)
      }
    })(@equal.sym(x835))
  }))
  let t828 = @term_syntax.parse_term("(d : Num)")
  let t829 = @term_syntax.parse_term("(c : Num)")
  let t830 = @term_syntax.parse_term("(b : Num)")
  let t831 = @tactics.map_every(fn(x825 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_2 = x825
    let t827 = @tactics.x_gen_tac(t_2)
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t827)
  }, @list.List([@term_syntax.parse_term("(a : Num)"), t830, t829, t828]))
  let t823 = @meson.meson_tac(@list.List([real_integer_closures()]))
  let t822 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.left_exists_and_thm()]))
  let t824 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@analysis.expand_tac, @list.List(["s", "t", "u", "v"])), t822), t823), @tactics.all_tac])
  let t821 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Num, ∃ b : Num, ∃ c : Num, ∃ d : Num, abs(real_of_num((n' : Num)) * real_of_num((m' : Num)) + (s : Real) * (real_of_num((N' : Num)) - real_of_num((N : Num)))) == real_of_num(a) && abs(real_of_num((p' : Num)) * real_of_num(m') + (t : Real) * (real_of_num(N') - real_of_num(N))) == real_of_num(b) && abs(real_of_num((q' : Num)) * real_of_num(m') + (u : Real) * (real_of_num(N') - real_of_num(N))) == real_of_num(c) && abs(real_of_num((r' : Num)) * real_of_num(m') + (v : Real) * (real_of_num(N') - real_of_num(N))) == real_of_num(d)"), fn(x818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s819 = @tactics.mp_tac(x818)
    fn(x820 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s819(x820)
    }
  })
  let t844 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(m' : Num)")), t821), t824), t831), t836), t837), t838), t839), t840), t841), t842), t843), @tactics.all_tac])
  let t817 = @tactics.first_x_assum(@tactics.disj_cases_then2(fn(x811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s812 = @tactics.assume_tac(x811)
    fn(x813 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s812(x813)
    }
  }, fn(x814 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s815 = @tactics.mp_tac(x814)
    fn(x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s815(x816)
    }
  }))
  let t809 = @simp.asm_simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq()]))
  let t808 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t804 = @term_syntax.parse_term("(real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num((m' : Num))")
  let t807 = @tactics.first_assum(fn(x806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x801 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s802 = @tactics.subst1_tac(x801)
      fn(x803 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s802(x803)
      }
    })(((x805 : @kernel.Thm) => @bool.spec(t804, x805))(x806))
  })
  let t800 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + ((b : Real) + ((c : Real) + (d : Real))) == (e : Real)) == (a + (b + (c + (d - e))) == real_of_num(0))"))]))
  let t810 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@analysis.expand_tac, @list.List(["w", "x", "y", "z"])), t800), t807), t808), @tactics.disj2_tac), t809), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t799 = @tactics.subgoal_then(@term_syntax.parse_term("pow((w : Real), 2) + (pow((x : Real), 2) + (pow((y : Real), 2) + pow((z : Real), 2))) == real_of_num((N : Num))"), fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x795 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s796 = @tactics.subst1_tac(x795)
      fn(x797 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s796(x797)
      }
    })(@equal.sym(x798))
  })
  let t794 = @simp.abbrev_tac(@term_syntax.parse_term("(z : Real) == real_of_num((r' : Num)) + (v : Real) * ((real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num((m' : Num)))"))
  let t793 = @simp.abbrev_tac(@term_syntax.parse_term("(y : Real) == real_of_num((q' : Num)) + (u : Real) * ((real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num((m' : Num)))"))
  let t792 = @simp.abbrev_tac(@term_syntax.parse_term("(x : Real) == real_of_num((p' : Num)) + (t : Real) * ((real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num((m' : Num)))"))
  let t791 = @simp.abbrev_tac(@term_syntax.parse_term("(w : Real) == real_of_num((n' : Num)) + (s : Real) * ((real_of_num((N' : Num)) - real_of_num((N : Num))) / real_of_num((m' : Num)))"))
  let t787 = @simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("(real_of_num((N : Num)) + real_of_num((N' : Num))) * real_of_num((m : Num)) - real_of_num((M : Num)) == real_of_num((m' : Num))")))]))
  let t786 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((z : Real) * (b : Real)) - (c : Real) * z == (a * b - c) * z"))]))
  let t785 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + ((n' : Real) - (n : Real)) == (b : Real) - (n - n')) == (a == b)"))]))
  let t784 = @simp.rewrite_tac(@list.List([@calc_int.real_eq_add_lcancel()]))
  let t788 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("((m : Real) * (z : Real) - real_of_num(1)) * ((m' : Real) * z + (nn : Real)) == m * (m' * (z * z)) + (m * (z * nn) - m' * z - nn)"))])), t784), t785), t786), @tactics.ap_thm_tac), @tactics.ap_term_tac), t787), @calc_rat.real_arith_tac)
  let t783 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t782 = @tactics.map_every(@analysis.expand_tac, @list.List(["s", "t", "u", "v"]))
  let t780 = @equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("real_of_num(2) * (real_of_num((n : Num)) * real_of_num((n' : Num)) + (real_of_num((p : Num)) * real_of_num((p' : Num)) + (real_of_num((q : Num)) * real_of_num((q' : Num)) + real_of_num((r : Num)) * real_of_num((r' : Num))))) == real_of_num((M : Num))")))
  let t781 = @simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("pow(real_of_num((n' : Num)), 2) + (pow(real_of_num((p' : Num)), 2) + (pow(real_of_num((q' : Num)), 2) + pow(real_of_num((r' : Num)), 2))) == real_of_num((N' : Num))"))), t780]))
  let t779 = @list.List([@simp.rewrite_tac(@list.List([@real.real_mul_ac()])), @tactics.all_tac])
  let t778 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (c : Real) && (b : Real) == (d : Real) → a + (b + ((n : Real) - (m : Real))) == c + (d + (n - m))")))
  let t777 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t789 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("((n : Real) + (s : Real) * (z : Real)) * (n + s * z) + (((p : Real) + (t : Real) * z) * (p + t * z) + (((q : Real) + (u : Real) * z) * (q + u * z) + (((r : Real) + (v : Real) * z) * (r + v * z) - (N : Real)))) == (s * s + (t * t + (u * u + v * v))) * (z * z) + (real_of_num(2) * (n * s + (p * t + (q * u + r * v))) * z + (n * n + (p * p + (q * q + r * r)) - N))"))])), t777), t778), @tactics.conj_tac), t779), @tactics.ap_thm_tac), @tactics.ap_term_tac), t781), t782), t783), @calc_rat.real_arith_tac), t788])
  let t776 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((m : Num)) * (real_of_num((m' : Num)) * pow((z : Real), 2)) + ((real_of_num((M : Num)) - real_of_num(2) * (real_of_num(m) * real_of_num((N' : Num)))) * z + (real_of_num(N') - real_of_num((N : Num))))"))
  let t790 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@theorems.eq_trans())), t776), @tactics.conj_tac), t789), @tactics.all_tac])
  let t775 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Real, pow(real_of_num((n' : Num)) + (s : Real) * z, 2) + (pow(real_of_num((p' : Num)) + (t : Real) * z, 2) + (pow(real_of_num((q' : Num)) + (u : Real) * z, 2) + (pow(real_of_num((r' : Num)) + (v : Real) * z, 2) - real_of_num((N : Num))))) == (real_of_num((m : Num)) * z - real_of_num(1)) * (real_of_num((m' : Num)) * z + (real_of_num(N) - real_of_num((N' : Num))))"), fn(x772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s773 = @tactics.assume_tac(x772)
    fn(x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s773(x774)
    }
  })
  let t770 = @simp.asm_rewrite_tac(@list.List([]))
  let t769 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) < (a : Real) → !(a - b == real_of_num(0))")))
  let t768 = @simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("(real_of_num((N : Num)) + real_of_num((N' : Num))) * real_of_num((m : Num)) - real_of_num((M : Num)) == real_of_num((m' : Num))")))]))
  let t771 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq())])), t768), t769), t770), @tactics.all_tac])
  let t767 = @tactics.subgoal_then(@term_syntax.parse_term("!((m' : Num) == 0)"), fn(x764 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s765 = @tactics.assume_tac(x764)
    fn(x766 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s765(x766)
    }
  })
  let t763 = @tactics.disch_then(fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s760 = @tactics.assume_tac(x759)
      fn(x761 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s760(x761)
      }
    })(@equal.gsym(x762))
  })
  let t758 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@analysis.real_sub_rdistrib())]))
  let t756 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_le()]))
  let t753 = @equal.gsym(@realax.real_of_num_mul())
  let t754 = @equal.gsym(@realax.real_of_num_add())
  let t755 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t754, t753]))
  let t752 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t751 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_mul()]))
  let t757 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@analysis.expand_tac("m'"), t751), t752), t755), t756), @tactics.all_tac])
  let t750 = @tactics.subgoal_then(@term_syntax.parse_term("(real_of_num((N : Num)) + real_of_num((N' : Num))) * real_of_num((m : Num)) - real_of_num((M : Num)) == real_of_num((m' : Num))"), fn(x747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x747
    let t749 = @tactics.assume_tac(th)
    @tactics.then_tac(@tactics.subst_all_tac(th), t749)
  })
  let t746 = @simp.abbrev_tac(@term_syntax.parse_term("(m' : Num) == ((N : Num) + (N' : Num)) * (m : Num) - (M : Num)"))
  let t745 = @simp.asm_simp_tac(@list.List([@real.real_div_rmul(), @realax.real_of_num_eq(), @equal.gsym(@realarith.real_pow_2())]))
  let t744 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @analysis.real_sub_rdistrib(), @realax.real_mul_assoc()]))
  let t743 = @simp.asm_simp_tac(@list.List([@real.real_eq_rdiv_eq(), @real.real_pow_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(0 < (a : Num)) == !(a == 0)"))]))
  let t742 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num((N : Num)) + real_of_num((N' : Num)) - real_of_num((M : Num)) / real_of_num((m : Num)) == (pow((s : Real), 2) + (pow((t : Real), 2) + (pow((u : Real), 2) + pow((v : Real), 2)))) / pow(real_of_num(m), 2)"))
  let t741 = @tactics.repeat_tac(@tactics.disch_tac)
  let t739 = @calc_rat.real_arith(@term_syntax.parse_term("(((a : Real) - real_of_num(1)) * (m : Real) == (M : Real)) == (a * m - M == m)"))
  let t740 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(((a : Real) - real_of_num(1)) * (m : Real) < (M : Real)) == (a * m - M < m)")), t739]))
  let t737 = @kernel.assume_rule(@term_syntax.parse_term("!((m : Num) == 0)"))
  let t738 = @simp.simp_tac(@list.List([@real.real_lt_ldiv_eq(), @real.real_lt_rdiv_eq(), @real.real_eq_rdiv_eq(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(0 < (n : Num)) == !(n == 0)")), t737]))
  let t734 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (a : Real) - (b : Real)) == (b < a)"))
  let t735 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) - (c : Real) == real_of_num(1)) == (a + b - real_of_num(1) == c)"))
  let t736 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) - (c : Real) < real_of_num(1)) == (a + b - real_of_num(1) < c)")), t735, t734]))
  let t733 = @simp.asm_rewrite_tac(@list.List([]))
  let t731 = @simp.simp_tac(@list.List([@real.real_div_rmul(), @realax.real_of_num_eq(), @kernel.assume_rule(@term_syntax.parse_term("!((m : Num) == 0)"))]))
  let t730 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t729 = @simp.simp_tac(@list.List([@real.real_div_rmul(), @realax.real_of_num_eq(), @kernel.assume_rule(@term_syntax.parse_term("!((m : Num) == 0)"))]))
  let t728 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_mul_assoc()]))
  let t727 = @simp.rewrite_tac(@list.List([@real.real_add_rdistrib(), @equal.gsym(@real.real_pow_mul()), @analysis.real_sub_rdistrib()]))
  let t724 = @equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("real_of_num(2) * (real_of_num((n : Num)) * real_of_num((n' : Num)) + (real_of_num((p : Num)) * real_of_num((p' : Num)) + (real_of_num((q : Num)) * real_of_num((q' : Num)) + real_of_num((r : Num)) * real_of_num((r' : Num))))) == real_of_num((M : Num))")))
  let t725 = @equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("pow(real_of_num((n' : Num)), 2) + (pow(real_of_num((p' : Num)), 2) + (pow(real_of_num((q' : Num)), 2) + pow(real_of_num((r' : Num)), 2))) == real_of_num((N' : Num))")))
  let t726 = @simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("pow(real_of_num((n : Num)) / real_of_num((m : Num)), 2) + (pow(real_of_num((p : Num)) / real_of_num(m), 2) + (pow(real_of_num((q : Num)) / real_of_num(m), 2) + pow(real_of_num((r : Num)) / real_of_num(m), 2))) == real_of_num((N : Num))"))), t725, t724]))
  let t723 = @simp.asm_simp_tac(@list.List([@real.real_pow_eq_0(), @real.real_div_rmul(), @realax.real_of_num_eq()]))
  let t722 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num((m : Num)), 2)"))
  let t732 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_rcancel_imp()), t722), t723), t726), t727), t728), t729), t730), t731), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t721 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((n : Num)) / real_of_num((m : Num)) - real_of_num((n' : Num)), 2) + (pow(real_of_num((p : Num)) / real_of_num(m) - real_of_num((p' : Num)), 2) + (pow(real_of_num((q : Num)) / real_of_num(m) - real_of_num((q' : Num)), 2) + pow(real_of_num((r : Num)) / real_of_num(m) - real_of_num((r' : Num)), 2))) == real_of_num((N : Num)) + real_of_num((N' : Num)) - real_of_num((M : Num)) / real_of_num(m)"), fn(x718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s719 = @tactics.assume_tac(x718)
    fn(x720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s719(x720)
    }
  })
  let t716 = @simp.asm_rewrite_tac(@list.List([]))
  let t715 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t714 = @simp.asm_simp_tac(@list.List([@real.real_pow_eq_0(), @real.real_div_rmul(), @realax.real_of_num_eq()]))
  let t713 = @simp.rewrite_tac(@list.List([@real.real_add_rdistrib(), @equal.gsym(@real.real_pow_mul()), @analysis.real_sub_rdistrib()]))
  let t712 = @simp.asm_simp_tac(@list.List([@real.real_pow_eq_0(), @real.real_div_rmul(), @realax.real_of_num_eq()]))
  let t711 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num((m : Num)), 2)"))
  let t717 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_rcancel_imp()), t711), t712), t713), t714), t715), t716), @tactics.all_tac])
  let t710 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((n : Num)) / real_of_num((m : Num)) - real_of_num((n' : Num)), 2) + (pow(real_of_num((p : Num)) / real_of_num(m) - real_of_num((p' : Num)), 2) + (pow(real_of_num((q : Num)) / real_of_num(m) - real_of_num((q' : Num)), 2) + pow(real_of_num((r : Num)) / real_of_num(m) - real_of_num((r' : Num)), 2))) == (pow((s : Real), 2) + (pow((t : Real), 2) + (pow((u : Real), 2) + pow((v : Real), 2)))) / pow(real_of_num(m), 2)"), fn(x707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s708 = @tactics.mp_tac(x707)
    fn(x709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s708(x709)
    }
  })
  let t706 = @tactics.first_x_assum(fn(x705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s699 = @tactics.mp_tac(x698)
      fn(x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s699(x700)
      }
    })(((x704 : @kernel.Thm) => @lib.check(fn(x703 : @kernel.Thm) -> Bool raise {
      (fn(x701 : @kernel.Term) -> Bool raise {
        @basics.is_disj(x701)
      })((fn(x702 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x702)
      })(x703))
    }, x704))(x705))
  })
  let t696 = @simp.asm_rewrite_tac(@list.List([@analysis.real_sub_0()]))
  let t695 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_entire(), @analysis.real_le_square()]))
  let t697 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (w : Real) && real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) && real_of_num(0) <= (z : Real) && !(w == real_of_num(0) && x == real_of_num(0) && y == real_of_num(0) && z == real_of_num(0)) → real_of_num(0) < w + (x + (y + z))"))), t695), t696), @tactics.all_tac])
  let t694 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < pow(real_of_num((n : Num)) / real_of_num((m : Num)) - real_of_num((n' : Num)), 2) + (pow(real_of_num((p : Num)) / real_of_num(m) - real_of_num((p' : Num)), 2) + (pow(real_of_num((q : Num)) / real_of_num(m) - real_of_num((q' : Num)), 2) + pow(real_of_num((r : Num)) / real_of_num(m) - real_of_num((r' : Num)), 2)))"), fn(x691 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s692 = @tactics.mp_tac(x691)
    fn(x693 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s692(x693)
    }
  })
  let t687 = @simp.asm_rewrite_tac(@list.List([]))
  let t688 = @tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("pow(real_of_num((n : Num)) / real_of_num((m : Num)), 2) + (pow(real_of_num((p : Num)) / real_of_num(m), 2) + (pow(real_of_num((q : Num)) / real_of_num(m), 2) + pow(real_of_num((r : Num)) / real_of_num(m), 2))) == real_of_num((N : Num))"), fn(x686 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s684 = @tactics.subst1_tac(x683)
      fn(x685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s684(x685)
      }
    })(@equal.sym(x686))
  }), t687)
  let t682 = @tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) == 1)"))
  let t689 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) == 0)")), t682), @int.arith_tac), t688])
  let t681 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq(), @real.real_div_1()]))
  let t677 = @term_syntax.parse_term("(r' : Num)")
  let t678 = @term_syntax.parse_term("(q' : Num)")
  let t679 = @term_syntax.parse_term("(p' : Num)")
  let t680 = @term_syntax.parse_term("(n' : Num)")
  let t690 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x674 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s675 = @tactics.exists_tac(x674)
    fn(x676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s675(x676)
    }
  }, @list.List([@term_syntax.parse_term("1"), t680, t679, t678, t677])), t681), @tactics.conj_tac), t689), @tactics.all_tac])
  let t673 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num((n : Num)) / real_of_num((m : Num)) == real_of_num((n' : Num)) && real_of_num((p : Num)) / real_of_num(m) == real_of_num((p' : Num)) && real_of_num((q : Num)) / real_of_num(m) == real_of_num((q' : Num)) && real_of_num((r : Num)) / real_of_num(m) == real_of_num((r' : Num))"))
  let t667 = @equal.gsym(@calc_int.real_of_num_pow())
  let t668 = @equal.gsym(@realax.real_of_num_mul())
  let t669 = @equal.gsym(@realax.real_of_num_add())
  let t670 = @simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_eq()), t669, t668, t667]))
  let t672 = @tactics.disch_then(fn(x671 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s665 = @tactics.assume_tac(x664)
      fn(x666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s665(x666)
      }
    })(t670(x671))
  })
  let t663 = @tactics.undisch_tac(@term_syntax.parse_term("2 * ((n : Num) * (n' : Num) + ((p : Num) * (p' : Num) + ((q : Num) * (q' : Num) + (r : Num) * (r' : Num)))) == (M : Num)"))
  let t662 = @simp.abbrev_tac(@term_syntax.parse_term("(M : Num) == 2 * ((n : Num) * (n' : Num) + ((p : Num) * (p' : Num) + ((q : Num) * (q' : Num) + (r : Num) * (r' : Num))))"))
  let t657 = @equal.gsym(@calc_int.real_of_num_pow())
  let t658 = @equal.gsym(@realax.real_of_num_add())
  let t659 = @simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_eq()), t658, t657]))
  let t661 = @tactics.disch_then(fn(x660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s655 = @tactics.assume_tac(x654)
      fn(x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s655(x656)
      }
    })(t659(x660))
  })
  let t653 = @tactics.undisch_tac(@term_syntax.parse_term("EXP((n' : Num), 2) + (EXP((p' : Num), 2) + (EXP((q' : Num), 2) + EXP((r' : Num), 2))) == (N' : Num)"))
  let t652 = @simp.abbrev_tac(@term_syntax.parse_term("(N' : Num) == EXP((n' : Num), 2) + (EXP((p' : Num), 2) + (EXP((q' : Num), 2) + EXP((r' : Num), 2)))"))
  let t651 = @simp.abbrev_tac(@term_syntax.parse_term("(v : Real) == real_of_num((r : Num)) - real_of_num((m : Num)) * real_of_num((r' : Num))"))
  let t650 = @simp.abbrev_tac(@term_syntax.parse_term("(u : Real) == real_of_num((q : Num)) - real_of_num((m : Num)) * real_of_num((q' : Num))"))
  let t649 = @simp.abbrev_tac(@term_syntax.parse_term("(t : Real) == real_of_num((p : Num)) - real_of_num((m : Num)) * real_of_num((p' : Num))"))
  let t648 = @simp.abbrev_tac(@term_syntax.parse_term("(s : Real) == real_of_num((n : Num)) - real_of_num((m : Num)) * real_of_num((n' : Num))"))
  let t644 = @term_syntax.parse_term("(r' : Num)")
  let t645 = @term_syntax.parse_term("(q' : Num)")
  let t646 = @term_syntax.parse_term("(p' : Num)")
  let t647 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n' : Num)"), t646, t645, t644]))
  let t643 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t642 = @tactics.first_x_assum(fn(x641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x636 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x640 : @kernel.Thm) => @lib.check(fn(x639 : @kernel.Thm) -> Bool raise {
      (fn(x637 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x637)
      })((fn(x638 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x638)
      })(x639))
    }, x640))(x641))
  })
  let t634 = @meson.meson_tac(@list.List([]))
  let t631 = @drule.match_mp(real_rat_abs_middle())
  let t633 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s629 = @tactics.mp_tac(x628)
      fn(x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s629(x630)
      }
    })(t631(x632))
  }))
  let t627 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(b : Bool) → !(a : Bool)) == (a → b)"))]))
  let t626 = @tactics.first_assum(fn(x625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s619 = @tactics.mp_tac(x618)
      fn(x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s619(x620)
      }
    })(((x624 : @kernel.Thm) => @lib.check(fn(x623 : @kernel.Thm) -> Bool raise {
      (fn(x621 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x621)
      })((fn(x622 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x622)
      })(x623))
    }, x624))(x625))
  })
  let t617 = @simp.rewrite_tac(@list.List([@analysis.real_sub_0()]))
  let t616 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) < (y : Real) → !(x + y == real_of_num(0))")), @real.real_abs_pos(), @real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t615 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t614 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * a == (b : Real) * b) == ((a + b) * (a - b) == real_of_num(0))"))]))
  let t613 = @simp.rewrite_tac(@list.List([]))
  let t612 = @tactics.conv_tac(@equal.rand_conv(@calc_rat.real_rat_reduce_conv))
  let t611 = @simp.asm_simp_tac(@list.List([@real.real_pow_le2(), @real.real_abs_pos(), @real.real_le_div(), @analysis.real_pos()]))
  let t610 = @simp.once_rewrite_tac(@list.List([@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Real) - (b : Real)"), @real.real_pow2_abs()))]))
  let t609 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_of_num(1) / real_of_num(2), 2)"))
  let t608 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ m : Real, (a : Real) <= m && (b : Real) <= m && (c : Real) <= m && (d : Real) <= m && !(a == m && b == m && c == m && d == m) && real_of_num(4) * m <= real_of_num(1) → a + (b + (c + d)) < real_of_num(1)")))
  let t604 = @term_syntax.parse_term("(r' : Num)")
  let t605 = @term_syntax.parse_term("(q' : Num)")
  let t606 = @term_syntax.parse_term("(p' : Num)")
  let t607 = @tactics.map_every(fn(x601 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s602 = @tactics.exists_tac(x601)
    fn(x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s602(x603)
    }
  }, @list.List([@term_syntax.parse_term("(n' : Num)"), t606, t605, t604]))
  let t597 = @term_syntax.parse_term("(n' : Num)")
  let t598 = @term_syntax.parse_term("(p' : Num)")
  let t599 = @term_syntax.parse_term("(q' : Num)")
  let t600 = @tactics.map_every(fn(x594 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_1 = x594
    @tactics.disch_then((x596 : @kernel.Thm) => @tactics.x_choose_tac(t_1, x596))
  }, @list.List([@term_syntax.parse_term("(r' : Num)"), t599, t598, t597]))
  let t593 = @simp.simp_tac(@list.List([@real.real_le_div(), @analysis.real_pos()]))
  let t589 = @term_syntax.parse_term("real_of_num((r : Num)) / real_of_num((m : Num))")
  let t590 = @term_syntax.parse_term("real_of_num((q : Num)) / real_of_num((m : Num))")
  let t591 = @term_syntax.parse_term("real_of_num((p : Num)) / real_of_num((m : Num))")
  let t592 = @tactics.map_every(fn(x587 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x587
    @tactics.mp_tac(@bool.spec(t, real_num_round()))
  }, @list.List([@term_syntax.parse_term("real_of_num((n : Num)) / real_of_num((m : Num))"), t591, t590, t589]))
  let t582 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t581 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (b : Real) - (a + (c : Real)) == b - c"))]))
  let t580 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t579 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (b : Real) - a == b"))]))
  let t578 = @simp.asm_rewrite_tac(@list.List([]))
  let t583 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(r' : Num) + 1")), @tactics.disj2_tac), t578), t579), t580), t581), t582)
  let t577 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t576 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (b : Real) - a == b"))]))
  let t575 = @simp.asm_rewrite_tac(@list.List([]))
  let t584 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(r' : Num)")), @tactics.disj2_tac), t575), t576), t577)
  let t574 = @tactics.conv_tac(@class.taut)
  let t585 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_add(), @calc_num.arith_even()])), t574), t584, t583])
  let t573 = @tactics.subgoal_then(@term_syntax.parse_term("EVEN((n' : Num) + ((p' : Num) + ((q' : Num) + (r' : Num)))) == EVEN((N : Num)) || EVEN(n' + (p' + (q' + (r' + 1)))) == EVEN(N)"), @tactics.disj_cases_tac)
  let t571 = @tactics.pop_assum_list(fn(x570 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s567 = @tactics.mp_tac(x566)
      fn(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s567(x568)
      }
    })(((x569 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x569))(x570))
  })
  let t565 = @simp.rewrite_tac(@list.List([]))
  let t564 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x560 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s561 = @tactics.subst1_tac(x560)
      fn(x562 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s561(x562)
      }
    })(@equal.sym(x563))
  }))
  let t559 = @simp.simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t558 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t557 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_add_rdistrib(), @equal.gsym(@realax.real_mul_assoc())]))
  let t555 = @equal.gsym(@realax.real_of_num_mul())
  let t556 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq(), @equal.gsym(@realax.real_of_num_add()), t555]))
  let t548 = @term_syntax.parse_term("2 * (r' : Num) + 1")
  let t549 = @term_syntax.parse_term("2 * (q' : Num) + 1")
  let t550 = @term_syntax.parse_term("2 * (p' : Num) + 1")
  let t551 = @term_syntax.parse_term("2 * (n' : Num) + 1")
  let t552 = @list.List([@term_syntax.parse_term("2"), t551, t550, t549, t548])
  let t572 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s546 = @tactics.mp_tac(x545)
      fn(x547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s546(x547)
      }
    })(((x553 : @kernel.Thm) => @bool.specl(t552, x553))(x554))
  }), t556), t557), t558), t559), t564), t565), t571), @int.arith_tac), @tactics.all_tac])
  let t544 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) == 2"), fn(x541 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s542 = @tactics.subst_all_tac(x541)
    fn(x543 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s542(x543)
    }
  })
  let t538 = @term_syntax.parse_term("(q' : Num)")
  let t539 = @term_syntax.parse_term("(p' : Num)")
  let t540 = @tactics.map_every(fn(x535 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s536 = @tactics.exists_tac(x535)
    fn(x537 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s536(x537)
    }
  }, @list.List([@term_syntax.parse_term("(n' : Num)"), t539, t538]))
  let t586 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.choose_then(@tactics.strip_assume_tac)), t540), t544), t572), t573), t585), @tactics.all_tac])
  let t635 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("∃ n' : Num, ∃ p' : Num, ∃ q' : Num, ∃ r' : Num, real_of_num((n : Num)) / real_of_num((m : Num)) == real_of_num(n') + real_of_num(1) / real_of_num(2) && real_of_num((p : Num)) / real_of_num(m) == real_of_num(p') + real_of_num(1) / real_of_num(2) && real_of_num((q : Num)) / real_of_num(m) == real_of_num(q') + real_of_num(1) / real_of_num(2) && real_of_num((r : Num)) / real_of_num(m) == real_of_num(r') + real_of_num(1) / real_of_num(2)")), t586), t592), t593), t600), t607), @tactics.disj1_tac), t608), t609), t610), t611), t612), t613), t614), t615), t616), t617), t626), t627), t633), t634), @tactics.all_tac])
  let t534 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n' : Num, ∃ p' : Num, ∃ q' : Num, ∃ r' : Num, pow(real_of_num((n : Num)) / real_of_num((m : Num)) - real_of_num(n'), 2) + (pow(real_of_num((p : Num)) / real_of_num(m) - real_of_num(p'), 2) + (pow(real_of_num((q : Num)) / real_of_num(m) - real_of_num(q'), 2) + pow(real_of_num((r : Num)) / real_of_num(m) - real_of_num(r'), 2))) < real_of_num(1) || pow(real_of_num(n) / real_of_num(m) - real_of_num(n'), 2) + (pow(real_of_num(p) / real_of_num(m) - real_of_num(p'), 2) + (pow(real_of_num(q) / real_of_num(m) - real_of_num(q'), 2) + pow(real_of_num(r) / real_of_num(m) - real_of_num(r'), 2))) == real_of_num(1) && m == 2 && EVEN(n' + (p' + (q' + r'))) == EVEN((N : Num))"), fn(x531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s532 = @tactics.mp_tac(x531)
    fn(x533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s532(x533)
    }
  })
  let t530 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t529 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → p) → p")))
  let t914 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t529), t530), @tactics.disch_tac), t534), t635), t642), t643), t647), @tactics.disch_tac), t648), t649), t650), t651), t652), t653), t661), t662), t663), t672), t673), t690), t694), t697), t706), t710), t717), t721), t732), t733), t736), t738), t740), t741), t742), t743), t744), t745), t746), t750), t757), t758), t763), t767), t771), t775), t790), t791), t792), t793), t794), t799), t810), t817), t844), t845), t852), @tactics.disch_tac), t856), t889), t890), t891), t895), t899), t900), t907), t912), t913)
  aubrey_lemma_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, ∀ r : Num, !(m == 0) && !(m == 1) && pow(real_of_num(n) / real_of_num(m), 2) + (pow(real_of_num(p) / real_of_num(m), 2) + (pow(real_of_num(q) / real_of_num(m), 2) + pow(real_of_num(r) / real_of_num(m), 2))) == real_of_num((N : Num)) → (∃ m' : Num, ∃ n' : Num, ∃ p' : Num, ∃ q' : Num, ∃ r' : Num, !(m' == 0) && m' < m && pow(real_of_num(n') / real_of_num(m'), 2) + (pow(real_of_num(p') / real_of_num(m'), 2) + (pow(real_of_num(q') / real_of_num(m'), 2) + pow(real_of_num(r') / real_of_num(m'), 2))) == real_of_num(N))"), t914))
}

///|
let aubrey_lemma_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AUBREY_LEMMA_4")

///|
/// `AUBREY_LEMMA_4`
pub fn aubrey_lemma_4() -> @kernel.Thm {
  aubrey_lemma_4_c.get()
}

///|
/// AUBREY_THM_4
fn step_39() -> Unit raise {
  let t925 = @meson.asm_meson_tac(@list.List([]))
  let t924 = @simp.asm_rewrite_tac(@list.List([]))
  let t926 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num)"), aubrey_lemma_4()))), t924), t925)
  let t923 = @meson.meson_tac(@list.List([]))
  let t927 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@real.real_div_1(), @calc_num.arith_eq()])), t923), t926])
  let t922 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t921 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(x918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s919 = @tactics.mp_tac(x918)
    fn(x920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s919(x920)
    }
  }))
  let t928 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x915 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s916 = @equal.land_conv(x915)
    fn(x917 : @kernel.Term) -> @kernel.Thm raise {
      s916(x917)
    }
  }, @list.List([@arith.num_wop()])), t921), t922), t927)
  aubrey_thm_4_c.set(@tactics.prove(@term_syntax.parse_term("(∃ q : Num, !(q == 0) && (∃ a : Num, ∃ b : Num, ∃ c : Num, ∃ d : Num, pow(real_of_num(a) / real_of_num(q), 2) + (pow(real_of_num(b) / real_of_num(q), 2) + (pow(real_of_num(c) / real_of_num(q), 2) + pow(real_of_num(d) / real_of_num(q), 2))) == real_of_num((N : Num)))) → (∃ a : Num, ∃ b : Num, ∃ c : Num, ∃ d : Num, pow(real_of_num(a), 2) + (pow(real_of_num(b), 2) + (pow(real_of_num(c), 2) + pow(real_of_num(d), 2))) == real_of_num(N))"), t928))
}

///|
let aubrey_thm_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AUBREY_THM_4")

///|
/// `AUBREY_THM_4`
pub fn aubrey_thm_4() -> @kernel.Thm {
  aubrey_thm_4_c.get()
}

///|
/// LAGRANGE_IDENTITY
fn step_40() -> Unit raise {
  lagrange_identity_c.set(@calc_rat.real_arith(@term_syntax.parse_term("(pow((w1 : Real), 2) + (pow((x1 : Real), 2) + (pow((y1 : Real), 2) + pow((z1 : Real), 2)))) * (pow((w2 : Real), 2) + (pow((x2 : Real), 2) + (pow((y2 : Real), 2) + pow((z2 : Real), 2)))) == pow(w1 * w2 - x1 * x2 - y1 * y2 - z1 * z2, 2) + (pow(w1 * x2 + (x1 * w2 + (y1 * z2 - z1 * y2)), 2) + (pow(w1 * y2 - x1 * z2 + (y1 * w2 + z1 * x2), 2) + pow(w1 * z2 + (x1 * y2 - y1 * x2 + z1 * w2), 2)))")))
}

///|
let lagrange_identity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_IDENTITY")

///|
/// `LAGRANGE_IDENTITY`
pub fn lagrange_identity() -> @kernel.Thm {
  lagrange_identity_c.get()
}

///|
/// LAGRANGE_REAL_NUM
fn step_41() -> Unit raise {
  let t931 = @meson.meson_tac(@list.List([]))
  let t930 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_num()]))
  let t929 = @simp.asm_rewrite_tac(@list.List([]))
  let t932 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_pow2_abs())]))), t929), t930), t931)
  let lemma = @tactics.prove(@term_syntax.parse_term("(∃ a : Num, abs((w : Real)) == real_of_num(a)) && (∃ b : Num, abs((x : Real)) == real_of_num(b)) && (∃ c : Num, abs((y : Real)) == real_of_num(c)) && (∃ d : Num, abs((z : Real)) == real_of_num(d)) → (∃ a : Num, ∃ b : Num, ∃ c : Num, ∃ d : Num, pow(w, 2) + (pow(x, 2) + (pow(y, 2) + pow(z, 2))) == pow(real_of_num(a), 2) + (pow(real_of_num(b), 2) + (pow(real_of_num(c), 2) + pow(real_of_num(d), 2))))"), t932)
  let t1093 = @meson.meson_tac(@list.List([real_integer_closures()]))
  let t1092 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul()]))
  let t1091 = @tactics.match_mp_tac(lemma)
  let t1090 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t1089 = @simp.rewrite_tac(@list.List([@real.real_inv_eq_0(), @real.real_pow_eq_0(), @realax.real_of_num_eq(), @kernel.assume_rule(@term_syntax.parse_term("!((q : Num) == 0)"))]))
  let t1088 = @simp.rewrite_tac(@list.List([@real.real_eq_mul_rcancel()]))
  let t1087 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@real.real_add_rdistrib())]))
  let t1086 = @simp.rewrite_tac(@list.List([@real.real_pow_div()]))
  let t1085 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("!((q : Num) == 0)"))]))
  let t1084 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num)"))
  let t1082 = @equal.gsym(@real.real_pow_div())
  let t1083 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), t1082]))
  let t1081 = @simp.rewrite_tac(@list.List([@real.real_add_rdistrib()]))
  let t1080 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("real_of_num((q : Num)) == pow(real_of_num((a : Num)), 2) + (pow(real_of_num((b : Num)), 2) + (pow(real_of_num((c : Num)), 2) + pow(real_of_num((d : Num)), 2)))"))))
  let t1079 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc(), lagrange_identity()]))
  let t1077 = @equal.gsym(@calc_int.real_of_num_pow())
  let t1078 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t1077]))
  let t1076 = @simp.asm_rewrite_tac(@list.List([]))
  let t1074 = @simp.simp_tac(@list.List([@realax.real_mul_assoc(), @real.real_pow_eq_0(), @realax.real_mul_linv(), @realax.real_mul_lid(), @kernel.assume_rule(@term_syntax.parse_term("!((q : Num) == 0)")), @realax.real_of_num_eq()]))
  let t1073 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t1072 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1075 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), @realax.real_mul_assoc(), @realax.real_div()])), t1072), t1073), t1074), @tactics.all_tac])
  let t1071 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((p : Num)) == real_of_num((q : Num)) * (real_of_num(q * p) / pow(real_of_num(q), 2))"), fn(x1068 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1069 = @tactics.subst1_tac(x1068)
    fn(x1070 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1069(x1070)
    }
  })
  let t1066 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq()]))
  let t1065 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.exp_2()]))
  let t1064 = @tactics.disch_then(fn(x1063 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1061 = @tactics.mp_tac(x1060)
      fn(x1062 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1061(x1062)
      }
    })(@equal.sym(x1063))
  })
  let t1059 = @tactics.undisch_tac(@term_syntax.parse_term("0 * (p : Num) == EXP((x : Num), 2) + (EXP((y : Num), 2) + (EXP(1, 2) + EXP(0, 2)))"))
  let t1067 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1056 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1057 = @tactics.subst_all_tac(x1056)
    fn(x1058 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1057(x1058)
    }
  }), t1059), t1064), t1065), t1066), @tactics.all_tac])
  let t1055 = @tactics.subgoal_then(@term_syntax.parse_term("!((q : Num) == 0)"), fn(x1052 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1053 = @tactics.assume_tac(x1052)
    fn(x1054 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1053(x1054)
    }
  })
  let t1048 = @term_syntax.parse_term("(d : Num)")
  let t1049 = @term_syntax.parse_term("(c : Num)")
  let t1050 = @term_syntax.parse_term("(b : Num)")
  let t1051 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Num)"), t1050, t1049, t1048]))
  let t1047 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1043 = @term_syntax.parse_term("(q : Num)")
  let t1046 = @tactics.first_x_assum(fn(x1045 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1040 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1041 = @tactics.mp_tac(x1040)
      fn(x1042 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1041(x1042)
      }
    })(((x1044 : @kernel.Thm) => @bool.spec(t1043, x1044))(x1045))
  })
  let t1039 = @simp.asm_rewrite_tac(@list.List([]))
  let t1038 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @arith.lt_mult_rcancel()]))
  let t1035 = @term_syntax.parse_term("!((p : Num) == 1)")
  let t1036 = @tactics.map_every(fn(x1032 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1033 = @tactics.undisch_tac(x1032)
    fn(x1034 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1033(x1034)
    }
  }, @list.List([@term_syntax.parse_term("!((p : Num) == 0)"), t1035]))
  let t1031 = @simp.asm_rewrite_tac(@list.List([]))
  let t1030 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1029 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1028 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("2 * (x : Num) * (2 * x) <= (p : Num) * p && 2 * (y : Num) * (2 * y) <= p * p && 2 * 2 <= p * p → x * x + (y * y + 1) < p * p")))
  let t1037 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.exp_2(), @arith.mult_clauses(), @arith.add_clauses()])), t1028), t1029), t1030), t1031), t1036), @int.arith_tac), @tactics.all_tac])
  let t1027 = @tactics.subgoal_then(@term_syntax.parse_term("(q : Num) * (p : Num) < EXP(p, 2)"), fn(x1024 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1025 = @tactics.mp_tac(x1024)
    fn(x1026 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1025(x1026)
    }
  })
  let t1023 = @tactics.match_mp_tac(aubrey_thm_4())
  let t1022 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t1019 = @term_syntax.parse_term("(y : Num)")
  let t1020 = @term_syntax.parse_term("(x : Num)")
  let t1021 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(q : Num)"), t1020, t1019]))
  let t1018 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1014 = @term_syntax.parse_term("EXP(1, 2) + EXP(0, 2)")
  let t1017 = @tactics.disch_then(fn(x1016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1011 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1012 = @tactics.mp_tac(x1011)
      fn(x1013 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1012(x1013)
      }
    })(((x1015 : @kernel.Thm) => @bool.spec(t1014, x1015))(x1016))
  })
  let t1008 = @drule.match_mp(lagrange_lemma())
  let t1010 = @tactics.first_assum(fn(x1009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1006 = @tactics.mp_tac(x1005)
      fn(x1007 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1006(x1007)
      }
    })(t1008(x1009))
  })
  let t1004 = @tactics.disch_then(fn(x1001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1002 = @tactics.subst_all_tac(x1001)
    fn(x1003 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1002(x1003)
    }
  })
  let t1000 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t999 = @tactics.disch_then(fn(x996 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s997 = @tactics.subst_all_tac(x996)
    fn(x998 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s997(x998)
    }
  })
  let t995 = @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t993 = @meson.meson_tac(@list.List([real_integer_closures()]))
  let t992 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul()]))
  let t991 = @tactics.match_mp_tac(lemma)
  let t990 = @simp.rewrite_tac(@list.List([lagrange_identity()]))
  let t989 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul())]))
  let t985 = @term_syntax.parse_term("(z2 : Num)")
  let t986 = @term_syntax.parse_term("(y2 : Num)")
  let t987 = @term_syntax.parse_term("(x2 : Num)")
  let t988 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(w2 : Num)"), t987, t986, t985]))
  let t981 = @term_syntax.parse_term("(z1 : Num)")
  let t982 = @term_syntax.parse_term("(y1 : Num)")
  let t983 = @term_syntax.parse_term("(x1 : Num)")
  let t984 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(w1 : Num)"), t983, t982, t981]))
  let t980 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t979 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 < (x : Num)) == (!(x == 0) && !(x == 1))"))]))
  let t978 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_1()])), @tactics.all_tac])
  let t977 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 1)"), fn(x974 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s975 = @tactics.assume_tac(x974)
    fn(x976 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s975(x976)
    }
  })
  let t973 = @simp.asm_rewrite_tac(@list.List([]))
  let t972 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t971 = @simp.asm_rewrite_tac(@list.List([]))
  let t970 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t969 = @simp.rewrite_tac(@list.List([@arith.mult_eq_0()]))
  let t968 = @tactics.undisch_tac(@term_syntax.parse_term("!((p : Num) * (m : Num) == 0)"))
  let t967 = @simp.rewrite_tac(@list.List([@arith.lt_mult_lcancel()]))
  let t966 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((p : Num) < p * (m : Num)) == (p * 1 < p * m)"))]))
  let t965 = @simp.rewrite_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t964 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) < (p : Num) * m) == (1 * m < p * m)"))]))
  let t963 = @tactics.first_x_assum(fn(x960 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x960
    let t962 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num)"), th))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(p : Num)"), th)), t962)
  })
  let t994 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s958 = @tactics.subst_all_tac(x957)
    fn(x959 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s958(x959)
    }
  }), t963), t964), t965), t966), t967), t968), t969), t970), t971), t972), t973), t977), t978), t979), t980), t984), @tactics.disch_tac), t988), @tactics.disch_tac), t989), t990), t991), t992), t993)])
  let t956 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t955 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(x952 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s953 = @tactics.mp_tac(x952)
    fn(x954 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s953(x954)
    }
  }))
  let t951 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t950 = @tactics.undisch_tac(@term_syntax.parse_term("divides((p : Num), (n : Num))"))
  let t949 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t946 = @drule.match_mp(@prime.prime_factor())
  let t948 = @tactics.first_assum(fn(x947 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s944 = @tactics.mp_tac(x943)
      fn(x945 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s944(x945)
      }
    })(t946(x947))
  })
  let t941 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t940 = @simp.asm_rewrite_tac(@list.List([]))
  let t939 = @tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("0")))
  let t942 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t939), t940), t941), @tactics.all_tac])
  let t938 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t936 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t935 = @simp.asm_rewrite_tac(@list.List([]))
  let t937 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("0"))), t935), t936), @tactics.all_tac])
  let t934 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t933 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1094 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.num_wf()), t933), @tactics.disch_tac), t934), t937), t938), t942), t948), t949), t950), t951), t955), t956), t994), t995), t999), t1000), t1004), t1010), t1017), t1018), t1021), @tactics.strip_tac), t1022), t1023), t1027), t1037), t1038), t1039), @tactics.disch_tac), t1046), t1047), t1051), @tactics.disch_tac), t1055), t1067), t1071), t1075), t1076), t1078), t1079), t1080), t1081), t1083), t1084), t1085), t1086), t1087), t1088), t1089), t1090), t1091), t1092), t1093)
  lagrange_real_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∃ w : Num, ∃ x : Num, ∃ y : Num, ∃ z : Num, real_of_num(n) == pow(real_of_num(w), 2) + (pow(real_of_num(x), 2) + (pow(real_of_num(y), 2) + pow(real_of_num(z), 2)))"), t1094))
}

///|
let lagrange_real_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_REAL_NUM")

///|
/// `LAGRANGE_REAL_NUM`
pub fn lagrange_real_num() -> @kernel.Thm {
  lagrange_real_num_c.get()
}

///|
/// LAGRANGE_NUM
fn step_42() -> Unit raise {
  let t1095 = @simp.rewrite_tac(@list.List([@analysis.real_pos(), @calc_int.real_of_num_pow(), @realax.real_of_num_add(), @realax.real_of_num_eq()]))
  let t1096 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), lagrange_real_num()))), t1095)
  lagrange_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∃ w : Num, ∃ x : Num, ∃ y : Num, ∃ z : Num, n == EXP(w, 2) + (EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)))"), t1096))
}

///|
let lagrange_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_NUM")

///|
/// `LAGRANGE_NUM`
pub fn lagrange_num() -> @kernel.Thm {
  lagrange_num_c.get()
}

///|
/// 100/four_squares.ml:898
fn step_43() -> Unit raise {
  @int.prioritize_int(())
}

///|
/// LAGRANGE_INT
fn step_44() -> Unit raise {
  let t1106 = @tactics.then_tac(@tactics.strip_tac, @simp.asm_simp_tac(@list.List([@int.int_le_square(), @int.int_le_add(), @int.int_pow_2()])))
  let t1105 = @meson.meson_tac(@list.List([]))
  let t1102 = @equal.gsym(@int.int_of_num_add())
  let t1103 = @equal.gsym(@int.int_of_num_pow())
  let t1104 = @simp.simp_tac(@list.List([@equal.gsym(@int.int_of_num_eq()), t1103, t1102]))
  let t1101 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_add(), @realax.real_of_num_eq()]))
  let t1100 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), lagrange_real_num()))
  let t1099 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1098 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_forall_pos())]))
  let t1097 = @term_syntax.parse_term("(a : Int)")
  let t1107 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(a : Int)"), t1097), t1098), t1099), t1100), t1101), t1104), t1105), t1106])
  let t1108 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t1107)
  lagrange_int_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Int, (int_of_num(0) <= a) == (∃ w : Int, ∃ x : Int, ∃ y : Int, ∃ z : Int, a == pow(w, 2) + (pow(x, 2) + (pow(y, 2) + pow(z, 2))))"), t1108))
}

///|
let lagrange_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_INT")

///|
/// `LAGRANGE_INT`
pub fn lagrange_int() -> @kernel.Thm {
  lagrange_int_c.get()
}

///|
/// 100/four_squares.ml:910
fn step_45() -> Unit raise {
  @realax.prioritize_num(())
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
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
}
