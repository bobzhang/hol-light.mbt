// Translated from upstream Examples/digit_serial_methods.ml; edit this file directly.

///|
/// THEOREM_V_1
fn step_1() -> Unit raise {
  let t50 = @meson.asm_meson_tac(@list.List([@real.real_abs_pos()]))
  let t49 = @simp.asm_simp_tac(@list.List([]))
  let t47 = @term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real)((i : Num), ((V : Real), abs((Tl : (Num) -> Real)(i))))")
  let t48 = @tactics.trans_tac(@realax.real_le_trans())(t47)
  let t46 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t45 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t44 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t43 = @simp.rewrite_tac(@list.List([@real.real_le_radd()]))
  let t42 = @simp.asm_rewrite_tac(@list.List([]))
  let t40 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x")), @realax.real_le_refl()]))
  let t39 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @calc_int.real_abs_neg()]))
  let t38 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) + 1"))]))
  let t41 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) && abs((y : Real)) <= (b : Real) → abs(x + y) <= a + b"))), t38), t39), t40), @tactics.all_tac])
  let t36 = @term_syntax.parse_term("(beta : (Num) -> Real)((i : Num) + 1) * (abs((psi : (Num, (Real, Real)) -> Real)(i, ((V : Real), (Tl : (Num) -> Real)(i)))) * abs(Tl(i))) + (omega : (Num) -> Real)(i + 1)")
  let t37 = @tactics.trans_tac(@realax.real_le_trans())(t36)
  let t35 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t33 = @term_syntax.parse_term("abs(-(beta : (Num) -> Real)((i : Num) + 1) * ((psi : (Num, (Real, Real)) -> Real)(i, ((V : Real), (Tl : (Num) -> Real)(i))) * Tl(i)) + (beta(i + 1) * (Tp : (Num) -> Real)(i) - (DSF : (Num, Real) -> Real)(i + 1, beta(i + 1) * Tp(i))))")
  let t34 = @tactics.trans_tac(@realax.real_le_trans())(t33)
  let t32 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t31 = @tactics.first_x_assum(@tactics.conjuncts_then(fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s28 = @tactics.assume_tac(x27)
      fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s28(x29)
      }
    })(@equal.gsym(x30))
  }))
  let t24 = @tactics.conv_tac(@calc_rat.real_field)
  let t25 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t24])
  let t23 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (beta : (Num) -> Real)((i : Num) + 1) && real_of_num(0) < (B : (Num) -> Real)(i)"), fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s21 = @tactics.mp_tac(x20)
    fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s21(x22)
    }
  })
  let t26 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.add1()])), t23), t25), @tactics.all_tac])
  let t19 = @simp.asm_rewrite_tac(@list.List([]))
  let t18 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t16 = @meson.asm_meson_tac(@list.List([@real.real_abs_pos()]))
  let t15 = @simp.asm_simp_tac(@list.List([]))
  let t13 = @term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real)((i : Num), ((V : Real), abs((Tl : (Num) -> Real)(i))))")
  let t14 = @tactics.trans_tac(@realax.real_le_trans())(t13)
  let t12 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) → abs(real_of_num(1) + x) <= real_of_num(1) + a")))
  let t11 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t10 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t9 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t17 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x8 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x8))
  }), t9), @tactics.gen_tac), t10), t11), t12), t14), t15), t16), @tactics.all_tac])
  let t7 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) → (r : Bool)) && p && q → p && q && r")))
  let t6 = @list.List([@tactics.then_tac(@nums.induct_tac, @simp.asm_simp_tac(@list.List([@real.real_lt_01(), @arith.add1(), @real.real_lt_mul()]))), @tactics.all_tac])
  let t5 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, real_of_num(0) < (B : (Num) -> Real)(i)"), fn(x2 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3 = @tactics.assume_tac(x2)
    fn(x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3(x4)
    }
  })
  let t1 = @simp.rewrite_tac(@list.List([@arith.ge(), @realax.real_gt(), @realax.real_gt(), @arith.le_0()]))
  let t51 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1), @tactics.strip_tac), t5), t6), t7), @tactics.conj_tac), t17), t18), @nums.induct_tac), t19), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t26), t31), t32), t34), @tactics.conj_tac), t35), t37), @tactics.conj_tac), t41), t42), t43), t44), t45), t46), t48), t49), t50)
  theorem_v_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ V : Real, ∀ beta : (Num) -> Real, ∀ omega : (Num) -> Real, ∀ DSF : (Num, Real) -> Real, ∀ B : (Num) -> Real, ∀ H : (Num) -> Real, ∀ v : (Num) -> Real, ∀ Tl : (Num) -> Real, ∀ Tp : (Num) -> Real, ∀ PSI : (Num, (Real, Real)) -> Real, ∀ psi : (Num, (Real, Real)) -> Real, ∀ tau : (Num, Real) -> Real, ∀ taup : (Num, Real) -> Real, real_of_num(0) <= V && (∀ i : Num, i >= 0 → beta(i) > real_of_num(0)) && (∀ i : Num, i >= 1 → (∀ x : Real, abs(x - DSF(i, x)) <= omega(i))) && (∀ i : Num, i >= 0 → abs(psi(i, (V, Tl(i)))) <= PSI(i, (V, abs(Tl(i))))) && (∀ i : Num, ∀ x : Real, ∀ y : Real, real_of_num(0) <= x && x <= y → PSI(i, (V, x)) <= PSI(i, (V, y))) && (∀ u : Real, tau(0, u) == u) && (∀ i : Num, ∀ u : Real, tau(i + 1, u) == beta(i + 1) * (PSI(i, (u, tau(i, u))) * tau(i, u)) + omega(i + 1)) && (∀ i : Num, ∀ u : Real, taup(i, u) == (real_of_num(1) + PSI(i, (u, tau(i, u)))) * tau(i, u)) && B(0) == real_of_num(1) && H(0) == real_of_num(0) && Tl(0) == V && (∀ i : Num, Tp(i) == (real_of_num(1) + psi(i, (V, Tl(i)))) * Tl(i)) && (∀ i : Num, v(i + 1) == DSF(i + 1, beta(i + 1) * Tp(i))) && (∀ i : Num, B(i + 1) == beta(i + 1) * B(i)) && (∀ i : Num, H(i + 1) == H(i) + v(i + 1) / B(i + 1)) && (∀ i : Num, Tl(i + 1) == beta(i + 1) * Tl(i) - v(i + 1)) → (∀ i : Num, V == H(i) + Tl(i) / B(i)) && (∀ i : Num, i >= 0 → abs(Tl(i)) <= tau(i, V)) && (∀ i : Num, i >= 0 → abs(Tp(i)) <= taup(i, V))"), t51))
}

///|
let theorem_v_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THEOREM_V_1")

///|
/// `THEOREM_V_1`
pub fn theorem_v_1() -> @kernel.Thm {
  theorem_v_1_c.get()
}

///|
/// posynomial
fn step_2() -> Unit raise {
  posynomial_c.set(@pair.new_definition(@term_syntax.parse_term("(posynomial : ((Real) -> Real) -> Bool)((p : (Real) -> Real)) == (∃ c : (Num) -> Real, ∃ n : (Num) -> Real, ∃ k : Num, (∀ i : Num, 1 <= i && i <= k → c(i) > real_of_num(0) && integer(n(i))) && (∀ v : Real, real_of_num(0) < v → sum(op_dot_dot(1, k), (i : Num) => c(i) * rpow(v, n(i))) == p(v)))")))
}

///|
let posynomial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("posynomial")

///|
/// `posynomial`
pub fn posynomial() -> @kernel.Thm {
  posynomial_c.get()
}

///|
/// POSYNOMIAL_0
fn step_3() -> Unit raise {
  let t58 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg()]))
  let t55 = @term_syntax.parse_term("0")
  let t56 = @term_syntax.parse_term("(i : Num) => real_of_num(0)")
  let t57 = @tactics.map_every(fn(x52 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s53 = @tactics.exists_tac(x52)
    fn(x54 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s53(x54)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num) => real_of_num(1)"), t56, t55]))
  let t59 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([posynomial()])), t57), t58), @int.arith_tac)
  posynomial_0_c.set(@tactics.prove(@term_syntax.parse_term("posynomial((v : Real) => real_of_num(0))"), t59))
}

///|
let posynomial_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_0")

///|
/// `POSYNOMIAL_0`
pub fn posynomial_0() -> @kernel.Thm {
  posynomial_0_c.get()
}

///|
/// POSYNOMIAL_1
fn step_4() -> Unit raise {
  let t66 = @simp.rewrite_tac(@list.List([@floor.integer_closed(), @iterate.sum_sing_numseg(), @transcendentals.rpow_pow()]))
  let t63 = @term_syntax.parse_term("1")
  let t64 = @term_syntax.parse_term("(i : Num) => real_of_num(0)")
  let t65 = @tactics.map_every(fn(x60 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s61 = @tactics.exists_tac(x60)
    fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s61(x62)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num) => real_of_num(1)"), t64, t63]))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([posynomial()])), t65), t66), @calc_rat.real_arith_tac)
  posynomial_1_c.set(@tactics.prove(@term_syntax.parse_term("posynomial((v : Real) => real_of_num(1))"), t67))
}

///|
let posynomial_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_1")

///|
/// `POSYNOMIAL_1`
pub fn posynomial_1() -> @kernel.Thm {
  posynomial_1_c.get()
}

///|
/// POSYNOMIAL_CMUL
fn step_5() -> Unit raise {
  let t82 = @simp.asm_simp_tac(@list.List([@realax.real_gt(), @real.real_lt_mul()]))
  let t81 = @simp.simp_tac(@list.List([@iterate.sum_lmul(), @equal.gsym(@realax.real_mul_assoc())]))
  let t80 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t79 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : (Num) -> Real)"))(fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x76
    let t78 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i : Num) => (c : Real) * (d : (Num) -> Real)(i)")), t78)
  }))
  let t75 = @simp.rewrite_tac(@list.List([posynomial()]))
  let t74 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s69 = @tactics.mp_tac(x68)
    fn(x70 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s69(x70)
    }
  }, fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s72 = @tactics.assume_tac(x71)
    fn(x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s72(x73)
    }
  }))
  let t83 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t74), t75), t79), t80), t81), t82)
  posynomial_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Real, ∀ c : Real, posynomial(p) && real_of_num(0) < c → posynomial((v : Real) => c * p(v))"), t83))
}

