// Translated from upstream 100/reciprocity.ml; edit this file directly.

///|
/// 100/reciprocity.ml:9
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// IN_NUMSEG_1
fn step_2() -> Unit raise {
  let t1 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_numseg()])), @int.arith_tac)
  in_numseg_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ i : Num, IN(i, op_dot_dot(1, p - 1)) == (0 < i && i < p)"), t1))
}

///|
let in_numseg_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_NUMSEG_1")

///|
/// `IN_NUMSEG_1`
pub fn in_numseg_1() -> @kernel.Thm {
  in_numseg_1_c.get()
}

///|
/// EVEN_DIV
fn step_3() -> Unit raise {
  let t2 = @int.arith_rule(@term_syntax.parse_term("!(2 == 0)"))
  let t3 = @drule.match_mp(@arith.division())(t2)
  let t4 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), t3))
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@arith.even_mod()]))), t4), @int.arith_tac)
  even_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, EVEN(n) == (n == 2 * DIV(n, 2))"), t5))
}

///|
let even_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_DIV")

///|
/// `EVEN_DIV`
pub fn even_div() -> @kernel.Thm {
  even_div_c.get()
}

///|
/// CONG_MINUS1_SQUARE
fn step_4() -> Unit raise {
  let t11 = @term_syntax.parse_term("(d : Num)")
  let t12 = @tactics.map_every(fn(x8 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s9 = @tactics.exists_tac(x8)
    fn(x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s9(x10)
    }
  }, @list.List([@term_syntax.parse_term("0"), t11]))
  let t7 = @simp.rewrite_tac(@list.List([@int.cong(), @pocklington.nat_mod(), @int.arith_rule(@term_syntax.parse_term("2 + (x : Num) - 1 == x + 1"))]))
  let t6 = @tactics.repeat_tac(@tactics.strip_tac)
  let t13 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@arith.le_exists(), @theorems.left_imp_exists_thm()])), t6), t7), t12), @int.arith_tac)
  cong_minus1_square_c.set(@tactics.prove(@term_syntax.parse_term("2 <= (p : Num) → op_eq_eq((p - 1) * (p - 1), 1, mod(p))"), t13))
}

///|
let cong_minus1_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MINUS1_SQUARE")

///|
/// `CONG_MINUS1_SQUARE`
pub fn cong_minus1_square() -> @kernel.Thm {
  cong_minus1_square_c.get()
}

///|
/// CONG_EXP_MINUS1
fn step_5() -> Unit raise {
  let t19 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @pocklington.cong_refl(), cong_minus1_square()]))
  let t18 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((n : Num))"))
  let t17 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mult(), @pocklington.cong_refl(), @arith.even()]))
  let t16 = @tactics.exists_tac(@term_syntax.parse_term("((p : Num) - 1) * (if EVEN((n : Num)) { 1 } else { p - 1 })"))
  let t15 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t14 = @simp.rewrite_tac(@list.List([@arith.exp(), @calc_num.arith(), @pocklington.cong_refl()]))
  let t20 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), @nums.induct_tac), t14), t15), t16), t17), t18), t19)
  cong_exp_minus1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ n : Num, 2 <= p → op_eq_eq(EXP(p - 1, n), if EVEN(n) { 1 } else { p - 1 }, mod(p))"), t20))
}

///|
let cong_exp_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_EXP_MINUS1")

///|
/// `CONG_EXP_MINUS1`
pub fn cong_exp_minus1() -> @kernel.Thm {
  cong_exp_minus1_c.get()
}

///|
/// NOT_CONG_MINUS1
fn step_6() -> Unit raise {
  let t36 = @drule.match_mp(@int.divides_le())
  let t38 = @tactics.disch_then(fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s34 = @tactics.mp_tac(x33)
      fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s34(x35)
      }
    })(t36(x37))
  })
  let t39 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pocklington.cong_0()])), t38), @int.asm_arith_tac)
  let t32 = @meson.meson_tac(@list.List([@pocklington.cong_0(), @pocklington.cong_sym(), @prime.divides_refl(), @pocklington.cong_refl()]))
  let t31 = @tactics.match_mp_tac(@pocklington.cong_add())
  let t30 = @list.List([@meson.asm_meson_tac(@list.List([@arith.add_clauses()])), @tactics.all_tac])
  let t29 = @tactics.exists_tac(@term_syntax.parse_term("0 + 1"))
  let t28 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t27 = @simp.asm_simp_tac(@list.List([@arith.add_clauses(), @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → p - 1 + 2 == p + 1"))]))
  let t26 = @simp.once_rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t25 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) - 1"))
  let t40 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_add_lcancel()), t25), t26), t27), t28), t29), @tactics.conj_tac), t30), t31), t32), t39])
  let t24 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq(2, 0, mod((p : Num)))"), fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s22 = @tactics.mp_tac(x21)
    fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s22(x23)
    }
  })
  let t41 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t24), t40)
  not_cong_minus1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, 3 <= p → !op_eq_eq(p - 1, 1, mod(p))"), t41))
}

///|
let not_cong_minus1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_CONG_MINUS1")

///|
/// `NOT_CONG_MINUS1`
pub fn not_cong_minus1() -> @kernel.Thm {
  not_cong_minus1_c.get()
}

///|
/// CONG_COND_LEMMA
fn step_7() -> Unit raise {
  let t43 = @meson.asm_meson_tac(@list.List([@pocklington.cong_sym(), not_cong_minus1()]))
  let t42 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t42), t43)
  cong_cond_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ x : Bool, ∀ y : Bool, 3 <= p && op_eq_eq(if x { 1 } else { p - 1 }, if y { 1 } else { p - 1 }, mod(p)) → x == y"), t44))
}

///|
let cong_cond_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_COND_LEMMA")

///|
/// `CONG_COND_LEMMA`
pub fn cong_cond_lemma() -> @kernel.Thm {
  cong_cond_lemma_c.get()
}

///|
/// FINITE_SUBCROSS
fn step_8() -> Unit raise {
  let t47 = @simp.asm_simp_tac(@list.List([@sets.finite_cross(), @sets.subset(), @sets.in_cross(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t46 = @tactics.exists_tac(@term_syntax.parse_term("CROSS((s : (A) -> Bool), (t : (B) -> Bool))"))
  let t45 = @tactics.match_mp_tac(@sets.finite_subset())
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t45), t46), t47)
  finite_subcross_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → FINITE({((x : A), (y : B)) | IN(x, s) && IN(y, t) && (P : (A, B) -> Bool)(x, y)})"), t48))
}

///|
let finite_subcross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUBCROSS")

///|
/// `FINITE_SUBCROSS`
pub fn finite_subcross() -> @kernel.Thm {
  finite_subcross_c.get()
}

///|
/// CARD_SUBCROSS_DETERMINATE
fn step_9() -> Unit raise {
  let t55 = @meson.asm_meson_tac(@list.List([]))
  let t54 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @pair.pair_eq()]))
  let t53 = @simp.rewrite_tac(@list.List([@pair.exists_pair_thm(), @sets.in_elim_pair_thm()]))
  let t52 = @simp.asm_simp_tac(@list.List([finite_subcross(), @pair.forall_pair_thm(), @theorems.exists_unique_thm()]))
  let t51 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((A, B)) -> A) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), x))"))
  let t50 = @tactics.match_mp_tac(@sets.card_image_inj_eq())
  let t49 = @tactics.conv_tac(@equal.sym_conv)
  let t56 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t49), t50), t51), t52), t53), t54), t55)
  card_subcross_determinate_c.set(@tactics.prove(@term_syntax.parse_term("FINITE((s : (A) -> Bool)) && FINITE((t : (B) -> Bool)) && (∀ x : A, IN(x, s) && (p : (A) -> Bool)(x) → IN((f : (A) -> B)(x), t)) → CARD({((x : A), (y : B)) | IN(x, s) && IN(y, t) && y == f(x) && p(x)}) == CARD({(x : A) | IN(x, s) && p(x)})"), t56))
}

///|
let card_subcross_determinate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SUBCROSS_DETERMINATE")

///|
/// `CARD_SUBCROSS_DETERMINATE`
pub fn card_subcross_determinate() -> @kernel.Thm {
  card_subcross_determinate_c.get()
}

///|
/// CARD_SUBCROSS_SWAP
fn step_10() -> Unit raise {
  let t62 = @meson.meson_tac(@list.List([]))
  let t61 = @simp.simp_tac(@list.List([@sets.in_elim_pair_thm(), @pair.pair_eq()]))
  let t60 = @simp.rewrite_tac(@list.List([@theorems.exists_unique_thm(), @pair.forall_pair_thm(), @pair.exists_pair_thm()]))
  let t59 = @simp.asm_simp_tac(@list.List([finite_subcross(), @iterate.finite_numseg()]))
  let t58 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), (y, x)))"))
  let t57 = @tactics.match_mp_tac(@sets.card_image_inj_eq())
  let t63 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t57), t58), t59), t60), t61), t62)
  card_subcross_swap_c.set(@tactics.prove(@term_syntax.parse_term("CARD({((y : Num), (x : Num)) | IN(y, op_dot_dot(1, (m : Num))) && IN(x, op_dot_dot(1, (n : Num))) && (P : (Num, Num) -> Bool)(x, y)}) == CARD({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, n)) && IN(y, op_dot_dot(1, m)) && P(x, y)})"), t63))
}

///|
let card_subcross_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SUBCROSS_SWAP")

///|
/// `CARD_SUBCROSS_SWAP`
pub fn card_subcross_swap() -> @kernel.Thm {
  card_subcross_swap_c.get()
}

///|
/// 100/reciprocity.ml:96
fn step_11() -> Unit raise {
  @printer.parse_as_infix("is_quadratic_residue", (12L, "right"))
}

///|
/// is_quadratic_residue
fn step_12() -> Unit raise {
  is_quadratic_residue_c.set(@pair.new_definition(@term_syntax.parse_term("(is_quadratic_residue : (Num, (Num, Num) -> Bool) -> Bool)((y : Num), (rel : (Num, Num) -> Bool)) == (∃ x : Num, op_eq_eq(EXP(x, 2), y, rel))")))
}

///|
let is_quadratic_residue_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_quadratic_residue")

///|
/// `is_quadratic_residue`
pub fn is_quadratic_residue() -> @kernel.Thm {
  is_quadratic_residue_c.get()
}

