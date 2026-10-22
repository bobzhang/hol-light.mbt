// Translated from upstream EC/formulary_jacobian.ml; edit this file directly.

///|
/// ja_dbl_2007_bl
fn step_1() -> Unit raise {
  ja_dbl_2007_bl_c.set(@pair.new_definition(@term_syntax.parse_term("(ja_dbl_2007_bl : ((Ring[A], A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A))) == LET((xx : A) => LET_END(LET((yy : A) => LET_END(LET((yyyy : A) => LET_END(LET((zz : A) => LET_END(LET((t0 : A) => LET_END(LET((t1 : A) => LET_END(LET((t2 : A) => LET_END(LET((t3 : A) => LET_END(LET((s : A) => LET_END(LET((t4 : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((m : A) => LET_END(LET((t7 : A) => LET_END(LET((t8 : A) => LET_END(LET((t : A) => LET_END(LET((x3 : A) => LET_END(LET((t9 : A) => LET_END(LET((t10 : A) => LET_END(LET((t11 : A) => LET_END(LET((y3 : A) => LET_END(LET((t12 : A) => LET_END(LET((t13 : A) => LET_END(LET((t14 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), ring_sub(f, t14, zz))), ring_sub(f, t13, yy))), ring_pow(f, t12, 2))), ring_add(f, y1, z1))), ring_sub(f, t11, t10))), ring_mul(f, m, t9))), ring_mul(f, ring_of_num(f, 8), yyyy))), ring_sub(f, s, t))), t)), ring_sub(f, t7, t8))), ring_mul(f, ring_of_num(f, 2), s))), ring_pow(f, m, 2))), ring_add(f, t6, t5))), ring_mul(f, ring_of_num(f, 3), xx))), ring_mul(f, a, t4))), ring_pow(f, zz, 2))), ring_mul(f, ring_of_num(f, 2), t3))), ring_sub(f, t2, yyyy))), ring_sub(f, t1, xx))), ring_pow(f, t0, 2))), ring_add(f, x1, yy))), ring_pow(f, z1, 2))), ring_pow(f, yy, 2))), ring_pow(f, y1, 2))), ring_pow(f, x1, 2))")))
}

///|
let ja_dbl_2007_bl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ja_dbl_2007_bl")

///|
/// `ja_dbl_2007_bl`
pub fn ja_dbl_2007_bl() -> @kernel.Thm {
  ja_dbl_2007_bl_c.get()
}

///|
/// JA_DBL_2007_BL
fn step_2() -> Unit raise {
  let t6 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t5 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @jacobian.jacobian_eq()]))
  let t4 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t3 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t2 = @simp.rewrite_tac(@list.List([ja_dbl_2007_bl(), @jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t1 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1), @tactics.strip_tac), t2), t3), t4), t5), @ringtheory.field_tac), t6)
  ja_dbl_2007_bl_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && IN(a, ring_carrier(f)) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) → jacobian_eq(f, ja_dbl_2007_bl((f, a, b), (x1, y1, z1)), jacobian_add((f, a, b), (x1, y1, z1), (x1, y1, z1)))"), t7))
}

///|
let ja_dbl_2007_bl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JA_DBL_2007_BL")

///|
/// `JA_DBL_2007_BL`
pub fn ja_dbl_2007_bl_v1() -> @kernel.Thm {
  ja_dbl_2007_bl_v1_c.get()
}

///|
/// JA_DBL_2007_BL'
fn step_3() -> Unit raise {
  let t17 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t16 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @jacobian.jacobian_eq()]))
  let t15 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t14 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s12 = @tactics.subst_all_tac(x11)
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s12(x13)
    }
  }))
  let t10 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_0(), @pair.pair_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0(), ja_dbl_2007_bl()]))
  let t9 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t8 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t8), t9), t10), @tactics.strip_tac), t14), t15), t16), @ringtheory.field_tac), t17)
  ja_dbl_2007_bl_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && IN(a, ring_carrier(f)) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) && (z1 == ring_0(f) → (x1, y1, z1) == jacobian_0((f, a, b))) → ja_dbl_2007_bl((f, a, b), (x1, y1, z1)) == jacobian_add((f, a, b), (x1, y1, z1), (x1, y1, z1))"), t18))
}