///|
let posynomial_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_CMUL")

///|
/// `POSYNOMIAL_CMUL`
pub fn posynomial_cmul() -> @kernel.Thm {
  posynomial_cmul_c.get()
}

///|
/// POSYNOMIAL_CONST
fn step_6() -> Unit raise {
  let t95 = @simp.asm_rewrite_tac(@list.List([posynomial_1()]))
  let t94 = @tactics.match_mp_tac(posynomial_cmul())
  let t93 = @simp.gen_rewrite_tac(fn(x92 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x86 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s87 = @equal.rand_conv(x86)
      fn(x88 : @kernel.Term) -> @kernel.Thm raise {
        s87(x88)
      }
    })((fn(x89 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s90 = @equal.abs_conv(x89)
      fn(x91 : @kernel.Term) -> @kernel.Thm raise {
        s90(x91)
      }
    })(x92))
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t85 = @simp.asm_rewrite_tac(@list.List([posynomial_0()]))
  let t84 = @tactics.repeat_tac(@tactics.strip_tac)
  let t96 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (c : Real)) == (c == real_of_num(0) || real_of_num(0) < c)"))])), t84), t85), t93), t94), t95)
  posynomial_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, real_of_num(0) <= c → posynomial((v : Real) => c)"), t96))
}

///|
let posynomial_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_CONST")

///|
/// `POSYNOMIAL_CONST`
pub fn posynomial_const() -> @kernel.Thm {
  posynomial_const_c.get()
}

///|
/// POSYNOMIAL_VPOWMUL
fn step_7() -> Unit raise {
  let t115 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_add(), @realax.real_mul_assoc(), @iterate.sum_rmul(), @floor.integer_closed()]))
  let t114 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => (nn : (Num) -> Real)(i) + (n : Real)"))
  let t113 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(nn : (Num) -> Real)"))(@tactics.strip_assume_tac))
  let t112 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t111 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t110 = @simp.gen_rewrite_tac(fn(x107 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s108 = @equal.binop_conv(x107)
    fn(x109 : @kernel.Term) -> @kernel.Thm raise {
      s108(x109)
    }
  }, @list.List([@theorems.swap_exists_thm()]))
  let t106 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Num) -> Real)"))
  let t105 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t104 = @simp.rewrite_tac(@list.List([posynomial()]))
  let t103 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s98 = @tactics.mp_tac(x97)
    fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s98(x99)
    }
  }, fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s101 = @tactics.assume_tac(x100)
    fn(x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s101(x102)
    }
  }))
  let t116 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t103), t104), t105), t106), t110), t111), t112), t113), t114), t115)
  posynomial_vpowmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Real, ∀ n : Real, posynomial(p) && integer(n) → posynomial((v : Real) => p(v) * rpow(v, n))"), t116))
}

///|
let posynomial_vpowmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_VPOWMUL")

///|
/// `POSYNOMIAL_VPOWMUL`
pub fn posynomial_vpowmul() -> @kernel.Thm {
  posynomial_vpowmul_c.get()
}

///|
/// POSYNOMIAL_VMUL
fn step_8() -> Unit raise {
  let t119 = @simp.asm_rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1(), @floor.integer_closed()]))
  let t117 = @term_syntax.parse_term("real_of_num(1)")
  let t118 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(p : (Real) -> Real)"), t117]), posynomial_vpowmul()))
  let t120 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t118), t119)
  posynomial_vmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Real, posynomial(p) → posynomial((v : Real) => p(v) * v)"), t120))
}

///|
let posynomial_vmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_VMUL")

///|
/// `POSYNOMIAL_VMUL`
pub fn posynomial_vmul() -> @kernel.Thm {
  posynomial_vmul_c.get()
}

///|
/// POSYNOMIAL_VDIV
fn step_9() -> Unit raise {
  let t123 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_pow(), @realax.real_div(), @transcendentals.rpow_neg(), @real.real_pow_1(), @floor.integer_closed()]))
  let t121 = @term_syntax.parse_term("-real_of_num(1)")
  let t122 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(p : (Real) -> Real)"), t121]), posynomial_vpowmul()))
  let t124 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t122), t123)
  posynomial_vdiv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Real, posynomial(p) → posynomial((v : Real) => p(v) / v)"), t124))
}

///|
let posynomial_vdiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_VDIV")

///|
/// `POSYNOMIAL_VDIV`
pub fn posynomial_vdiv() -> @kernel.Thm {
  posynomial_vdiv_c.get()
}

///|
/// POSYNOMIAL_V
fn step_10() -> Unit raise {
  let t133 = @simp.rewrite_tac(@list.List([posynomial_1()]))
  let t132 = @tactics.match_mp_tac(posynomial_vmul())
  let t134 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x131 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x125 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s126 = @equal.rand_conv(x125)
      fn(x127 : @kernel.Term) -> @kernel.Thm raise {
        s126(x127)
      }
    })((fn(x128 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s129 = @equal.abs_conv(x128)
      fn(x130 : @kernel.Term) -> @kernel.Thm raise {
        s129(x130)
      }
    })(x131))
  }, @list.List([@equal.gsym(@realax.real_mul_lid())])), t132), t133)
  posynomial_v_c.set(@tactics.prove(@term_syntax.parse_term("posynomial((v : Real) => v)"), t134))
}

///|
let posynomial_v_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_V")

///|
/// `POSYNOMIAL_V`
pub fn posynomial_v() -> @kernel.Thm {
  posynomial_v_c.get()
}

///|
/// POSYNOMIAL_ADD
fn step_11() -> Unit raise {
  let t153 = @simp.asm_simp_tac(@list.List([]))
  let t152 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.numseg()), @iterate.sum_offset(), @arith.add_sub()]))
  let t150 = @int.arith_rule(@term_syntax.parse_term("((1 <= (i : Num) && i <= (m : Num) + (n : Num)) && !(i <= m)) == (1 + m <= i && i <= n + m)"))
  let t151 = @simp.simp_tac(@list.List([@iterate.sum_cases(), @iterate.finite_numseg(), @iterate.in_numseg(), @int.arith_rule(@term_syntax.parse_term("((1 <= (i : Num) && i <= (m : Num) + (n : Num)) && i <= m) == (1 <= i && i <= m)")), t150]))
  let t149 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("COND((p : Bool), (f : (_) -> _), (g : (_) -> _), if p { (x : _) } else { (y : _) }) == (if p { f(x) } else { g(y) })"))]))
  let t148 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t154 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t148), t149), t151), t152), t153)
  let t147 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((i : Num) <= (m : Num)) && i <= m + (n : Num) → 1 <= i - m && i - m <= n"))]))
  let t146 = @simp.asm_simp_tac(@list.List([]))
  let t155 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t146), t147), t154])
  let t145 = @simp.rewrite_tac(@list.List([]))
  let t144 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) + (n : Num)"))
  let t143 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => if i <= (m : Num) { (n1 : (Num) -> Real)(i) } else { (n2 : (Num) -> Real)(i - m) }"))
  let t142 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => if i <= (m : Num) { (c1 : (Num) -> Real)(i) } else { (c2 : (Num) -> Real)(i - m) }"))
  let t139 = @term_syntax.parse_term("(n : Num)")
  let t140 = @term_syntax.parse_term("(n2 : (Num) -> Real)")
  let t141 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c2 : (Num) -> Real)"), t140, t139]))
  let t136 = @term_syntax.parse_term("(m : Num)")
  let t137 = @term_syntax.parse_term("(n1 : (Num) -> Real)")
  let t138 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c1 : (Num) -> Real)"), t137, t136]))
  let t135 = @simp.rewrite_tac(@list.List([posynomial(), @theorems.imp_conj(), @theorems.left_imp_exists_thm()]))
  let t156 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t135), t138), @tactics.disch_tac), @tactics.disch_tac), t141), @tactics.disch_tac), @tactics.disch_tac), t142), t143), t144), t145), @tactics.conj_tac), t155)
  posynomial_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Real, ∀ q : (Real) -> Real, posynomial(p) && posynomial(q) → posynomial((v : Real) => p(v) + q(v))"), t156))
}

///|
let posynomial_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_ADD")

///|
/// `POSYNOMIAL_ADD`
pub fn posynomial_add() -> @kernel.Thm {
  posynomial_add_c.get()
}

///|
/// POSYNOMIAL_SUM
fn step_12() -> Unit raise {
  let t158 = @simp.simp_tac(@list.List([@iterate.sum_clauses(), posynomial_0(), posynomial_add(), @sets.forall_in_insert(), @class.eta_ax()]))
  let t157 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t159 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t157), t158)
  posynomial_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : (A) -> Bool, ∀ p : (Real, A) -> Real, FINITE(k) && (∀ i : A, IN(i, k) → posynomial((v : Real) => p(v, i))) → posynomial((v : Real) => sum(k, p(v)))"), t159))
}

///|
let posynomial_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_SUM")

///|
/// `POSYNOMIAL_SUM`
pub fn posynomial_sum() -> @kernel.Thm {
  posynomial_sum_c.get()
}