///|
/// IS_QUADRATIC_RESIDUE
fn step_13() -> Unit raise {
  let t71 = @simp.asm_simp_tac(@list.List([@int.cong_v1(), @arith.mod_mult_mod2()]))
  let t72 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((x : Num) * x, (a : Num), mod((p : Num)))")), t71)
  let t73 = @list.List([@meson.asm_meson_tac(@list.List([@arith.lt_nz(), @equal.gsym(@int.divides_mod()), @pocklington.cong_divides(), @prime.divides_lmul()])), t72])
  let t70 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t69 = @tactics.exists_tac(@term_syntax.parse_term("MOD((x : Num), (p : Num))"))
  let t66 = @term_syntax.parse_term("(x : Num)")
  let t68 = @tactics.disch_then((x67 : @kernel.Thm) => @tactics.x_choose_tac(t66, x67))
  let t65 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t64 = @simp.rewrite_tac(@list.List([is_quadratic_residue(), @arith.exp_2()]))
  let t74 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t64), @tactics.disch_tac), @tactics.eq_tac), t65), t68), t69), t70), @tactics.conj_tac), t73)
  is_quadratic_residue_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, !(p == 0) && !divides(p, a) → is_quadratic_residue(a, mod(p)) == (∃ x : Num, 0 < x && x < p && op_eq_eq(EXP(x, 2), a, mod(p)))"), t74))
}

///|
let is_quadratic_residue_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_QUADRATIC_RESIDUE")

///|
/// `IS_QUADRATIC_RESIDUE`
pub fn is_quadratic_residue_v1() -> @kernel.Thm {
  is_quadratic_residue_v1_c.get()
}

///|
/// IS_QUADRATIC_RESIDUE_COMMON
fn step_14() -> Unit raise {
  let t76 = @meson.asm_meson_tac(@list.List([@prime.coprime_prime(), @prime.divides_refl(), @prime.prime_0()]))
  let t75 = @tactics.match_mp_tac(is_quadratic_residue_v1())
  let t77 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t75), t76)
  is_quadratic_residue_common_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && coprime((a, p)) → is_quadratic_residue(a, mod(p)) == (∃ x : Num, 0 < x && x < p && op_eq_eq(EXP(x, 2), a, mod(p)))"), t77))
}

///|
let is_quadratic_residue_common_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_QUADRATIC_RESIDUE_COMMON")

///|
/// `IS_QUADRATIC_RESIDUE_COMMON`
pub fn is_quadratic_residue_common() -> @kernel.Thm {
  is_quadratic_residue_common_c.get()
}

///|
/// QUADRATIC_RESIDUE_PAIR_ADD
fn step_15() -> Unit raise {
  let t78 = @simp.simp_tac(@list.List([@pocklington.cong_add_rcancel_eq_0(), @pocklington.cong_0(), @prime.prime_divprod_eq(), @arith.add_sym()]))
  let t79 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@grobner.num_ring(@term_syntax.parse_term("EXP((x : Num) + (y : Num), 2) == y * (y + 2 * x) + EXP(x, 2)"))])), t78)
  quadratic_residue_pair_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ x : Num, ∀ y : Num, prime(p) → op_eq_eq(EXP(x + y, 2), EXP(x, 2), mod(p)) == (divides(p, y) || divides(p, 2 * x + y))"), t79))
}

///|
let quadratic_residue_pair_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUADRATIC_RESIDUE_PAIR_ADD")

///|
/// `QUADRATIC_RESIDUE_PAIR_ADD`
pub fn quadratic_residue_pair_add() -> @kernel.Thm {
  quadratic_residue_pair_add_c.get()
}

///|
/// QUADRATIC_RESIDUE_PAIR
fn step_16() -> Unit raise {
  let t86 = @simp.rewrite_tac(@list.List([@realax.dist_radd_0(), @int.arith_rule(@term_syntax.parse_term("(x : Num) + (x + (d : Num)) == 2 * x + d")), @theorems.disj_aci()]))
  let t85 = @simp.asm_simp_tac(@list.List([quadratic_residue_pair_add()]))
  let t84 = @simp.once_rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t83 = @simp.asm_rewrite_tac(@list.List([]))
  let t82 = @tactics.repeat_tac(@tactics.strip_tac)
  let t81 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t80 = @list.List([@meson.meson_tac(@list.List([@realax.dist_sym(), @pocklington.cong_sym(), @arith.add_sym()])), @tactics.all_tac])
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@arith.wlog_le())), @tactics.conj_tac), t80), t81), t82), t83), t84), t85), t86)
  quadratic_residue_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ x : Num, ∀ y : Num, prime(p) → op_eq_eq(EXP(x, 2), EXP(y, 2), mod(p)) == (divides(p, x + y) || divides(p, dist((x, y))))"), t87))
}

///|
let quadratic_residue_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUADRATIC_RESIDUE_PAIR")

///|
/// `QUADRATIC_RESIDUE_PAIR`
pub fn quadratic_residue_pair() -> @kernel.Thm {
  quadratic_residue_pair_c.get()
}

///|
/// IS_QUADRATIC_RESIDUE_PAIR
fn step_17() -> Unit raise {
  let t131 = @simp.rewrite_tac(@list.List([@realax.dist()]))
  let t130 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @realax.dist_eq_0()]))
  let t127 = @drule.match_mp(@prime.divides_cases())
  let t129 = @tactics.disch_then(@tactics.disj_cases_then(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s125 = @tactics.mp_tac(x124)
      fn(x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s125(x126)
      }
    })(t127(x128))
  }))
  let t123 = @list.List([@meson.asm_meson_tac(@list.List([@pocklington.cong_trans(), @pocklington.cong_sym()])), @tactics.all_tac])
  let t122 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq(EXP((x : Num), 2), EXP((z : Num), 2), mod((p : Num)))"), fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x120
    @simp.simp_tac(@list.List([th]))
  })
  let t116 = @term_syntax.parse_term("(z : Num)")
  let t117 = @list.List([@term_syntax.parse_term("(x : Num)"), t116])
  let t132 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s114 = @tactics.mp_tac(x113)
      fn(x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s114(x115)
      }
    })(((x118 : @kernel.Thm) => @bool.specl(t117, x118))(x119))
  }), t122), t123), t129), t130), t131), @int.asm_arith_tac)
  let t112 = @meson.asm_meson_tac(@list.List([@pocklington.cong_trans(), @pocklington.cong_sym()]))
  let t111 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < (p : Num) → x + (p - x) == p")), @prime.divides_refl()]))
  let t107 = @term_syntax.parse_term("(p : Num) - (x : Num)")
  let t108 = @list.List([@term_syntax.parse_term("(x : Num)"), t107])
  let t133 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s105 = @tactics.mp_tac(x104)
      fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s105(x106)
      }
    })(((x109 : @kernel.Thm) => @bool.specl(t108, x109))(x110))
  }), t111), t112), t132])
  let t101 = @drule.match_mp(quadratic_residue_pair())
  let t103 = @tactics.first_x_assum(fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s99 = @tactics.mp_tac(x98)
      fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s99(x100)
      }
    })(t101(x102))
  })
  let t97 = @tactics.repeat_tac(@tactics.strip_tac)
  let t96 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (x : Num) && x < (p : Num) → 0 < p - x && p - x < p && x + (p - x) == p"))]))
  let t94 = @term_syntax.parse_term("(p : Num) - (x : Num)")
  let t95 = @tactics.map_every(fn(x91 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s92 = @tactics.exists_tac(x91)
    fn(x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s92(x93)
    }
  }, @list.List([@term_syntax.parse_term("(x : Num)"), t94]))
  let t90 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(@tactics.strip_assume_tac))
  let t89 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t88 = @tactics.repeat_tac(@tactics.strip_tac)
  let t134 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([is_quadratic_residue_common()])), t88), @tactics.eq_tac), t89), t90), t95), t96), t97), t103), t133)
  is_quadratic_residue_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && coprime((a, p)) → is_quadratic_residue(a, mod(p)) == (∃ x : Num, ∃ y : Num, 0 < x && x < p && 0 < y && y < p && x + y == p && op_eq_eq(EXP(x, 2), a, mod(p)) && op_eq_eq(EXP(y, 2), a, mod(p)) && (∀ z : Num, 0 < z && z < p && op_eq_eq(EXP(z, 2), a, mod(p)) → z == x || z == y))"), t134))
}

///|
let is_quadratic_residue_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_QUADRATIC_RESIDUE_PAIR")

///|
/// `IS_QUADRATIC_RESIDUE_PAIR`
pub fn is_quadratic_residue_pair() -> @kernel.Thm {
  is_quadratic_residue_pair_c.get()
}

///|
/// QUADRATIC_RESIDUE_PAIR_PRODUCT
fn step_18() -> Unit raise {
  let t148 = @meson.asm_meson_tac(@list.List([@pocklington.cong_add(), @pocklington.cong_trans(), @pocklington.cong_sym(), @pocklington.cong_refl(), @arith.mult_sym(), @pocklington.cong_add_rcancel()]))
  let t149 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.mult_clauses()])), t148)
  let t147 = @meson.asm_meson_tac(@list.List([@arith.add_sym(), @arith.mult_sym()]))
  let t146 = @simp.rewrite_tac(@list.List([@int.cong(), @pocklington.nat_mod()]))
  let t150 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@arith.left_sub_distrib(), @arith.exp_2(), @arith.sub_add(), @arith.le_mult_lcancel(), @arith.lt_imp_le()])), t146), t147), t149])
  let t145 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((x : Num) * ((p : Num) - x) + EXP(x, 2), (a : Num) * (p - 1) + a * 1, mod(p))"), fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s143 = @tactics.mp_tac(x142)
    fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s143(x144)
    }
  })
  let t138 = @int.arith_rule(@term_syntax.parse_term("(x : Num) < (p : Num) → 1 <= p"))
  let t141 = @tactics.first_assum(fn(x140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s136 = @tactics.assume_tac(x135)
      fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s136(x137)
      }
    })(((x139 : @kernel.Thm) => @bool.mp(t138, x139))(x140))
  })
  let t151 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t141), t145), t150)
  quadratic_residue_pair_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ x : Num, 0 < x && x < p && op_eq_eq(EXP(x, 2), (a : Num), mod(p)) → op_eq_eq(x * (p - x), (p - 1) * a, mod(p))"), t151))
}

///|
let quadratic_residue_pair_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUADRATIC_RESIDUE_PAIR_PRODUCT")

///|
/// `QUADRATIC_RESIDUE_PAIR_PRODUCT`
pub fn quadratic_residue_pair_product() -> @kernel.Thm {
  quadratic_residue_pair_product_c.get()
}

///|
/// legendre
fn step_19() -> Unit raise {
  legendre_c.set(@pair.new_definition(@term_syntax.parse_term("(legendre : ((Num, Num)) -> Int)(((a : Num), (p : Num))) == (if !coprime((a, p)) { int_of_num(0) } else { if is_quadratic_residue(a, mod(p)) { int_of_num(1) } else { -int_of_num(1) } })")))
}

///|
let legendre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("legendre")

///|
/// `legendre`
pub fn legendre() -> @kernel.Thm {
  legendre_c.get()
}

///|
/// nproduct
fn step_20() -> Unit raise {
  nproduct_c.set(@pair.new_definition(@term_syntax.parse_term("(nproduct : ((_) -> Bool, (_) -> Num) -> Num) == (iterate : ((Num, Num) -> Num, (_) -> Bool, (_) -> Num) -> Num)(op_star)")))
}

///|
let nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nproduct")