///|
let ja_dbl_2007_bl_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JA_DBL_2007_BL'")

///|
/// `JA_DBL_2007_BL'`
pub fn ja_dbl_2007_bl_p() -> @kernel.Thm {
  ja_dbl_2007_bl_p_c.get()
}

///|
/// j3_dbl_2001_b
fn step_4() -> Unit raise {
  j3_dbl_2001_b_c.set(@pair.new_definition(@term_syntax.parse_term("(j3_dbl_2001_b : ((Ring[A], A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A))) == LET((delta : A) => LET_END(LET((gamma : A) => LET_END(LET((beta : A) => LET_END(LET((t0 : A) => LET_END(LET((t1 : A) => LET_END(LET((t2 : A) => LET_END(LET((alpha : A) => LET_END(LET((t3 : A) => LET_END(LET((t4 : A) => LET_END(LET((x3 : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((t7 : A) => LET_END(LET((z3 : A) => LET_END(LET((t8 : A) => LET_END(LET((t9 : A) => LET_END(LET((t10 : A) => LET_END(LET((t11 : A) => LET_END(LET((t12 : A) => LET_END(LET((y3 : A) => LET_END((x3, y3, z3)), ring_sub(f, t12, t11))), ring_mul(f, alpha, t9))), ring_mul(f, ring_of_num(f, 8), t10))), ring_pow(f, gamma, 2))), ring_sub(f, t8, x3))), ring_mul(f, ring_of_num(f, 4), beta))), ring_sub(f, t7, delta))), ring_sub(f, t6, gamma))), ring_pow(f, t5, 2))), ring_add(f, y1, z1))), ring_sub(f, t3, t4))), ring_mul(f, ring_of_num(f, 8), beta))), ring_pow(f, alpha, 2))), ring_mul(f, ring_of_num(f, 3), t2))), ring_mul(f, t0, t1))), ring_add(f, x1, delta))), ring_sub(f, x1, delta))), ring_mul(f, x1, gamma))), ring_pow(f, y1, 2))), ring_pow(f, z1, 2))")))
}

///|
let j3_dbl_2001_b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("j3_dbl_2001_b")

///|
/// `j3_dbl_2001_b`
pub fn j3_dbl_2001_b() -> @kernel.Thm {
  j3_dbl_2001_b_c.get()
}

///|
/// J3_DBL_2001_B
fn step_5() -> Unit raise {
  let t28 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t27 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @jacobian.jacobian_eq()]))
  let t26 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t25 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t24 = @simp.rewrite_tac(@list.List([j3_dbl_2001_b(), @jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t23 = @tactics.first_x_assum(fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s21 = @tactics.subst_all_tac(x20)
    fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s21(x22)
    }
  })
  let t19 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t19), @tactics.strip_tac), t23), t24), t25), t26), t27), @ringtheory.field_tac), t28)
  j3_dbl_2001_b_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && a == ring_of_int(f, -int_of_num(3)) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) → jacobian_eq(f, j3_dbl_2001_b((f, a, b), (x1, y1, z1)), jacobian_add((f, a, b), (x1, y1, z1), (x1, y1, z1)))"), t29))
}

///|
let j3_dbl_2001_b_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("J3_DBL_2001_B")

///|
/// `J3_DBL_2001_B`
pub fn j3_dbl_2001_b_v1() -> @kernel.Thm {
  j3_dbl_2001_b_v1_c.get()
}

