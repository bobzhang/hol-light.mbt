// Translated from upstream EC/formulary_projective.ml; edit this file directly.

///|
/// pr_dbl_2007_bl
fn step_1() -> Unit raise {
  pr_dbl_2007_bl_c.set(@pair.new_definition(@term_syntax.parse_term("(pr_dbl_2007_bl : ((Ring[A], A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A))) == LET((xx : A) => LET_END(LET((zz : A) => LET_END(LET((t0 : A) => LET_END(LET((t1 : A) => LET_END(LET((w : A) => LET_END(LET((t2 : A) => LET_END(LET((s : A) => LET_END(LET((ss : A) => LET_END(LET((sss : A) => LET_END(LET((r : A) => LET_END(LET((rr : A) => LET_END(LET((t3 : A) => LET_END(LET((t4 : A) => LET_END(LET((t5 : A) => LET_END(LET((b : A) => LET_END(LET((t6 : A) => LET_END(LET((t7 : A) => LET_END(LET((h : A) => LET_END(LET((x3 : A) => LET_END(LET((t8 : A) => LET_END(LET((t9 : A) => LET_END(LET((t10 : A) => LET_END(LET((y3 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), sss)), ring_sub(f, t10, t9))), ring_mul(f, w, t8))), ring_mul(f, ring_of_num(f, 2), rr))), ring_sub(f, b, h))), ring_mul(f, h, s))), ring_sub(f, t6, t7))), ring_mul(f, ring_of_num(f, 2), b))), ring_pow(f, w, 2))), ring_sub(f, t5, rr))), ring_sub(f, t4, xx))), ring_pow(f, t3, 2))), ring_add(f, x1, r))), ring_pow(f, r, 2))), ring_mul(f, y1, s))), ring_mul(f, s, ss))), ring_pow(f, s, 2))), ring_mul(f, ring_of_num(f, 2), t2))), ring_mul(f, y1, z1))), ring_add(f, t1, t0))), ring_mul(f, a, zz))), ring_mul(f, ring_of_num(f, 3), xx))), ring_pow(f, z1, 2))), ring_pow(f, x1, 2))")))
}

///|
let pr_dbl_2007_bl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pr_dbl_2007_bl")

///|
/// `pr_dbl_2007_bl`
pub fn pr_dbl_2007_bl() -> @kernel.Thm {
  pr_dbl_2007_bl_c.get()
}

///|
/// PR_DBL_2007_BL
fn step_2() -> Unit raise {
  let t6 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t5 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @projective.projective_eq()]))
  let t4 = @simp.asm_rewrite_tac(@list.List([@projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0()]))
  let t3 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t2 = @simp.rewrite_tac(@list.List([pr_dbl_2007_bl(), @projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0()]))
  let t1 = @simp.rewrite_tac(@list.List([@projective.projective_point()]))
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1), @tactics.strip_tac), t2), t3), t4), t5), @ringtheory.field_tac), t6)
  pr_dbl_2007_bl_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && IN(a, ring_carrier(f)) && IN(b, ring_carrier(f)) && projective_point(f, (x1, y1, z1)) → projective_eq(f, pr_dbl_2007_bl((f, a, b), (x1, y1, z1)), projective_add((f, a, b), (x1, y1, z1), (x1, y1, z1)))"), t7))
}

///|
let pr_dbl_2007_bl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PR_DBL_2007_BL")

///|
/// `PR_DBL_2007_BL`
pub fn pr_dbl_2007_bl_v1() -> @kernel.Thm {
  pr_dbl_2007_bl_v1_c.get()
}