///|
/// `nproduct`
pub fn nproduct() -> @kernel.Thm {
  nproduct_c.get()
}

///|
/// CONG_NPRODUCT
fn step_21() -> Unit raise {
  let t153 = @simp.simp_tac(@list.List([@pocklington.cong_refl(), @pocklington.cong_mult()]))
  let t152 = @tactics.match_mp_tac(@drule.match_mp(@iterate.iterate_related())(@iterate.monoidal_mul()))
  let t154 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([nproduct()])), t152), t153)
  cong_nproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Num, ∀ g : (_) -> Num, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → op_eq_eq(f(x), g(x), mod((n : Num)))) → op_eq_eq(nproduct(s, f), nproduct(s, g), mod(n))"), t154))
}

///|
let cong_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_NPRODUCT")

///|
/// `CONG_NPRODUCT`
pub fn cong_nproduct() -> @kernel.Thm {
  cong_nproduct_c.get()
}

///|
/// NPRODUCT_DELTA_CONST
fn step_22() -> Unit raise {
  let t155 = @meson.asm_meson_tac(@list.List([]))
  let t156 = @tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.in_elim_thm()]))), t155)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("{(x : _) | IN(x, INSERT((a : _), (s : (_) -> Bool))) && (p : (_) -> Bool)(x)} == (if p(a) { INSERT(a, {(x : _) | IN(x, s) && p(x)}) } else { {(x : _) | IN(x, s) && p(x)} })"), t156)
  let t157 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t158 = @tactics.then_tac(@tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) == (b → a → c)"))]))(@sets.finite_subset())), t157)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("FINITE((s : (_) -> Bool)) → FINITE({(x : _) | IN(x, s) && (p : (_) -> Bool)(x)})"), t158)
  let t161 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.in_elim_thm(), lemma2, @arith.exp(), @arith.mult_clauses()]))
  let t160 = @tactics.repeat_tac(@tactics.strip_tac)
  let t159 = @simp.simp_tac(@list.List([@iterate.nproduct_clauses(), @sets.card_clauses(), @arith.exp(), @sets.not_in_empty(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | false} == {}")), lemma1]))
  let t162 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t159), t160), @class.cond_cases_tac), t161)
  nproduct_delta_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Num, ∀ s : (_) -> Bool, FINITE(s) → nproduct(s, (x : _) => if (p : (_) -> Bool)(x) { c } else { 1 }) == EXP(c, CARD({(x : _) | IN(x, s) && p(x)}))"), t162))
}

///|
let nproduct_delta_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_DELTA_CONST")

///|
/// `NPRODUCT_DELTA_CONST`
pub fn nproduct_delta_const() -> @kernel.Thm {
  nproduct_delta_const_c.get()
}

///|
/// COPRIME_NPRODUCT
fn step_23() -> Unit raise {
  let t165 = @simp.simp_tac(@list.List([@iterate.nproduct_clauses(), @prime.coprime_1(), @sets.in_insert(), @prime.coprime_mul()]))
  let t164 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t163 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t166 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t163), t164), t165)
  coprime_nproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Num, ∀ p : Num, ∀ s : (_) -> Bool, FINITE(s) && (∀ x : _, IN(x, s) → coprime((p, f(x)))) → coprime((p, nproduct(s, f)))"), t166))
}

///|
let coprime_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_NPRODUCT")

///|
/// `COPRIME_NPRODUCT`
pub fn coprime_nproduct() -> @kernel.Thm {
  coprime_nproduct_c.get()
}

///|
/// FACT_NPRODUCT
fn step_24() -> Unit raise {
  let t168 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t167 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")), @iterate.nproduct_clauses(), @iterate.finite_numseg()]))
  let t169 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.fact(), @iterate.numseg_clauses(), @calc_num.arith(), @iterate.nproduct_clauses()]))), t167), t168), @int.arith_tac)
  fact_nproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, FACT(n) == nproduct(op_dot_dot(1, n), (i : Num) => i)"), t169))
}

///|
let fact_nproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FACT_NPRODUCT")

///|
/// `FACT_NPRODUCT`
pub fn fact_nproduct() -> @kernel.Thm {
  fact_nproduct_c.get()
}

///|
/// NPRODUCT_PAIRUP_INDUCT
fn step_25() -> Unit raise {
  let t283 = @simp.asm_rewrite_tac(@list.List([]))
  let t282 = @tactics.match_mp_tac(@pocklington.cong_mult())
  let t281 = @simp.asm_rewrite_tac(@list.List([@arith.mult_assoc(), @arith.exp()]))
  let t278 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n == SUC(n - 1)")))
  let t280 = @tactics.first_assum(fn(x279 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s276 = @tactics.subst1_tac(x275)
      fn(x277 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s276(x277)
      }
    })(t278(x279))
  })
  let t274 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.in_delete(), @arith.mult_clauses()]))
  let t273 = @simp.simp_tac(@list.List([@iterate.nproduct_clauses(), @sets.finite_insert(), @sets.finite_delete()]))
  let t270 = @simp.rewrite_rule(@list.List([@sets.has_size()]))
  let t272 = @tactics.first_x_assum(fn(x271 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s267 = @tactics.mp_tac(x266)
        fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s267(x268)
        }
      })(@bool.conjunct1(x269))
    })(t270(x271))
  })
  let t265 = @simp.expand_tac("s")
  let t263 = @meson.asm_meson_tac(@list.List([@arith.mult_sym()]))
  let t257 = @term_syntax.parse_term("(x : A)")
  let t258 = @list.List([@term_syntax.parse_term("(a : A)"), t257])
  let t262 = @tactics.disch_then(fn(x261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s255 = @tactics.mp_tac(x254)
        fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s255(x256)
        }
      })(((x259 : @kernel.Thm) => @bool.specl(t258, x259))(x260))
    })(@bool.conjunct2(x261))
  })
  let t253 = @simp.rewrite_tac(@list.List([@theorems.exists_unique_thm()]))
  let t249 = @kernel.assume_rule(@term_syntax.parse_term("IN((b : A), (s : (A) -> Bool))"))
  let t252 = @tactics.first_x_assum(fn(x251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s247 = @tactics.mp_tac(x246)
      fn(x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s247(x248)
      }
    })((fn(x250 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x250)(t249)
    })(x251))
  })
  let t245 = @list.List([@meson.asm_meson_tac(@list.List([@arith.mult_sym()])), @tactics.all_tac])
  let t244 = @tactics.disch_then(fn(x241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s242 = @tactics.subst_all_tac(x241)
    fn(x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s242(x243)
    }
  })
  let t240 = @simp.asm_rewrite_tac(@list.List([]))
  let t239 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t238 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t237 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t236 = @simp.rewrite_tac(@list.List([@theorems.exists_unique()]))
  let t232 = @kernel.assume_rule(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"))
  let t235 = @tactics.first_assum(fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s230 = @tactics.mp_tac(x229)
      fn(x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s230(x231)
      }
    })((fn(x233 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x233)(t232)
    })(x234))
  })
  let t228 = @simp.asm_rewrite_tac(@list.List([@sets.in_delete()]))
  let t227 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t226 = @simp.asm_rewrite_tac(@list.List([]))
  let t225 = @simp.simp_tac(@list.List([@sets.has_size(), @sets.finite_insert(), @sets.card_clauses(), @sets.finite_delete(), @theorems.imp_conj(), @sets.in_delete(), @sets.in_insert()]))
  let t224 = @tactics.first_x_assum(fn(x215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x215
    @simp.gen_rewrite_tac(fn(x223 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x217 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s218 = @equal.land_conv(x217)
        fn(x219 : @kernel.Term) -> @kernel.Thm raise {
          s218(x219)
        }
      })((fn(x220 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s221 = @equal.land_conv(x220)
        fn(x222 : @kernel.Term) -> @kernel.Thm raise {
          s221(x222)
        }
      })(x223))
    }, @list.List([@equal.sym(th)]))
  })
  let t264 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("HAS_SIZE((s : (A) -> Bool), 2 * (n : Num))")), t224), t225), t226), @int.arith_tac), @tactics.all_tac])), t227), t228), @tactics.strip_tac), t235), t236), t237), t238), @tactics.strip_tac), @tactics.conj_tac), t239), t240), @tactics.conj_tac), t244), t245), t252), t253), t262), t263), @tactics.all_tac])
  let t214 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t213 = @tactics.subgoal_then(@term_syntax.parse_term("(s : (A) -> Bool) == INSERT((a : A), INSERT((b : A), DELETE(DELETE(s, a), b)))"), fn(x212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s210 = @tactics.assume_tac(x209)
      fn(x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s210(x211)
      }
    })(@equal.sym(x212))
  })
  let t204 = @term_syntax.parse_term("(k : Num)")
  let t205 = @list.List([@term_syntax.parse_term("DELETE(DELETE((s : (A) -> Bool), (a : A)), (b : A))"), t204])
  let t208 = @tactics.disch_then(fn(x207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s202 = @tactics.mp_tac(x201)
      fn(x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s202(x203)
      }
    })(((x206 : @kernel.Thm) => @bool.specl(t205, x206))(x207))
  })
  let t200 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(@tactics.strip_assume_tac))
  let t199 = @simp.rewrite_tac(@list.List([@theorems.exists_unique()]))
  let t198 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("IN((a : A), (s : (A) -> Bool))"))]))
  let t194 = @term_syntax.parse_term("(a : A)")
  let t197 = @tactics.first_assum(fn(x196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s192 = @tactics.mp_tac(x191)
      fn(x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s192(x193)
      }
    })(((x195 : @kernel.Thm) => @bool.spec(t194, x195))(x196))
  })
  let t190 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n - 1 < n"))]))
  let t186 = @term_syntax.parse_term("(n : Num) - 1")
  let t189 = @tactics.first_x_assum(fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s184 = @tactics.mp_tac(x183)
      fn(x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s184(x185)
      }
    })(((x187 : @kernel.Thm) => @bool.spec(t186, x187))(x188))
  })
  let t180 = @simp.gen_rewrite_rule(fn(x179 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x179
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t177 = @term_syntax.parse_term("(a : A)")
  let t182 = @tactics.first_x_assum(fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x178 : @kernel.Thm) => @tactics.x_choose_tac(t177, x178))(t180(x181))
  })
  let t176 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size_0(), @int.arith_rule(@term_syntax.parse_term("(2 * (n : Num) == 0) == (n == 0)")), @sets.has_size()])), @tactics.all_tac])
  let t175 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t174 = @list.List([@simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @sets.has_size_0(), @iterate.nproduct_clauses(), @arith.exp(), @pocklington.cong_refl()])), @tactics.all_tac])
  let t173 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t172 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (A) -> Bool)"))
  let t171 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t170 = @tactics.match_mp_tac(@arith.num_wf())
  let t284 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t170), t171), @tactics.disch_tac), t172), @tactics.gen_tac), t173), t174), t175), t176), @tactics.strip_tac), t182), t189), t190), t197), t198), t199), t200), t208), t213), t214), @tactics.ants_tac), t264), @tactics.disch_tac), t265), t272), t273), t274), t280), t281), @tactics.disch_tac), t282), t283)
  nproduct_pairup_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Num, ∀ r : Num, ∀ n : Num, ∀ s : (A) -> Bool, ∀ k : Num, HAS_SIZE(s, 2 * n) && (∀ x : A, IN(x, s) → existsunique((y : A) => IN(y, s) && !(y == x) && op_eq_eq(f(x) * f(y), k, mod(r)))) → op_eq_eq(nproduct(s, f), EXP(k, n), mod(r))"), t284))
}