///|
/// J3_DBL_2001_B'
fn step_6() -> Unit raise {
  let t39 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t38 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @jacobian.jacobian_eq()]))
  let t37 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t36 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s34 = @tactics.subst_all_tac(x33)
    fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s34(x35)
    }
  }))
  let t32 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_0(), @pair.pair_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0(), j3_dbl_2001_b()]))
  let t31 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t30 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t40 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t30), t31), t32), @tactics.strip_tac), t36), t37), t38), @ringtheory.field_tac), t39)
  j3_dbl_2001_b_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && a == ring_of_int(f, -int_of_num(3)) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) && (z1 == ring_0(f) → (x1, y1, z1) == jacobian_0((f, a, b))) → j3_dbl_2001_b((f, a, b), (x1, y1, z1)) == jacobian_add((f, a, b), (x1, y1, z1), (x1, y1, z1))"), t40))
}

///|
let j3_dbl_2001_b_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("J3_DBL_2001_B'")

///|
/// `J3_DBL_2001_B'`
pub fn j3_dbl_2001_b_p() -> @kernel.Thm {
  j3_dbl_2001_b_p_c.get()
}

///|
/// j0_dbl_2009_l
fn step_7() -> Unit raise {
  j0_dbl_2009_l_c.set(@pair.new_definition(@term_syntax.parse_term("(j0_dbl_2009_l : ((Ring[A], A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A))) == LET((a : A) => LET_END(LET((b : A) => LET_END(LET((c : A) => LET_END(LET((t0 : A) => LET_END(LET((t1 : A) => LET_END(LET((t2 : A) => LET_END(LET((t3 : A) => LET_END(LET((d : A) => LET_END(LET((e : A) => LET_END(LET((g : A) => LET_END(LET((t4 : A) => LET_END(LET((x3 : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((t7 : A) => LET_END(LET((y3 : A) => LET_END(LET((t8 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), ring_mul(f, ring_of_num(f, 2), t8))), ring_mul(f, y1, z1))), ring_sub(f, t7, t6))), ring_mul(f, e, t5))), ring_mul(f, ring_of_num(f, 8), c))), ring_sub(f, d, x3))), ring_sub(f, g, t4))), ring_mul(f, ring_of_num(f, 2), d))), ring_pow(f, e, 2))), ring_mul(f, ring_of_num(f, 3), a))), ring_mul(f, ring_of_num(f, 2), t3))), ring_sub(f, t2, c))), ring_sub(f, t1, a))), ring_pow(f, t0, 2))), ring_add(f, x1, b))), ring_pow(f, b, 2))), ring_pow(f, y1, 2))), ring_pow(f, x1, 2))")))
}

///|
let j0_dbl_2009_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("j0_dbl_2009_l")

///|
/// `j0_dbl_2009_l`
pub fn j0_dbl_2009_l() -> @kernel.Thm {
  j0_dbl_2009_l_c.get()
}

///|
/// J0_DBL_2009_L
fn step_8() -> Unit raise {
  let t50 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t49 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @jacobian.jacobian_eq()]))
  let t48 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t47 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t46 = @simp.rewrite_tac(@list.List([j0_dbl_2009_l(), @jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t45 = @tactics.first_x_assum(fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s43 = @tactics.subst_all_tac(x42)
    fn(x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s43(x44)
    }
  })
  let t41 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t51 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t41), @tactics.strip_tac), t45), t46), t47), t48), t49), @ringtheory.field_tac), t50)
  j0_dbl_2009_l_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && a == ring_0(f) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) → jacobian_eq(f, j0_dbl_2009_l((f, a, b), (x1, y1, z1)), jacobian_add((f, a, b), (x1, y1, z1), (x1, y1, z1)))"), t51))
}

///|
let j0_dbl_2009_l_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("J0_DBL_2009_L")

///|
/// `J0_DBL_2009_L`
pub fn j0_dbl_2009_l_v1() -> @kernel.Thm {
  j0_dbl_2009_l_v1_c.get()
}