///|
/// p3_dbl_2007_bl_2
fn step_3() -> Unit raise {
  p3_dbl_2007_bl_2_c.set(@pair.new_definition(@term_syntax.parse_term("(p3_dbl_2007_bl_2 : ((Ring[A], A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A))) == LET((t0 : A) => LET_END(LET((t1 : A) => LET_END(LET((t2 : A) => LET_END(LET((w : A) => LET_END(LET((t3 : A) => LET_END(LET((s : A) => LET_END(LET((ss : A) => LET_END(LET((sss : A) => LET_END(LET((r : A) => LET_END(LET((rr : A) => LET_END(LET((t4 : A) => LET_END(LET((b : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((h : A) => LET_END(LET((x3 : A) => LET_END(LET((t7 : A) => LET_END(LET((t8 : A) => LET_END(LET((t9 : A) => LET_END(LET((y3 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), sss)), ring_sub(f, t9, t8))), ring_mul(f, w, t7))), ring_mul(f, ring_of_num(f, 2), rr))), ring_sub(f, b, h))), ring_mul(f, h, s))), ring_sub(f, t5, t6))), ring_mul(f, ring_of_num(f, 2), b))), ring_pow(f, w, 2))), ring_mul(f, ring_of_num(f, 2), t4))), ring_mul(f, x1, r))), ring_pow(f, r, 2))), ring_mul(f, y1, s))), ring_mul(f, s, ss))), ring_pow(f, s, 2))), ring_mul(f, ring_of_num(f, 2), t3))), ring_mul(f, y1, z1))), ring_mul(f, ring_of_num(f, 3), t2))), ring_mul(f, t0, t1))), ring_add(f, x1, z1))), ring_sub(f, x1, z1))")))
}

///|
let p3_dbl_2007_bl_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p3_dbl_2007_bl_2")

///|
/// `p3_dbl_2007_bl_2`
pub fn p3_dbl_2007_bl_2() -> @kernel.Thm {
  p3_dbl_2007_bl_2_c.get()
}

///|
/// P3_DBL_2007_BL_2
fn step_4() -> Unit raise {
  let t17 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t16 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @projective.projective_eq()]))
  let t15 = @simp.asm_rewrite_tac(@list.List([@projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0()]))
  let t14 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t13 = @simp.rewrite_tac(@list.List([p3_dbl_2007_bl_2(), @projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0()]))
  let t12 = @tactics.first_x_assum(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s10 = @tactics.subst_all_tac(x9)
    fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s10(x11)
    }
  })
  let t8 = @simp.rewrite_tac(@list.List([@projective.projective_point()]))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t8), @tactics.strip_tac), t12), t13), t14), t15), t16), @ringtheory.field_tac), t17)
  p3_dbl_2007_bl_2_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && a == ring_of_int(f, -int_of_num(3)) && IN(b, ring_carrier(f)) && projective_point(f, (x1, y1, z1)) → projective_eq(f, p3_dbl_2007_bl_2((f, a, b), (x1, y1, z1)), projective_add((f, a, b), (x1, y1, z1), (x1, y1, z1)))"), t18))
}

///|
let p3_dbl_2007_bl_2_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P3_DBL_2007_BL_2")

///|
/// `P3_DBL_2007_BL_2`
pub fn p3_dbl_2007_bl_2_v1() -> @kernel.Thm {
  p3_dbl_2007_bl_2_v1_c.get()
}

///|
/// p0_dbl_2007_bl
fn step_5() -> Unit raise {
  p0_dbl_2007_bl_c.set(@pair.new_definition(@term_syntax.parse_term("(p0_dbl_2007_bl : ((Ring[A], A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A))) == LET((xx : A) => LET_END(LET((zz : A) => LET_END(LET((w : A) => LET_END(LET((t2 : A) => LET_END(LET((s : A) => LET_END(LET((ss : A) => LET_END(LET((sss : A) => LET_END(LET((r : A) => LET_END(LET((rr : A) => LET_END(LET((t3 : A) => LET_END(LET((t4 : A) => LET_END(LET((t5 : A) => LET_END(LET((b : A) => LET_END(LET((t6 : A) => LET_END(LET((t7 : A) => LET_END(LET((h : A) => LET_END(LET((x3 : A) => LET_END(LET((t8 : A) => LET_END(LET((t9 : A) => LET_END(LET((t10 : A) => LET_END(LET((y3 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), sss)), ring_sub(f, t10, t9))), ring_mul(f, w, t8))), ring_mul(f, ring_of_num(f, 2), rr))), ring_sub(f, b, h))), ring_mul(f, h, s))), ring_sub(f, t6, t7))), ring_mul(f, ring_of_num(f, 2), b))), ring_pow(f, w, 2))), ring_sub(f, t5, rr))), ring_sub(f, t4, xx))), ring_pow(f, t3, 2))), ring_add(f, x1, r))), ring_pow(f, r, 2))), ring_mul(f, y1, s))), ring_mul(f, s, ss))), ring_pow(f, s, 2))), ring_mul(f, ring_of_num(f, 2), t2))), ring_mul(f, y1, z1))), ring_mul(f, ring_of_num(f, 3), xx))), ring_pow(f, z1, 2))), ring_pow(f, x1, 2))")))
}