///|
let nproduct_pairup_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPRODUCT_PAIRUP_INDUCT")

///|
/// `NPRODUCT_PAIRUP_INDUCT`
pub fn nproduct_pairup_induct() -> @kernel.Thm {
  nproduct_pairup_induct_c.get()
}

///|
/// QUADRATIC_NONRESIDUE_FACT
fn step_26() -> Unit raise {
  let t310 = @meson.asm_meson_tac(@list.List([is_quadratic_residue(), @arith.exp_2()]))
  let t309 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t308 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t307 = @simp.asm_rewrite_tac(@list.List([]))
  let t306 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t303 = @term_syntax.parse_term("(x : Num)")
  let t304 = @term_syntax.parse_term("(p : Num)")
  let t305 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t304, t303]), @pocklington.cong_solve_unique_nontrivial()))
  let t302 = @tactics.repeat_tac(@tactics.strip_tac)
  let t300 = @int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) → ((x : Num) <= p - 1) == (x < p)"))
  let t301 = @simp.asm_simp_tac(@list.List([@iterate.in_numseg(), @int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == (0 < x)")), t300]))
  let t299 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t298 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t296 = @simp.rewrite_tac(@list.List([@sets.has_size(), @iterate.finite_numseg(), @iterate.card_numseg(), @arith.add_sub()]))
  let t295 = @simp.simp_tac(@list.List([@arith.suc_sub1(), @arith.div_mult(), @calc_num.arith()]))
  let t292 = @simp.gen_rewrite_rule(fn(x291 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x291
  }, @list.List([@arith.odd_exists()]))
  let t293 = @tactics.choose_then(fn(x288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s289 = @tactics.subst1_tac(x288)
    fn(x290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s289(x290)
    }
  })
  let t297 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t293(t292(x294))
  }), t295), t296), @tactics.all_tac])
  let t287 = @tactics.match_mp_tac(nproduct_pairup_induct())
  let t286 = @simp.once_rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t285 = @simp.rewrite_tac(@list.List([fact_nproduct()]))
  let t311 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t285), t286), t287), @tactics.conj_tac), t297), t298), t299), t301), t302), t305), t306), t307), t308), @tactics.ap_term_tac), t309), t310)
  quadratic_nonresidue_fact_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && ODD(p) && coprime((a, p)) && !is_quadratic_residue(a, mod(p)) → op_eq_eq(EXP(a, DIV(p - 1, 2)), FACT(p - 1), mod(p))"), t311))
}

///|
let quadratic_nonresidue_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUADRATIC_NONRESIDUE_FACT")

///|
/// `QUADRATIC_NONRESIDUE_FACT`
pub fn quadratic_nonresidue_fact() -> @kernel.Thm {
  quadratic_nonresidue_fact_c.get()
}

///|
/// QUADRATIC_RESIDUE_FACT
fn step_27() -> Unit raise {
  let t372 = @meson.asm_meson_tac(@list.List([@prime.coprime_minus1(), @pocklington.cong_mult_lcancel(), @pocklington.cong_sym()]))
  let t371 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → SUC(p - 2) == p - 1"))]))
  let t370 = @simp.asm_simp_tac(@list.List([@arith.fact(), @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → p - 1 == SUC(p - 2)"))]))
  let t367 = @int.arith_rule(@term_syntax.parse_term("3 <= (p : Num) → SUC(DIV(p - 3, 2)) == DIV(p - 1, 2)"))
  let t368 = @equal.gsym(fact_nproduct())
  let t369 = @simp.asm_simp_tac(@list.List([@equal.gsym(@bool.conjunct2(@arith.exp())), t368, t367]))
  let t366 = @simp.asm_simp_tac(@list.List([@products.nproduct_delete(), @equal.gsym(@arith.mult_assoc()), @sets.in_delete(), @sets.finite_delete(), in_numseg_1(), @iterate.finite_numseg()]))
  let t363 = @drule.match_mp(@pocklington.cong_mult())
  let t365 = @tactics.disch_then(fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s361 = @tactics.mp_tac(x360)
      fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s361(x362)
      }
    })(t363(x364))
  })
  let t359 = @simp.asm_simp_tac(@list.List([@arith.exp_2(), @theorems.imp_imp(), @int.arith_rule(@term_syntax.parse_term("(x : Num) + (y : Num) == (p : Num) → p - x == y"))]))
  let t357 = @term_syntax.parse_term("(x : Num)")
  let t358 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t357]), quadratic_residue_pair_product()))
  let t355 = @meson.asm_meson_tac(@list.List([@pocklington.cong_solve_unique(), @prime.prime_0(), @prime.prime_coprime_lt()]))
  let t354 = @tactics.rule_assum_tac(@simp.once_rewrite_rule(@list.List([@arith.mult_sym()])))
  let t353 = @tactics.disch_then(fn(x350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s351 = @tactics.subst_all_tac(x350)
    fn(x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s351(x352)
    }
  })
  let t349 = @tactics.repeat_tac(@tactics.conj_tac)
  let t348 = @simp.asm_rewrite_tac(@list.List([]))
  let t347 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t346 = @simp.asm_rewrite_tac(@list.List([]))
  let t345 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t342 = @term_syntax.parse_term("(u : Num)")
  let t343 = @term_syntax.parse_term("(p : Num)")
  let t344 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t343, t342]), @pocklington.cong_solve_unique_nontrivial()))
  let t341 = @tactics.repeat_tac(@tactics.strip_tac)
  let t340 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Num)"))
  let t339 = @simp.asm_simp_tac(@list.List([@equal.gsym(even_div()), @arith.even_sub(), @calc_num.arith(), @arith.not_even()]))
  let t338 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(p : Num) - 1 - 1 - 1 == p - 3"))]))
  let t356 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.has_size(), @sets.finite_delete(), @iterate.finite_numseg(), in_numseg_1(), @sets.card_delete(), @sets.in_delete(), @iterate.card_numseg_1()])), t338), t339), t340), t341), t344), t345), t346), t347), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.eq_tac), @tactics.strip_tac), t348), t349), t353), t354), t355), @tactics.all_tac])
  let t333 = @term_syntax.parse_term("(a : Num)")
  let t334 = @term_syntax.parse_term("DELETE(DELETE(op_dot_dot(1, (p : Num) - 1), (x : Num)), (y : Num))")
  let t335 = @term_syntax.parse_term("DIV((p : Num) - 3, 2)")
  let t336 = @term_syntax.parse_term("(p : Num)")
  let t337 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(i : Num) => i"), t336, t335, t334, t333]), nproduct_pairup_induct()))
  let t332 = @list.List([@meson.asm_meson_tac(@list.List([@arith.odd_add()])), @tactics.all_tac])
  let t331 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Num) == (y : Num))"), fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s329 = @tactics.assume_tac(x328)
    fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s329(x330)
    }
  })
  let t326 = @term_syntax.parse_term("(y : Num)")
  let t327 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t326]))
  let t325 = @simp.asm_simp_tac(@list.List([@arith.exp_2(), is_quadratic_residue_pair(), @theorems.left_imp_exists_thm()]))
  let t324 = @tactics.undisch_tac(@term_syntax.parse_term("is_quadratic_residue((a : Num), mod((p : Num)))"))
  let t322 = @tactics.undisch_tac(@term_syntax.parse_term("!((p : Num) == 2)"))
  let t321 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t320 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 2"))
  let t319 = @tactics.undisch_tac(@term_syntax.parse_term("ODD((p : Num))"))
  let t317 = @drule.match_mp(@prime.prime_ge_2())
  let t323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s315 = @tactics.mp_tac(x314)
      fn(x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s315(x316)
      }
    })(t317(x318))
  }), t319), t320), t321), t322), @int.arith_tac), @tactics.all_tac])
  let t313 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= (p : Num) && !(p == 0)"), @tactics.strip_assume_tac)
  let t312 = @simp.once_rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t373 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t312), t313), t323), t324), t325), t327), @tactics.strip_tac), t331), t332), t337), @tactics.ants_tac), t356), t358), t359), t365), t366), t369), t370), t371), t372)
  quadratic_residue_fact_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && ODD(p) && coprime((a, p)) && is_quadratic_residue(a, mod(p)) → op_eq_eq(EXP(a, DIV(p - 1, 2)), FACT(p - 2), mod(p))"), t373))
}

///|
let quadratic_residue_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUADRATIC_RESIDUE_FACT")

///|
/// `QUADRATIC_RESIDUE_FACT`
pub fn quadratic_residue_fact() -> @kernel.Thm {
  quadratic_residue_fact_c.get()
}

///|
/// WILSON_LEMMA
fn step_28() -> Unit raise {
  let t389 = @meson.asm_meson_tac(@list.List([is_quadratic_residue(), @prime.coprime_sym(), @prime.coprime_1(), @pocklington.cong_refl(), @arith.exp_one(), @pocklington.cong_sym()]))
  let t387 = @term_syntax.parse_term("(p : Num)")
  let t388 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("1"), t387]), quadratic_residue_fact()))
  let t385 = @tactics.conv_tac(@pocklington.cong_conv)
  let t386 = @list.List([@tactics.then_tac(@tactics.conv_tac(@calc_num.num_reduce_conv), t385), @tactics.all_tac])
  let t381 = @drule.match_mp(@prime.prime_odd())
  let t382 = @tactics.disj_cases_then2(fn(x375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s376 = @tactics.subst_all_tac(x375)
    fn(x377 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s376(x377)
    }
  }, fn(x378 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s379 = @tactics.assume_tac(x378)
    fn(x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s379(x380)
    }
  })
  let t384 = @tactics.first_assum(fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t382(t381(x383))
  })
  let t374 = @simp.once_rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t390 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t374), t384), t386), t388), t389)
  wilson_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → op_eq_eq(FACT(p - 2), 1, mod(p))"), t390))
}

///|
let wilson_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WILSON_LEMMA")

///|
/// `WILSON_LEMMA`
pub fn wilson_lemma() -> @kernel.Thm {
  wilson_lemma_c.get()
}