///|
/// J0_DBL_2009_L'
fn step_9() -> Unit raise {
  let t61 = @simp.asm_simp_tac(@list.List([@ringtheory.field_imp_integral_domain()]))
  let t60 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq(), @jacobian.jacobian_eq()]))
  let t59 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0()]))
  let t58 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s56 = @tactics.subst_all_tac(x55)
    fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s56(x57)
    }
  }))
  let t54 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_0(), @pair.pair_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0(), j0_dbl_2009_l()]))
  let t53 = @class.asm_cases_tac(@term_syntax.parse_term("(z1 : A) == ring_0((f : Ring[A]))"))
  let t52 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t62 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t52), t53), t54), @tactics.strip_tac), t58), t59), t60), @ringtheory.field_tac), t61)
  j0_dbl_2009_l_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, field(f) && a == ring_0(f) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) && (z1 == ring_0(f) → (x1, y1, z1) == jacobian_0((f, a, b))) → j0_dbl_2009_l((f, a, b), (x1, y1, z1)) == jacobian_add((f, a, b), (x1, y1, z1), (x1, y1, z1))"), t62))
}

///|
let j0_dbl_2009_l_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("J0_DBL_2009_L'")

///|
/// `J0_DBL_2009_L'`
pub fn j0_dbl_2009_l_p() -> @kernel.Thm {
  j0_dbl_2009_l_p_c.get()
}

///|
/// ja_add_2007_bl
fn step_10() -> Unit raise {
  ja_add_2007_bl_c.set(@pair.new_definition(@term_syntax.parse_term("(ja_add_2007_bl : ((Ring[A], A, A), (A, A, A), (A, A, A)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A)), ((x2 : A), (y2 : A), (z2 : A))) == LET((z1z1 : A) => LET_END(LET((z2z2 : A) => LET_END(LET((u1 : A) => LET_END(LET((u2 : A) => LET_END(LET((t0 : A) => LET_END(LET((s1 : A) => LET_END(LET((t1 : A) => LET_END(LET((s2 : A) => LET_END(LET((h : A) => LET_END(LET((t2 : A) => LET_END(LET((i : A) => LET_END(LET((j : A) => LET_END(LET((t3 : A) => LET_END(LET((r : A) => LET_END(LET((v : A) => LET_END(LET((t4 : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((x3 : A) => LET_END(LET((t7 : A) => LET_END(LET((t8 : A) => LET_END(LET((t9 : A) => LET_END(LET((t10 : A) => LET_END(LET((y3 : A) => LET_END(LET((t11 : A) => LET_END(LET((t12 : A) => LET_END(LET((t13 : A) => LET_END(LET((t14 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), ring_mul(f, t14, h))), ring_sub(f, t13, z2z2))), ring_sub(f, t12, z1z1))), ring_pow(f, t11, 2))), ring_add(f, z1, z2))), ring_sub(f, t10, t9))), ring_mul(f, r, t7))), ring_mul(f, ring_of_num(f, 2), t8))), ring_mul(f, s1, j))), ring_sub(f, v, x3))), ring_sub(f, t6, t5))), ring_sub(f, t4, j))), ring_mul(f, ring_of_num(f, 2), v))), ring_pow(f, r, 2))), ring_mul(f, u1, i))), ring_mul(f, ring_of_num(f, 2), t3))), ring_sub(f, s2, s1))), ring_mul(f, h, i))), ring_pow(f, t2, 2))), ring_mul(f, ring_of_num(f, 2), h))), ring_sub(f, u2, u1))), ring_mul(f, y2, t1))), ring_mul(f, z1, z1z1))), ring_mul(f, y1, t0))), ring_mul(f, z2, z2z2))), ring_mul(f, x2, z1z1))), ring_mul(f, x1, z2z2))), ring_pow(f, z2, 2))), ring_pow(f, z1, 2))")))
}

///|
let ja_add_2007_bl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ja_add_2007_bl")

///|
/// `ja_add_2007_bl`
pub fn ja_add_2007_bl() -> @kernel.Thm {
  ja_add_2007_bl_c.get()
}