///|
/// POSYNOMIAL_MUL
fn step_13() -> Unit raise {
  let t184 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), posynomial_1()]))
  let t183 = @tactics.match_mp_tac(posynomial_cmul())
  let t182 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realax.real_gt()])))
  let t181 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t180 = @simp.asm_simp_tac(@list.List([@floor.integer_closed()]))
  let t179 = @tactics.match_mp_tac(posynomial_vpowmul())
  let t178 = @simp.rewrite_tac(@list.List([@equal.gsym(posynomial())]))
  let t177 = @simp.simp_tac(@list.List([posynomial(), @equal.gsym(@transcendentals.rpow_add())]))
  let t176 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(c : Real) * (x : Real) * ((d : Real) * (y : Real)) == c * d * (x * y)"))]))
  let t175 = @tactics.repeat_tac(@tactics.strip_tac)
  let t174 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t173 = @simp.simp_tac(@list.List([@sets.finite_product_dependent(), @iterate.finite_numseg(), @sets.forall_in_gspec()]))
  let t172 = @tactics.match_mp_tac(posynomial_sum())
  let t171 = @simp.simp_tac(@list.List([@iterate.sum_sum_product(), @iterate.finite_numseg(), @determinants.real_mul_sum()]))
  let t170 = @simp.rewrite_tac(@list.List([@equal.gsym(posynomial())]))
  let t169 = @simp.asm_simp_tac(@list.List([posynomial()]))
  let t167 = @bool.spec_all(posynomial())
  let t168 = @simp.gen_rewrite_tac(fn(x166 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x160 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s161 = @equal.land_conv(x160)
      fn(x162 : @kernel.Term) -> @kernel.Thm raise {
        s161(x162)
      }
    })((fn(x163 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s164 = @equal.binop_conv(x163)
      fn(x165 : @kernel.Term) -> @kernel.Thm raise {
        s164(x165)
      }
    })(x166))
  }, @list.List([@equal.conv_rule(@equal.rand_conv(@equal.once_depth_conv(@equal.sym_conv)), t167)]))
  let t185 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t168), @tactics.strip_tac), t169), t170), t171), t172), t173), t174), t175), t176), t177), t178), t179), t180), t181), t182), t183), t184)
  posynomial_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Real, ∀ q : (Real) -> Real, posynomial(p) && posynomial(q) → posynomial((v : Real) => p(v) * q(v))"), t185))
}

///|
let posynomial_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSYNOMIAL_MUL")

///|
/// `POSYNOMIAL_MUL`
pub fn posynomial_mul() -> @kernel.Thm {
  posynomial_mul_c.get()
}

///|
/// REAL_CONVEX_ON_POSYNOMIAL
fn step_14() -> Unit raise {
  let t212 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t211 = @tactics.match_mp_tac(@realanalysis.real_convex_on_rpow_integer())
  let t210 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t209 = @tactics.match_mp_tac(@realanalysis.real_convex_lmul())
  let t208 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t207 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t206 = @tactics.match_mp_tac(@realanalysis.real_convex_on_sum())
  let t205 = @simp.rewrite_tac(@list.List([@realanalysis.is_realinterval_clauses()]))
  let t204 = @tactics.match_mp_tac(@meson.meson(@list.List([@realanalysis.real_convex_on_eq()]), @term_syntax.parse_term("is_realinterval((s : (Real) -> Bool)) && real_convex_on((f : (Real) -> Real), s) → (∀ x : Real, IN(x, s) → f(x) == (g : (Real) -> Real)(x)) → real_convex_on(g, s)")))
  let t203 = @simp.gen_rewrite_tac(fn(x202 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x196 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s197 = @equal.land_conv(x196)
      fn(x198 : @kernel.Term) -> @kernel.Thm raise {
        s197(x198)
      }
    })((fn(x199 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s200 = @equal.once_depth_conv(x199)
      fn(x201 : @kernel.Term) -> @kernel.Thm raise {
        s200(x201)
      }
    })(x202))
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("(real_of_num(0) < (v : Real)) == IN(v, {(x : Real) | real_of_num(0) < x})"))]))
  let t195 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s190 = @tactics.assume_tac(x189)
    fn(x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s190(x191)
    }
  }, fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s193 = @tactics.mp_tac(x192)
    fn(x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s193(x194)
    }
  }))
  let t186 = @term_syntax.parse_term("(m : Num)")
  let t187 = @term_syntax.parse_term("(n : (Num) -> Real)")
  let t188 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : (Num) -> Real)"), t187, t186]))
  let t213 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([posynomial(), @theorems.left_imp_exists_thm(), @realax.real_gt()]))), t188), t195), t203), t204), t205), t206), t207), t208), @tactics.strip_tac), t209), t210), t211), t212)
  real_convex_on_posynomial_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Real, posynomial(p) → real_convex_on(p, {(x : Real) | x > real_of_num(0)})"), t213))
}

///|
let real_convex_on_posynomial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONVEX_ON_POSYNOMIAL")

///|
/// `REAL_CONVEX_ON_POSYNOMIAL`
pub fn real_convex_on_posynomial() -> @kernel.Thm {
  real_convex_on_posynomial_c.get()
}

///|
/// COROLLARY_V_3
fn step_15() -> Unit raise {
  let t273 = @tactics.first_x_assum(fn(x270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s271 = @tactics.match_accept_tac(x270)
    fn(x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s271(x272)
    }
  })
  let t269 = @tactics.match_mp_tac(real_convex_on_posynomial())
  let t268 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_gt())]))
  let t265 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realanalysis.real_convex_on_subset()))
  let t267 = @tactics.first_x_assum(fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t265(x266))
  })
  let t264 = @simp.asm_rewrite_tac(@list.List([]))
  let t263 = @tactics.match_mp_tac(@realanalysis.real_convex_lower_real_interval())
  let t262 = @tactics.repeat_tac(@tactics.strip_tac)
  let t260 = @tactics.first_x_assum(fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s258 = @tactics.match_accept_tac(x257)
    fn(x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s258(x259)
    }
  })
  let t256 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t255 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t254 = @simp.rewrite_tac(@list.List([posynomial_1()]))
  let t253 = @tactics.match_mp_tac(posynomial_add())
  let t252 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.first_x_assum(fn(x249 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s250 = @tactics.match_accept_tac(x249)
    fn(x251 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s250(x251)
    }
  })]))
  let t248 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t247 = @tactics.match_mp_tac(posynomial_mul())
  let t246 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t245 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t261 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.gen_rewrite_tac(fn(x242 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s243 = @equal.rand_conv(x242)
    fn(x244 : @kernel.Term) -> @kernel.Thm raise {
      s243(x244)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))), t245), t246), t247), t248), t252), t253), t254), t255), t256), t260), @tactics.all_tac])
  let t241 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, posynomial((taup : (Num, Real) -> Real)(i))"), fn(x238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s239 = @tactics.assume_tac(x238)
    fn(x240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s239(x240)
    }
  })
  let t234 = @meson.asm_meson_tac(@list.List([@realax.real_le_trans(), @real.real_abs_pos(), @int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) + 1"))]))
  let t235 = @tactics.then_tac(@tactics.match_mp_tac(posynomial_const()), t234)
  let t233 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t232 = @tactics.match_mp_tac(posynomial_mul())
  let t231 = @simp.asm_rewrite_tac(@list.List([]))
  let t236 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(posynomial_cmul()), t231), t232), t233), t235])
  let t230 = @tactics.match_mp_tac(posynomial_add())
  let t229 = @simp.asm_rewrite_tac(@list.List([@arith.add1(), posynomial_v()]))
  let t237 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.gen_rewrite_tac(fn(x226 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s227 = @equal.rand_conv(x226)
    fn(x228 : @kernel.Term) -> @kernel.Thm raise {
      s227(x228)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))), t229), t230), @tactics.conj_tac), t236), @tactics.all_tac])
  let t225 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, posynomial((tau : (Num, Real) -> Real)(i))"), fn(x222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s223 = @tactics.assume_tac(x222)
    fn(x224 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s223(x224)
    }
  })
  let t221 = @tactics.repeat_tac(@tactics.gen_tac)
  let t218 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t220 = @tactics.first_assum(fn(x219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s216 = @tactics.assume_tac(x215)
      fn(x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s216(x217)
      }
    })(t218(x219))
  })
  let t214 = @tactics.repeat_tac(@tactics.gen_tac)
  let t274 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_gt(), @realax.real_ge(), @arith.gt(), @arith.ge(), @arith.le_0()])), t214), @tactics.strip_tac), t220), t221), @tactics.disch_tac), t225), t237), t241), t261), t262), t263), t264), t267), t268), t269), t273)
  corollary_v_3_c.set(@tactics.prove(@term_syntax.parse_term("∀ V : Real, ∀ beta : (Num) -> Real, ∀ omega : (Num) -> Real, ∀ DSF : (Num, Real) -> Real, ∀ B : (Num) -> Real, ∀ H : (Num) -> Real, ∀ v : (Num) -> Real, ∀ Tl : (Num) -> Real, ∀ Tp : (Num) -> Real, ∀ PSI : (Num, (Real, Real)) -> Real, ∀ psi : (Num, (Real, Real)) -> Real, ∀ tau : (Num, Real) -> Real, ∀ taup : (Num, Real) -> Real, real_of_num(0) < V && (∀ i : Num, i >= 0 → beta(i) > real_of_num(0)) && (∀ i : Num, i >= 1 → (∀ x : Real, abs(x - DSF(i, x)) <= omega(i))) && (∀ i : Num, i >= 0 → abs(psi(i, (V, Tl(i)))) <= PSI(i, (V, abs(Tl(i))))) && (∀ i : Num, ∀ x : Real, ∀ y : Real, real_of_num(0) <= x && x <= y → PSI(i, (V, x)) <= PSI(i, (V, y))) && (∀ u : Real, tau(0, u) == u) && (∀ i : Num, ∀ u : Real, tau(i + 1, u) == beta(i + 1) * (PSI(i, (u, tau(i, u))) * tau(i, u)) + omega(i + 1)) && (∀ i : Num, ∀ u : Real, taup(i, u) == (real_of_num(1) + PSI(i, (u, tau(i, u)))) * tau(i, u)) && B(0) == real_of_num(1) && H(0) == real_of_num(0) && Tl(0) == V && (∀ i : Num, Tp(i) == (real_of_num(1) + psi(i, (V, Tl(i)))) * Tl(i)) && (∀ i : Num, v(i + 1) == DSF(i + 1, beta(i + 1) * Tp(i))) && (∀ i : Num, B(i + 1) == beta(i + 1) * B(i)) && (∀ i : Num, H(i + 1) == H(i) + v(i + 1) / B(i + 1)) && (∀ i : Num, Tl(i + 1) == beta(i + 1) * Tl(i) - v(i + 1)) && (∀ i : Num, ∀ p : (Real) -> Real, i >= 0 && posynomial(p) → posynomial((v : Real) => PSI(i, (v, p(v))))) → (∀ a : Real, ∀ b : Real, SUBSET(real_interval([(a, b)]), {(x : Real) | x > real_of_num(0)}) → (∀ i : Num, ∀ u : Real, IN(u, real_interval([(a, b)])) → tau(i, u) <= max(tau(i, a), tau(i, b)) && taup(i, u) <= max(taup(i, a), taup(i, b))))"), t274))
}