///|
/// WILSON_IMP
fn step_29() -> Unit raise {
  let t391 = @meson.meson_tac(@list.List([@pocklington.cong_mult(), @arith.mult_clauses(), wilson_lemma(), @pocklington.cong_refl()]))
  let t392 = @tactics.then_tac(@simp.simp_tac(@list.List([@arith.fact(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → p - 1 == SUC(p - 2)"))])), t391)
  wilson_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, prime(p) → op_eq_eq(FACT(p - 1), p - 1, mod(p))"), t392))
}

///|
let wilson_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WILSON_IMP")

///|
/// `WILSON_IMP`
pub fn wilson_imp() -> @kernel.Thm {
  wilson_imp_c.get()
}

///|
/// WILSON
fn step_30() -> Unit raise {
  let t438 = @meson.asm_meson_tac(@list.List([@prime.prime_1()]))
  let t439 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.divides_one()])), t438)
  let t437 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n - 1 + 1 == n"))]))
  let t436 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) - 1"))
  let t440 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@prime.divides_add_revr()), t436), t437), t439])
  let t435 = @tactics.subgoal_then(@term_syntax.parse_term("divides((p : Num), 1)"), fn(x432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s433 = @tactics.mp_tac(x432)
    fn(x434 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s433(x434)
    }
  })
  let t430 = @simp.asm_rewrite_tac(@list.List([]))
  let t429 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t428 = @tactics.match_mp_tac(@pocklington.cong_divides_modulus())
  let t431 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_divides()), t428), t429), t430), @tactics.all_tac])
  let t427 = @tactics.subgoal_then(@term_syntax.parse_term("divides((p : Num), FACT((n : Num) - 1)) == divides(p, n - 1)"), fn(x424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s425 = @tactics.subst1_tac(x424)
    fn(x426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s425(x426)
    }
  })
  let t423 = @tactics.disch_then(fn(x421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x421
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t420 = @simp.asm_simp_tac(@list.List([@equal.gsym(@prime.divides_fact_prime())]))
  let t417 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) < (y : Num) → x <= y - 1")))
  let t419 = @tactics.disch_then(fn(x418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x414 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s415 = @tactics.mp_tac(x414)
      fn(x416 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s415(x416)
      }
    })(t417(x418))
  })
  let t413 = @simp.asm_rewrite_tac(@list.List([]))
  let t412 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == (p : Num)"))
  let t411 = @simp.rewrite_tac(@list.List([@arith.le_lt()]))
  let t409 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t410 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@pocklington.cong_mod_0()])), t409), @tactics.all_tac])
  let t408 = @simp.asm_rewrite_tac(@list.List([]))
  let t407 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t404 = @drule.match_mp(@int.divides_le())
  let t406 = @tactics.first_assum(fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x401 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s402 = @tactics.mp_tac(x401)
      fn(x403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s402(x403)
      }
    })(t404(x405))
  })
  let t400 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t397 = @drule.match_mp(@prime.prime_factor())
  let t399 = @tactics.first_x_assum(fn(x398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s395 = @tactics.mp_tac(x394)
      fn(x396 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s395(x396)
      }
    })(t397(x398))
  })
  let t393 = @simp.simp_tac(@list.List([wilson_imp()]))
  let t441 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), @tactics.disch_tac), @tactics.eq_tac), t393), t399), t400), t406), t407), t408), t410), t411), t412), t413), t419), t420), t423), t427), t431), @tactics.disch_tac), t435), t440)
  wilson_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, !(p == 1) → prime(p) == op_eq_eq(FACT(p - 1), p - 1, mod(p))"), t441))
}

///|
let wilson_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WILSON")

///|
/// `WILSON`
pub fn wilson() -> @kernel.Thm {
  wilson_c.get()
}

///|
/// EULER_CRITERION
fn step_31() -> Unit raise {
  let t454 = @meson.asm_meson_tac(@list.List([wilson_lemma(), wilson_imp(), @pocklington.cong_trans(), @pocklington.cong_sym(), quadratic_residue_fact(), quadratic_nonresidue_fact()]))
  let t453 = @simp.rewrite_tac(@list.List([@class.cond_id(), @arith.exp(), @pocklington.cong_refl()]))
  let t452 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t448 = @drule.match_mp(@prime.prime_odd())
  let t449 = @tactics.disj_cases_then2(fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s443 = @tactics.subst_all_tac(x442)
    fn(x444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s443(x444)
    }
  }, fn(x445 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s446 = @tactics.assume_tac(x445)
    fn(x447 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s446(x447)
    }
  })
  let t451 = @tactics.first_assum(fn(x450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t449(t448(x450))
  })
  let t455 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t451), t452), t453), t454)
  euler_criterion_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, prime(p) && coprime((a, p)) → op_eq_eq(EXP(a, DIV(p - 1, 2)), if is_quadratic_residue(a, mod(p)) { 1 } else { p - 1 }, mod(p))"), t455))
}

///|
let euler_criterion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CRITERION")

///|
/// `EULER_CRITERION`
pub fn euler_criterion() -> @kernel.Thm {
  euler_criterion_c.get()
}

///|
/// GAUSS_LEMMA_1
fn step_32() -> Unit raise {
  let t542 = @term_syntax.parse_term("2 * (r : Num) + 1 == (p : Num)")
  let t543 = @term_syntax.parse_term("(j : Num) <= (r : Num)")
  let t544 = @tactics.map_every(fn(x539 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s540 = @tactics.undisch_tac(x539)
    fn(x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s540(x541)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num) <= (r : Num)"), t543, t542]))
  let t538 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → !(i + (j : Num) == 0)"))]))
  let t535 = @drule.match_mp(@int.divides_le())
  let t537 = @tactics.first_assum(fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x532 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s533 = @tactics.mp_tac(x532)
      fn(x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s533(x534)
      }
    })(t535(x536))
  })
  let t531 = @list.List([@meson.asm_meson_tac(@list.List([@int.coprime(), @prime.divides_refl(), @prime.prime_1()])), @tactics.all_tac])
  let t530 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.left_add_distrib()), @prime.prime_divprod_eq(), @prime.divides_refl()]))
  let t527 = @drule.match_mp(@pocklington.cong_divides())
  let t529 = @tactics.disch_then(fn(x528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s525 = @tactics.mp_tac(x524)
      fn(x526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s525(x526)
      }
    })(t527(x528))
  })
  let t523 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1())]))
  let t522 = @simp.asm_simp_tac(@list.List([@arith.mod_add_mod()]))
  let t518 = @term_syntax.parse_term("MOD")
  let t515 = @term_syntax.parse_term("(p : Num)")
  let t521 = @tactics.disch_then(fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x510 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s511 = @tactics.mp_tac(x510)
        fn(x512 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s511(x512)
        }
      })((fn(x516 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x513 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x514 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x513, x514)
          }
        })(x516)(t515)
      })(x517))
    })(((x519 : @kernel.Thm) => @equal.ap_term(t518, x519))(x520))
  })
  let t509 = @list.List([@meson.asm_meson_tac(@list.List([@int.cong_v1()])), @tactics.all_tac])
  let t508 = @tactics.disch_then(@tactics.disj_cases_then(fn(x505 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s506 = @tactics.mp_tac(x505)
    fn(x507 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s506(x507)
    }
  }))
  let t504 = @simp.asm_simp_tac(@list.List([@arith.division()]))
  let t501 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(if (a : Bool) { (x : Num) } else { (p : Num) - x }) == (if (b : Bool) { (y : Num) } else { p - y }) → x < p && y < p → x == y || x + y == p")))
  let t503 = @tactics.first_x_assum(fn(x502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s499 = @tactics.mp_tac(x498)
      fn(x500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s499(x500)
      }
    })(t501(x502))
  })
  let t497 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t496 = @tactics.match_mp_tac(@pocklington.cong_mult_lcancel())
  let t495 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) <= (r : Num) → i < 2 * r + 1"))])), @tactics.all_tac])))
  let t494 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t493 = @tactics.match_mp_tac(@pocklington.cong_imp_eq())
  let t492 = @tactics.repeat_tac(@tactics.strip_tac)
  let t491 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t489 = @term_syntax.parse_term("(j : Num)")
  let t490 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i : Num)"), t489]))
  let t487 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()])), @tactics.disch_tac)
  let t484 = @int.arith_rule(@term_syntax.parse_term("!(2 * (r : Num) + 1 <= (i : Num) && i <= r)"))
  let t485 = @meson.asm_meson_tac(@list.List([@int.divides_le(), @int.arith_rule(@term_syntax.parse_term("!(1 <= 0)")), t484]))
  let t486 = @list.List([@meson.asm_meson_tac(@list.List([@int.coprime(), @prime.divides_refl(), @prime.prime_1()])), t485])
  let t483 = @simp.asm_simp_tac(@list.List([@prime.prime_divprod_eq()]))
  let t482 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.divides_mod()), @prime.prime_imp_nz()]))
  let t481 = @simp.expand_tac("b")
  let t480 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@arith.division(), @arith.not_le(), @arith.sub_eq_0(), @prime.prime_0()]))])
  let t479 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)"))]))
  let t478 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.expand_tac("p"), @int.arith_tac)])
  let t477 = @tactics.repeat_tac(@tactics.strip_tac)
  let t476 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t475 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t488 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.expand_tac("f")), t475), @pair.let_tac), t476), t477), t478), t479), @class.cond_cases_tac), t480), t481), t482), t483), @tactics.strip_tac), t486), t487])
  let t474 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t473 = @simp.abbrev_tac(@term_syntax.parse_term("(f : (Num) -> Num) == ((x : Num) => LET((b : Num) => LET_END(if b <= (r : Num) { b } else { (p : Num) - b }), MOD((a : Num) * x, p)))"))
  let t472 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t471 = @tactics.match_mp_tac(@products.nproduct_injection())
  let t470 = @simp.rewrite_tac(@list.List([@trivia.i_def()]))
  let t469 = @simp.gen_rewrite_tac(fn(x468 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x462 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s463 = @equal.land_conv(x462)
      fn(x464 : @kernel.Term) -> @kernel.Thm raise {
        s463(x464)
      }
    })((fn(x465 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s466 = @equal.rand_conv(x465)
      fn(x467 : @kernel.Term) -> @kernel.Thm raise {
        s466(x467)
      }
    })(x468))
  }, @list.List([@equal.sym(@bool.conjunct1(@bool.spec_all(@trivia.i_o_id())))]))
  let t459 = @drule.match_mp(@prime.prime_imp_nz())
  let t461 = @tactics.first_assum(fn(x460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x456 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s457 = @tactics.assume_tac(x456)
      fn(x458 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s457(x458)
      }
    })(t459(x460))
  })
  let t545 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t461), t469), t470), t471), t472), t473), t474), @tactics.conj_tac), t488), t490), t491), t492), t493), t494), t495), t496), t497), t503), t504), t508), t509), t521), t522), t523), t529), t530), @tactics.strip_tac), t531), t537), t538), t544), @int.arith_tac)
  gauss_lemma_1_c.set(@tactics.prove(@term_syntax.parse_term("prime((p : Num)) && coprime(((a : Num), p)) && 2 * (r : Num) + 1 == p → nproduct(op_dot_dot(1, r), (x : Num) => LET((b : Num) => LET_END(if b <= r { b } else { p - b }), MOD(a * x, p))) == nproduct(op_dot_dot(1, r), (x : Num) => x)"), t545))
}