///|
/// JA_ADD_2007_BL
fn step_11() -> Unit raise {
  let t85 = @term_syntax.parse_term("(op_eq : (A, A) -> Bool)")
  let t92 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x91 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s83 = @tactics.mp_tac(x82)
      fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s83(x84)
      }
    })(((x90 : @kernel.Thm) => @lib.check(fn(x89 : @kernel.Thm) -> Bool raise {
      (fn(x87 : @kernel.Term) -> Bool raise {
        ((x86 : @kernel.Term) => @basics.free_in(t85, x86))(x87)
      })((fn(x88 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x88)
      })(x89))
    }, x90))(x91))
  }))
  let t81 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0(), @pair.let_def(), @pair.let_end_def()]))))
  let t80 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_eq(), ja_add_2007_bl(), @jacobian.jacobian_add()]))
  let t79 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s77 = @tactics.subst_all_tac(x76)
    fn(x78 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s77(x78)
    }
  }))
  let t75 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x72 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s73 = @tactics.mp_tac(x72)
    fn(x74 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s73(x74)
    }
  })))
  let t71 = @simp.asm_simp_tac(@list.List([@equal.gsym(@ringtheory.ring_char_divides_prime()), @prime.prime_2()]))
  let t70 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s65 = @tactics.assume_tac(x64)
    fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s65(x66)
    }
  }, fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s68 = @tactics.mp_tac(x67)
    fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s68(x69)
    }
  }))
  let t63 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t93 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t63), t70), t71), t75), t79), t80), t81), t92), @ringtheory.field_tac)
  ja_add_2007_bl_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, ∀ x2 : A, ∀ y2 : A, ∀ z2 : A, field(f) && !(ring_char(f) == 2) && IN(a, ring_carrier(f)) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) && jacobian_point(f, (x2, y2, z2)) && !(z1 == ring_0(f)) && !(z2 == ring_0(f)) && !jacobian_eq(f, (x1, y1, z1), (x2, y2, z2)) → jacobian_eq(f, ja_add_2007_bl((f, a, b), (x1, y1, z1), (x2, y2, z2)), jacobian_add((f, a, b), (x1, y1, z1), (x2, y2, z2)))"), t93))
}

///|
let ja_add_2007_bl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JA_ADD_2007_BL")

///|
/// `JA_ADD_2007_BL`
pub fn ja_add_2007_bl_v1() -> @kernel.Thm {
  ja_add_2007_bl_v1_c.get()
}

///|
/// ja_madd_2007_bl
fn step_12() -> Unit raise {
  ja_madd_2007_bl_c.set(@pair.new_definition(@term_syntax.parse_term("(ja_madd_2007_bl : ((Ring[A], A, A), (A, A, A), (A, A, _)) -> (A, A, A))(((f : Ring[A]), (a : A), (b : A)), ((x1 : A), (y1 : A), (z1 : A)), ((x2 : A), (y2 : A), (z2 : _))) == LET((z1z1 : A) => LET_END(LET((u2 : A) => LET_END(LET((t0 : A) => LET_END(LET((s2 : A) => LET_END(LET((h : A) => LET_END(LET((hh : A) => LET_END(LET((i : A) => LET_END(LET((j : A) => LET_END(LET((t1 : A) => LET_END(LET((r : A) => LET_END(LET((v : A) => LET_END(LET((t2 : A) => LET_END(LET((t3 : A) => LET_END(LET((t4 : A) => LET_END(LET((x3 : A) => LET_END(LET((t5 : A) => LET_END(LET((t6 : A) => LET_END(LET((t7 : A) => LET_END(LET((t8 : A) => LET_END(LET((y3 : A) => LET_END(LET((t9 : A) => LET_END(LET((t10 : A) => LET_END(LET((t11 : A) => LET_END(LET((z3 : A) => LET_END((x3, y3, z3)), ring_sub(f, t11, hh))), ring_sub(f, t10, z1z1))), ring_pow(f, t9, 2))), ring_add(f, z1, h))), ring_sub(f, t8, t7))), ring_mul(f, r, t5))), ring_mul(f, ring_of_num(f, 2), t6))), ring_mul(f, y1, j))), ring_sub(f, v, x3))), ring_sub(f, t4, t3))), ring_sub(f, t2, j))), ring_mul(f, ring_of_num(f, 2), v))), ring_pow(f, r, 2))), ring_mul(f, x1, i))), ring_mul(f, ring_of_num(f, 2), t1))), ring_sub(f, s2, y1))), ring_mul(f, h, i))), ring_mul(f, ring_of_num(f, 4), hh))), ring_pow(f, h, 2))), ring_sub(f, u2, x1))), ring_mul(f, y2, t0))), ring_mul(f, z1, z1z1))), ring_mul(f, x2, z1z1))), ring_pow(f, z1, 2))")))
}