///|
let corollary_v_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COROLLARY_V_3")

///|
/// `COROLLARY_V_3`
pub fn corollary_v_3() -> @kernel.Thm {
  corollary_v_3_c.get()
}

///|
/// FULL_COROLLARY
fn step_16() -> Unit raise {
  let t307 = @simp.asm_rewrite_tac(@list.List([@arith.ge(), @arith.le_0()]))
  let t296 = @term_syntax.parse_term("(psi : (Num, (Real, Real)) -> Real)")
  let t297 = @term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real)")
  let t298 = @term_syntax.parse_term("(Tp : (Num) -> Real)")
  let t299 = @term_syntax.parse_term("(Tl : (Num) -> Real)")
  let t300 = @term_syntax.parse_term("(v : (Num) -> Real)")
  let t301 = @term_syntax.parse_term("(H : (Num) -> Real)")
  let t302 = @term_syntax.parse_term("(B : (Num) -> Real)")
  let t303 = @term_syntax.parse_term("(DSF : (Num, Real) -> Real)")
  let t304 = @term_syntax.parse_term("(omega : (Num) -> Real)")
  let t305 = @term_syntax.parse_term("(beta : (Num) -> Real)")
  let t306 = @tactics.map_every(fn(x293 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s294 = @tactics.exists_tac(x293)
    fn(x295 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s294(x295)
    }
  }, @list.List([@term_syntax.parse_term("(V : Real)"), t305, t304, t303, t302, t301, t300, t299, t298, t297, t296]))
  let t308 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@realax.real_gt()]))(corollary_v_3())), t306), t307)
  let t292 = @simp.asm_rewrite_tac(@list.List([@realax.real_gt()]))
  let t286 = @term_syntax.parse_term("(psi : (Num, (Real, Real)) -> Real)")
  let t287 = @term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real)")
  let t288 = @term_syntax.parse_term("(v : (Num) -> Real)")
  let t289 = @term_syntax.parse_term("(DSF : (Num, Real) -> Real)")
  let t290 = @term_syntax.parse_term("(omega : (Num) -> Real)")
  let t291 = @tactics.map_every(fn(x283 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s284 = @tactics.exists_tac(x283)
    fn(x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s284(x285)
    }
  }, @list.List([@term_syntax.parse_term("(beta : (Num) -> Real)"), t290, t289, t288, t287, t286]))
  let t309 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@arith.ge(), @arith.le_0()]))(theorem_v_1())), t291), t292), t308])
  let t282 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool) && (s : Bool)) == ((p && q && r) && s)"))]))
  let t279 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t281 = @tactics.first_assum(fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s277 = @tactics.assume_tac(x276)
      fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s277(x278)
      }
    })(t279(x280))
  })
  let t275 = @tactics.repeat_tac(@tactics.gen_tac)
  let t310 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_gt(), @realax.real_ge(), @arith.gt(), @arith.ge(), @arith.le_0()])), t275), @tactics.strip_tac), t281), t282), @tactics.conj_tac), t309)
  full_corollary_c.set(@tactics.prove(@term_syntax.parse_term("∀ V : Real, ∀ beta : (Num) -> Real, ∀ omega : (Num) -> Real, ∀ DSF : (Num, Real) -> Real, ∀ B : (Num) -> Real, ∀ H : (Num) -> Real, ∀ v : (Num) -> Real, ∀ Tl : (Num) -> Real, ∀ Tp : (Num) -> Real, ∀ PSI : (Num, (Real, Real)) -> Real, ∀ psi : (Num, (Real, Real)) -> Real, ∀ tau : (Num, Real) -> Real, ∀ taup : (Num, Real) -> Real, real_of_num(0) < V && (∀ i : Num, i >= 0 → beta(i) > real_of_num(0)) && (∀ i : Num, i >= 1 → (∀ x : Real, abs(x - DSF(i, x)) <= omega(i))) && (∀ i : Num, i >= 0 → abs(psi(i, (V, Tl(i)))) <= PSI(i, (V, abs(Tl(i))))) && (∀ i : Num, ∀ x : Real, ∀ y : Real, real_of_num(0) <= x && x <= y → PSI(i, (V, x)) <= PSI(i, (V, y))) && (∀ u : Real, tau(0, u) == u) && (∀ i : Num, ∀ u : Real, tau(i + 1, u) == beta(i + 1) * (PSI(i, (u, tau(i, u))) * tau(i, u)) + omega(i + 1)) && (∀ i : Num, ∀ u : Real, taup(i, u) == (real_of_num(1) + PSI(i, (u, tau(i, u)))) * tau(i, u)) && B(0) == real_of_num(1) && H(0) == real_of_num(0) && Tl(0) == V && (∀ i : Num, Tp(i) == (real_of_num(1) + psi(i, (V, Tl(i)))) * Tl(i)) && (∀ i : Num, v(i + 1) == DSF(i + 1, beta(i + 1) * Tp(i))) && (∀ i : Num, B(i + 1) == beta(i + 1) * B(i)) && (∀ i : Num, H(i + 1) == H(i) + v(i + 1) / B(i + 1)) && (∀ i : Num, Tl(i + 1) == beta(i + 1) * Tl(i) - v(i + 1)) && (∀ i : Num, ∀ p : (Real) -> Real, i >= 0 && posynomial(p) → posynomial((v : Real) => PSI(i, (v, p(v))))) → (∀ i : Num, V == H(i) + Tl(i) / B(i)) && (∀ i : Num, abs(Tl(i)) <= tau(i, V)) && (∀ i : Num, abs(Tp(i)) <= taup(i, V)) && (∀ a : Real, ∀ b : Real, SUBSET(real_interval([(a, b)]), {(x : Real) | x > real_of_num(0)}) → (∀ i : Num, ∀ u : Real, IN(u, real_interval([(a, b)])) → tau(i, u) <= max(tau(i, a), tau(i, b)) && taup(i, u) <= max(taup(i, a), taup(i, b))))"), t310))
}

///|
let full_corollary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FULL_COROLLARY")

///|
/// `FULL_COROLLARY`
pub fn full_corollary() -> @kernel.Thm {
  full_corollary_c.get()
}

