// Translated from upstream Divstep/divstep_bounds.ml; edit this file directly.

///|
/// INTEGER_DIVSTEP_DELTA
fn step_1() -> Unit raise {
  let t13 = @meson.meson_tac(@list.List([@floor.integer_closed()]))
  let t12 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) + (x : Real) - real_of_num(1) / real_of_num(2) == real_of_num(1) + (x - real_of_num(1) / real_of_num(2))"))]))
  let t11 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) - (x : Real) - real_of_num(1) / real_of_num(2) == -(x - real_of_num(1) / real_of_num(2))"))]))
  let t10 = @simp.asm_rewrite_tac(@list.List([]))
  let t9 = @tactics.repeat_tac(@tactics.gen_tac)
  let t8 = @simp.rewrite_tac(@list.List([@divstep.divstep(), @pair.forall_pair_thm()]))
  let t6 = @term_syntax.parse_term("(t : (Real, Int, Int))")
  let t7 = @tactics.spec_tac(@term_syntax.parse_term("ITER((n : Num), divstep, (real_of_num(1) / real_of_num(2), (f : Int), (g : Int)))"), t6)
  let t5 = @tactics.pop_assum(fn(x2 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3 = @tactics.mp_tac(x2)
    fn(x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3(x4)
    }
  })
  let t1 = @simp.asm_rewrite_tac(@list.List([@iter.iter(), @real.real_sub_refl(), @floor.integer_closed()]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t1), t5), t7), t8), t9), @class.cond_cases_tac), t10), t11), t12), t13)
  integer_divstep_delta_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Int, ∀ g : Int, ∀ n : Num, integer(FST(ITER(n, divstep, (real_of_num(1) / real_of_num(2), f, g))) - real_of_num(1) / real_of_num(2))"), t14))
}

///|
let integer_divstep_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_DIVSTEP_DELTA")

///|
/// `INTEGER_DIVSTEP_DELTA`
pub fn integer_divstep_delta() -> @kernel.Thm {
  integer_divstep_delta_c.get()
}

///|
/// ITER_DIVSTEP_ODD_ALT
fn step_2() -> Unit raise {
  let t16 = @meson.asm_meson_tac(@list.List([@pair.pair()]))
  let t15 = @tactics.match_mp_tac(@divstep.iter_divstep_odd())
  let t17 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t15), t16)
  iter_divstep_odd_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Int, ∀ g : Int, ∀ n : Num, rem(f, int_of_num(2)) == int_of_num(1) → rem(FST(SND(ITER(n, divstep, (real_of_num(1) / real_of_num(2), f, g)))), int_of_num(2)) == int_of_num(1)"), t17))
}

///|
let iter_divstep_odd_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_DIVSTEP_ODD_ALT")

///|
/// `ITER_DIVSTEP_ODD_ALT`
pub fn iter_divstep_odd_alt() -> @kernel.Thm {
  iter_divstep_odd_alt_c.get()
}