///|
let ja_madd_2007_bl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ja_madd_2007_bl")

///|
/// `ja_madd_2007_bl`
pub fn ja_madd_2007_bl() -> @kernel.Thm {
  ja_madd_2007_bl_c.get()
}

///|
/// JA_MADD_2007_BL
fn step_13() -> Unit raise {
  let t116 = @term_syntax.parse_term("(op_eq : (A, A) -> Bool)")
  let t123 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s114 = @tactics.mp_tac(x113)
      fn(x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s114(x115)
      }
    })(((x121 : @kernel.Thm) => @lib.check(fn(x120 : @kernel.Thm) -> Bool raise {
      (fn(x118 : @kernel.Term) -> Bool raise {
        ((x117 : @kernel.Term) => @basics.free_in(t116, x117))(x118)
      })((fn(x119 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x119)
      })(x120))
    }, x121))(x122))
  }))
  let t112 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_add(), @jacobian.jacobian_eq(), @jacobian.jacobian_neg(), @jacobian.jacobian_0(), @pair.let_def(), @pair.let_end_def()]))))
  let t111 = @simp.asm_rewrite_tac(@list.List([@jacobian.jacobian_eq(), ja_madd_2007_bl(), @jacobian.jacobian_add()]))
  let t110 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s108 = @tactics.subst_all_tac(x107)
    fn(x109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s108(x109)
    }
  }))
  let t106 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s104 = @tactics.mp_tac(x103)
    fn(x105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s104(x105)
    }
  })))
  let t102 = @simp.asm_simp_tac(@list.List([@equal.gsym(@ringtheory.ring_char_divides_prime()), @prime.prime_2()]))
  let t101 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x95 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s96 = @tactics.assume_tac(x95)
    fn(x97 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s96(x97)
    }
  }, fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s99 = @tactics.mp_tac(x98)
    fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s99(x100)
    }
  }))
  let t94 = @simp.rewrite_tac(@list.List([@jacobian.jacobian_point()]))
  let t124 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t94), t101), t102), t106), t110), t111), t112), t123), @ringtheory.field_tac), @misc.not_ring_char_divides_tac)
  ja_madd_2007_bl_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Ring[A], ∀ a : A, ∀ b : A, ∀ x1 : A, ∀ y1 : A, ∀ z1 : A, ∀ x2 : A, ∀ y2 : A, ∀ z2 : A, field(f) && !(ring_char(f) == 2) && IN(a, ring_carrier(f)) && IN(b, ring_carrier(f)) && jacobian_point(f, (x1, y1, z1)) && jacobian_point(f, (x2, y2, z2)) && z2 == ring_1(f) && !(z1 == ring_0(f)) && !jacobian_eq(f, (x1, y1, z1), (x2, y2, z2)) → jacobian_eq(f, ja_madd_2007_bl((f, a, b), (x1, y1, z1), (x2, y2, z2)), jacobian_add((f, a, b), (x1, y1, z1), (x2, y2, z2)))"), t124))
}

///|
let ja_madd_2007_bl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JA_MADD_2007_BL")

///|
/// `JA_MADD_2007_BL`
pub fn ja_madd_2007_bl_v1() -> @kernel.Thm {
  ja_madd_2007_bl_v1_c.get()
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
}