///|
/// BOUND_THEOREM_DIV
fn step_17() -> Unit raise {
  let t464 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t463 = @tactics.try_tac(@tactics.match_mp_tac(@real.real_le_inv2()))
  let t462 = @tactics.repeat_tac(@tactics.conj_tac)
  let t461 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t460 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) / real_of_num(4) <= (X : Real) / (Y : Real) && X / Y <= real_of_num(1)) == (real_of_num(1) / real_of_num(2) * inv(real_of_num(2)) <= X * inv(Y) && X * inv(Y) <= real_of_num(1) * inv(real_of_num(1)))"))]))
  let t459 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@realax.real_le_trans()]))])
  let t454 = @term_syntax.parse_term("(X : Real) / (Y : Real)")
  let t455 = @list.List([@term_syntax.parse_term("(i : Num)"), t454])
  let t458 = @tactics.disch_then(fn(x457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s452 = @tactics.mp_tac(x451)
      fn(x453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s452(x453)
      }
    })(((x456 : @kernel.Thm) => @bool.specl(t455, x456))(x457))
  })
  let t450 = @simp.rewrite_tac(@list.List([@sets.subset(), @misc.in_real_interval(), @sets.in_elim_thm()]))
  let t445 = @term_syntax.parse_term("real_of_num(1)")
  let t446 = @list.List([@term_syntax.parse_term("real_of_num(1) / real_of_num(4)"), t445])
  let t449 = @tactics.first_x_assum(fn(x448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s443 = @tactics.mp_tac(x442)
      fn(x444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s443(x444)
      }
    })(((x447 : @kernel.Thm) => @bool.specl(t446, x447))(x448))
  })
  let t441 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t440 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @real.real_le_div2_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (b : Real) → abs(b) == b"))]))
  let t438 = @simp.rewrite_tac(@list.List([]))
  let t439 = @list.List([@tactics.then_tac(@simp.expand_tac("PSI"), t438), @tactics.all_tac])
  let t437 = @simp.asm_rewrite_tac(@list.List([@real.real_add_sub()]))
  let t465 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(tau : (Num, Real) -> Real)"))), t437), @tactics.conj_tac), t439), t440), t441), t449), t450), @tactics.ants_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t458), @tactics.ants_tac), t459), t460), @tactics.conj_tac), t461), t462), t463), t464), @calc_rat.asm_real_arith_tac)
  let t419 = @simp.asm_simp_tac(@list.List([posynomial_const()]))
  let t418 = @simp.rewrite_tac(@list.List([]))
  let t420 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("PSI"), t418), t419), @tactics.no_tac)
  let t421 = @tactics.first_x_assum(fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s416 = @tactics.match_accept_tac(x415)
    fn(x417 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s416(x417)
    }
  })
  let t422 = @tactics.first_x_assum(fn(x412 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s413 = @tactics.match_accept_tac(x412)
    fn(x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s413(x414)
    }
  })
  let t423 = @tactics.first_x_assum(fn(x409 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s410 = @tactics.match_accept_tac(x409)
    fn(x411 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s410(x411)
    }
  })
  let t424 = @tactics.first_x_assum(fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s407 = @tactics.match_accept_tac(x406)
    fn(x408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s407(x408)
    }
  })
  let t405 = @simp.asm_simp_tac(@list.List([@arith.add1(), @real.real_div_rmul(), @real.real_lt_imp_nz()]))
  let t403 = @term_syntax.parse_term("(j : Num)")
  let t404 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t403)
  let t402 = @simp.asm_simp_tac(@list.List([@real.real_eq_ldiv_eq()]))
  let t401 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / (b : Real) * (c : Real) == a * (c / b)"))]))
  let t400 = @simp.asm_simp_tac(@list.List([]))
  let t399 = @simp.rewrite_tac(@list.List([]))
  let t398 = @simp.expand_tac("psi")
  let t397 = @tactics.first_x_assum(fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x392
    @simp.gen_rewrite_tac(fn(x394 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s395 = @equal.land_conv(x394)
      fn(x396 : @kernel.Term) -> @kernel.Thm raise {
        s395(x396)
      }
    }, @list.List([th]))
  })
  let t425 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")), t397), t398), t399), t400), t401), @tactics.ap_term_tac), t402), t404), @nums.induct_tac), t405), @calc_rat.real_arith_tac)
  let t426 = @tactics.first_x_assum(fn(x389 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s390 = @tactics.match_accept_tac(x389)
    fn(x391 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s390(x391)
    }
  })
  let t427 = @tactics.first_x_assum(fn(x386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s387 = @tactics.match_accept_tac(x386)
    fn(x388 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s387(x388)
    }
  })
  let t428 = @tactics.first_x_assum(fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s384 = @tactics.match_accept_tac(x383)
    fn(x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s384(x385)
    }
  })
  let t382 = @simp.rewrite_tac(@list.List([]))
  let t429 = @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("taup"), t382), @tactics.no_tac)
  let t430 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.no_tac)
  let t431 = @tactics.first_x_assum(fn(x379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s380 = @tactics.match_accept_tac(x379)
    fn(x381 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s380(x381)
    }
  })
  let t378 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t432 = @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("PSI"), t378), @tactics.no_tac)
  let t377 = @simp.asm_simp_tac(@list.List([]))
  let t376 = @simp.rewrite_tac(@list.List([]))
  let t375 = @tactics.map_every(fn(x372 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s373 = @simp.expand_tac(x372)
    fn(x374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s373(x374)
    }
  }, @list.List(["PSI", "psi"]))
  let t433 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")), t375), t376), t377), @tactics.no_tac)
  let t434 = @tactics.first_x_assum(fn(x369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s370 = @tactics.match_accept_tac(x369)
    fn(x371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s370(x371)
    }
  })
  let t435 = @tactics.first_x_assum(fn(x366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s367 = @tactics.match_accept_tac(x366)
    fn(x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s367(x368)
    }
  })
  let t436 = @list.List([@tactics.first_x_assum(fn(x363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s364 = @tactics.match_accept_tac(x363)
    fn(x365 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s364(x365)
    }
  }), t435, t434, t433, t432, t431, t430, t429, t428, t427, t426, t425, t424, t423, t422, t421, t420])
  let t466 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t436), t465])
  let t362 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_0(), @realax.real_gt()]))
  let t349 = @term_syntax.parse_term("(taup : (Num, Real) -> Real)")
  let t350 = @term_syntax.parse_term("(tau : (Num, Real) -> Real)")
  let t351 = @term_syntax.parse_term("(psi : (Num, (Real, Real)) -> Real)")
  let t352 = @term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real)")
  let t353 = @term_syntax.parse_term("(Tp : (Num) -> Real)")
  let t354 = @term_syntax.parse_term("(Tl : (Num) -> Real)")
  let t355 = @term_syntax.parse_term("(v : (Num) -> Real)")
  let t356 = @term_syntax.parse_term("(H : (Num) -> Real)")
  let t357 = @term_syntax.parse_term("(B : (Num) -> Real)")
  let t358 = @term_syntax.parse_term("(DSF : (Num, Real) -> Real)")
  let t359 = @term_syntax.parse_term("(omega : (Num) -> Real)")
  let t360 = @term_syntax.parse_term("(beta : (Num) -> Real)")
  let t361 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(X : Real) / (Y : Real)"), t360, t359, t358, t357, t356, t355, t354, t353, t352, t351, t350, t349]), full_corollary()))
  let t348 = @simp.abbrev_tac(@term_syntax.parse_term("(taup : (Num, Real) -> Real) == ((i : Num) => (u : Real) => (real_of_num(1) + (PSI : (Num, (Real, Real)) -> Real)(i, (u, (tau : (Num, Real) -> Real)(i, u)))) * tau(i, u))"))
  let t344 = @term_syntax.parse_term("(Tl : (Num) -> Real)(0) == (X : Real) / (Y : Real) && (∀ i : Num, Tl(SUC(i)) == (beta : (Num) -> Real)(i + 1) * Tl(i) - (v : (Num) -> Real)(i + 1))")
  let t345 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t342 = @simp.rewrite_rule(@list.List([@arith.add1()]))
  let t346 = @tactics.x_choose_then(@term_syntax.parse_term("(Tl : (Num) -> Real)"))(fn(x343 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t342(x343))
  })
  let t347 = t346(t345(t344))
  let t338 = @term_syntax.parse_term("(∀ u : Real, (tau : (Num, Real) -> Real)(0, u) == u) && (∀ i : Num, ∀ u : Real, tau(SUC(i), u) == (beta : (Num) -> Real)(i + 1) * ((PSI : (Num, (Real, Real)) -> Real)(i, (u, tau(i, u))) * tau(i, u)) + (omega : (Num) -> Real)(i + 1))")
  let t339 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t336 = @simp.rewrite_rule(@list.List([@arith.add1()]))
  let t340 = @tactics.x_choose_then(@term_syntax.parse_term("(tau : (Num, Real) -> Real)"))(fn(x337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t336(x337))
  })
  let t341 = t340(t339(t338))
  let t334 = @term_syntax.parse_term("(psi : (Num, (Real, Real)) -> Real) == ((i : Num) => GABS((f : ((Real, Real)) -> Real) => ∀ u : Real, ∀ t : Real, GEQ(f((u, t)), (sigma : (Real) -> Real)((Y : Real)))))")
  let t335 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real) == ((i : Num) => GABS((f : ((Real, Real)) -> Real) => ∀ u : Real, ∀ t : Real, GEQ(f((u, t)), (Sigma : Real))))"), t334]))
  let t333 = @list.List([@meson.asm_meson_tac(@list.List([@real.real_lt_div()])), @tactics.all_tac])
  let t332 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (X : Real) / (Y : Real)"), fn(x329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s330 = @tactics.assume_tac(x329)
    fn(x331 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s330(x331)
    }
  })
  let t328 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (X : Real) && real_of_num(0) < (Y : Real)"), @tactics.strip_assume_tac)
  let t327 = @list.List([@tactics.then_tac(@nums.induct_tac, @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @arith.add1(), @real.real_lt_01()]))), @tactics.all_tac])
  let t326 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, real_of_num(0) < (B : (Num) -> Real)(i)"), fn(x323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s324 = @tactics.assume_tac(x323)
    fn(x325 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s324(x325)
    }
  })
  let t319 = @term_syntax.parse_term("real_of_num(1)")
  let t322 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x316 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s317 = @tactics.mp_tac(x316)
      fn(x318 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s317(x318)
      }
    })(((x320 : @kernel.Thm) => @bool.spec(t319, x320))(x321))
  }), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t315 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (Sigma : Real)"), fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s313 = @tactics.assume_tac(x312)
    fn(x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s313(x314)
    }
  })
  let t311 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_0(), @realax.real_gt()]))
  let t467 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t311), @tactics.strip_tac), t315), t322), t326), t327), t328), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t332), t333), t335), t341), t347), t348), t361), t362), @tactics.ants_tac), t466)
  bound_theorem_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ beta : (Num) -> Real, ∀ Sigma : Real, ∀ omega : (Num) -> Real, ∀ B : (Num) -> Real, ∀ DSF : (Num, Real) -> Real, ∀ H : (Num) -> Real, ∀ R : (Num) -> Real, ∀ Tp : (Num) -> Real, ∀ X : Real, ∀ Y : Real, ∀ g : (Real) -> Real, ∀ sigma : (Real) -> Real, ∀ v : (Num) -> Real, (∀ i : Num, i >= 0 → beta(i) > real_of_num(0)) && real_of_num(1) / real_of_num(2) <= X && X < real_of_num(1) && real_of_num(1) <= Y && Y < real_of_num(2) && (∀ y : Real, real_of_num(1) <= y && y < real_of_num(2) → g(y) == (real_of_num(1) + sigma(y)) / y && abs(sigma(y)) <= Sigma) && (∀ i : Num, i >= 1 → (∀ x : Real, abs(x - DSF(i, x)) <= omega(i))) && B(0) == real_of_num(1) && H(0) == real_of_num(0) && R(0) == X && (∀ i : Num, Tp(i) == g(Y) * R(i)) && (∀ i : Num, v(i + 1) == DSF(i + 1, beta(i + 1) * Tp(i))) && (∀ i : Num, B(i + 1) == beta(i + 1) * B(i)) && (∀ i : Num, H(i + 1) == H(i) + v(i + 1) / B(i + 1)) && (∀ i : Num, R(i + 1) == beta(i + 1) * R(i) - v(i + 1) * Y) → (∃ tau : (Num, Real) -> Real, (∀ u : Real, tau(0, u) == u) && (∀ i : Num, ∀ u : Real, tau(i + 1, u) == beta(i + 1) * (Sigma * tau(i, u)) + omega(i + 1)) && (∀ i : Num, abs(X / Y - H(i)) <= max(tau(i, real_of_num(1) / real_of_num(4)), tau(i, real_of_num(1))) / B(i)))"), t467))
}

///|
let bound_theorem_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_THEOREM_DIV")

///|
/// `BOUND_THEOREM_DIV`
pub fn bound_theorem_div() -> @kernel.Thm {
  bound_theorem_div_c.get()
}