///|
let p0_dbl_2007_bl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("p0_dbl_2007_bl")

///|
/// `p0_dbl_2007_bl`
pub fn p0_dbl_2007_bl() -> @kernel.Thm {
  p0_dbl_2007_bl_c.get()
}

///|
/// P0_DBL_2007_BL
fn step_6() -> Unit raise {
  let t28 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t27 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @projective.projective_eq()]))
  let t26 = @simp.asm_rewrite_tac(@list.List([@projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0()]))
  let t25 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t24 = @simp.rewrite_tac(@list.List([p0_dbl_2007_bl(), @projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0()]))
  let t23 = @tactics.first_x_assum(fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s21 = @tactics.subst_all_tac(x20)
    fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s21(x22)
    }
  })
  let t19 = @simp.rewrite_tac(@list.List([@projective.projective_point()]))
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t19), @tactics.strip_tac), t23), t24), t25), t26), t27), @ringtheory.field_tac), t28)
  p0_dbl_2007_bl_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && a == ring_0(f) && IN(b, ring_carrier(f)) && projective_point(f, (x1, y1, z1)) → projective_eq(f, p0_dbl_2007_bl((f, a, b), (x1, y1, z1)), projective_add((f, a, b), (x1, y1, z1), (x1, y1, z1)))"), t29))
}

///|
let p0_dbl_2007_bl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("P0_DBL_2007_BL")

///|
/// `P0_DBL_2007_BL`
pub fn p0_dbl_2007_bl_v1() -> @kernel.Thm {
  p0_dbl_2007_bl_v1_c.get()
}

///|
/// pr_add_1998_cmo_2
fn step_7() -> Unit raise {
  pr_add_1998_cmo_2_c.set(@pair.new_definition(@term_syntax.parse_term("(pr_add_1998_cmo_2 : ((Ring[A], A, A), (A, A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A)), ((x2 : A), (y2 : A), (z2 : A))) == LET((y1z2 : A) => LET_END(LET((x1z2 : A) => LET_END(LET((z1z2 : A) => LET_END(LET((t0 : A) => LET_END(LET((u : A) => LET_END(LET((uu : A) => LET_END(LET((t1 : A) => LET_END(LET((v : A) => LET_END(LET((vv : A) => LET_END(LET((vvv : A) => LET_END(LET((r : A) => LET_END(LET((t2 : A) => LET_END(LET((t3 : A) => LET_END(LET((t4 : A) => LET_END(LET((a : A) => LET_END(LET((x3 : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((t7 : A) => LET_END(LET((y3 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), ring_mul(f, vvv, z1z2))), ring_sub(f, t7, t6))), ring_mul(f, u, t5))), ring_mul(f, vvv, y1z2))), ring_sub(f, r, a))), ring_mul(f, v, a))), ring_sub(f, t4, t2))), ring_sub(f, t3, vvv))), ring_mul(f, uu, z1z2))), ring_mul(f, ring_of_num(f, 2), r))), ring_mul(f, vv, x1z2))), ring_mul(f, v, vv))), ring_pow(f, v, 2))), ring_sub(f, t1, x1z2))), ring_mul(f, x2, z1))), ring_pow(f, u, 2))), ring_sub(f, t0, y1z2))), ring_mul(f, y2, z1))), ring_mul(f, z1, z2))), ring_mul(f, x1, z2))), ring_mul(f, y1, z2))")))
}