///|
let gauss_lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_LEMMA_1")

///|
/// `GAUSS_LEMMA_1`
pub fn gauss_lemma_1() -> @kernel.Thm {
  gauss_lemma_1_c.get()
}

///|
/// GAUSS_LEMMA_2
fn step_33() -> Unit raise {
  let t595 = @simp.rewrite_tac(@list.List([@pocklington.cong_refl()]))
  let t596 = @tactics.then_tac(@simp.simp_tac(@list.List([@products.nproduct_mul(), @iterate.finite_numseg(), @products.nproduct_const(), @iterate.card_numseg_1()])), t595)
  let t597 = @list.List([@simp.asm_simp_tac(@list.List([@pocklington.cong_mod(), @prime.prime_imp_nz(), cong_nproduct(), @iterate.finite_numseg()])), t596])
  let t594 = @tactics.exists_tac(@term_syntax.parse_term("nproduct(op_dot_dot(1, (r : Num)), (x : Num) => (a : Num) * x)"))
  let t593 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t591 = @meson.meson_tac(@list.List([@arith.not_lt()]))
  let t590 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t589 = @simp.expand_tac("s")
  let t588 = @tactics.match_mp_tac(@pocklington.eq_imp_cong())
  let t587 = @simp.simp_tac(@list.List([nproduct_delta_const(), @iterate.finite_numseg()]))
  let t592 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@class.cond_swap())])), t587), t588), @tactics.ap_term_tac), @tactics.ap_term_tac), t589), t590), t591), @tactics.all_tac])
  let t586 = @tactics.match_mp_tac(@pocklington.cong_mult())
  let t585 = @simp.asm_simp_tac(@list.List([@products.nproduct_mul(), @iterate.finite_numseg()]))
  let t582 = @term_syntax.parse_term("1")
  let t583 = @tactics.map_every(fn(x579 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s580 = @tactics.exists_tac(x579)
    fn(x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s580(x581)
    }
  }, @list.List([@term_syntax.parse_term("(b : Num)"), t582]))
  let t578 = @tactics.disch_then(fn(x577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t576 = @simp.asm_simp_tac(@list.List([@arith.lt_imp_le(), @int.cong(), @pocklington.nat_mod()]))
  let t573 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → !(p == 0)")))
  let t571 = @drule.match_mp(@arith.division())
  let t568 = @term_syntax.parse_term("(a : Num) * (i : Num)")
  let t575 = @tactics.disch_then(fn(x574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x572 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s566 = @tactics.mp_tac(x565)
          fn(x567 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s566(x567)
          }
        })(((x569 : @kernel.Thm) => @bool.spec(t568, x569))(x570))
      })(t571(x572))
    })(t573(x574))
  })
  let t562 = @drule.match_mp(@prime.prime_ge_2())
  let t564 = @tactics.first_assum(fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s560 = @tactics.mp_tac(x559)
      fn(x561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s560(x561)
      }
    })(t562(x563))
  })
  let t558 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((b : Num) <= (p : Num) && (1 <= p || b == 0)) == (b <= p)"))]))
  let t557 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_rcancel(), @arith.mult_clauses(), @pocklington.cong_refl()]))
  let t556 = @tactics.match_mp_tac(@pocklington.cong_sub())
  let t555 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib()]))
  let t554 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @pocklington.cong_refl()]))
  let t553 = @simp.asm_rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t552 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t551 = @simp.expand_tac("s")
  let t550 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t549 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t584 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(cong_nproduct()), t549), t550), @tactics.strip_tac), @pair.let_tac), t551), t552), t553), @class.cond_cases_tac), t554), t555), t556), t557), t558), t564), t575), t576), t578), t583), @int.arith_tac), @tactics.all_tac])
  let t548 = @tactics.exists_tac(@term_syntax.parse_term("nproduct(op_dot_dot(1, (r : Num)), (x : Num) => (if IN(x, (s : (Num) -> Bool)) { 1 } else { (p : Num) - 1 }) * MOD((a : Num) * x, p))"))
  let t547 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t546 = @simp.abbrev_tac(@term_syntax.parse_term("(s : (Num) -> Bool) == {(x : Num) | IN(x, op_dot_dot(1, (r : Num))) && MOD((a : Num) * x, (p : Num)) <= r}"))
  let t598 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t546), t547), t548), @tactics.conj_tac), t584), t585), t586), @tactics.conj_tac), t592), t593), t594), @tactics.conj_tac), t597)
  gauss_lemma_2_c.set(@tactics.prove(@term_syntax.parse_term("prime((p : Num)) && coprime(((a : Num), p)) && 2 * (r : Num) + 1 == p → op_eq_eq(nproduct(op_dot_dot(1, r), (x : Num) => LET((b : Num) => LET_END(if b <= r { b } else { p - b }), MOD(a * x, p))), EXP(p - 1, CARD({(x : Num) | IN(x, op_dot_dot(1, r)) && r < MOD(a * x, p)})) * (EXP(a, r) * nproduct(op_dot_dot(1, r), (x : Num) => x)), mod(p))"), t598))
}

///|
let gauss_lemma_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_LEMMA_2")

///|
/// `GAUSS_LEMMA_2`
pub fn gauss_lemma_2() -> @kernel.Thm {
  gauss_lemma_2_c.get()
}

///|
/// GAUSS_LEMMA_3
fn step_34() -> Unit raise {
  let t618 = @simp.asm_rewrite_tac(@list.List([]))
  let t617 = @tactics.match_mp_tac(@prime.prime_coprime_lt())
  let t616 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t615 = @tactics.repeat_tac(@tactics.strip_tac)
  let t614 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @iterate.finite_numseg()]))
  let t613 = @tactics.match_mp_tac(coprime_nproduct())
  let t612 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t610 = @simp.simp_rule(@list.List([gauss_lemma_1()]))(gauss_lemma_2())
  let t611 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @equal.gsym(@arith.mult_assoc()), t610]))
  let t609 = @tactics.exists_tac(@term_syntax.parse_term("nproduct(op_dot_dot(1, (r : Num)), (x : Num) => x)"))
  let t608 = @tactics.match_mp_tac(@pocklington.cong_mult_rcancel())
  let t606 = @simp.expand_tac("p")
  let t605 = @tactics.subgoal_then(@term_syntax.parse_term("(r : Num) == DIV((p : Num) - 1, 2)"), fn(x603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x603
    @simp.asm_simp_tac(@list.List([th, euler_criterion()]))
  })
  let t602 = @simp.rewrite_tac(@list.List([@pocklington.cong_refl()]))
  let t607 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_mult()), t602), t605), t606), @int.arith_tac), @tactics.all_tac])
  let t601 = @simp.once_rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t600 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num) - 1, CARD({(x : Num) | IN(x, op_dot_dot(1, (r : Num))) && r < MOD((a : Num) * x, p)})) * EXP(a, r)"))
  let t599 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t619 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t599), t600), t601), @tactics.conj_tac), t607), t608), t609), t611), t612), t613), t614), t615), t616), t617), t618), @int.asm_arith_tac)
  gauss_lemma_3_c.set(@tactics.prove(@term_syntax.parse_term("prime((p : Num)) && coprime(((a : Num), p)) && 2 * (r : Num) + 1 == p → op_eq_eq(EXP(p - 1, CARD({(x : Num) | IN(x, op_dot_dot(1, r)) && r < MOD(a * x, p)})) * (if is_quadratic_residue(a, mod(p)) { 1 } else { p - 1 }), 1, mod(p))"), t619))
}

///|
let gauss_lemma_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_LEMMA_3")

///|
/// `GAUSS_LEMMA_3`
pub fn gauss_lemma_3() -> @kernel.Thm {
  gauss_lemma_3_c.get()
}

///|
/// GAUSS_LEMMA_4
fn step_35() -> Unit raise {
  let t624 = @simp.asm_simp_tac(@list.List([cong_exp_minus1(), @pocklington.cong_mult(), @pocklington.cong_refl(), @prime.prime_ge_2()]))
  let t623 = @simp.once_rewrite_tac(@list.List([@pocklington.cong_sym()]))
  let t622 = @simp.asm_simp_tac(@list.List([gauss_lemma_3()]))
  let t621 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num) - 1, CARD({(x : Num) | IN(x, op_dot_dot(1, (r : Num))) && r < MOD((a : Num) * x, p)})) * (if is_quadratic_residue(a, mod(p)) { 1 } else { p - 1 })"))
  let t620 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t625 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t620), t621), t622), t623), t624)
  gauss_lemma_4_c.set(@tactics.prove(@term_syntax.parse_term("prime((p : Num)) && coprime(((a : Num), p)) && 2 * (r : Num) + 1 == p → op_eq_eq((if EVEN(CARD({(x : Num) | IN(x, op_dot_dot(1, r)) && r < MOD(a * x, p)})) { 1 } else { p - 1 }) * (if is_quadratic_residue(a, mod(p)) { 1 } else { p - 1 }), 1, mod(p))"), t625))
}

///|
let gauss_lemma_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_LEMMA_4")

///|
/// `GAUSS_LEMMA_4`
pub fn gauss_lemma_4() -> @kernel.Thm {
  gauss_lemma_4_c.get()
}

///|
/// GAUSS_LEMMA
fn step_36() -> Unit raise {
  let t642 = @meson.meson_tac(@list.List([@pocklington.cong_sym()]))
  let t641 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t640 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_simp_tac(@list.List([@pocklington.cong_refl()]))))
  let t638 = @drule.match_mp(gauss_lemma_4())
  let t643 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x639 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x635 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s636 = @tactics.mp_tac(x635)
      fn(x637 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s636(x637)
      }
    })(t638(x639))
  }), t640), t641), t642)
  let t633 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((r : Num) == 0)")), @int.arith_tac)
  let t634 = @list.List([@simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(r : Num) == 0")), @calc_num.arith(), @prime.prime_1()])), t633])
  let t632 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0"))
  let t631 = @simp.expand_tac("p")
  let t644 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.conjuncts_then2(fn(x628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s629 = @tactics.mp_tac(x628)
    fn(x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s629(x630)
    }
  }, @tactics.strip_assume_tac)), t631), t632), t634), t643])
  let t627 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t626 = @tactics.match_mp_tac(cong_cond_lemma())
  let t645 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t626), t627), @tactics.conj_tac), t644)
  gauss_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ p : Num, ∀ r : Num, prime(p) && coprime((a, p)) && 2 * r + 1 == p → is_quadratic_residue(a, mod(p)) == EVEN(CARD({(x : Num) | IN(x, op_dot_dot(1, r)) && r < MOD(a * x, p)}))"), t645))
}

///|
let gauss_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_LEMMA")

///|
/// `GAUSS_LEMMA`
pub fn gauss_lemma() -> @kernel.Thm {
  gauss_lemma_c.get()
}