///|
/// BOUND_THEOREM_SQRT
fn step_18() -> Unit raise {
  let t686 = @tactics.match_mp_tac(@real.real_le_lsqrt())
  let t687 = @list.List([@tactics.match_mp_tac(@real.real_le_rsqrt()), t686])
  let t685 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@realax.real_le_trans()]))])
  let t680 = @term_syntax.parse_term("sqrt((X : Real))")
  let t681 = @list.List([@term_syntax.parse_term("(i : Num)"), t680])
  let t684 = @tactics.disch_then(fn(x683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x677 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s678 = @tactics.mp_tac(x677)
      fn(x679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s678(x679)
      }
    })(((x682 : @kernel.Thm) => @bool.specl(t681, x682))(x683))
  })
  let t676 = @simp.rewrite_tac(@list.List([@sets.subset(), @misc.in_real_interval(), @sets.in_elim_thm()]))
  let t671 = @term_syntax.parse_term("real_of_num(1)")
  let t672 = @list.List([@term_syntax.parse_term("real_of_num(1) / real_of_num(2)"), t671])
  let t675 = @tactics.first_x_assum(fn(x674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s669 = @tactics.mp_tac(x668)
      fn(x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s669(x670)
      }
    })(((x673 : @kernel.Thm) => @bool.specl(t672, x673))(x674))
  })
  let t667 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t666 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @real.real_le_div2_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (b : Real) → abs(b) == b"))]))
  let t664 = @simp.rewrite_tac(@list.List([]))
  let t665 = @list.List([@tactics.then_tac(@simp.expand_tac("PSI"), t664), @tactics.all_tac])
  let t663 = @simp.asm_rewrite_tac(@list.List([@real.real_add_sub()]))
  let t688 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(tau : (Num, Real) -> Real)"))), t663), @tactics.conj_tac), t665), t666), t667), t675), t676), @tactics.ants_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t684), @tactics.ants_tac), t685), @tactics.conj_tac), t687), @calc_rat.asm_real_arith_tac)
  let t645 = @simp.asm_rewrite_tac(@list.List([]))
  let t644 = @tactics.match_mp_tac(posynomial_vdiv())
  let t643 = @simp.asm_simp_tac(@list.List([@real.real_lt_inv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < inv(real_of_num(2)) * (x : Real)) == (real_of_num(0) < x)"))]))
  let t642 = @tactics.match_mp_tac(posynomial_cmul())
  let t641 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (inv(real_of_num(2)) * (inv((y : Real)) * (z : Real))) == inv(real_of_num(2)) * z * (x / y)"))]))
  let t640 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()]))
  let t639 = @simp.asm_simp_tac(@list.List([posynomial_const(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (s : Real) → real_of_num(0) <= real_of_num(1) + s"))]))
  let t638 = @tactics.match_mp_tac(posynomial_mul())
  let t637 = @simp.asm_simp_tac(@list.List([posynomial_const()]))
  let t636 = @tactics.match_mp_tac(posynomial_add())
  let t635 = @simp.asm_simp_tac(@list.List([posynomial_const()]))
  let t634 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == 0"))
  let t633 = @simp.rewrite_tac(@list.List([]))
  let t632 = @simp.expand_tac("PSI")
  let t631 = @term_syntax.parse_term("(p : (Real) -> Real)")
  let t646 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i : Num)"), t631])), @tactics.disch_tac), t632), t633), t634), t635), t636), t637), t638), t639), t640), t641), t642), t643), t644), t645)
  let t647 = @tactics.first_x_assum(fn(x628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s629 = @tactics.match_accept_tac(x628)
    fn(x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s629(x630)
    }
  })
  let t648 = @tactics.first_x_assum(fn(x625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s626 = @tactics.match_accept_tac(x625)
    fn(x627 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s626(x627)
    }
  })
  let t649 = @tactics.first_x_assum(fn(x622 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s623 = @tactics.match_accept_tac(x622)
    fn(x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s623(x624)
    }
  })
  let t650 = @tactics.first_x_assum(fn(x619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s620 = @tactics.match_accept_tac(x619)
    fn(x621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s620(x621)
    }
  })
  let t617 = @tactics.conv_tac(@calc_rat.real_field)
  let t618 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t617])
  let t616 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (beta : (Num) -> Real)((j : Num) + 1) && real_of_num(0) < (B : (Num) -> Real)(j)"), fn(x613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s614 = @tactics.mp_tac(x613)
    fn(x615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s614(x615)
    }
  })
  let t612 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, (B : (Num) -> Real)(i + 1) == (beta : (Num) -> Real)(i + 1) * B(i)"))]))
  let t611 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, (H : (Num) -> Real)(i + 1) == H(i) + (v : (Num) -> Real)(i + 1) / (B : (Num) -> Real)(i + 1)"))]))
  let t610 = @simp.simp_tac(@list.List([]))
  let t609 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t608 = @simp.once_rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ i : Num, (R : (Num) -> Real)(i + 1) == (beta : (Num) -> Real)(i + 1) * R(i) - (v : (Num) -> Real)(i + 1) * (((H : (Num) -> Real)(i + 1) + H(i)) / real_of_num(2))"))]))
  let t606 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t607 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @calc_rat.real_arith_tac), t606])
  let t605 = @tactics.match_mp_tac(@nums.num_induction())
  let t603 = @term_syntax.parse_term("(j : Num)")
  let t604 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t603)
  let t602 = @simp.asm_simp_tac(@list.List([@real.real_eq_ldiv_eq()]))
  let t601 = @simp.asm_simp_tac(@list.List([@real.sqrt_pow_2(), @realarith.real_lt_imp_le()]))
  let t600 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (h : Real)) / real_of_num(2) * (x - h) == (pow(x, 2) - pow(h, 2)) / real_of_num(2)"))]))
  let t599 = @tactics.exists_tac(@term_syntax.parse_term("(B : (Num) -> Real)((i : Num))"))
  let t598 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("∀ b : Real, real_of_num(0) < b && (x : Real) / b == (y : Real) / real_of_num(2) * ((z : Real) / b) → x == y / real_of_num(2) * z")))
  let t596 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) - (s - (h : Real)) / real_of_num(2) == (s + h) / real_of_num(2)"))]))
  let t594 = @tactics.conv_tac(@calc_rat.real_field)
  let t595 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t594])
  let t593 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (beta : (Num) -> Real)((j : Num) + 1) && real_of_num(0) < (B : (Num) -> Real)(j)"), fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s591 = @tactics.mp_tac(x590)
    fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s591(x592)
    }
  })
  let t589 = @tactics.undisch_tac(@term_syntax.parse_term("(Tl : (Num) -> Real)((j : Num)) / (B : (Num) -> Real)(j) == sqrt((X : Real)) - (H : (Num) -> Real)(j)"))
  let t597 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@real.real_sub_rzero(), @real.real_div_1(), @arith.add1()]))), t589), t593), t595), t596])
  let t588 = @tactics.subgoal_then(@term_syntax.parse_term("∀ j : Num, (Tl : (Num) -> Real)(j) / (B : (Num) -> Real)(j) == sqrt((X : Real)) - (H : (Num) -> Real)(j)"), fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s586 = @tactics.assume_tac(x585)
    fn(x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s586(x587)
    }
  })
  let t584 = @simp.asm_rewrite_tac(@list.List([]))
  let t583 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (b : Real) && real_of_num(0) < (s : Real) && (r : Real) == (s - (t : Real) / b / real_of_num(2)) * t → inv(s) * r == (real_of_num(1) - t * inv(real_of_num(2) * (s * b))) * t")))
  let t582 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t581 = @simp.asm_simp_tac(@list.List([]))
  let t580 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) + ((x : Real) - real_of_num(1)) == x"))]))
  let t579 = @list.List([@simp.asm_simp_tac(@list.List([@real.real_div_sqrt(), @realarith.real_lt_imp_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * ((c : Real) / (s : Real) * ((x : Real) / real_of_num(2))) == c * (x / s)"))])), @tactics.all_tac])
  let t578 = @simp.asm_rewrite_tac(@list.List([]))
  let t577 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == 0"))
  let t576 = @simp.rewrite_tac(@list.List([]))
  let t575 = @simp.expand_tac("psi")
  let t574 = @tactics.first_x_assum(fn(x569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x569
    @simp.gen_rewrite_tac(fn(x571 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s572 = @equal.land_conv(x571)
      fn(x573 : @kernel.Term) -> @kernel.Thm raise {
        s572(x573)
      }
    }, @list.List([th]))
  })
  let t651 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")), t574), t575), t576), t577), t578), t579), t580), t581), t582), @tactics.ap_term_tac), t583), t584), t588), t597), t598), t599), t600), t601), t602), t604), t605), @tactics.conj_tac), t607), t608), t609), t610), t611), t612), t616), t618)
  let t652 = @tactics.first_x_assum(fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s567 = @tactics.match_accept_tac(x566)
    fn(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s567(x568)
    }
  })
  let t653 = @tactics.first_x_assum(fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s564 = @tactics.match_accept_tac(x563)
    fn(x565 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s564(x565)
    }
  })
  let t654 = @tactics.first_x_assum(fn(x560 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s561 = @tactics.match_accept_tac(x560)
    fn(x562 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s561(x562)
    }
  })
  let t559 = @simp.rewrite_tac(@list.List([]))
  let t655 = @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("taup"), t559), @tactics.no_tac)
  let t656 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.no_tac)
  let t657 = @tactics.first_x_assum(fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s557 = @tactics.match_accept_tac(x556)
    fn(x558 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s557(x558)
    }
  })
  let t554 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))
  let t555 = @simp.asm_simp_tac(@list.List([@real.real_le_ladd(), @real.real_le_lmul_eq(), @real.real_le_div2_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (s : Real) → real_of_num(0) < real_of_num(1) + s")), @real.real_lt_mul(), t554]))
  let t553 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @real.real_le_ladd()]))
  let t552 = @simp.rewrite_tac(@list.List([]))
  let t551 = @simp.expand_tac("PSI")
  let t549 = @term_syntax.parse_term("(y : Real)")
  let t550 = @term_syntax.parse_term("(x : Real)")
  let t658 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i : Num)"), t550, t549])), @tactics.strip_tac), t551), t552), @class.cond_cases_tac), t553), t555), @calc_rat.real_arith_tac)
  let t548 = @simp.asm_rewrite_tac(@list.List([]))
  let t547 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t546 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(real_of_num(2) * x) == real_of_num(2) * x")))
  let t545 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t544 = @simp.rewrite_tac(@list.List([@real.real_abs_div()]))
  let t543 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) → abs(real_of_num(1) + x) <= real_of_num(1) + a"))]))
  let t542 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t541 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t540 = @simp.asm_simp_tac(@list.List([@real.real_abs_mul()]))
  let t539 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) && abs((real_of_num(1) + x) * (y : Real)) <= (b : Real) → abs((real_of_num(1) + x) * (real_of_num(1) - y) - real_of_num(1)) <= a + b")))
  let t538 = @simp.asm_simp_tac(@list.List([]))
  let t537 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == 0"))
  let t536 = @simp.rewrite_tac(@list.List([]))
  let t535 = @tactics.map_every(fn(x532 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s533 = @simp.expand_tac(x532)
    fn(x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s533(x534)
    }
  }, @list.List(["PSI", "psi"]))
  let t659 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")), t535), t536), t537), t538), t539), t540), t541), t542), t543), t544), t545), @tactics.ap_term_tac), t546), t547), t548)
  let t660 = @tactics.first_x_assum(fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s530 = @tactics.match_accept_tac(x529)
    fn(x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s530(x531)
    }
  })
  let t661 = @tactics.first_x_assum(fn(x526 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s527 = @tactics.match_accept_tac(x526)
    fn(x528 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s527(x528)
    }
  })
  let t662 = @list.List([@tactics.first_x_assum(fn(x523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s524 = @tactics.match_accept_tac(x523)
    fn(x525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s524(x525)
    }
  }), t661, t660, t659, t658, t657, t656, t655, t654, t653, t652, t651, t650, t649, t648, t647, t646])
  let t689 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t662), t688])
  let t522 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_0(), @realax.real_gt()]))
  let t509 = @term_syntax.parse_term("(taup : (Num, Real) -> Real)")
  let t510 = @term_syntax.parse_term("(tau : (Num, Real) -> Real)")
  let t511 = @term_syntax.parse_term("(psi : (Num, (Real, Real)) -> Real)")
  let t512 = @term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real)")
  let t513 = @term_syntax.parse_term("(Tp : (Num) -> Real)")
  let t514 = @term_syntax.parse_term("(Tl : (Num) -> Real)")
  let t515 = @term_syntax.parse_term("(v : (Num) -> Real)")
  let t516 = @term_syntax.parse_term("(H : (Num) -> Real)")
  let t517 = @term_syntax.parse_term("(B : (Num) -> Real)")
  let t518 = @term_syntax.parse_term("(DSF : (Num, Real) -> Real)")
  let t519 = @term_syntax.parse_term("(omega : (Num) -> Real)")
  let t520 = @term_syntax.parse_term("(beta : (Num) -> Real)")
  let t521 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("sqrt((X : Real))"), t520, t519, t518, t517, t516, t515, t514, t513, t512, t511, t510, t509]), full_corollary()))
  let t508 = @simp.abbrev_tac(@term_syntax.parse_term("(taup : (Num, Real) -> Real) == ((i : Num) => (u : Real) => (real_of_num(1) + (PSI : (Num, (Real, Real)) -> Real)(i, (u, (tau : (Num, Real) -> Real)(i, u)))) * tau(i, u))"))
  let t504 = @term_syntax.parse_term("(Tl : (Num) -> Real)(0) == sqrt((X : Real)) && (∀ i : Num, Tl(SUC(i)) == (beta : (Num) -> Real)(i + 1) * Tl(i) - (v : (Num) -> Real)(i + 1))")
  let t505 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t502 = @simp.rewrite_rule(@list.List([@arith.add1()]))
  let t506 = @tactics.x_choose_then(@term_syntax.parse_term("(Tl : (Num) -> Real)"))(fn(x503 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t502(x503))
  })
  let t507 = t506(t505(t504))
  let t498 = @term_syntax.parse_term("(∀ u : Real, (tau : (Num, Real) -> Real)(0, u) == u) && (∀ i : Num, ∀ u : Real, tau(SUC(i), u) == (beta : (Num) -> Real)(i + 1) * ((PSI : (Num, (Real, Real)) -> Real)(i, (u, tau(i, u))) * tau(i, u)) + (omega : (Num) -> Real)(i + 1))")
  let t499 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t496 = @simp.rewrite_rule(@list.List([@arith.add1()]))
  let t500 = @tactics.x_choose_then(@term_syntax.parse_term("(tau : (Num, Real) -> Real)"))(fn(x497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t496(x497))
  })
  let t501 = t500(t499(t498))
  let t494 = @term_syntax.parse_term("(psi : (Num, (Real, Real)) -> Real) == ((i : Num) => GABS((f : ((Real, Real)) -> Real) => ∀ u : Real, ∀ t : Real, GEQ(f((u, t)), if i == 0 { (sigma : (Real) -> Real)((X : Real)) } else { (real_of_num(1) + sigma(X)) * (real_of_num(1) - t / (real_of_num(2) * (u * (B : (Num) -> Real)(i)))) - real_of_num(1) })))")
  let t495 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(PSI : (Num, (Real, Real)) -> Real) == ((i : Num) => GABS((f : ((Real, Real)) -> Real) => ∀ u : Real, ∀ t : Real, GEQ(f((u, t)), if i == 0 { (Sigma : Real) } else { Sigma + (real_of_num(1) + Sigma) * (t / (real_of_num(2) * (u * (B : (Num) -> Real)(i)))) })))"), t494]))
  let t493 = @list.List([@meson.asm_meson_tac(@list.List([@real.sqrt_pos_lt()])), @tactics.all_tac])
  let t492 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < sqrt((X : Real))"), fn(x489 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s490 = @tactics.assume_tac(x489)
    fn(x491 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s490(x491)
    }
  })
  let t488 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (X : Real)"), fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s486 = @tactics.assume_tac(x485)
    fn(x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s486(x487)
    }
  })
  let t484 = @list.List([@tactics.then_tac(@nums.induct_tac, @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @arith.add1(), @real.real_lt_01()]))), @tactics.all_tac])
  let t483 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, real_of_num(0) < (B : (Num) -> Real)(i)"), fn(x480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s481 = @tactics.assume_tac(x480)
    fn(x482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s481(x482)
    }
  })
  let t476 = @term_syntax.parse_term("real_of_num(1) / real_of_num(2)")
  let t479 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s474 = @tactics.mp_tac(x473)
      fn(x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s474(x475)
      }
    })(((x477 : @kernel.Thm) => @bool.spec(t476, x477))(x478))
  }), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t472 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (Sigma : Real)"), fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s470 = @tactics.assume_tac(x469)
    fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s470(x471)
    }
  })
  let t468 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_0(), @realax.real_gt()]))
  let t690 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t468), @tactics.strip_tac), t472), t479), t483), t484), t488), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t492), t493), t495), t501), t507), t508), t521), t522), @tactics.ants_tac), t689)
  bound_theorem_sqrt_c.set(@tactics.prove(@term_syntax.parse_term("∀ beta : (Num) -> Real, ∀ Sigma : Real, ∀ omega : (Num) -> Real, ∀ B : (Num) -> Real, ∀ DSF : (Num, Real) -> Real, ∀ H : (Num) -> Real, ∀ R : (Num) -> Real, ∀ Tp : (Num) -> Real, ∀ X : Real, ∀ g : (Real) -> Real, ∀ sigma : (Real) -> Real, ∀ v : (Num) -> Real, (∀ i : Num, i >= 0 → beta(i) > real_of_num(0)) && real_of_num(1) / real_of_num(4) <= X && X < real_of_num(1) && (∀ x : Real, real_of_num(1) / real_of_num(4) <= x && x < real_of_num(1) → g(x) == (real_of_num(1) + sigma(x)) / sqrt(x) && abs(sigma(x)) <= Sigma) && (∀ i : Num, i >= 1 → (∀ x : Real, abs(x - DSF(i, x)) <= omega(i))) && B(0) == real_of_num(1) && H(0) == real_of_num(0) && R(0) == X / real_of_num(2) && (∀ i : Num, Tp(i) == (if i == 0 { real_of_num(2) } else { real_of_num(1) }) * (g(X) * R(i))) && (∀ i : Num, v(i + 1) == DSF(i + 1, beta(i + 1) * Tp(i))) && (∀ i : Num, B(i + 1) == beta(i + 1) * B(i)) && (∀ i : Num, H(i + 1) == H(i) + v(i + 1) / B(i + 1)) && (∀ i : Num, R(i + 1) == beta(i + 1) * R(i) - v(i + 1) * ((H(i + 1) + H(i)) / real_of_num(2))) → (∃ tau : (Num, Real) -> Real, (∀ u : Real, tau(0, u) == u) && (∀ i : Num, ∀ u : Real, tau(i + 1, u) == beta(i + 1) * ((if i == 0 { Sigma } else { Sigma + (real_of_num(1) + Sigma) * (tau(i, u) / (real_of_num(2) * (u * B(i)))) }) * tau(i, u)) + omega(i + 1)) && (∀ i : Num, abs(sqrt(X) - H(i)) <= max(tau(i, real_of_num(1) / real_of_num(2)), tau(i, real_of_num(1))) / B(i)))"), t690))
}