///|
let pr_add_1998_cmo_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pr_add_1998_cmo_2")

///|
/// `pr_add_1998_cmo_2`
pub fn pr_add_1998_cmo_2() -> @kernel.Thm {
  pr_add_1998_cmo_2_c.get()
}

///|
/// PR_ADD_1998_CMO_2
fn step_8() -> Unit raise {
  let t52 = @term_syntax.parse_term("(op_eq : (A, A) -> Bool)")
  let t59 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s50 = @tactics.mp_tac(x49)
      fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s50(x51)
      }
    })(((x57 : @kernel.Thm) => @lib.check(fn(x56 : @kernel.Thm) -> Bool raise {
      (fn(x54 : @kernel.Term) -> Bool raise {
        ((x53 : @kernel.Term) => @basics.free_in(t52, x53))(x54)
      })((fn(x55 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x55)
      })(x56))
    }, x57))(x58))
  }))
  let t48 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0(), @pair.let_def(), @pair.let_end_def()]))))
  let t47 = @simp.asm_rewrite_tac(@list.List([@projective.projective_eq(), pr_add_1998_cmo_2(), @projective.projective_add()]))
  let t46 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s44 = @tactics.subst_all_tac(x43)
    fn(x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s44(x45)
    }
  }))
  let t42 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s40 = @tactics.mp_tac(x39)
    fn(x41 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s40(x41)
    }
  })))
  let t38 = @simp.asm_simp_tac(@list.List([@equal.gsym(@ringtheory.ring_char_divides_prime()), @prime.prime_2()]))
  let t37 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s32 = @tactics.assume_tac(x31)
    fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s32(x33)
    }
  }, fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s35 = @tactics.mp_tac(x34)
    fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s35(x36)
    }
  }))
  let t30 = @simp.rewrite_tac(@list.List([@projective.projective_point()]))
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t30), t37), t38), t42), t46), t47), t48), t59), @ringtheory.field_tac)
  pr_add_1998_cmo_2_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, ∀ x2 : A, ∀ y2 : A, ∀ z2 : A, field(f) && !(ring_char(f) == 2) && IN(a, ring_carrier(f)) && IN(b, ring_carrier(f)) && projective_point(f, (x1, y1, z1)) && projective_point(f, (x2, y2, z2)) && !(z1 == ring_0(f)) && !(z2 == ring_0(f)) && !projective_eq(f, (x1, y1, z1), (x2, y2, z2)) → projective_eq(f, pr_add_1998_cmo_2((f, a, b), (x1, y1, z1), (x2, y2, z2)), projective_add((f, a, b), (x1, y1, z1), (x2, y2, z2)))"), t60))
}

///|
let pr_add_1998_cmo_2_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PR_ADD_1998_CMO_2")

///|
/// `PR_ADD_1998_CMO_2`
pub fn pr_add_1998_cmo_2_v1() -> @kernel.Thm {
  pr_add_1998_cmo_2_v1_c.get()
}