///|
/// GAUSS_LEMMA_SYM
fn step_37() -> Unit raise {
  let t736 = @drule.match_mp(@arith.division())
  let t733 = @term_syntax.parse_term("(q : Num) * (x : Num)")
  let t738 = @tactics.disch_then(fn(x737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s731 = @tactics.mp_tac(x730)
        fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s731(x732)
        }
      })(((x734 : @kernel.Thm) => @bool.spec(t733, x734))(x735))
    })(t736(x737))
  })
  let t728 = @kernel.assume_rule(@term_syntax.parse_term("prime((p : Num))"))
  let t729 = @tactics.mp_tac(@drule.match_mp(@prime.prime_imp_nz())(t728))
  let t725 = @list.List([@simp.asm_simp_tac(@list.List([@arith.le_mult_rcancel(), @prime.prime_imp_nz()])), @tactics.all_tac])
  let t726 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(DIV((q : Num) * (x : Num), (p : Num)) + 2) * p <= (y : Num) * p"), fn(x722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s723 = @tactics.mp_tac(x722)
    fn(x724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s723(x724)
    }
  }), t725)
  let t721 = @list.List([@simp.asm_simp_tac(@list.List([@arith.le_mult_rcancel(), @prime.prime_imp_nz()])), @tactics.all_tac])
  let t727 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(y : Num) * (p : Num) <= DIV((q : Num) * (x : Num), p) * p"), fn(x718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s719 = @tactics.mp_tac(x718)
    fn(x720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s719(x720)
    }
  }), t721), t726])
  let t717 = @tactics.repeat_tac(@tactics.strip_tac)
  let t716 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((x : Num) <= (y : Num)) && !(y + 2 <= x) → x == y + 1")))
  let t714 = @meson.asm_meson_tac(@list.List([@arith.division(), @prime.prime_imp_nz()]))
  let t712 = @term_syntax.parse_term("DIV((q : Num) * (x : Num), (p : Num))")
  let t713 = @tactics.map_every(fn(x709 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s710 = @tactics.exists_tac(x709)
    fn(x711 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s710(x711)
    }
  }, @list.List([@term_syntax.parse_term("(p : Num)"), t712]))
  let t708 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("∀ p : Num, ∀ d : Num, 2 * (r : Num) + 1 == p && p * (d + 1) <= d * p + (m : Num) + r → r < m")))
  let t715 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s706 = @tactics.subst_all_tac(x705)
    fn(x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s706(x707)
    }
  }), t708), t713), t714)])
  let t739 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b"))), @tactics.conj_tac), t715), t716), t717), t727), t729), t738), @int.asm_arith_tac)
  let t704 = @tactics.undisch_tac(@term_syntax.parse_term("2 * (r : Num) + 1 == (p : Num)"))
  let t703 = @tactics.first_assum(@tactics.conjuncts_then2(fn(x697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s698 = @tactics.subst1_tac(x697)
    fn(x699 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s698(x699)
    }
  }, fn(x700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s701 = @tactics.mp_tac(x700)
    fn(x702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s701(x702)
    }
  }))
  let t694 = @drule.match_mp(@arith.division())
  let t691 = @term_syntax.parse_term("(q : Num) * (x : Num)")
  let t696 = @tactics.disch_then(fn(x695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x693 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x688 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s689 = @tactics.mp_tac(x688)
        fn(x690 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s689(x690)
        }
      })(((x692 : @kernel.Thm) => @bool.spec(t691, x692))(x693))
    })(t694(x695))
  })
  let t687 = @kernel.assume_rule(@term_syntax.parse_term("prime((p : Num))"))
  let t740 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@drule.match_mp(@prime.prime_imp_nz())(t687)), t696), t703), t704), @int.arith_tac), t739])
  let t685 = @term_syntax.parse_term("(y : Num)")
  let t686 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t685]))
  let t741 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_pair_thm(), @pair.forall_pair_thm()]))), t686), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.eq_tac), @tactics.disch_tac), t740)
  let t682 = @simp.simp_tac(@list.List([@arith.lt_mult_lcancel(), @int.arith_rule(@term_syntax.parse_term("(x : Num) < (y : Num) → x + 1 <= y"))]))
  let t679 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(2 * (r : Num) + 1) * (d : Num) + r < (2 * (s : Num) + 1) * r → 2 * r * d < 2 * r * s")))
  let t681 = @tactics.disch_then(fn(x680 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x676 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s677 = @tactics.mp_tac(x676)
      fn(x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s677(x678)
      }
    })(t679(x680))
  })
  let t683 = @tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x673 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s674 = @simp.expand_tac(x673)
    fn(x675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s674(x675)
    }
  }, @list.List(["p", "q"])), t681), t682)
  let t672 = @meson.asm_meson_tac(@list.List([@prime.prime_imp_nz(), @arith.lt_add_lcancel(), @arith.division()]))
  let t671 = @simp.gen_rewrite_tac(fn(x670 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x664 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s665 = @equal.land_conv(x664)
      fn(x666 : @kernel.Term) -> @kernel.Thm raise {
        s665(x666)
      }
    })((fn(x667 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s668 = @equal.once_depth_conv(x667)
      fn(x669 : @kernel.Term) -> @kernel.Thm raise {
        s668(x669)
      }
    })(x670))
  }, @list.List([@arith.mult_sym()]))
  let t663 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t662 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num) * (x : Num)"))
  let t684 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.lte_trans()), t662), t663), t671), t672), t683])
  let t661 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) * DIV((q : Num) * (x : Num), p) + (r : Num) < q * r"), fn(x658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s659 = @tactics.mp_tac(x658)
    fn(x660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s659(x660)
    }
  })
  let t657 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t656 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg(), @int.arith_rule(@term_syntax.parse_term("1 <= (x : Num) + 1"))]))
  let t655 = @tactics.match_mp_tac(card_subcross_determinate())
  let t742 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t655), t656), t657), @tactics.strip_tac), t661), t684), t741])
  let t654 = @tactics.exists_tac(@term_syntax.parse_term("CARD({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, (r : Num))) && IN(y, op_dot_dot(1, (s : Num))) && y == DIV((q : Num) * x, (p : Num)) + 1 && r < MOD(q * x, p)})"))
  let t653 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t652 = @tactics.disch_then(fn(x651 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t650 = @simp.asm_simp_tac(@list.List([]))
  let t647 = @term_syntax.parse_term("(r : Num)")
  let t648 = @term_syntax.parse_term("(p : Num)")
  let t649 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : Num)"), t648, t647]), gauss_lemma()))
  let t646 = @tactics.repeat_tac(@tactics.strip_tac)
  let t743 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])), t646), t649), t650), t652), @tactics.ap_term_tac), t653), t654), @tactics.conj_tac), t742)
  gauss_lemma_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ r : Num, ∀ s : Num, prime(p) && prime(q) && coprime((p, q)) && 2 * r + 1 == p && 2 * s + 1 == q → is_quadratic_residue(q, mod(p)) == EVEN(CARD({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, r)) && IN(y, op_dot_dot(1, s)) && q * x < p * y && p * y <= q * x + r}))"), t743))
}

///|
let gauss_lemma_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_LEMMA_SYM")

///|
/// `GAUSS_LEMMA_SYM`
pub fn gauss_lemma_sym() -> @kernel.Thm {
  gauss_lemma_sym_c.get()
}

///|
/// GAUSS_LEMMA_SYM'
fn step_38() -> Unit raise {
  let t759 = @simp.rewrite_tac(@list.List([@sets.in_elim_pair_thm(), @theorems.conj_aci()]))
  let t758 = @simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm()]))
  let t757 = @simp.gen_rewrite_tac(fn(x754 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s755 = @equal.land_conv(x754)
    fn(x756 : @kernel.Term) -> @kernel.Thm raise {
      s755(x756)
    }
  }, @list.List([card_subcross_swap()]))
  let t753 = @tactics.disch_then(fn(x750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s751 = @tactics.subst1_tac(x750)
    fn(x752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s751(x752)
    }
  })
  let t749 = @simp.asm_rewrite_tac(@list.List([]))
  let t748 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t744 = @term_syntax.parse_term("(r : Num)")
  let t745 = @term_syntax.parse_term("(s : Num)")
  let t746 = @term_syntax.parse_term("(p : Num)")
  let t747 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : Num)"), t746, t745, t744]), gauss_lemma_sym()))
  let t760 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t747), t748), t749), t753), @tactics.ap_term_tac), t757), @tactics.ap_term_tac), t758), t759)
  gauss_lemma_sym_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ r : Num, ∀ s : Num, prime(p) && prime(q) && coprime((p, q)) && 2 * r + 1 == p && 2 * s + 1 == q → is_quadratic_residue(p, mod(q)) == EVEN(CARD({((x : Num), (y : Num)) | IN(x, op_dot_dot(1, r)) && IN(y, op_dot_dot(1, s)) && p * y < q * x && q * x <= p * y + s}))"), t760))
}

///|
let gauss_lemma_sym_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_LEMMA_SYM'")

///|
/// `GAUSS_LEMMA_SYM'`
pub fn gauss_lemma_sym_p() -> @kernel.Thm {
  gauss_lemma_sym_p_c.get()
}