///|
let bound_theorem_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_THEOREM_SQRT")

///|
/// `BOUND_THEOREM_SQRT`
pub fn bound_theorem_sqrt() -> @kernel.Thm {
  bound_theorem_sqrt_c.get()
}

///|
/// BOUNDS_INSTATIATION
fn step_19() -> Unit raise {
  let t696 = @simp.asm_rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t695 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t694 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t693 = @simp.asm_rewrite_tac(@list.List([]))
  let t691 = @term_syntax.parse_term("(a : Real) / (b : Real)")
  let t692 = @tactics.trans_tac(@realax.real_le_trans())(t691)
  let t697 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t692), t693), t694), t695), t696)
  let pth = @tactics.prove(@term_syntax.parse_term("(x : Real) <= (a : Real) / (b : Real) → real_of_num(0) <= b → (∀ a' : Real, a <= a' → x <= a' / b)"), t697)
  fn calc(x698 : @list.List[@kernel.Thm], x699 : (@kernel.Thm, @kernel.Thm), x700 : Int64) -> @list.List[@kernel.Thm] raise {
    let rews = x698
    let (thb, ths) = x699
    let n = x700
    if (n == 0L) {
      @list.List([thb])
    } else {
      let oths = calc(rews, (thb, ths), @lib.sub63(n, 1L))
      let th1 = @equal.conv_rule(@calc_num.num_reduce_conv, @bool.spec(@nums.mk_small_numeral(@lib.sub63(n, 1L)), ths))
      let th2 = @simp.gen_rewrite_rule(fn(x701 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s702 = @equal.top_depth_conv(x701)
        fn(x703 : @kernel.Term) -> @kernel.Thm raise {
          s702(x703)
        }
      }, rews.prepend(@lib.hd(oths)))(th1)
      let th3 = @equal.conv_rule(@calc_rat.real_rat_reduce_conv, th2)
      oths.prepend(th3)
    }
  }
  bounds_instatiation_c.set(fn(x704 : @kernel.Thm) -> ((@kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise) raise) raise {
    let th = x704
    fn(x705 : @kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise) raise {
      let beta = x705
      fn(x706 : @kernel.Term) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise {
        let sigma = x706
        fn(x707 : @kernel.Term) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise {
          let omega = x707
          fn(x708 : Int64) -> ((Int64) -> @kernel.Thm raise) raise {
            let n_1 = x708
            fn(x709 : Int64) -> @kernel.Thm raise {
              let d = x709
              let ith = @equal.beta_rule(@bool.specl(@list.List([beta, sigma, omega]), th))
              let (avs, itm) = @basics.strip_forall(@kernel.concl(ith))
              let hth = @kernel.assume_rule(@kernel.rand(@equal.lhand(itm)))
              let t710 = @bool.conj(@calc_rat.real_arith(@equal.lhand(@equal.lhand(itm))), hth)
              let eth = @bool.mp(@bool.specl(avs, ith), t710)
              let (ev, ebod) = @basics.dest_exists(@kernel.concl(eth))
              match @bool.conjuncts_rule(@kernel.assume_rule(ebod)) {
                More(th0, tail=More(th1_1, tail=More(bth, tail=Empty))) => {
                  let hths = @bool.conjuncts_rule(hth)
                  let t711 = @lib.el(if (th == bound_theorem_div()) {
                    11
                  } else {
                    9
                  }, hths)
                  let (th_b, th_s) = (@lib.el(if (th == bound_theorem_div()) {
                    6
                  } else {
                    4
                  }, hths), t711)
                  let bths = calc(@list.List([]), (th_b, th_s), n_1)
                  let t713 = @simp.gen_rewrite_rule(fn(x712 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x712
                  }, @list.List([@theorems.swap_forall_thm()]))(th1_1)
                  let t714 = @bool.spec(if (th == bound_theorem_div()) {
                    @term_syntax.parse_term("real_of_num(1) / real_of_num(4)")
                  } else {
                    @term_syntax.parse_term("real_of_num(1) / real_of_num(2)")
                  }, t713)
                  let tths_lo = calc(bths, (@bool.spec(if (th == bound_theorem_div()) {
                    @term_syntax.parse_term("real_of_num(1) / real_of_num(4)")
                  } else {
                    @term_syntax.parse_term("real_of_num(1) / real_of_num(2)")
                  }, th0), t714), n_1)
                  let t716 = @simp.gen_rewrite_rule(fn(x715 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    x715
                  }, @list.List([@theorems.swap_forall_thm()]))(th1_1)
                  let t717 = @bool.spec(@term_syntax.parse_term("real_of_num(1)"), t716)
                  let tths_hi = calc(bths, (@bool.spec(@term_syntax.parse_term("real_of_num(1)"), th0), t717), n_1)
                  let t726 = @lib.range(0L, n_1)
                  let t719 = @simp.rewrite_rule(tths_lo.concat(tths_hi))
                  let aths = @lib.map(fn(x725 : Int64) -> @kernel.Thm raise {
                    (fn(x724 : @kernel.Term) -> @kernel.Thm raise {
                      (fn(x720 : @kernel.Thm) -> @kernel.Thm raise {
                        ((x718 : @kernel.Thm) => @equal.conv_rule(@calc_rat.real_rat_reduce_conv, x718))(t719(x720))
                      })((fn(x723 : @kernel.Term) -> @kernel.Thm raise {
                        (fn(x721 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                          fn(x722 : @kernel.Thm) -> @kernel.Thm raise {
                            @bool.spec(x721, x722)
                          }
                        })(x723)(bth)
                      })(x724))
                    })(@nums.mk_small_numeral(x725))
                  }, t726)
                  let weaken : (@kernel.Thm) -> @kernel.Thm raise = fn(x727 : @kernel.Thm) -> @kernel.Thm raise {
                    let th_1 = x727
                    let th1_2 = @drule.match_mp(pth)(th_1)
                    let t731 = @equal.lhand(@kernel.concl(th1_2))
                    let th2_1 = @simp.gen_rewrite_conv(fn(x728 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s729 = @equal.rand_conv(x728)
                      fn(x730 : @kernel.Term) -> @kernel.Thm raise {
                        s729(x730)
                      }
                    }, bths)(t731)
                    let th3_1 = @equal.conv_rule(@equal.rand_conv(@calc_rat.real_rat_reduce_conv), th2_1)
                    let th4 = @bool.mp(th1_2, @bool.eqt_elim(th3_1))
                    let rr = @calc_int.rat_of_term(@equal.lhand(@equal.lhand(@basics.dest_forall(@kernel.concl(th4)).1)))
                    let yy = @num.pow10(@lib.int63_to_int(d))
                    let xx = @num.ceiling_num(@num.mult_num(yy, rr))
                    let t732 = @nums.mk_numeral(yy)
                    let th5 = @bool.specl(@list.List([@nums.mk_numeral(xx), t732]), @calc_rat.decimal())
                    let th6 = @bool.spec(@equal.lhand(@kernel.concl(th5)), th4)
                    @bool.mp(th6, @bool.eqt_elim(@calc_rat.real_rat_reduce_conv(@equal.lhand(@kernel.concl(th6)))))
                  }
                  let ath = @lib.end_itlist(@bool.conj, @lib.map(weaken, aths))
                  @bool.genl(avs, @bool.disch_all(@bool.choose_rule(ev, eth, ath)))
                }
                _ => raise @lib.MatchFailure("tscript.ml:690")
              }
            }
          }
        }
      }
    }
  })
}