///|
/// pr_madd_1998_cmo
fn step_9() -> Unit raise {
  pr_madd_1998_cmo_c.set(@pair.new_definition(@term_syntax.parse_term("(pr_madd_1998_cmo : ((Ring[A], A, A), (A, A, A), (A, A, _)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A)), ((x2 : A), (y2 : A), (z2 : _))) == LET((t0 : A) => LET_END(LET((u : A) => LET_END(LET((uu : A) => LET_END(LET((t1 : A) => LET_END(LET((v : A) => LET_END(LET((vv : A) => LET_END(LET((vvv : A) => LET_END(LET((r : A) => LET_END(LET((t2 : A) => LET_END(LET((t3 : A) => LET_END(LET((t4 : A) => LET_END(LET((a : A) => LET_END(LET((x3 : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((t7 : A) => LET_END(LET((y3 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), ring_mul(f, vvv, z1))), ring_sub(f, t7, t6))), ring_mul(f, u, t5))), ring_mul(f, vvv, y1))), ring_sub(f, r, a))), ring_mul(f, v, a))), ring_sub(f, t4, t2))), ring_sub(f, t3, vvv))), ring_mul(f, uu, z1))), ring_mul(f, ring_of_num(f, 2), r))), ring_mul(f, vv, x1))), ring_mul(f, v, vv))), ring_pow(f, v, 2))), ring_sub(f, t1, x1))), ring_mul(f, x2, z1))), ring_pow(f, u, 2))), ring_sub(f, t0, y1))), ring_mul(f, y2, z1))")))
}

///|
let pr_madd_1998_cmo_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pr_madd_1998_cmo")

///|
/// `pr_madd_1998_cmo`
pub fn pr_madd_1998_cmo() -> @kernel.Thm {
  pr_madd_1998_cmo_c.get()
}

///|
/// PR_MADD_1998_CMO
fn step_10() -> Unit raise {
  let t83 = @term_syntax.parse_term("(op_eq : (A, A) -> Bool)")
  let t90 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x80 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s81 = @tactics.mp_tac(x80)
      fn(x82 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s81(x82)
      }
    })(((x88 : @kernel.Thm) => @lib.check(fn(x87 : @kernel.Thm) -> Bool raise {
      (fn(x85 : @kernel.Term) -> Bool raise {
        ((x84 : @kernel.Term) => @basics.free_in(t83, x84))(x85)
      })((fn(x86 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x86)
      })(x87))
    }, x88))(x89))
  }))
  let t79 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@projective.projective_add(), @projective.projective_eq(), @projective.projective_neg(), @projective.projective_0(), @pair.let_def(), @pair.let_end_def()]))))
  let t78 = @simp.asm_rewrite_tac(@list.List([@projective.projective_eq(), pr_madd_1998_cmo(), @projective.projective_add()]))
  let t77 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s75 = @tactics.subst_all_tac(x74)
    fn(x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s75(x76)
    }
  }))
  let t73 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s71 = @tactics.mp_tac(x70)
    fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s71(x72)
    }
  })))
  let t69 = @simp.asm_simp_tac(@list.List([@equal.gsym(@ringtheory.ring_char_divides_prime()), @prime.prime_2()]))
  let t68 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x62 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s63 = @tactics.assume_tac(x62)
    fn(x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s63(x64)
    }
  }, fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s66 = @tactics.mp_tac(x65)
    fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s66(x67)
    }
  }))
  let t61 = @simp.rewrite_tac(@list.List([@projective.projective_point()]))
  let t91 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t61), t68), t69), t73), t77), t78), t79), t90), @ringtheory.field_tac)
  pr_madd_1998_cmo_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, ∀ x2 : A, ∀ y2 : A, ∀ z2 : A, field(f) && !(ring_char(f) == 2) && IN(a, ring_carrier(f)) && IN(b, ring_carrier(f)) && projective_point(f, (x1, y1, z1)) && projective_point(f, (x2, y2, z2)) && z2 == ring_1(f) && !(z1 == ring_0(f)) && !projective_eq(f, (x1, y1, z1), (x2, y2, z2)) → projective_eq(f, pr_madd_1998_cmo((f, a, b), (x1, y1, z1), (x2, y2, z2)), projective_add((f, a, b), (x1, y1, z1), (x2, y2, z2)))"), t91))
}

///|
let pr_madd_1998_cmo_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PR_MADD_1998_CMO")

///|
/// `PR_MADD_1998_CMO`
pub fn pr_madd_1998_cmo_v1() -> @kernel.Thm {
  pr_madd_1998_cmo_v1_c.get()
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
}