///|
/// RECIPROCITY_SET_LEMMA
fn step_39() -> Unit raise {
  let t798 = @simp.asm_simp_tac(@list.List([@sets.card_union(), @sets.finite_union(), @sets.set_rule(@term_syntax.parse_term("(INTER((a : (_) -> Bool), UNION((b : (_) -> Bool), (c : (_) -> Bool))) == {}) == (INTER(a, b) == {} && INTER(a, c) == {})"))]))
  let t797 = @simp.rewrite_tac(@list.List([@lists.pairwise(), @sets.disjoint(), @lists.all()]))
  let t794 = @simp.gen_rewrite_rule(fn(x793 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x793
  }, @list.List([@lists.pairwise()]))
  let t796 = @tactics.first_x_assum(fn(x795 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s791 = @tactics.mp_tac(x790)
      fn(x792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s791(x792)
      }
    })(t794(x795))
  })
  let t789 = @tactics.disch_then(fn(x788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x785 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s786 = @tactics.subst1_tac(x785)
      fn(x787 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s786(x787)
      }
    })(@equal.sym(x788))
  })
  let t784 = @simp.simp_tac(@list.List([@sets.card_cross(), @iterate.card_numseg_1(), @iterate.finite_numseg()]))
  let t780 = @term_syntax.parse_term("(CARD : (((Num, Num)) -> Bool) -> Num)")
  let t783 = @tactics.first_x_assum(fn(x782 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x777 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s778 = @tactics.mp_tac(x777)
      fn(x779 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s778(x779)
      }
    })(((x781 : @kernel.Thm) => @equal.ap_term(t780, x781))(x782))
  })
  let t775 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t774 = @tactics.first_x_assum(fn(x773 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s771 = @tactics.subst_all_tac(x770)
      fn(x772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s771(x772)
      }
    })(@equal.sym(x773))
  })
  let t769 = @simp.simp_tac(@list.List([@sets.finite_cross(), @iterate.finite_numseg()]))
  let t768 = @tactics.exists_tac(@term_syntax.parse_term("CROSS(op_dot_dot(1, (r : Num)), op_dot_dot(1, (s : Num)))"))
  let t767 = @tactics.match_mp_tac(@sets.finite_subset())
  let t776 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t767), t768), t769), t774), t775), @tactics.all_tac])
  let t766 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((a : ((Num, Num)) -> Bool)) && FINITE((b : ((Num, Num)) -> Bool)) && FINITE((c : ((Num, Num)) -> Bool)) && FINITE((d : ((Num, Num)) -> Bool))"), @tactics.strip_assume_tac)
  let t765 = @tactics.subgoal_then(@term_syntax.parse_term("CARD((a : ((Num, Num)) -> Bool)) + (CARD((b : ((Num, Num)) -> Bool)) + (CARD((c : ((Num, Num)) -> Bool)) + CARD((d : ((Num, Num)) -> Bool)))) == (r : Num) * (s : Num)"), fn(x761 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x761
    let t764 = @tactics.conv_tac(@class.taut)
    let t763 = @simp.asm_rewrite_tac(@list.List([@arith.even_add(), @equal.gsym(@arith.not_even()), @arith.even_mult()]))
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@equal.ap_term(@term_syntax.parse_term("EVEN"), th)), t763), t764)
  })
  let t799 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t765), t766), t776), t783), t784), t789), t796), t797), t798)
  reciprocity_set_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : ((Num, Num)) -> Bool, ∀ b : ((Num, Num)) -> Bool, ∀ c : ((Num, Num)) -> Bool, ∀ d : ((Num, Num)) -> Bool, ∀ r : Num, ∀ s : Num, UNION(a, UNION(b, UNION(c, d))) == CROSS(op_dot_dot(1, r), op_dot_dot(1, s)) && PAIRWISE(DISJOINT, [a, b, c, d]) && CARD(b) == CARD(c) → (EVEN(CARD(a)) == EVEN(CARD(d))) == !(ODD(r) && ODD(s))"), t799))
}

///|
let reciprocity_set_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RECIPROCITY_SET_LEMMA")

///|
/// `RECIPROCITY_SET_LEMMA`
pub fn reciprocity_set_lemma() -> @kernel.Thm {
  reciprocity_set_lemma_c.get()
}

///|
/// RECIPROCITY_SIMPLE
fn step_40() -> Unit raise {
  let t861 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x860 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s858 = @tactics.subst_all_tac(x857)
      fn(x859 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s858(x859)
      }
    })(@equal.sym(x860))
  }))
  let t856 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) + (x : Num) < (y : Num) + a) == (x < y)"))]))
  let t855 = @simp.asm_simp_tac(@list.List([@arith.le_mult_lcancel(), @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (r : Num) → x <= r + 1"))]))
  let t854 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) && (v : Num) + (y + (z : Num)) < x + (u : Num) → y - x + z < u - v")))
  let t853 = @tactics.repeat_tac(@tactics.strip_tac)
  let t852 = @simp.rewrite_tac(@list.List([@arith.left_sub_distrib()]))
  let t851 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (x : Num) && x <= (y : Num) → 1 <= y + 1 - x && y + 1 - x <= y"))]))
  let t850 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) → y + 1 - (y + 1 - x) == x"))]))
  let t848 = @term_syntax.parse_term("(y : Num)")
  let t849 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t848]))
  let t847 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @iterate.in_numseg(), @pair.pair_eq()]))
  let t846 = @simp.simp_tac(@list.List([finite_subcross(), @iterate.finite_numseg()]))
  let t845 = @tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), ((r : Num) + 1 - x, (s : Num) + 1 - y)))")))
  let t862 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.bijections_card_eq()), t845), t846), t847), @tactics.conj_tac), t849), t850), t851), t852), t853), t854), t855), t856), t861), @int.asm_arith_tac)
  let t844 = @simp.expand_tac("p")
  let t843 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t842 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Num), op_dot_dot(1, (r : Num)))"))
  let t839 = @drule.match_mp(@int.divides_le())
  let t841 = @tactics.first_x_assum(fn(x840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x836 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s837 = @tactics.mp_tac(x836)
      fn(x838 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s837(x838)
      }
    })(t839(x840))
  })
  let t835 = @list.List([@meson.asm_meson_tac(@list.List([@prime.divides_refl(), @prime.prime_1(), @int.coprime()])), @tactics.all_tac])
  let t834 = @simp.asm_simp_tac(@list.List([@prime.prime_divprod_eq(), @prime.divides_refl()]))
  let t830 = @term_syntax.parse_term("divides((p : Num))")
  let t833 = @tactics.disch_then(fn(x832 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s828 = @tactics.mp_tac(x827)
      fn(x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s828(x829)
      }
    })(((x831 : @kernel.Thm) => @equal.ap_term(t830, x831))(x832))
  })
  let t826 = @tactics.subgoal_then(@term_syntax.parse_term("!((q : Num) * (x : Num) == (p : Num) * (y : Num))"), fn(x824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x824
    @tactics.then_tac(@tactics.mp_tac(th), @int.arith_tac)
  })
  let t823 = @simp.asm_simp_tac(@list.List([]))
  let t821 = @term_syntax.parse_term("IN((y : Num), op_dot_dot(1, (s : Num)))")
  let t822 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("IN((x : Num), op_dot_dot(1, (r : Num)))"), t821]))
  let t820 = @term_syntax.parse_term("(y : Num)")
  let t863 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t820])), t822), t823), t826), t833), t834), @tactics.strip_tac), t835), t841), t842), t843), t844), @int.arith_tac), @int.arith_tac, t862])
  let t819 = @simp.rewrite_tac(@list.List([@lists.pairwise(), @sets.disjoint(), @sets.extension(), @sets.not_in_empty(), @pair.forall_pair_thm(), @lists.all(), @sets.in_union(), @sets.in_cross(), @sets.in_elim_pair_thm(), @sets.in_inter()]))
  let t818 = @tactics.repeat_tac(@tactics.conj_tac)
  let t817 = @tactics.exists_tac(@term_syntax.parse_term("{((x : Num), (y : Num)) | IN(x, op_dot_dot(1, (r : Num))) && IN(y, op_dot_dot(1, (s : Num))) && (p : Num) * y + s < (q : Num) * x}"))
  let t816 = @tactics.exists_tac(@term_syntax.parse_term("{((x : Num), (y : Num)) | IN(x, op_dot_dot(1, (r : Num))) && IN(y, op_dot_dot(1, (s : Num))) && (q : Num) * x + r < (p : Num) * y}"))
  let t815 = @tactics.match_mp_tac(reciprocity_set_lemma())
  let t814 = @tactics.repeat_tac(@tactics.disch_then(fn(x811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s812 = @tactics.subst1_tac(x811)
    fn(x813 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s812(x813)
    }
  }))
  let t810 = @simp.asm_rewrite_tac(@list.List([]))
  let t809 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t808 = @simp.asm_rewrite_tac(@list.List([]))
  let t804 = @term_syntax.parse_term("(s : Num)")
  let t805 = @term_syntax.parse_term("(r : Num)")
  let t806 = @term_syntax.parse_term("(q : Num)")
  let t807 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t806, t805, t804]), gauss_lemma_sym_p()))
  let t800 = @term_syntax.parse_term("(s : Num)")
  let t801 = @term_syntax.parse_term("(r : Num)")
  let t802 = @term_syntax.parse_term("(q : Num)")
  let t803 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t802, t801, t800]), gauss_lemma_sym()))
  let t864 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t803), t807), t808), t809), t810), t814), t815), t816), t817), t818), t819), t863)
  reciprocity_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ r : Num, ∀ s : Num, prime(p) && prime(q) && coprime((p, q)) && 2 * r + 1 == p && 2 * s + 1 == q → (is_quadratic_residue(q, mod(p)) == is_quadratic_residue(p, mod(q))) == !(ODD(r) && ODD(s))"), t864))
}

///|
let reciprocity_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RECIPROCITY_SIMPLE")

///|
/// `RECIPROCITY_SIMPLE`
pub fn reciprocity_simple() -> @kernel.Thm {
  reciprocity_simple_c.get()
}

///|
/// RECIPROCITY_LEGENDRE
fn step_41() -> Unit raise {
  let t892 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_lneg(), @int.int_mul_rneg(), @int.int_neg_neg(), @int.int_mul_lid()]))
  let t891 = @class.asm_cases_tac(@term_syntax.parse_term("is_quadratic_residue((p : Num), mod((q : Num)))"))
  let t890 = @tactics.disch_then(fn(x889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t888 = @simp.simp_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) == (b : Bool)) == (a == !b)"))]))
  let t887 = @simp.asm_rewrite_tac(@list.List([]))
  let t885 = @term_syntax.parse_term("EVEN((s : Num))")
  let t886 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("EVEN((r : Num))"), t885]))
  let t884 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @arith.not_odd(), @int.int_pow_one()]))
  let t883 = @simp.asm_simp_tac(@list.List([@prime.distinct_prime_coprime(), @int.int_pow_neg(), @arith.even_mult(), legendre()]))
  let t879 = @term_syntax.parse_term("(s : Num)")
  let t880 = @term_syntax.parse_term("(r : Num)")
  let t881 = @term_syntax.parse_term("(q : Num)")
  let t882 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t881, t880, t879]), reciprocity_simple()))
  let t878 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (s : Num) + 1 - 1, 2) == s"))]))
  let t877 = @tactics.repeat_tac(@tactics.disch_then(fn(x874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x874
    let t876 = @tactics.assume_tac(@equal.sym(th))
    @tactics.then_tac(@tactics.subst1_tac(th), t876)
  }))
  let t873 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t871 = @term_syntax.parse_term("(s : Num)")
  let t872 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Num)"), t871]))
  let t870 = @simp.rewrite_tac(@list.List([@arith.odd_exists(), @theorems.left_imp_exists_thm(), @theorems.right_imp_forall_thm()]))
  let t868 = @term_syntax.parse_term("ODD((p : Num))")
  let t869 = @tactics.map_every(fn(x865 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s866 = @tactics.undisch_tac(x865)
    fn(x867 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s866(x867)
    }
  }, @list.List([@term_syntax.parse_term("ODD((q : Num))"), t868]))
  let t893 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t869), t870), t872), t873), t877), t878), t882), t883), t884), t886), t887), t888), t890), t891), t892)
  reciprocity_legendre_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, prime(p) && prime(q) && ODD(p) && ODD(q) && !(p == q) → legendre((p, q)) * legendre((q, p)) == pow(-int_of_num(1), DIV(p - 1, 2) * DIV(q - 1, 2))"), t893))
}

///|
let reciprocity_legendre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RECIPROCITY_LEGENDRE")

///|
/// `RECIPROCITY_LEGENDRE`
pub fn reciprocity_legendre() -> @kernel.Thm {
  reciprocity_legendre_c.get()
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
}