///|
let bounds_instatiation_c : @lib.Cell[(@kernel.Thm) -> ((@kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise) raise) raise] = @lib.Cell::new("BOUNDS_INSTATIATION")

///|
/// `BOUNDS_INSTATIATION`
pub fn bounds_instatiation(x : @kernel.Thm) -> ((@kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise) raise) raise) raise {
  (bounds_instatiation_c.get())(x)
}

///|
/// Examples/digit_serial_methods.ml:726
fn step_20() -> Unit raise {
  let t733 = @term_syntax.parse_term("(i : Num) => if i == 0 { real_of_num(1) / real_of_num(2) } else { real_of_num(9) / real_of_num(16) }")
  let t734 = @term_syntax.parse_term("inv(pow(real_of_num(2), 8))")
  let t735 = @term_syntax.parse_term("(i : Num) => if i == 2 { real_of_num(32) } else { if i == 5 { real_of_num(64) } else { real_of_num(128) } }")
  ignore(bounds_instatiation(bound_theorem_sqrt())(t735)(t734)(t733)(7L)(6L))
}

///|
/// TABLE_PART_1
fn step_21() -> Unit raise {
  let t736 = @term_syntax.parse_term("(i : Num) => real_of_num(5) / real_of_num(8)")
  let t737 = @term_syntax.parse_term("inv(pow(real_of_num(2), 9))")
  let t738 = @term_syntax.parse_term("(i : Num) => real_of_num(128)")
  table_part_1_c.set(bounds_instatiation(bound_theorem_div())(t738)(t737)(t736)(4L)(4L))
}

///|
let table_part_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TABLE_PART_1")

///|
/// `TABLE_PART_1`
pub fn table_part_1() -> @kernel.Thm {
  table_part_1_c.get()
}

///|
/// TABLE_PART_2
fn step_22() -> Unit raise {
  let t739 = @term_syntax.parse_term("(i : Num) => real_of_num(5) / real_of_num(8)")
  let t740 = @term_syntax.parse_term("inv(pow(real_of_num(2), 9))")
  let t741 = @term_syntax.parse_term("(i : Num) => if i == 2 { real_of_num(32) } else { real_of_num(128) }")
  table_part_2_c.set(bounds_instatiation(bound_theorem_div())(t741)(t740)(t739)(4L)(4L))
}

///|
let table_part_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TABLE_PART_2")

///|
/// `TABLE_PART_2`
pub fn table_part_2() -> @kernel.Thm {
  table_part_2_c.get()
}

///|
/// TABLE_PART_3
fn step_23() -> Unit raise {
  let t742 = @term_syntax.parse_term("(i : Num) => real_of_num(5) / real_of_num(8)")
  let t743 = @term_syntax.parse_term("inv(pow(real_of_num(2), 9))")
  let t744 = @term_syntax.parse_term("(i : Num) => real_of_num(128)")
  table_part_3_c.set(bounds_instatiation(bound_theorem_sqrt())(t744)(t743)(t742)(4L)(4L))
}

///|
let table_part_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TABLE_PART_3")

///|
/// `TABLE_PART_3`
pub fn table_part_3() -> @kernel.Thm {
  table_part_3_c.get()
}

///|
/// TABLE_PART_4
fn step_24() -> Unit raise {
  let t745 = @term_syntax.parse_term("(i : Num) => real_of_num(5) / real_of_num(8)")
  let t746 = @term_syntax.parse_term("inv(pow(real_of_num(2), 9))")
  let t747 = @term_syntax.parse_term("(i : Num) => if i == 2 { real_of_num(32) } else { real_of_num(128) }")
  table_part_4_c.set(bounds_instatiation(bound_theorem_sqrt())(t747)(t746)(t745)(4L)(4L))
}

///|
let table_part_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TABLE_PART_4")

///|
/// `TABLE_PART_4`
pub fn table_part_4() -> @kernel.Thm {
  table_part_4_c.get()
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
}