///|
/// DIVSTEP_ENDTOEND_BITS_SIMPLE
fn step_3() -> Unit raise {
  let t67 = @simp.asm_rewrite_tac(@list.List([]))
  let t66 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@int.int_rem_2_divides()])))
  let t65 = @simp.rewrite_tac(@list.List([@int.int_mul_div_eq(), @int.int_2_divides_add(), @int.int_2_divides_sub()]))
  let t64 = @simp.rewrite_tac(@list.List([@int.real_of_int_clauses()]))
  let t63 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real) / real_of_num(2)) == (real_of_num(2) * x == y)"))]))
  let t62 = @tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.real_arith_tac, @tactics.all_tac]))
  let t61 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_lid(), @int.int_mul_lzero(), @int.int_add_rid()]))
  let t60 = @simp.rewrite_tac(@list.List([@class.cond_swap()]))
  let t59 = @tactics.conv_tac(@int.int_reduce_conv)
  let t58 = @simp.asm_rewrite_tac(@list.List([]))
  let t57 = @tactics.disj_cases_tac(@bool.spec(@term_syntax.parse_term("(g : Int)"), @int.int_rem_2_cases()))
  let t56 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.eq_tac, @list.List([@simp.asm_simp_tac(@list.List([@floor.real_lt_integers(), @floor.integer_closed()])), @tactics.all_tac])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t55 = @tactics.subgoal_then(@term_syntax.parse_term("((delta : Real) - real_of_num(1) / real_of_num(2) < real_of_num(0)) == !(delta > real_of_num(0))"), fn(x52 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s53 = @tactics.subst1_tac(x52)
    fn(x54 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s53(x54)
    }
  })
  let t49 = @term_syntax.parse_term("(g : Int)")
  let t50 = @term_syntax.parse_term("(f : Int)")
  let t51 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(delta : Real)"), t50, t49]))
  let t48 = @tactics.pop_assum_list(fn(x47 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t46 = @simp.asm_rewrite_tac(@list.List([@divstep.divstep(), @pair.forall_pair_thm()]))
  let t44 = @term_syntax.parse_term("(t : (Real, Int, Int))")
  let t45 = @tactics.spec_tac(@term_syntax.parse_term("ITER((m : Num), divstep, (real_of_num(1) / real_of_num(2), (f : Int), (g : Int)))"), t44)
  let t41 = @term_syntax.parse_term("(m : Num)")
  let t42 = @term_syntax.parse_term("(g : Int)")
  let t43 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : Int)"), t42, t41]), iter_divstep_odd_alt()))
  let t38 = @term_syntax.parse_term("(m : Num)")
  let t39 = @term_syntax.parse_term("(g : Int)")
  let t40 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : Int)"), t39, t38]), integer_divstep_delta()))
  let t37 = @simp.rewrite_tac(@list.List([@iter.iter(), @equal.gsym(@arith.add1())]))
  let t36 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t35 = @simp.asm_rewrite_tac(@list.List([@int.int_of_num_lt()]))
  let t34 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t33 = @simp.rewrite_tac(@list.List([@int.int_of_num_th(), @equal.gsym(@int.int_eq())]))
  let t32 = @simp.rewrite_tac(@list.List([@int.real_of_int_clauses()]))
  let t31 = @simp.asm_rewrite_tac(@list.List([@iter.iter(), @realarith.real_sub_0()]))
  let t30 = @tactics.disch_then(@tactics.match_mp_tac)
  let t29 = @simp.rewrite_tac(@list.List([@int.integer_real_of_int()]))
  let t28 = @simp.simp_tac(@list.List([@floor.real_of_int_of_real(), integer_divstep_delta()]))
  let t26 = @equal.gsym(@theorems.conj_assoc())
  let t27 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.real_of_int_clauses()), @theorems.imp_imp(), t26]))
  let t21 = @term_syntax.parse_term("(n : Num)")
  let t22 = @term_syntax.parse_term("(b : Num)")
  let t23 = @term_syntax.parse_term("(n : Num) => real_of_int(SND(SND(ITER(n, divstep, (real_of_num(1) / real_of_num(2), (f : Int), (g : Int))))))")
  let t24 = @term_syntax.parse_term("(n : Num) => real_of_int(FST(SND(ITER(n, divstep, (real_of_num(1) / real_of_num(2), (f : Int), (g : Int))))))")
  let t25 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => int_of_real(FST(ITER(n, divstep, (real_of_num(1) / real_of_num(2), (f : Int), (g : Int)))) - real_of_num(1) / real_of_num(2))"), t24, t23, t22, t21]), @hull_light.endtoend_bits_simple()))
  let t20 = @simp.gen_rewrite_tac(fn(x19 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x19
  }, @list.List([@equal.gsym(@divstep.iter_divstep_bound_alt())]))
  let t18 = @tactics.repeat_tac(@tactics.strip_tac)
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@hull_light.divsteps_s())])), t18), t20), t25), t27), t28), t29), t30), t31), t32), t33), t34), t35), t36), t37), t40), t43), t45), t46), t48), t51), @tactics.disch_tac), @tactics.disch_tac), t55), t56), t57), t58), t59), t60), @class.cond_cases_tac), t61), @list.List([@tactics.disj1_tac, @tactics.disj1_tac, @tactics.disj2_tac, @tactics.disj2_tac])), t62), t63), t64), t65), t66), t67)
  divstep_endtoend_bits_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Int, ∀ g : Int, ∀ b : Num, ∀ n : Num, int_of_num(0) <= g && g <= f && f <= pow(int_of_num(2), b) && rem(f, int_of_num(2)) == int_of_num(1) && 9437 * b + 1 <= 4096 * n → SND(SND(ITER(n, divstep, (real_of_num(1) / real_of_num(2), f, g)))) == int_of_num(0)"), t68))
}

///|
let divstep_endtoend_bits_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_ENDTOEND_BITS_SIMPLE")

///|
/// `DIVSTEP_ENDTOEND_BITS_SIMPLE`
pub fn divstep_endtoend_bits_simple() -> @kernel.Thm {
  divstep_endtoend_bits_simple_c.get()
}

///|
/// IDIVSTEP_ENDTOEND_BITS_SIMPLE
fn step_4() -> Unit raise {
  let t76 = @meson.asm_meson_tac(@list.List([@idivstep.divstep_fg_gcd(), @integer.int_gcd_0()]))
  let t75 = @simp.rewrite_tac(@list.List([@idivstep.iter_divstep_integer()]))
  let t73 = @drule.match_mp(divstep_endtoend_bits_simple())
  let t77 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s71 = @tactics.mp_tac(x70)
      fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s71(x72)
      }
    })(t73(x74))
  }), t75), t76])
  let t69 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t78 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t69), @tactics.conj_tac), t77)
  idivstep_endtoend_bits_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Int, ∀ g : Int, ∀ b : Num, ∀ n : Num, int_of_num(0) <= g && g <= f && f <= pow(int_of_num(2), b) && rem(f, int_of_num(2)) == int_of_num(1) && 9437 * b + 1 <= 4096 * n → divstep_g(n, (int_of_num(1), f, g)) == int_of_num(0) && abs(divstep_f(n, (int_of_num(1), f, g))) == gcd((f, g))"), t78))
}

///|
let idivstep_endtoend_bits_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IDIVSTEP_ENDTOEND_BITS_SIMPLE")

///|
/// `IDIVSTEP_ENDTOEND_BITS_SIMPLE`
pub fn idivstep_endtoend_bits_simple() -> @kernel.Thm {
  idivstep_endtoend_bits_simple_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
