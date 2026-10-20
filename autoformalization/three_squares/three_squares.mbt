// Translated from upstream Autoformalization/three_squares.ml; edit this file directly.

///|
/// Autoformalization/three_squares.ml:27
fn step_1() -> Unit raise {
  @int.prioritize_int(())
}

///|
/// INT_BALANCED_REM
fn step_2() -> Unit raise {
  let t6 = @tactics.exists_tac(@term_syntax.parse_term("(d : Int) + int_of_num(1)"))
  let t7 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(d : Int)")), t6])
  let t5 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Int) * int_of_num(2) <= (q : Int)"))
  let t4 = @simp.abbrev_tac(@term_syntax.parse_term("(d : Int) == div((x : Int), (q : Int))"))
  let t3 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Int) == rem((x : Int), (q : Int))"))
  let t1 = @term_syntax.parse_term("(q : Int)")
  let t2 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Int)"), t1]), @int.int_division()))
  let t8 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2), @tactics.ants_tac), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t3), t4), @tactics.strip_tac), t5), t7), @int.asm_int_arith_tac)
  int_balanced_rem_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Int, ∀ q : Int, int_of_num(0) < q → (∃ b : Int, abs(x - q * b) * int_of_num(2) <= q)"), t8))
}

///|
let int_balanced_rem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_BALANCED_REM")

///|
/// `INT_BALANCED_REM`
pub fn int_balanced_rem() -> @kernel.Thm {
  int_balanced_rem_c.get()
}

///|
/// SQ_BOUND
fn step_3() -> Unit raise {
  let t16 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_pow_mul(), @int.int_pow2_abs()])), @int.int_arith_tac)
  let t15 = @simp.rewrite_tac(@list.List([@int.int_abs_pos()]))
  let t14 = @tactics.match_mp_tac(@int.int_le_mul())
  let t13 = @simp.asm_rewrite_tac(@list.List([]))
  let t17 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_pow_le2()), t13), t14), t15), @int.int_arith_tac), t16])
  let t12 = @tactics.subgoal_then(@term_syntax.parse_term("pow(abs((a : Int)) * int_of_num(2), 2) <= pow((q : Int), 2)"), fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s10 = @tactics.mp_tac(x9)
    fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s10(x11)
    }
  })
  let t18 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t12), t17)
  sq_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ q : Int, abs(a) * int_of_num(2) <= q → int_of_num(4) * pow(a, 2) <= pow(q, 2)"), t18))
}

///|
let sq_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQ_BOUND")

///|
/// `SQ_BOUND`
pub fn sq_bound() -> @kernel.Thm {
  sq_bound_c.get()
}

///|
/// POSDEF_BINARY_CRITERION
fn step_4() -> Unit raise {
  let t44 = @simp.asm_simp_tac(@list.List([@int.int_lt_mul_eq()]))
  let t43 = @simp.asm_simp_tac(@list.List([@int.int_lt_pow_2()]))
  let t42 = @tactics.match_mp_tac(@int.int_lt_mul())
  let t41 = @simp.rewrite_tac(@list.List([@int.int_le_pow_2()]))
  let t40 = @tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("int_of_num(0) <= (a : Int) && int_of_num(0) < (b : Int) → int_of_num(0) < a + b")))
  let t39 = @list.List([@tactics.conv_tac(@int.int_ring), @tactics.all_tac])
  let t45 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (A11 * pow((x : Int), 2) + (int_of_num(2) * ((A12 : Int) * (x * (y : Int))) + (A22 : Int) * pow(y, 2))) == pow(A11 * x + A12 * y, 2) + (A11 * A22 - pow(A12, 2)) * pow(y, 2)"), fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s37 = @tactics.subst1_tac(x36)
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s37(x38)
    }
  }), t39), t40), t41), t42), t43), t44])
  let t46 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (A11 : Int) * (A11 * pow((x : Int), 2) + (int_of_num(2) * ((A12 : Int) * (x * (y : Int))) + (A22 : Int) * pow(y, 2)))"), fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s34 = @tactics.mp_tac(x33)
    fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s34(x35)
    }
  }), t45)
  let t32 = @simp.asm_simp_tac(@list.List([@int.int_lt_pow_2()]))
  let t31 = @tactics.match_mp_tac(@int.int_lt_mul())
  let t29 = @tactics.conv_tac(@int.int_ring)
  let t30 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t29), @tactics.all_tac])
  let t28 = @tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * pow((x : Int), 2) + (int_of_num(2) * ((A12 : Int) * (x * (y : Int))) + (A22 : Int) * pow(y, 2)) == A11 * pow(x, 2)"), fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s26 = @tactics.subst1_tac(x25)
    fn(x27 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s26(x27)
    }
  })
  let t23 = @simp.asm_rewrite_tac(@list.List([]))
  let t24 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((x : Int) == int_of_num(0) && (y : Int) == int_of_num(0))")), t23), @tactics.all_tac])
  let t47 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((x : Int) == int_of_num(0))"), fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s21 = @tactics.assume_tac(x20)
    fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s21(x22)
    }
  }), t24), t28), t30), t31), t32), t46])
  let t19 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Int) == int_of_num(0)"))
  let t48 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t19), t47)
  posdef_binary_criterion_c.set(@tactics.prove(@term_syntax.parse_term("∀ A11 : Int, ∀ A12 : Int, ∀ A22 : Int, int_of_num(0) < A11 && int_of_num(0) < A11 * A22 - pow(A12, 2) → (∀ x : Int, ∀ y : Int, !(x == int_of_num(0) && y == int_of_num(0)) → int_of_num(0) < A11 * pow(x, 2) + (int_of_num(2) * (A12 * (x * y)) + A22 * pow(y, 2)))"), t48))
}

///|
let posdef_binary_criterion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSDEF_BINARY_CRITERION")

///|
/// `POSDEF_BINARY_CRITERION`
pub fn posdef_binary_criterion() -> @kernel.Thm {
  posdef_binary_criterion_c.get()
}

///|
/// BINARY_DISC1
fn step_5() -> Unit raise {
  let t177 = @tactics.conv_tac(@int.int_ring)
  let t176 = @tactics.undisch_tac(@term_syntax.parse_term("(A11 : Int) * pow((x : Int), 2) + (int_of_num(2) * ((A12 : Int) * (x * (y : Int))) + (A22 : Int) * pow(y, 2)) == (n : Int)"))
  let t175 = @tactics.map_every(fn(x172 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s173 = @simp.expand_tac(x172)
    fn(x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s173(x174)
    }
  }, @list.List(["A12'", "A22'"]))
  let t170 = @term_syntax.parse_term("(x : Int) - (r : Int) * (y : Int)")
  let t171 = @tactics.map_every(fn(x167 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s168 = @tactics.exists_tac(x167)
    fn(x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s168(x169)
    }
  }, @list.List([@term_syntax.parse_term("(y : Int)"), t170]))
  let t166 = @tactics.disch_then(@tactics.match_mp_tac)
  let t165 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) - pow((A12' : Int), 2) == int_of_num(1)")), @int.int_arith_tac), @tactics.all_tac])
  let t160 = @term_syntax.parse_term("(A11 : Int)")
  let t161 = @list.List([@term_syntax.parse_term("(A12' : Int)"), t160])
  let t164 = @tactics.disch_then(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s158 = @tactics.mp_tac(x157)
      fn(x159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s158(x159)
      }
    })(((x162 : @kernel.Thm) => @bool.specl(t161, x162))(x163))
  })
  let t156 = @list.List([@tactics.first_assum(fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s154 = @tactics.accept_tac(x153)
    fn(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s154(x155)
    }
  }), @tactics.all_tac])
  let t149 = @term_syntax.parse_term("(A22' : Int)")
  let t152 = @tactics.first_x_assum(fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s147 = @tactics.mp_tac(x146)
      fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s147(x148)
      }
    })(((x150 : @kernel.Thm) => @bool.spec(t149, x150))(x151))
  })
  let t144 = @simp.asm_simp_tac(@list.List([@int.int_lt_lmul_eq()]))
  let t140 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(4) <= (A11 : Int) * A11"))
  let t141 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_pow_2()])), t140), @int.int_arith_tac)
  let t142 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("int_of_num(4) * ((A11 : Int) * (A22' : Int)) <= int_of_num(4) + pow(A11, 2)")), @int.int_arith_tac), t141])
  let t139 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num(4) + pow((A11 : Int), 2)"))
  let t143 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_let_trans()), t139), @tactics.conj_tac), t142), @tactics.all_tac])
  let t138 = @tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (int_of_num(4) * (A22' : Int)) < A11 * (int_of_num(4) * A11)"), fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s136 = @tactics.mp_tac(x135)
    fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s136(x137)
    }
  })
  let t133 = @list.List([@int.asm_int_arith_tac, @tactics.then_tac(@tactics.match_mp_tac(@int.int_le_rmul()), @int.asm_int_arith_tac)])
  let t132 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num(2) * (A11 : Int)"))
  let t134 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_trans()), t132), @tactics.conj_tac), t133), @tactics.all_tac])
  let t131 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(4) <= (A11 : Int) * A11"), fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s129 = @tactics.assume_tac(x128)
    fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s129(x130)
    }
  })
  let t127 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(2) <= (A11 : Int)"), fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s125 = @tactics.assume_tac(x124)
    fn(x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s125(x126)
    }
  })
  let t121 = @kernel.assume_rule(@term_syntax.parse_term("abs((A12' : Int)) * int_of_num(2) <= (A11 : Int)"))
  let t122 = @tactics.mp_tac(@drule.match_mp(sq_bound())(t121))
  let t123 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) == int_of_num(1) + pow((A12' : Int), 2)"), fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x119
    @simp.rewrite_tac(@list.List([th]))
  }), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t122), @int.int_arith_tac), @tactics.all_tac])
  let t145 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("int_of_num(4) * ((A11 : Int) * (A22' : Int)) <= int_of_num(4) + pow(A11, 2)"), fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s117 = @tactics.assume_tac(x116)
    fn(x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s117(x118)
    }
  }), t123), t127), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t131), t134), t138), t143), t144), @int.int_arith_tac), @tactics.all_tac])
  let t115 = @tactics.subgoal_then(@term_syntax.parse_term("(A22' : Int) < (A11 : Int)"), fn(x112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s113 = @tactics.assume_tac(x112)
    fn(x114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s113(x114)
    }
  })
  let t110 = @simp.asm_simp_tac(@list.List([@int.int_lt_mul_eq()]))
  let t108 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(A12' : Int)"), @int.int_le_pow_2()))
  let t109 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) == int_of_num(1) + pow((A12' : Int), 2)"), fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s106 = @tactics.subst1_tac(x105)
    fn(x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s106(x107)
    }
  }), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t108), @int.int_arith_tac), @tactics.all_tac])
  let t111 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (A11 : Int) * (A22' : Int)"), fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s103 = @tactics.mp_tac(x102)
    fn(x104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s103(x104)
    }
  }), t109), t110), @tactics.all_tac])
  let t101 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (A22' : Int)"), fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s99 = @tactics.assume_tac(x98)
    fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s99(x100)
    }
  })
  let t96 = @tactics.undisch_tac(@term_syntax.parse_term("(A11 : Int) * (A22 : Int) - pow((A12 : Int), 2) == int_of_num(1)"))
  let t97 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x93 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s94 = @simp.expand_tac(x93)
    fn(x95 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s94(x95)
    }
  }, @list.List(["A12'", "A22'"])), t96), @int.int_arith_tac), @tactics.all_tac])
  let t92 = @tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) - pow((A12' : Int), 2) == int_of_num(1)"), fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s90 = @tactics.assume_tac(x89)
    fn(x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s90(x91)
    }
  })
  let t87 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(A12 : Int) + (A11 : Int) * -(b : Int) == A12 - A11 * b"))]))
  let t86 = @tactics.undisch_tac(@term_syntax.parse_term("abs((A12 : Int) - (A11 : Int) * (b : Int)) * int_of_num(2) <= A11"))
  let t88 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x83 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s84 = @simp.expand_tac(x83)
    fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s84(x85)
    }
  }, @list.List(["A12'", "r"])), t86), t87), @tactics.all_tac])
  let t82 = @tactics.subgoal_then(@term_syntax.parse_term("abs((A12' : Int)) * int_of_num(2) <= (A11 : Int)"), fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s80 = @tactics.assume_tac(x79)
    fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s80(x81)
    }
  })
  let t78 = @simp.abbrev_tac(@term_syntax.parse_term("(A22' : Int) == (A11 : Int) * pow((r : Int), 2) + (int_of_num(2) * ((A12 : Int) * r) + (A22 : Int))"))
  let t77 = @simp.abbrev_tac(@term_syntax.parse_term("(A12' : Int) == (A12 : Int) + (A11 : Int) * (r : Int)"))
  let t76 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Int) == -(b : Int)"))
  let t73 = @term_syntax.parse_term("(b : Int)")
  let t75 = @tactics.disch_then((x74 : @kernel.Thm) => @tactics.x_choose_tac(t73, x74))
  let t72 = @simp.asm_rewrite_tac(@list.List([]))
  let t70 = @term_syntax.parse_term("(A11 : Int)")
  let t71 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(A12 : Int)"), t70]), int_balanced_rem()))
  let t68 = @tactics.conv_tac(@int.int_ring)
  let t67 = @simp.asm_rewrite_tac(@list.List([]))
  let t65 = @simp.asm_rewrite_tac(@list.List([]))
  let t66 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(A11 : Int) * (A22 : Int) - pow((A12 : Int), 2) == int_of_num(1)")), t65), @int.int_arith_tac), @tactics.all_tac])
  let t64 = @tactics.subgoal_then(@term_syntax.parse_term("(A22 : Int) == int_of_num(1) + pow((A12 : Int), 2)"), fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s62 = @tactics.subst1_tac(x61)
    fn(x63 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s62(x63)
    }
  })
  let t60 = @tactics.undisch_tac(@term_syntax.parse_term("(A11 : Int) * pow((x : Int), 2) + (int_of_num(2) * ((A12 : Int) * (x * (y : Int))) + (A22 : Int) * pow(y, 2)) == (n : Int)"))
  let t59 = @term_syntax.parse_term("(y : Int)")
  let t69 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x56 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s57 = @tactics.exists_tac(x56)
    fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s57(x58)
    }
  }, @list.List([@term_syntax.parse_term("(x : Int) + (A12 : Int) * (y : Int)"), t59])), t60), t64), t66), t67), t68), @tactics.all_tac])
  let t55 = @class.asm_cases_tac(@term_syntax.parse_term("(A11 : Int) == int_of_num(1)"))
  let t52 = @term_syntax.parse_term("(y : Int)")
  let t54 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Int)"))((x53 : @kernel.Thm) => @tactics.x_choose_tac(t52, x53)))
  let t51 = @tactics.repeat_tac(@tactics.gen_tac)
  let t50 = @simp.rewrite_tac(@list.List([@int.int_abs_pos()]))
  let t49 = @tactics.exists_tac(@term_syntax.parse_term("abs"))
  let t178 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.wf_int_measure()), t49), t50), @tactics.gen_tac), @tactics.disch_tac), @tactics.strip_tac), t51), @tactics.disch_tac), @tactics.gen_tac), t54), t55), t69), t71), t72), t75), t76), t77), t78), t82), t88), t92), t97), t101), t111), t115), t145), t152), @tactics.ants_tac), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), @tactics.ants_tac), t156), t164), @tactics.ants_tac), t165), t166), t171), t175), t176), t177)
  binary_disc1_c.set(@tactics.prove(@term_syntax.parse_term("∀ A11 : Int, int_of_num(0) < A11 → (∀ A12 : Int, ∀ A22 : Int, A11 * A22 - pow(A12, 2) == int_of_num(1) → (∀ n : Int, (∃ x : Int, ∃ y : Int, A11 * pow(x, 2) + (int_of_num(2) * (A12 * (x * y)) + A22 * pow(y, 2)) == n) → (∃ u : Int, ∃ v : Int, pow(u, 2) + pow(v, 2) == n)))"), t178))
}

///|
let binary_disc1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_DISC1")

///|
/// `BINARY_DISC1`
pub fn binary_disc1() -> @kernel.Thm {
  binary_disc1_c.get()
}

///|
/// TERNARY_COMPLETE
fn step_6() -> Unit raise {
  ternary_complete_c.set(@int.int_ring(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, ∀ x1 : Int, ∀ x2 : Int, ∀ x3 : Int, a11 * (a11 * pow(x1, 2) + (a22 * pow(x2, 2) + (a33 * pow(x3, 2) + (int_of_num(2) * (a12 * (x1 * x2)) + (int_of_num(2) * (a13 * (x1 * x3)) + int_of_num(2) * (a23 * (x2 * x3))))))) == pow(a11 * x1 + (a12 * x2 + a13 * x3), 2) + ((a11 * a22 - pow(a12, 2)) * pow(x2, 2) + (int_of_num(2) * ((a11 * a23 - a12 * a13) * (x2 * x3)) + (a11 * a33 - pow(a13, 2)) * pow(x3, 2)))")))
}

///|
let ternary_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERNARY_COMPLETE")

///|
/// `TERNARY_COMPLETE`
pub fn ternary_complete() -> @kernel.Thm {
  ternary_complete_c.get()
}

///|
/// TSQ_DISC1_A11_1
fn step_7() -> Unit raise {
  let t244 = @tactics.undisch_tac(@term_syntax.parse_term("pow((u : Int), 2) + pow((v : Int), 2) == (n : Int) - pow((L : Int), 2)"))
  let t241 = @term_syntax.parse_term("(v : Int)")
  let t242 = @term_syntax.parse_term("(u : Int)")
  let t243 = @tactics.map_every(fn(x238 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s239 = @tactics.exists_tac(x238)
    fn(x240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s239(x240)
    }
  }, @list.List([@term_syntax.parse_term("(L : Int)"), t242, t241]))
  let t235 = @term_syntax.parse_term("(v : Int)")
  let t237 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Int)"))((x236 : @kernel.Thm) => @tactics.x_choose_tac(t235, x236)))
  let t233 = @tactics.map_every(fn(x230 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s231 = @simp.expand_tac(x230)
    fn(x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s231(x232)
    }
  }, @list.List(["G11", "G12", "G22", "L"]))
  let t229 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_lid()]))
  let t220 = @term_syntax.parse_term("(x3 : Int)")
  let t221 = @term_syntax.parse_term("(x2 : Int)")
  let t222 = @term_syntax.parse_term("(x1 : Int)")
  let t223 = @term_syntax.parse_term("(a33 : Int)")
  let t224 = @term_syntax.parse_term("(a23 : Int)")
  let t225 = @term_syntax.parse_term("(a22 : Int)")
  let t226 = @term_syntax.parse_term("(a13 : Int)")
  let t227 = @term_syntax.parse_term("(a12 : Int)")
  let t228 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("int_of_num(1)"), t227, t226, t225, t224, t223, t222, t221, t220]), ternary_complete()))
  let t219 = @term_syntax.parse_term("(x3 : Int)")
  let t234 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x216 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s217 = @tactics.exists_tac(x216)
    fn(x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s217(x218)
    }
  }, @list.List([@term_syntax.parse_term("(x2 : Int)"), t219])), t228), t229), t233), @int.int_arith_tac), @tactics.all_tac])
  let t212 = @term_syntax.parse_term("(n : Int) - pow((L : Int), 2)")
  let t215 = @tactics.disch_then(fn(x214 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s210 = @tactics.mp_tac(x209)
      fn(x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s210(x211)
      }
    })(((x213 : @kernel.Thm) => @bool.spec(t212, x213))(x214))
  })
  let t208 = @simp.asm_rewrite_tac(@list.List([]))
  let t203 = @term_syntax.parse_term("(G22 : Int)")
  let t204 = @list.List([@term_syntax.parse_term("(G12 : Int)"), t203])
  let t207 = @tactics.disch_then(fn(x206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s201 = @tactics.mp_tac(x200)
      fn(x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s201(x202)
      }
    })(((x205 : @kernel.Thm) => @bool.specl(t204, x205))(x206))
  })
  let t199 = @simp.asm_rewrite_tac(@list.List([]))
  let t198 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(G11 : Int)")]), binary_disc1()))
  let t197 = @simp.abbrev_tac(@term_syntax.parse_term("(L : Int) == (x1 : Int) + ((a12 : Int) * (x2 : Int) + (a13 : Int) * (x3 : Int))"))
  let t195 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(0) < int_of_num(1) * (a22 : Int) - pow((a12 : Int), 2)"))
  let t196 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("G11"), t195), @int.int_arith_tac), @tactics.all_tac])
  let t194 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (G11 : Int)"), fn(x191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s192 = @tactics.assume_tac(x191)
    fn(x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s192(x193)
    }
  })
  let t189 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(1) * ((a22 : Int) * (a33 : Int) - pow((a23 : Int), 2)) - (a12 : Int) * (a12 * a33 - a23 * (a13 : Int)) + a13 * (a12 * a23 - a22 * a13) == int_of_num(1)"))
  let t190 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x186 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s187 = @simp.expand_tac(x186)
    fn(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s187(x188)
    }
  }, @list.List(["G11", "G12", "G22"])), t189), @int.int_arith_tac), @tactics.all_tac])
  let t185 = @tactics.subgoal_then(@term_syntax.parse_term("(G11 : Int) * (G22 : Int) - pow((G12 : Int), 2) == int_of_num(1)"), fn(x182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s183 = @tactics.assume_tac(x182)
    fn(x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s183(x184)
    }
  })
  let t181 = @simp.abbrev_tac(@term_syntax.parse_term("(G22 : Int) == (a33 : Int) - pow((a13 : Int), 2)"))
  let t180 = @simp.abbrev_tac(@term_syntax.parse_term("(G12 : Int) == (a23 : Int) - (a12 : Int) * (a13 : Int)"))
  let t179 = @simp.abbrev_tac(@term_syntax.parse_term("(G11 : Int) == (a22 : Int) - pow((a12 : Int), 2)"))
  let t245 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t179), t180), t181), t185), t190), t194), t196), t197), t198), t199), t207), t208), t215), @tactics.ants_tac), t234), t237), t243), t244), @int.int_arith_tac)
  tsq_disc1_a11_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, ∀ n : Int, int_of_num(0) < int_of_num(1) * a22 - pow(a12, 2) && int_of_num(1) * (a22 * a33 - pow(a23, 2)) - a12 * (a12 * a33 - a23 * a13) + a13 * (a12 * a23 - a22 * a13) == int_of_num(1) && (∃ x1 : Int, ∃ x2 : Int, ∃ x3 : Int, int_of_num(1) * pow(x1, 2) + (a22 * pow(x2, 2) + (a33 * pow(x3, 2) + (int_of_num(2) * (a12 * (x1 * x2)) + (int_of_num(2) * (a13 * (x1 * x3)) + int_of_num(2) * (a23 * (x2 * x3)))))) == n) → (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == n)"), t245))
}

///|
let tsq_disc1_a11_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TSQ_DISC1_A11_1")

///|
/// `TSQ_DISC1_A11_1`
pub fn tsq_disc1_a11_1() -> @kernel.Thm {
  tsq_disc1_a11_1_c.get()
}

///|
/// SL3_EXTEND
fn step_8() -> Unit raise {
  let t324 = @tactics.conv_tac(@int.int_ring)
  let t323 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(a : Int) * ((u1' : Int) * (x : Int) + (u2' : Int) * (y : Int)) + (u3 : Int) * (z : Int) == int_of_num(1)")))
  let t322 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u1' : Int) * (x' : Int) + (u2' : Int) * (y' : Int) == int_of_num(1)")))
  let t321 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u2 : Int) == (a : Int) * (u2' : Int)")))
  let t320 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u1 : Int) == (a : Int) * (u1' : Int)")))
  let t314 = @term_syntax.parse_term("(u1' : Int) * (x : Int) + (u2' : Int) * (y : Int)")
  let t315 = @term_syntax.parse_term("int_of_num(0)")
  let t316 = @term_syntax.parse_term("-((u2' : Int) * (z : Int))")
  let t317 = @term_syntax.parse_term("(x' : Int)")
  let t318 = @term_syntax.parse_term("-((u1' : Int) * (z : Int))")
  let t319 = @tactics.map_every(fn(x311 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s312 = @tactics.exists_tac(x311)
    fn(x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s312(x313)
    }
  }, @list.List([@term_syntax.parse_term("-(y' : Int)"), t318, t317, t316, t315, t314]))
  let t309 = @tactics.conv_tac(@int.int_ring)
  let t308 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u2 : Int) == (a : Int) * (u2' : Int)")))
  let t307 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u1 : Int) == (a : Int) * (u1' : Int)")))
  let t310 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u1 : Int) * (x : Int) + ((u2 : Int) * (y : Int) + (u3 : Int) * (z : Int)) == int_of_num(1)"))), t307), t308), t309), @tactics.all_tac])
  let t306 = @tactics.subgoal_then(@term_syntax.parse_term("(a : Int) * ((u1' : Int) * (x : Int) + (u2' : Int) * (y : Int)) + (u3 : Int) * (z : Int) == int_of_num(1)"), fn(x303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s304 = @tactics.assume_tac(x303)
    fn(x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s304(x305)
    }
  })
  let t300 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_eq_mul_lcancel()])), @int.asm_int_arith_tac)
  let t299 = @tactics.conv_tac(@int.int_ring)
  let t298 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u2 : Int) == (a : Int) * (u2' : Int)")))
  let t297 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u1 : Int) == (a : Int) * (u1' : Int)")))
  let t301 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(a : Int) == (u1 : Int) * (x' : Int) + (u2 : Int) * (y' : Int)"))), t297), t298), t299), t300])
  let t302 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(a : Int) * ((u1' : Int) * (x' : Int) + (u2' : Int) * (y' : Int)) == a * int_of_num(1)"), fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s295 = @tactics.mp_tac(x294)
    fn(x296 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s295(x296)
    }
  }), t301), @tactics.all_tac])
  let t293 = @tactics.subgoal_then(@term_syntax.parse_term("(u1' : Int) * (x' : Int) + (u2' : Int) * (y' : Int) == int_of_num(1)"), fn(x290 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s291 = @tactics.assume_tac(x290)
    fn(x292 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s291(x292)
    }
  })
  let t283 = @simp.rewrite_rule(@list.List([@int.int_divides()]))
  let t281 = @term_syntax.parse_term("(u2' : Int)")
  let t289 = @tactics.first_assum(fn(x288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      ((x282 : @kernel.Thm) => @tactics.x_choose_tac(t281, x282))(t283(x284))
    })(((x287 : @kernel.Thm) => @lib.check(fn(x285 : @kernel.Thm) -> Bool raise {
      let th_1 = x285
      let t286 = @term_syntax.parse_term("(u2 : Int)")
      (@kernel.rand(@kernel.concl(th_1)) == t286)
    }, x287))(x288))
  })
  let t274 = @simp.rewrite_rule(@list.List([@int.int_divides()]))
  let t272 = @term_syntax.parse_term("(u1' : Int)")
  let t280 = @tactics.first_assum(fn(x279 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      ((x273 : @kernel.Thm) => @tactics.x_choose_tac(t272, x273))(t274(x275))
    })(((x278 : @kernel.Thm) => @lib.check(fn(x276 : @kernel.Thm) -> Bool raise {
      let th = x276
      let t277 = @term_syntax.parse_term("(u1 : Int)")
      (@kernel.rand(@kernel.concl(th)) == t277)
    }, x278))(x279))
  })
  let t270 = @meson.asm_meson_tac(@list.List([@integer.int_gcd_eq_0()]))
  let t269 = @simp.rewrite_tac(@list.List([]))
  let t268 = @tactics.undisch_tac(@term_syntax.parse_term("!((u1 : Int) == int_of_num(0) && (u2 : Int) == int_of_num(0))"))
  let t267 = @simp.asm_rewrite_tac(@list.List([]))
  let t271 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_lt_le()])), t267), @tactics.disch_tac), t268), t269), t270), @tactics.all_tac])
  let t266 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (a : Int)"), fn(x263 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s264 = @tactics.assume_tac(x263)
    fn(x265 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s264(x265)
    }
  })
  let t262 = @simp.abbrev_tac(@term_syntax.parse_term("(a : Int) == gcd(((u1 : Int), (u2 : Int)))"))
  let t260 = @term_syntax.parse_term("(u2 : Int)")
  let t261 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(u1 : Int)"), t260]), @int.int_gcd()))
  let t258 = @tactics.conv_tac(@int.int_ring)
  let t257 = @simp.asm_rewrite_tac(@list.List([]))
  let t256 = @tactics.undisch_tac(@term_syntax.parse_term("(u1 : Int) * (x : Int) + ((u2 : Int) * (y : Int) + (u3 : Int) * (z : Int)) == int_of_num(1)"))
  let t250 = @term_syntax.parse_term("int_of_num(0)")
  let t251 = @term_syntax.parse_term("int_of_num(0)")
  let t252 = @term_syntax.parse_term("int_of_num(1)")
  let t253 = @term_syntax.parse_term("int_of_num(0)")
  let t254 = @term_syntax.parse_term("int_of_num(0)")
  let t255 = @tactics.map_every(fn(x247 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s248 = @tactics.exists_tac(x247)
    fn(x249 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s248(x249)
    }
  }, @list.List([@term_syntax.parse_term("(z : Int)"), t254, t253, t252, t251, t250]))
  let t259 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(@tactics.strip_assume_tac), t255), t256), t257), t258), @tactics.all_tac])
  let t246 = @class.asm_cases_tac(@term_syntax.parse_term("(u1 : Int) == int_of_num(0) && (u2 : Int) == int_of_num(0)"))
  let t325 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t246), t259), t261), t262), @tactics.strip_tac), t266), t271), t280), t289), t293), t302), t306), t310), t319), t320), t321), t322), t323), t324)
  sl3_extend_c.set(@tactics.prove(@term_syntax.parse_term("∀ u1 : Int, ∀ u2 : Int, ∀ u3 : Int, (∃ x : Int, ∃ y : Int, ∃ z : Int, u1 * x + (u2 * y + u3 * z) == int_of_num(1)) → (∃ c12 : Int, ∃ c13 : Int, ∃ c22 : Int, ∃ c23 : Int, ∃ c32 : Int, ∃ c33 : Int, u1 * (c22 * c33 - c23 * c32) - c12 * (u2 * c33 - c23 * u3) + c13 * (u2 * c32 - c22 * u3) == int_of_num(1))"), t325))
}

///|
let sl3_extend_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SL3_EXTEND")

///|
/// `SL3_EXTEND`
pub fn sl3_extend() -> @kernel.Thm {
  sl3_extend_c.get()
}

///|
/// BINARY_HERMITE
fn step_9() -> Unit raise {
  let t451 = @simp.asm_rewrite_tac(@list.List([]))
  let t449 = @tactics.conv_tac(@int.int_ring)
  let t450 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x446 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s447 = @simp.expand_tac(x446)
    fn(x448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s447(x448)
    }
  }, @list.List(["A22'", "A12'"])), t449), @tactics.all_tac])
  let t452 = @tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * pow((y' : Int) + (r : Int) * (x' : Int), 2) + (int_of_num(2) * ((A12 : Int) * ((y' + r * x') * x')) + (A22 : Int) * pow(x', 2)) == (A22' : Int) * pow(x', 2) + (int_of_num(2) * ((A12' : Int) * (x' * y')) + A11 * pow(y', 2))"), fn(x443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s444 = @tactics.assume_tac(x443)
    fn(x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s444(x445)
    }
  }), t450), t451)
  let t441 = @meson.asm_meson_tac(@list.List([]))
  let t440 = @meson.meson_tac(@list.List([]))
  let t439 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_rzero(), @int.int_add_rid()]))
  let t442 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((x' : Int) == int_of_num(0) && (y' : Int) == int_of_num(0))")), t439), t440), t441])
  let t453 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(x' : Int) == int_of_num(0)")), t442), t452])
  let t438 = @tactics.exists_tac(@term_syntax.parse_term("(x' : Int)"))
  let t437 = @tactics.exists_tac(@term_syntax.parse_term("(y' : Int) + (r : Int) * (x' : Int)"))
  let t435 = @tactics.x_choose_then(@term_syntax.parse_term("(y' : Int)"))(@tactics.strip_assume_tac)
  let t436 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x' : Int)"))(t435))
  let t434 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) - pow((A12' : Int), 2) == (D : Int)")), @int.int_arith_tac), @tactics.all_tac])
  let t429 = @term_syntax.parse_term("(A11 : Int)")
  let t430 = @list.List([@term_syntax.parse_term("(A12' : Int)"), t429])
  let t433 = @tactics.disch_then(fn(x432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s427 = @tactics.mp_tac(x426)
      fn(x428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s427(x428)
      }
    })(((x431 : @kernel.Thm) => @bool.specl(t430, x431))(x432))
  })
  let t425 = @list.List([@tactics.first_assum(fn(x422 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s423 = @tactics.accept_tac(x422)
    fn(x424 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s423(x424)
    }
  }), @tactics.all_tac])
  let t418 = @term_syntax.parse_term("(A22' : Int)")
  let t421 = @tactics.first_x_assum(fn(x420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s416 = @tactics.mp_tac(x415)
      fn(x417 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s416(x417)
      }
    })(((x419 : @kernel.Thm) => @bool.spec(t418, x419))(x420))
  })
  let t413 = @simp.asm_simp_tac(@list.List([@int.int_lt_lmul_eq()]))
  let t409 = @simp.rewrite_tac(@list.List([@int.int_pow_2()]))
  let t408 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(4) * (D : Int) < int_of_num(3) * pow((A11 : Int), 2)"))
  let t410 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_pow_2()])), t408), t409), @int.int_arith_tac)
  let t411 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("int_of_num(4) * ((A11 : Int) * (A22' : Int)) <= int_of_num(4) * (D : Int) + pow(A11, 2)")), @int.int_arith_tac), t410])
  let t407 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num(4) * (D : Int) + pow((A11 : Int), 2)"))
  let t412 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_let_trans()), t407), @tactics.conj_tac), t411), @tactics.all_tac])
  let t406 = @tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (int_of_num(4) * (A22' : Int)) < A11 * (int_of_num(4) * A11)"), fn(x403 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s404 = @tactics.mp_tac(x403)
    fn(x405 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s404(x405)
    }
  })
  let t402 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(4) * (D : Int) < int_of_num(3) * pow((A11 : Int), 2)"), fn(x399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s400 = @tactics.assume_tac(x399)
    fn(x401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s400(x401)
    }
  })
  let t396 = @kernel.assume_rule(@term_syntax.parse_term("abs((A12' : Int)) * int_of_num(2) <= (A11 : Int)"))
  let t397 = @tactics.mp_tac(@drule.match_mp(sq_bound())(t396))
  let t398 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) == (D : Int) + pow((A12' : Int), 2)"), fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x394
    @simp.rewrite_tac(@list.List([th]))
  }), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t397), @int.int_arith_tac), @tactics.all_tac])
  let t414 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("int_of_num(4) * ((A11 : Int) * (A22' : Int)) <= int_of_num(4) * (D : Int) + pow(A11, 2)"), fn(x391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s392 = @tactics.assume_tac(x391)
    fn(x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s392(x393)
    }
  }), t398), t402), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t406), t412), t413), @int.int_arith_tac), @tactics.all_tac])
  let t390 = @tactics.subgoal_then(@term_syntax.parse_term("(A22' : Int) < (A11 : Int)"), fn(x387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s388 = @tactics.assume_tac(x387)
    fn(x389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s388(x389)
    }
  })
  let t383 = @tactics.first_assum(fn(x380 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s381 = @tactics.accept_tac(x380)
    fn(x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s381(x382)
    }
  })
  let t384 = @list.List([@tactics.conv_tac(@int.int_ring), t383])
  let t385 = @list.List([@int.int_arith_tac, @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * pow(int_of_num(1), 2) + (int_of_num(2) * ((A12 : Int) * (int_of_num(1) * int_of_num(0))) + (A22 : Int) * pow(int_of_num(0), 2)) == A11"), fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s378 = @tactics.subst1_tac(x377)
    fn(x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s378(x379)
    }
  }), t384)])
  let t376 = @term_syntax.parse_term("int_of_num(0)")
  let t386 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.map_every(fn(x373 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s374 = @tactics.exists_tac(x373)
    fn(x375 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s374(x375)
    }
  }, @list.List([@term_syntax.parse_term("int_of_num(1)"), t376])), @tactics.conj_tac), t385), @tactics.all_tac])
  let t372 = @class.asm_cases_tac(@term_syntax.parse_term("int_of_num(3) * pow((A11 : Int), 2) <= int_of_num(4) * (D : Int)"))
  let t370 = @simp.asm_simp_tac(@list.List([@int.int_lt_mul_eq()]))
  let t368 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(A12' : Int)"), @int.int_le_pow_2()))
  let t369 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) == (D : Int) + pow((A12' : Int), 2)"), fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s366 = @tactics.subst1_tac(x365)
    fn(x367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s366(x367)
    }
  }), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t368), @int.asm_int_arith_tac), @tactics.all_tac])
  let t371 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (A11 : Int) * (A22' : Int)"), fn(x362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s363 = @tactics.mp_tac(x362)
    fn(x364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s363(x364)
    }
  }), t369), t370), @tactics.all_tac])
  let t361 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (A22' : Int)"), fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s359 = @tactics.assume_tac(x358)
    fn(x360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s359(x360)
    }
  })
  let t356 = @tactics.undisch_tac(@term_syntax.parse_term("(A11 : Int) * (A22 : Int) - pow((A12 : Int), 2) == (D : Int)"))
  let t357 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x353 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s354 = @simp.expand_tac(x353)
    fn(x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s354(x355)
    }
  }, @list.List(["A12'", "A22'"])), t356), @int.int_arith_tac), @tactics.all_tac])
  let t352 = @tactics.subgoal_then(@term_syntax.parse_term("(A11 : Int) * (A22' : Int) - pow((A12' : Int), 2) == (D : Int)"), fn(x349 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s350 = @tactics.assume_tac(x349)
    fn(x351 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s350(x351)
    }
  })
  let t347 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(A12 : Int) + (A11 : Int) * -(b : Int) == A12 - A11 * b"))]))
  let t346 = @tactics.undisch_tac(@term_syntax.parse_term("abs((A12 : Int) - (A11 : Int) * (b : Int)) * int_of_num(2) <= A11"))
  let t348 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x343 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s344 = @simp.expand_tac(x343)
    fn(x345 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s344(x345)
    }
  }, @list.List(["A12'", "r"])), t346), t347), @tactics.all_tac])
  let t342 = @tactics.subgoal_then(@term_syntax.parse_term("abs((A12' : Int)) * int_of_num(2) <= (A11 : Int)"), fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s340 = @tactics.assume_tac(x339)
    fn(x341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s340(x341)
    }
  })
  let t338 = @simp.abbrev_tac(@term_syntax.parse_term("(A22' : Int) == (A11 : Int) * pow((r : Int), 2) + (int_of_num(2) * ((A12 : Int) * r) + (A22 : Int))"))
  let t337 = @simp.abbrev_tac(@term_syntax.parse_term("(A12' : Int) == (A12 : Int) + (A11 : Int) * (r : Int)"))
  let t336 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Int) == -(b : Int)"))
  let t333 = @term_syntax.parse_term("(b : Int)")
  let t335 = @tactics.disch_then((x334 : @kernel.Thm) => @tactics.x_choose_tac(t333, x334))
  let t332 = @simp.asm_rewrite_tac(@list.List([]))
  let t330 = @term_syntax.parse_term("(A11 : Int)")
  let t331 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(A12 : Int)"), t330]), int_balanced_rem()))
  let t329 = @tactics.repeat_tac(@tactics.gen_tac)
  let t328 = @simp.rewrite_tac(@list.List([@int.int_abs_pos()]))
  let t327 = @tactics.exists_tac(@term_syntax.parse_term("abs"))
  let t326 = @tactics.match_mp_tac(@int.wf_int_measure())
  let t454 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t326), t327), t328), @tactics.gen_tac), @tactics.disch_tac), @tactics.strip_tac), t329), @tactics.disch_tac), t331), t332), t335), t336), t337), t338), t342), t348), t352), t357), t361), t371), t372), t386), t390), t414), t421), @tactics.ants_tac), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), @tactics.ants_tac), t425), t433), @tactics.ants_tac), t434), t436), t437), t438), @tactics.conj_tac), t453)
  binary_hermite_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : Int, int_of_num(0) < D → (∀ A11 : Int, int_of_num(0) < A11 → (∀ A12 : Int, ∀ A22 : Int, A11 * A22 - pow(A12, 2) == D → (∃ x : Int, ∃ y : Int, !(x == int_of_num(0) && y == int_of_num(0)) && int_of_num(3) * pow(A11 * pow(x, 2) + (int_of_num(2) * (A12 * (x * y)) + A22 * pow(y, 2)), 2) <= int_of_num(4) * D)))"), t454))
}

///|
let binary_hermite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_HERMITE")

///|
/// `BINARY_HERMITE`
pub fn binary_hermite() -> @kernel.Thm {
  binary_hermite_c.get()
}

///|
/// INT_GCD3_EXISTS
fn step_10() -> Unit raise {
  let t479 = @simp.asm_rewrite_tac(@list.List([]))
  let t476 = @term_syntax.parse_term("(y' : Int)")
  let t477 = @term_syntax.parse_term("(y : Int) * (x' : Int)")
  let t478 = @tactics.map_every(fn(x473 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s474 = @tactics.exists_tac(x473)
    fn(x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s474(x475)
    }
  }, @list.List([@term_syntax.parse_term("(x : Int) * (x' : Int)"), t477, t476]))
  let t472 = @tactics.disch_then(@tactics.conjuncts_then(fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s470 = @tactics.assume_tac(x469)
    fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s470(x471)
    }
  }))
  let t468 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t467 = @tactics.undisch_tac(@term_syntax.parse_term("(d : Int) == (e : Int) * (x' : Int) + (c : Int) * (y' : Int)"))
  let t466 = @tactics.undisch_tac(@term_syntax.parse_term("(e : Int) == (a : Int) * (x : Int) + (b : Int) * (y : Int)"))
  let t463 = @simp.asm_rewrite_tac(@list.List([]))
  let t464 = @meson.asm_meson_tac(@list.List([@integer.int_divides_trans()]))
  let t465 = @list.List([@meson.asm_meson_tac(@list.List([@integer.int_divides_trans()])), t464, t463, @tactics.all_tac])
  let t462 = @tactics.repeat_tac(@tactics.conj_tac)
  let t461 = @tactics.exists_tac(@term_syntax.parse_term("(d : Int)"))
  let t460 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Int)"))(@tactics.strip_assume_tac))
  let t458 = @term_syntax.parse_term("(c : Int)")
  let t459 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(e : Int)"), t458]), @int.int_gcd_exists()))
  let t457 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Int)"))(@tactics.strip_assume_tac))
  let t455 = @term_syntax.parse_term("(b : Int)")
  let t456 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Int)"), t455]), @int.int_gcd_exists()))
  let t480 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t456), t457), t459), t460), t461), t462), t465), t466), t467), t468), t472), t478), t479), @int.int_arith_tac)
  int_gcd3_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Int, ∃ d : Int, divides(d, a) && divides(d, b) && divides(d, c) && (∃ x : Int, ∃ y : Int, ∃ z : Int, d == a * x + (b * y + c * z))"), t480))
}

///|
let int_gcd3_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_GCD3_EXISTS")

///|
/// `INT_GCD3_EXISTS`
pub fn int_gcd3_exists() -> @kernel.Thm {
  int_gcd3_exists_c.get()
}

///|
/// TERNARY_MIN
fn step_11() -> Unit raise {
  let t532 = @tactics.disch_then(fn(x530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x530
    @simp.rewrite_tac(@list.List([@equal.sym(th_1)]))
  })
  let t533 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(mn : Int) == (a11 : Int) * pow((x' : Int), 2) + ((a22 : Int) * pow((y : Int), 2) + ((a33 : Int) * pow((z : Int), 2) + (int_of_num(2) * ((a12 : Int) * (x' * y)) + (int_of_num(2) * ((a13 : Int) * (x' * z)) + int_of_num(2) * ((a23 : Int) * (y * z))))))")), t532)
  let t528 = @simp.asm_rewrite_tac(@list.List([]))
  let t526 = @term_syntax.parse_term("(s : Int)")
  let t527 = @term_syntax.parse_term("(q : Int)")
  let t529 = @tactics.then_tac(@tactics.map_every(fn(x523 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s524 = @tactics.exists_tac(x523)
    fn(x525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s524(x525)
    }
  }, @list.List([@term_syntax.parse_term("(p : Int)"), t527, t526])), t528)
  let t522 = @simp.asm_simp_tac(@list.List([]))
  let t534 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.match_mp_tac(@int.int_lt_imp_le()), t522), t529])), t533])
  let t518 = @term_syntax.parse_term("(a11 : Int) * pow((p : Int), 2) + ((a22 : Int) * pow((q : Int), 2) + ((a33 : Int) * pow((s : Int), 2) + (int_of_num(2) * ((a12 : Int) * (p * q)) + (int_of_num(2) * ((a13 : Int) * (p * s)) + int_of_num(2) * ((a23 : Int) * (q * s))))))")
  let t521 = @tactics.first_x_assum(fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s516 = @tactics.mp_tac(x515)
      fn(x517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s516(x517)
      }
    })(((x519 : @kernel.Thm) => @bool.spec(t518, x519))(x520))
  })
  let t512 = @term_syntax.parse_term("(s : Int)")
  let t513 = @term_syntax.parse_term("(q : Int)")
  let t514 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Int)"), t513, t512]))
  let t511 = @simp.asm_rewrite_tac(@list.List([]))
  let t508 = @term_syntax.parse_term("(z : Int)")
  let t509 = @term_syntax.parse_term("(y : Int)")
  let t510 = @tactics.map_every(fn(x505 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s506 = @tactics.exists_tac(x505)
    fn(x507 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s506(x507)
    }
  }, @list.List([@term_syntax.parse_term("(x' : Int)"), t509, t508]))
  let t504 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(mn : Int)"))(@tactics.strip_assume_tac))
  let t500 = @simp.rewrite_tac(@list.List([]))
  let t498 = @term_syntax.parse_term("int_of_num(0)")
  let t499 = @term_syntax.parse_term("int_of_num(0)")
  let t501 = @tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x495 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s496 = @tactics.exists_tac(x495)
    fn(x497 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s496(x497)
    }
  }, @list.List([@term_syntax.parse_term("int_of_num(1)"), t499, t498])), t500), @int.int_arith_tac)
  let t490 = @term_syntax.parse_term("int_of_num(0)")
  let t491 = @term_syntax.parse_term("int_of_num(0)")
  let t492 = @list.List([@term_syntax.parse_term("int_of_num(1)"), t491, t490])
  let t502 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s488 = @tactics.mp_tac(x487)
      fn(x489 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s488(x489)
      }
    })(((x493 : @kernel.Thm) => @bool.specl(t492, x493))(x494))
  }), @tactics.ants_tac), @list.List([@int.int_arith_tac, @tactics.all_tac])), @int.int_arith_tac), t501])
  let t503 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(a11 : Int) * pow(int_of_num(1), 2) + ((a22 : Int) * pow(int_of_num(0), 2) + ((a33 : Int) * pow(int_of_num(0), 2) + (int_of_num(2) * ((a12 : Int) * (int_of_num(1) * int_of_num(0))) + (int_of_num(2) * ((a13 : Int) * (int_of_num(1) * int_of_num(0))) + int_of_num(2) * ((a23 : Int) * (int_of_num(0) * int_of_num(0)))))))")), @tactics.conj_tac), t502), @tactics.all_tac])
  let t486 = @tactics.subgoal_then(@term_syntax.parse_term("∃ v : Int, int_of_num(0) <= v && (∃ x : Int, ∃ y : Int, ∃ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) && v == (a11 : Int) * pow(x, 2) + ((a22 : Int) * pow(y, 2) + ((a33 : Int) * pow(z, 2) + (int_of_num(2) * ((a12 : Int) * (x * y)) + (int_of_num(2) * ((a13 : Int) * (x * z)) + int_of_num(2) * ((a23 : Int) * (y * z)))))))"), fn(x484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x484
    @simp.rewrite_tac(@list.List([th]))
  })
  let t483 = @simp.rewrite_tac(@list.List([]))
  let t481 = @bool.gen(@term_syntax.parse_term("(P : (Int) -> Bool)"), @int.int_wop())
  let t482 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(v : Int) => ∃ x : Int, ∃ y : Int, ∃ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) && v == (a11 : Int) * pow(x, 2) + ((a22 : Int) * pow(y, 2) + ((a33 : Int) * pow(z, 2) + (int_of_num(2) * ((a12 : Int) * (x * y)) + (int_of_num(2) * ((a13 : Int) * (x * z)) + int_of_num(2) * ((a23 : Int) * (y * z))))))"), t481))
  let t535 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t482), t483), t486), t503), t504), t510), t511), t514), @tactics.disch_tac), t521), @tactics.ants_tac), t534)
  ternary_min_c.set(@tactics.prove(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → int_of_num(0) < a11 * pow(x, 2) + (a22 * pow(y, 2) + (a33 * pow(z, 2) + (int_of_num(2) * (a12 * (x * y)) + (int_of_num(2) * (a13 * (x * z)) + int_of_num(2) * (a23 * (y * z))))))) → (∃ v1 : Int, ∃ v2 : Int, ∃ v3 : Int, !(v1 == int_of_num(0) && v2 == int_of_num(0) && v3 == int_of_num(0)) && (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → a11 * pow(v1, 2) + (a22 * pow(v2, 2) + (a33 * pow(v3, 2) + (int_of_num(2) * (a12 * (v1 * v2)) + (int_of_num(2) * (a13 * (v1 * v3)) + int_of_num(2) * (a23 * (v2 * v3)))))) <= a11 * pow(x, 2) + (a22 * pow(y, 2) + (a33 * pow(z, 2) + (int_of_num(2) * (a12 * (x * y)) + (int_of_num(2) * (a13 * (x * z)) + int_of_num(2) * (a23 * (y * z))))))))"), t535))
}

///|
let ternary_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERNARY_MIN")

///|
/// `TERNARY_MIN`
pub fn ternary_min() -> @kernel.Thm {
  ternary_min_c.get()
}

///|
/// MIN_PRIMITIVE
fn step_12() -> Unit raise {
  let t660 = @tactics.conv_tac(@int.int_ring)
  let t659 = @simp.rewrite_tac(@list.List([@int.int_pow_2()]))
  let t658 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("pow((g : Int), 2) == int_of_num(1)")))
  let t657 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(g : Int) == g * (w1 : Int) * (x : Int) + (g * (w2 : Int) * (y : Int) + g * (w3 : Int) * (z : Int))")))
  let t654 = @term_syntax.parse_term("(g : Int) * (z : Int)")
  let t655 = @term_syntax.parse_term("(g : Int) * (y : Int)")
  let t656 = @tactics.map_every(fn(x651 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s652 = @tactics.exists_tac(x651)
    fn(x653 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s652(x653)
    }
  }, @list.List([@term_syntax.parse_term("(g : Int) * (x : Int)"), t655, t654]))
  let t648 = @simp.asm_simp_tac(@list.List([@int.int_lt_pow_2()]))
  let t649 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(int_of_num(1) <= (x : Int)) == (int_of_num(0) < x)"))])), t648), @tactics.all_tac])
  let t647 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(1) <= pow((g : Int), 2)"), fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s645 = @tactics.mp_tac(x644)
    fn(x646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s645(x646)
    }
  })
  let t643 = @simp.asm_simp_tac(@list.List([@int.int_le_rmul_eq()]))
  let t642 = @simp.gen_rewrite_tac(fn(x641 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x635 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s636 = @equal.land_conv(x635)
      fn(x637 : @kernel.Term) -> @kernel.Thm raise {
        s636(x637)
      }
    })((fn(x638 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s639 = @equal.rand_conv(x638)
      fn(x640 : @kernel.Term) -> @kernel.Thm raise {
        s639(x640)
      }
    })(x641))
  }, @list.List([@equal.gsym(@int.int_arith(@term_syntax.parse_term("int_of_num(1) * (Fw : Int) == Fw")))]))
  let t633 = @tactics.conv_tac(@int.int_ring)
  let t634 = @list.List([@tactics.then_tac(@simp.expand_tac("Fw"), t633), @tactics.all_tac])
  let t632 = @tactics.subgoal_then(@term_syntax.parse_term("(a11 : Int) * pow((g : Int) * (w1 : Int), 2) + ((a22 : Int) * pow(g * (w2 : Int), 2) + ((a33 : Int) * pow(g * (w3 : Int), 2) + (int_of_num(2) * ((a12 : Int) * (g * w1 * (g * w2))) + (int_of_num(2) * ((a13 : Int) * (g * w1 * (g * w3))) + int_of_num(2) * ((a23 : Int) * (g * w2 * (g * w3))))))) == pow(g, 2) * (Fw : Int)"), fn(x629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s630 = @tactics.subst1_tac(x629)
    fn(x631 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s630(x631)
    }
  })
  let t628 = @simp.asm_rewrite_tac(@list.List([]))
  let t622 = @term_syntax.parse_term("(w3 : Int)")
  let t623 = @term_syntax.parse_term("(w2 : Int)")
  let t624 = @list.List([@term_syntax.parse_term("(w1 : Int)"), t623, t622])
  let t627 = @tactics.disch_then(fn(x626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s620 = @tactics.mp_tac(x619)
      fn(x621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s620(x621)
      }
    })(((x625 : @kernel.Thm) => @bool.specl(t624, x625))(x626))
  })
  let t618 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → (a11 : Int) * pow((g : Int) * (w1 : Int), 2) + ((a22 : Int) * pow(g * (w2 : Int), 2) + ((a33 : Int) * pow(g * (w3 : Int), 2) + (int_of_num(2) * ((a12 : Int) * (g * w1 * (g * w2))) + (int_of_num(2) * ((a13 : Int) * (g * w1 * (g * w3))) + int_of_num(2) * ((a23 : Int) * (g * w2 * (g * w3))))))) <= a11 * pow(x, 2) + (a22 * pow(y, 2) + (a33 * pow(z, 2) + (int_of_num(2) * (a12 * (x * y)) + (int_of_num(2) * (a13 * (x * z)) + int_of_num(2) * (a23 * (y * z))))))"))
  let t616 = @simp.asm_simp_tac(@list.List([]))
  let t617 = @list.List([@tactics.then_tac(@simp.expand_tac("Fw"), t616), @tactics.all_tac])
  let t615 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (Fw : Int)"), fn(x612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s613 = @tactics.assume_tac(x612)
    fn(x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s613(x614)
    }
  })
  let t650 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.abbrev_tac(@term_syntax.parse_term("(Fw : Int) == (a11 : Int) * pow((w1 : Int), 2) + ((a22 : Int) * pow((w2 : Int), 2) + ((a33 : Int) * pow((w3 : Int), 2) + (int_of_num(2) * ((a12 : Int) * (w1 * w2)) + (int_of_num(2) * ((a13 : Int) * (w1 * w3)) + int_of_num(2) * ((a23 : Int) * (w2 * w3))))))")), t615), t617), t618), t627), t628), t632), t634), t642), t643), t647), t649), @int.int_arith_tac), @tactics.all_tac])
  let t611 = @tactics.subgoal_then(@term_syntax.parse_term("pow((g : Int), 2) == int_of_num(1)"), fn(x608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s609 = @tactics.assume_tac(x608)
    fn(x610 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s609(x610)
    }
  })
  let t606 = @simp.asm_rewrite_tac(@list.List([]))
  let t607 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.undisch_tac(@term_syntax.parse_term("(w1 : Int) * (x : Int) + ((w2 : Int) * (y : Int) + (w3 : Int) * (z : Int)) == int_of_num(1)"))), t606), @int.int_arith_tac), @tactics.all_tac])
  let t605 = @tactics.subgoal_then(@term_syntax.parse_term("!((w1 : Int) == int_of_num(0) && (w2 : Int) == int_of_num(0) && (w3 : Int) == int_of_num(0))"), fn(x602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s603 = @tactics.assume_tac(x602)
    fn(x604 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s603(x604)
    }
  })
  let t599 = @simp.asm_simp_tac(@list.List([@int.int_eq_mul_lcancel()]))
  let t598 = @tactics.conv_tac(@int.int_ring)
  let t597 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(g : Int) == g * (w1 : Int) * (x : Int) + (g * (w2 : Int) * (y : Int) + g * (w3 : Int) * (z : Int))")))
  let t600 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_mul_rid()])), t597), t598), t599])
  let t601 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(g : Int) * ((w1 : Int) * (x : Int) + ((w2 : Int) * (y : Int) + (w3 : Int) * (z : Int))) == g * int_of_num(1)"), fn(x594 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s595 = @tactics.mp_tac(x594)
    fn(x596 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s595(x596)
    }
  }), t600), @tactics.all_tac])
  let t593 = @tactics.subgoal_then(@term_syntax.parse_term("(w1 : Int) * (x : Int) + ((w2 : Int) * (y : Int) + (w3 : Int) * (z : Int)) == int_of_num(1)"), fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s591 = @tactics.assume_tac(x590)
    fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s591(x592)
    }
  })
  let t588 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_lzero()]))
  let t589 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("!((g : Int) * (w1 : Int) == int_of_num(0) && g * (w2 : Int) == int_of_num(0) && g * (w3 : Int) == int_of_num(0))"))), t588), @tactics.all_tac])
  let t587 = @tactics.subgoal_then(@term_syntax.parse_term("!((g : Int) == int_of_num(0))"), fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s585 = @tactics.assume_tac(x584)
    fn(x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s585(x586)
    }
  })
  let t583 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x582 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s578 = @tactics.subst_all_tac(x577)
      fn(x579 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s578(x579)
      }
    })(((x581 : @kernel.Thm) => @lib.check(fn(x580 : @kernel.Thm) -> Bool raise {
      let th_3 = x580
      if @basics.is_eq(@kernel.concl(th_3)) {
        let l = @equal.lhand(@kernel.concl(th_3))
        ((l == @term_syntax.parse_term("(v1 : Int)")) || ((l == @term_syntax.parse_term("(v2 : Int)")) || (l == @term_syntax.parse_term("(v3 : Int)"))))
      } else {
        false
      }
    }, x581))(x582))
  }))
  let t570 = @simp.rewrite_rule(@list.List([@int.int_divides()]))
  let t568 = @term_syntax.parse_term("(w3 : Int)")
  let t576 = @tactics.first_assum(fn(x575 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      ((x569 : @kernel.Thm) => @tactics.x_choose_tac(t568, x569))(t570(x571))
    })(((x574 : @kernel.Thm) => @lib.check(fn(x572 : @kernel.Thm) -> Bool raise {
      let th_2 = x572
      let t573 = @term_syntax.parse_term("(v3 : Int)")
      (@kernel.rand(@kernel.concl(th_2)) == t573)
    }, x574))(x575))
  })
  let t561 = @simp.rewrite_rule(@list.List([@int.int_divides()]))
  let t559 = @term_syntax.parse_term("(w2 : Int)")
  let t567 = @tactics.first_assum(fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      ((x560 : @kernel.Thm) => @tactics.x_choose_tac(t559, x560))(t561(x562))
    })(((x565 : @kernel.Thm) => @lib.check(fn(x563 : @kernel.Thm) -> Bool raise {
      let th_1 = x563
      let t564 = @term_syntax.parse_term("(v2 : Int)")
      (@kernel.rand(@kernel.concl(th_1)) == t564)
    }, x565))(x566))
  })
  let t552 = @simp.rewrite_rule(@list.List([@int.int_divides()]))
  let t550 = @term_syntax.parse_term("(w1 : Int)")
  let t558 = @tactics.first_assum(fn(x557 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      ((x551 : @kernel.Thm) => @tactics.x_choose_tac(t550, x551))(t552(x553))
    })(((x556 : @kernel.Thm) => @lib.check(fn(x554 : @kernel.Thm) -> Bool raise {
      let th = x554
      let t555 = @term_syntax.parse_term("(v1 : Int)")
      (@kernel.rand(@kernel.concl(th)) == t555)
    }, x556))(x557))
  })
  let t549 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : Int)"))(@tactics.strip_assume_tac))
  let t546 = @term_syntax.parse_term("(v3 : Int)")
  let t547 = @term_syntax.parse_term("(v2 : Int)")
  let t548 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(v1 : Int)"), t547, t546]), int_gcd3_exists()))
  let t545 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s537 = @tactics.assume_tac(x536)
    fn(x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s537(x538)
    }
  }, @tactics.conjuncts_then2(fn(x539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s540 = @tactics.assume_tac(x539)
    fn(x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s540(x541)
    }
  }, fn(x542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s543 = @tactics.assume_tac(x542)
    fn(x544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s543(x544)
    }
  })))
  let t661 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t545), t548), t549), t558), t567), t576), t583), t587), t589), t593), t601), t605), t607), t611), t650), t656), t657), t658), t659), t660)
  min_primitive_c.set(@tactics.prove(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, ∀ v1 : Int, ∀ v2 : Int, ∀ v3 : Int, (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → int_of_num(0) < a11 * pow(x, 2) + (a22 * pow(y, 2) + (a33 * pow(z, 2) + (int_of_num(2) * (a12 * (x * y)) + (int_of_num(2) * (a13 * (x * z)) + int_of_num(2) * (a23 * (y * z))))))) && !(v1 == int_of_num(0) && v2 == int_of_num(0) && v3 == int_of_num(0)) && (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → a11 * pow(v1, 2) + (a22 * pow(v2, 2) + (a33 * pow(v3, 2) + (int_of_num(2) * (a12 * (v1 * v2)) + (int_of_num(2) * (a13 * (v1 * v3)) + int_of_num(2) * (a23 * (v2 * v3)))))) <= a11 * pow(x, 2) + (a22 * pow(y, 2) + (a33 * pow(z, 2) + (int_of_num(2) * (a12 * (x * y)) + (int_of_num(2) * (a13 * (x * z)) + int_of_num(2) * (a23 * (y * z))))))) → (∃ x : Int, ∃ y : Int, ∃ z : Int, v1 * x + (v2 * y + v3 * z) == int_of_num(1))"), t661))
}

///|
let min_primitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MIN_PRIMITIVE")

///|
/// `MIN_PRIMITIVE`
pub fn min_primitive() -> @kernel.Thm {
  min_primitive_c.get()
}

///|
/// DISC_G
fn step_13() -> Unit raise {
  disc_g_c.set(@int.int_ring(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, (a11 * a22 - pow(a12, 2)) * (a11 * a33 - pow(a13, 2)) - pow(a11 * a23 - a12 * a13, 2) == a11 * (a11 * (a22 * a33 - pow(a23, 2)) - a12 * (a12 * a33 - a23 * a13) + a13 * (a12 * a23 - a22 * a13))")))
}

///|
let disc_g_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISC_G")

///|
/// `DISC_G`
pub fn disc_g() -> @kernel.Thm {
  disc_g_c.get()
}

///|
/// CUBE_GE_8
fn step_14() -> Unit raise {
  let t664 = @list.List([@int.int_arith_tac, @tactics.then_tac(@tactics.match_mp_tac(@int.int_pow_le2()), @int.asm_int_arith_tac)])
  let t663 = @tactics.exists_tac(@term_syntax.parse_term("pow(int_of_num(2), 3)"))
  let t662 = @tactics.match_mp_tac(@int.int_le_trans())
  let t665 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t662), t663), @tactics.conj_tac), t664)
  cube_ge_8_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Int, int_of_num(2) <= a → int_of_num(8) <= pow(a, 3)"), t665))
}

///|
let cube_ge_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_GE_8")

///|
/// `CUBE_GE_8`
pub fn cube_ge_8() -> @kernel.Thm {
  cube_ge_8_c.get()
}

///|
/// HERMITE_LOWER
fn step_15() -> Unit raise {
  let t674 = @simp.rewrite_tac(@list.List([@int.int_pow_2()]))
  let t673 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("int_of_num(4) * pow((a11 : Int) * (x1 : Int) + ((a12 : Int) * (s : Int) + (a13 : Int) * (t : Int)), 2) <= pow(a11, 2)")))
  let t672 = @simp.asm_rewrite_tac(@list.List([]))
  let t670 = @simp.asm_simp_tac(@list.List([@int.int_lt_imp_le()]))
  let t671 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_lmul()), t670), @tactics.all_tac])
  let t669 = @tactics.subgoal_then(@term_syntax.parse_term("(a11 : Int) * a11 <= a11 * (a11 * pow((x1 : Int), 2) + ((a22 : Int) * pow((s : Int), 2) + ((a33 : Int) * pow((t : Int), 2) + (int_of_num(2) * ((a12 : Int) * (x1 * s)) + (int_of_num(2) * ((a13 : Int) * (x1 * t)) + int_of_num(2) * ((a23 : Int) * (s * t)))))))"), fn(x666 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s667 = @tactics.mp_tac(x666)
    fn(x668 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s667(x668)
    }
  })
  let t675 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t669), t671), t672), t673), t674), @int.int_arith_tac)
  hermite_lower_c.set(@tactics.prove(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, ∀ x1 : Int, ∀ s : Int, ∀ t : Int, ∀ Gst : Int, int_of_num(0) < a11 && a11 <= a11 * pow(x1, 2) + (a22 * pow(s, 2) + (a33 * pow(t, 2) + (int_of_num(2) * (a12 * (x1 * s)) + (int_of_num(2) * (a13 * (x1 * t)) + int_of_num(2) * (a23 * (s * t)))))) && int_of_num(4) * pow(a11 * x1 + (a12 * s + a13 * t), 2) <= pow(a11, 2) && a11 * (a11 * pow(x1, 2) + (a22 * pow(s, 2) + (a33 * pow(t, 2) + (int_of_num(2) * (a12 * (x1 * s)) + (int_of_num(2) * (a13 * (x1 * t)) + int_of_num(2) * (a23 * (s * t))))))) == pow(a11 * x1 + (a12 * s + a13 * t), 2) + Gst → int_of_num(3) * pow(a11, 2) <= int_of_num(4) * Gst"), t675))
}

///|
let hermite_lower_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_LOWER")

///|
/// `HERMITE_LOWER`
pub fn hermite_lower() -> @kernel.Thm {
  hermite_lower_c.get()
}

///|
/// HERMITE_CUBE
fn step_16() -> Unit raise {
  let t694 = @tactics.then_tac(@tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("int_of_num(3) * pow((G : Int), 2) <= int_of_num(4) * (a : Int)"))), @int.int_arith_tac)
  let t693 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("pow(pow((a : Int), 2), 2) == pow(a, 3) * a")), @int.int_pow_2()]))
  let t695 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("pow(int_of_num(3), 2) * pow(pow((a : Int), 2), 2) <= pow(int_of_num(4), 2) * pow((G : Int), 2)"))), t693), @int.int_arith_tac), t694])
  let t692 = @tactics.exists_tac(@term_syntax.parse_term("int_of_num(16) * (int_of_num(3) * pow((G : Int), 2))"))
  let t691 = @tactics.match_mp_tac(@int.int_le_trans())
  let t690 = @list.List([@tactics.first_assum(fn(x687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s688 = @tactics.accept_tac(x687)
    fn(x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s688(x689)
    }
  }), @tactics.all_tac])
  let t686 = @tactics.exists_tac(@term_syntax.parse_term("(a : Int)"))
  let t685 = @tactics.match_mp_tac(@int.int_le_rcancel_imp())
  let t684 = @simp.rewrite_tac(@list.List([@int.int_pow_mul()]))
  let t681 = @simp.asm_rewrite_tac(@list.List([]))
  let t680 = @simp.rewrite_tac(@list.List([@int.int_le_pow_2()]))
  let t682 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_mul()), t680), @int.int_arith_tac), t681])
  let t683 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@int.int_pow_le2()), @tactics.conj_tac), t682), @tactics.all_tac])
  let t679 = @tactics.subgoal_then(@term_syntax.parse_term("pow(int_of_num(3) * pow((a : Int), 2), 2) <= pow(int_of_num(4) * (G : Int), 2)"), fn(x676 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s677 = @tactics.mp_tac(x676)
    fn(x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s677(x678)
    }
  })
  let t696 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t679), t683), t684), @tactics.disch_tac), t685), t686), @tactics.conj_tac), t690), t691), t692), @tactics.conj_tac), t695)
  hermite_cube_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Int, ∀ G : Int, int_of_num(0) < a && int_of_num(0) < G && int_of_num(3) * pow(a, 2) <= int_of_num(4) * G && int_of_num(3) * pow(G, 2) <= int_of_num(4) * a → int_of_num(27) * pow(a, 3) <= int_of_num(64)"), t696))
}

///|
let hermite_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUBE")

///|
/// `HERMITE_CUBE`
pub fn hermite_cube() -> @kernel.Thm {
  hermite_cube_c.get()
}

///|
/// TERNARY_POSDEF
fn step_17() -> Unit raise {
  let t760 = @simp.asm_simp_tac(@list.List([@int.int_lt_mul_eq()]))
  let t757 = @simp.asm_rewrite_tac(@list.List([]))
  let t756 = @tactics.disch_then(@tactics.match_mp_tac)
  let t755 = @simp.asm_rewrite_tac(@list.List([]))
  let t752 = @term_syntax.parse_term("(G22 : Int)")
  let t753 = @term_syntax.parse_term("(G12 : Int)")
  let t754 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(G11 : Int)"), t753, t752]), posdef_binary_criterion()))
  let t751 = @simp.rewrite_tac(@list.List([@int.int_le_pow_2()]))
  let t758 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("int_of_num(0) <= (a : Int) && int_of_num(0) < (b : Int) → int_of_num(0) < a + b"))), t751), t754), t755), t756), t757)
  let t750 = @list.List([@int.asm_int_arith_tac, @tactics.first_assum(fn(x747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s748 = @tactics.accept_tac(x747)
    fn(x749 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s748(x749)
    }
  })])
  let t746 = @simp.rewrite_tac(@list.List([@int.int_entire(), @class.de_morgan_thm()]))
  let t745 = @simp.rewrite_tac(@list.List([@int.int_lt_pow_2()]))
  let t744 = @simp.rewrite_tac(@list.List([@int.int_add_rid()]))
  let t743 = @simp.asm_rewrite_tac(@list.List([@int.int_mul_rzero(), @int.int_add_rid(), @int.int_mul_lzero(), @int.int_pow_zero(), @calc_num.arith_eq()]))
  let t741 = @simp.asm_rewrite_tac(@list.List([]))
  let t742 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((x : Int) == int_of_num(0) && (y : Int) == int_of_num(0) && (z : Int) == int_of_num(0))")), t741), @tactics.all_tac])
  let t740 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Int) == int_of_num(0))"), fn(x737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s738 = @tactics.assume_tac(x737)
    fn(x739 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s738(x739)
    }
  })
  let t759 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.pop_assum(@tactics.strip_assume_tac), t740), t742), t743), t744), t745), t746), @tactics.conj_tac), t750), t758])
  let t736 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Int) == int_of_num(0) && (z : Int) == int_of_num(0)"))
  let t726 = @term_syntax.parse_term("(z : Int)")
  let t727 = @term_syntax.parse_term("(y : Int)")
  let t728 = @term_syntax.parse_term("(x : Int)")
  let t729 = @term_syntax.parse_term("(a33 : Int)")
  let t730 = @term_syntax.parse_term("(a23 : Int)")
  let t731 = @term_syntax.parse_term("(a22 : Int)")
  let t732 = @term_syntax.parse_term("(a13 : Int)")
  let t733 = @term_syntax.parse_term("(a12 : Int)")
  let t734 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a11 : Int)"), t733, t732, t731, t730, t729, t728, t727, t726]), ternary_complete()))
  let t735 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x723 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s724 = @simp.expand_tac(x723)
    fn(x725 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s724(x725)
    }
  }, @list.List(["G11", "G12", "G22"])), t734), @int.int_arith_tac), @tactics.all_tac])
  let t761 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(a11 : Int) * (a11 * pow((x : Int), 2) + ((a22 : Int) * pow((y : Int), 2) + ((a33 : Int) * pow((z : Int), 2) + (int_of_num(2) * ((a12 : Int) * (x * y)) + (int_of_num(2) * ((a13 : Int) * (x * z)) + int_of_num(2) * ((a23 : Int) * (y * z))))))) == pow(a11 * x + (a12 * y + a13 * z), 2) + ((G11 : Int) * pow(y, 2) + (int_of_num(2) * ((G12 : Int) * (y * z)) + (G22 : Int) * pow(z, 2)))"), fn(x720 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s721 = @tactics.subst1_tac(x720)
    fn(x722 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s721(x722)
    }
  }), t735), t736), t759), @tactics.all_tac), t760])
  let t719 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (a11 : Int) * (a11 * pow((x : Int), 2) + ((a22 : Int) * pow((y : Int), 2) + ((a33 : Int) * pow((z : Int), 2) + (int_of_num(2) * ((a12 : Int) * (x * y)) + (int_of_num(2) * ((a13 : Int) * (x * z)) + int_of_num(2) * ((a23 : Int) * (y * z)))))))"), fn(x716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s717 = @tactics.mp_tac(x716)
    fn(x718 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s717(x718)
    }
  })
  let t714 = @simp.asm_rewrite_tac(@list.List([]))
  let t713 = @tactics.match_mp_tac(@int.int_lt_mul())
  let t712 = @list.List([@simp.rewrite_tac(@list.List([disc_g()])), @tactics.all_tac])
  let t711 = @tactics.subgoal_then(@term_syntax.parse_term("((a11 : Int) * (a22 : Int) - pow((a12 : Int), 2)) * (a11 * (a33 : Int) - pow((a13 : Int), 2)) - pow(a11 * (a23 : Int) - a12 * a13, 2) == a11 * (a11 * (a22 * a33 - pow(a23, 2)) - a12 * (a12 * a33 - a23 * a13) + a13 * (a12 * a23 - a22 * a13))"), fn(x708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s709 = @tactics.subst1_tac(x708)
    fn(x710 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s709(x710)
    }
  })
  let t715 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.map_every(fn(x705 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s706 = @simp.expand_tac(x705)
    fn(x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s706(x707)
    }
  }, @list.List(["G11", "G12", "G22"])), t711), t712), t713), t714), @tactics.all_tac])
  let t704 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (G11 : Int) * (G22 : Int) - pow((G12 : Int), 2)"), fn(x701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s702 = @tactics.assume_tac(x701)
    fn(x703 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s702(x703)
    }
  })
  let t700 = @simp.abbrev_tac(@term_syntax.parse_term("(G22 : Int) == (a11 : Int) * (a33 : Int) - pow((a13 : Int), 2)"))
  let t699 = @simp.abbrev_tac(@term_syntax.parse_term("(G12 : Int) == (a11 : Int) * (a23 : Int) - (a12 : Int) * (a13 : Int)"))
  let t698 = @simp.abbrev_tac(@term_syntax.parse_term("(G11 : Int) == (a11 : Int) * (a22 : Int) - pow((a12 : Int), 2)"))
  let t697 = @tactics.repeat_tac(@tactics.gen_tac)
  let t762 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t697), @tactics.disch_tac), t698), t699), t700), t704), t715), t719), t761)
  ternary_posdef_c.set(@tactics.prove(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, int_of_num(0) < a11 && int_of_num(0) < a11 * a22 - pow(a12, 2) && int_of_num(0) < a11 * (a22 * a33 - pow(a23, 2)) - a12 * (a12 * a33 - a23 * a13) + a13 * (a12 * a23 - a22 * a13) → (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → int_of_num(0) < a11 * pow(x, 2) + (a22 * pow(y, 2) + (a33 * pow(z, 2) + (int_of_num(2) * (a12 * (x * y)) + (int_of_num(2) * (a13 * (x * z)) + int_of_num(2) * (a23 * (y * z)))))))"), t762))
}

///|
let ternary_posdef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERNARY_POSDEF")

///|
/// `TERNARY_POSDEF`
pub fn ternary_posdef() -> @kernel.Thm {
  ternary_posdef_c.get()
}

///|
/// ADJ_PREIMAGE
fn step_18() -> Unit raise {
  let t770 = @tactics.conv_tac(@int.int_ring)
  let t769 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(u1 : Int) * ((c22 : Int) * (c33 : Int) - (c23 : Int) * (c32 : Int)) - (c12 : Int) * ((u2 : Int) * c33 - c23 * (u3 : Int)) + (c13 : Int) * (u2 * c32 - c22 * u3) == int_of_num(1)")))
  let t766 = @term_syntax.parse_term("((u2 : Int) * (c32 : Int) - (u3 : Int) * (c22 : Int)) * (X1 : Int) + ((u3 * (c12 : Int) - (u1 : Int) * c32) * (X2 : Int) + (u1 * c22 - u2 * c12) * (X3 : Int))")
  let t767 = @term_syntax.parse_term("((c23 : Int) * (u3 : Int) - (u2 : Int) * (c33 : Int)) * (X1 : Int) + (((u1 : Int) * c33 - (c13 : Int) * u3) * (X2 : Int) + (c13 * u2 - u1 * c23) * (X3 : Int))")
  let t768 = @tactics.map_every(fn(x763 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s764 = @tactics.exists_tac(x763)
    fn(x765 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s764(x765)
    }
  }, @list.List([@term_syntax.parse_term("((c22 : Int) * (c33 : Int) - (c23 : Int) * (c32 : Int)) * (X1 : Int) + (((c13 : Int) * c32 - (c12 : Int) * c33) * (X2 : Int) + (c12 * c23 - c13 * c22) * (X3 : Int))"), t767, t766]))
  let t771 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t768), t769), t770)
  adj_preimage_c.set(@tactics.prove(@term_syntax.parse_term("∀ u1 : Int, ∀ u2 : Int, ∀ u3 : Int, ∀ c12 : Int, ∀ c22 : Int, ∀ c32 : Int, ∀ c13 : Int, ∀ c23 : Int, ∀ c33 : Int, ∀ X1 : Int, ∀ X2 : Int, ∀ X3 : Int, u1 * (c22 * c33 - c23 * c32) - c12 * (u2 * c33 - c23 * u3) + c13 * (u2 * c32 - c22 * u3) == int_of_num(1) → (∃ y1 : Int, ∃ y2 : Int, ∃ y3 : Int, u1 * y1 + (c12 * y2 + c13 * y3) == X1 && u2 * y1 + (c22 * y2 + c23 * y3) == X2 && u3 * y1 + (c32 * y2 + c33 * y3) == X3)"), t771))
}

///|
let adj_preimage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADJ_PREIMAGE")

///|
/// `ADJ_PREIMAGE`
pub fn adj_preimage() -> @kernel.Thm {
  adj_preimage_c.get()
}

///|
/// HERMITE_A1
fn step_19() -> Unit raise {
  let t898 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(27) * pow((b11 : Int), 3) <= int_of_num(64)"))
  let t897 = @simp.asm_rewrite_tac(@list.List([]))
  let t899 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(b11 : Int)"), cube_ge_8()))), t897), t898), @int.int_arith_tac), @tactics.all_tac])
  let t896 = @tactics.subgoal_then(@term_syntax.parse_term("!(int_of_num(2) <= (b11 : Int))"), fn(x893 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s894 = @tactics.assume_tac(x893)
    fn(x895 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s894(x895)
    }
  })
  let t892 = @simp.asm_rewrite_tac(@list.List([]))
  let t890 = @term_syntax.parse_term("(Gst : Int)")
  let t891 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b11 : Int)"), t890]), hermite_cube()))
  let t887 = @simp.rewrite_tac(@list.List([]))
  let t888 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t887])
  let t882 = @term_syntax.parse_term("(t : Int)")
  let t883 = @list.List([@term_syntax.parse_term("(s : Int)"), t882])
  let t886 = @tactics.disch_then(fn(x885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x879 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s880 = @tactics.mp_tac(x879)
      fn(x881 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s880(x881)
      }
    })(((x884 : @kernel.Thm) => @bool.specl(t883, x884))(x885))
  })
  let t878 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t875 = @term_syntax.parse_term("(G22 : Int)")
  let t876 = @term_syntax.parse_term("(G12 : Int)")
  let t877 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(G11 : Int)"), t876, t875]), posdef_binary_criterion()))
  let t889 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("Gst"), t877), @tactics.ants_tac), t878), t886), @tactics.ants_tac), t888), @tactics.all_tac])
  let t874 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (Gst : Int)"), fn(x871 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s872 = @tactics.assume_tac(x871)
    fn(x873 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s872(x873)
    }
  })
  let t867 = @tactics.conv_tac(@int.int_ring)
  let t864 = @term_syntax.parse_term("(b11 : Int) * (b33 : Int) - pow((b13 : Int), 2) == (G22 : Int)")
  let t865 = @term_syntax.parse_term("(b11 : Int) * (b23 : Int) - (b12 : Int) * (b13 : Int) == (G12 : Int)")
  let t866 = @tactics.map_every(fn(x862 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let e = x862
    @tactics.undisch_tac(e)
  }, @list.List([@term_syntax.parse_term("(b11 : Int) * (b22 : Int) - pow((b12 : Int), 2) == (G11 : Int)"), t865, t864]))
  let t853 = @term_syntax.parse_term("(t : Int)")
  let t854 = @term_syntax.parse_term("(s : Int)")
  let t855 = @term_syntax.parse_term("(x1 : Int)")
  let t856 = @term_syntax.parse_term("(b33 : Int)")
  let t857 = @term_syntax.parse_term("(b23 : Int)")
  let t858 = @term_syntax.parse_term("(b22 : Int)")
  let t859 = @term_syntax.parse_term("(b13 : Int)")
  let t860 = @term_syntax.parse_term("(b12 : Int)")
  let t861 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b11 : Int)"), t860, t859, t858, t857, t856, t855, t854, t853]), ternary_complete()))
  let t868 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("Gst"), t861), t866), t867)
  let t869 = @list.List([@tactics.first_x_assum(fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x843
    let t852 = @tactics.disch_then(fn(x849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th2 = x849
      let t851 = @tactics.mp_tac(th2)
      @tactics.orelse_tac(@tactics.accept_tac(th2), t851)
    })
    let t847 = @meson.meson_tac(@list.List([]))
    let t848 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((s : Int) == int_of_num(0) && (t : Int) == int_of_num(0))")), t847), @tactics.all_tac])
    let t845 = @term_syntax.parse_term("(t : Int)")
    let t846 = @term_syntax.parse_term("(s : Int)")
    @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x1 : Int)"), t846, t845]), th)), @tactics.ants_tac), t848), t852)
  }), t868])
  let t842 = @tactics.repeat_tac(@tactics.conj_tac)
  let t841 = @simp.asm_rewrite_tac(@list.List([]))
  let t838 = @term_syntax.parse_term("(t : Int)")
  let t839 = @term_syntax.parse_term("(s : Int)")
  let t840 = @tactics.map_every(fn(x835 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s836 = @tactics.exists_tac(x835)
    fn(x837 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s836(x837)
    }
  }, @list.List([@term_syntax.parse_term("(x1 : Int)"), t839, t838]))
  let t830 = @term_syntax.parse_term("(b33 : Int)")
  let t831 = @term_syntax.parse_term("(b23 : Int)")
  let t832 = @term_syntax.parse_term("(b22 : Int)")
  let t833 = @term_syntax.parse_term("(b13 : Int)")
  let t834 = @tactics.map_every(fn(x827 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s828 = @tactics.exists_tac(x827)
    fn(x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s828(x829)
    }
  }, @list.List([@term_syntax.parse_term("(b12 : Int)"), t833, t832, t831, t830]))
  let t870 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(hermite_lower()), t834), t840), t841), t842), t869), @tactics.all_tac])
  let t826 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(3) * pow((b11 : Int), 2) <= int_of_num(4) * (Gst : Int)"), fn(x823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s824 = @tactics.assume_tac(x823)
    fn(x825 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s824(x825)
    }
  })
  let t821 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(b11 : Int) * -(bb : Int) + ((b12 : Int) * (s : Int) + (b13 : Int) * (t : Int)) == b12 * s + b13 * t - b11 * bb"))]))
  let t820 = @simp.expand_tac("x1")
  let t819 = @kernel.assume_rule(@term_syntax.parse_term("abs((b12 : Int) * (s : Int) + (b13 : Int) * (t : Int) - (b11 : Int) * (bb : Int)) * int_of_num(2) <= b11"))
  let t822 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@drule.match_mp(sq_bound())(t819)), t820), t821), @int.int_arith_tac), @tactics.all_tac])
  let t818 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(4) * pow((b11 : Int) * (x1 : Int) + ((b12 : Int) * (s : Int) + (b13 : Int) * (t : Int)), 2) <= pow(b11, 2)"), fn(x815 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s816 = @tactics.assume_tac(x815)
    fn(x817 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s816(x817)
    }
  })
  let t814 = @simp.abbrev_tac(@term_syntax.parse_term("(x1 : Int) == -(bb : Int)"))
  let t811 = @term_syntax.parse_term("(bb : Int)")
  let t813 = @tactics.disch_then((x812 : @kernel.Thm) => @tactics.x_choose_tac(t811, x812))
  let t810 = @simp.asm_rewrite_tac(@list.List([]))
  let t808 = @term_syntax.parse_term("(b11 : Int)")
  let t809 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b12 : Int) * (s : Int) + (b13 : Int) * (t : Int)"), t808]), int_balanced_rem()))
  let t807 = @simp.abbrev_tac(@term_syntax.parse_term("(Gst : Int) == (G11 : Int) * pow((s : Int), 2) + (int_of_num(2) * ((G12 : Int) * (s * (t : Int))) + (G22 : Int) * pow(t, 2))"))
  let t805 = @tactics.x_choose_then(@term_syntax.parse_term("(t : Int)"))(@tactics.strip_assume_tac)
  let t806 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Int)"))(t805))
  let t804 = @simp.asm_rewrite_tac(@list.List([]))
  let t799 = @term_syntax.parse_term("(G22 : Int)")
  let t800 = @list.List([@term_syntax.parse_term("(G12 : Int)"), t799])
  let t803 = @tactics.disch_then(fn(x802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s797 = @tactics.mp_tac(x796)
      fn(x798 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s797(x798)
      }
    })(((x801 : @kernel.Thm) => @bool.specl(t800, x801))(x802))
  })
  let t795 = @simp.asm_rewrite_tac(@list.List([]))
  let t791 = @term_syntax.parse_term("(G11 : Int)")
  let t794 = @tactics.disch_then(fn(x793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s789 = @tactics.mp_tac(x788)
      fn(x790 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s789(x790)
      }
    })(((x792 : @kernel.Thm) => @bool.spec(t791, x792))(x793))
  })
  let t787 = @simp.asm_rewrite_tac(@list.List([]))
  let t786 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(b11 : Int)"), binary_hermite()))
  let t784 = @tactics.conv_tac(@int.int_ring)
  let t783 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(b11 : Int) * ((b22 : Int) * (b33 : Int) - pow((b23 : Int), 2)) - (b12 : Int) * (b12 * b33 - (b13 : Int) * b23) + b13 * (b12 * b23 - b13 * b22) == int_of_num(1)")))
  let t782 = @simp.rewrite_tac(@list.List([disc_g()]))
  let t785 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x779 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s780 = @simp.expand_tac(x779)
    fn(x781 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s780(x781)
    }
  }, @list.List(["G11", "G12", "G22"])), t782), t783), t784), @tactics.all_tac])
  let t778 = @tactics.subgoal_then(@term_syntax.parse_term("(G11 : Int) * (G22 : Int) - pow((G12 : Int), 2) == (b11 : Int)"), fn(x775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s776 = @tactics.assume_tac(x775)
    fn(x777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s776(x777)
    }
  })
  let t774 = @simp.abbrev_tac(@term_syntax.parse_term("(G22 : Int) == (b11 : Int) * (b33 : Int) - pow((b13 : Int), 2)"))
  let t773 = @simp.abbrev_tac(@term_syntax.parse_term("(G12 : Int) == (b11 : Int) * (b23 : Int) - (b12 : Int) * (b13 : Int)"))
  let t772 = @simp.abbrev_tac(@term_syntax.parse_term("(G11 : Int) == (b11 : Int) * (b22 : Int) - pow((b12 : Int), 2)"))
  let t900 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t772), t773), t774), t778), t785), t786), t787), t794), t795), t803), t804), t806), t807), t809), t810), t813), t814), t818), t822), t826), t870), t874), t889), t891), t892), @tactics.disch_tac), t896), t899), @int.asm_int_arith_tac)
  hermite_a1_c.set(@tactics.prove(@term_syntax.parse_term("∀ b11 : Int, ∀ b12 : Int, ∀ b13 : Int, ∀ b22 : Int, ∀ b23 : Int, ∀ b33 : Int, int_of_num(0) < b11 && b11 * (b22 * b33 - pow(b23, 2)) - b12 * (b12 * b33 - b13 * b23) + b13 * (b12 * b23 - b13 * b22) == int_of_num(1) && int_of_num(0) < b11 * b22 - pow(b12, 2) && (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → b11 <= b11 * pow(x, 2) + (b22 * pow(y, 2) + (b33 * pow(z, 2) + (int_of_num(2) * (b12 * (x * y)) + (int_of_num(2) * (b13 * (x * z)) + int_of_num(2) * (b23 * (y * z))))))) → b11 == int_of_num(1)"), t900))
}

///|
let hermite_a1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_A1")

///|
/// `HERMITE_A1`
pub fn hermite_a1() -> @kernel.Thm {
  hermite_a1_c.get()
}

///|
/// CONJ_MIN
fn step_20() -> Unit raise {
  let t921 = @tactics.conv_tac(@int.int_ring)
  let t922 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t921)
  let t920 = @tactics.conv_tac(@int.int_ring)
  let t923 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t920), t922])
  let t919 = @tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("(lhs1 : Int) == (lhs2 : Int) && (rhs1 : Int) == (rhs2 : Int) → lhs2 <= rhs2 → lhs1 <= rhs1")))
  let t917 = @tactics.conv_tac(@int.int_ring)
  let t916 = @tactics.pop_assum_list((x915 : @list.List[@kernel.Thm]) => @tactics.map_every(fn(x912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s913 = @tactics.mp_tac(x912)
    fn(x914 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s913(x914)
    }
  }, x915))
  let t911 = @simp.rewrite_tac(@list.List([]))
  let t918 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("!((x : Int) == int_of_num(0) && (y : Int) == int_of_num(0) && (z : Int) == int_of_num(0))"))), t911), t916), t917), @tactics.all_tac])
  let t905 = @term_syntax.parse_term("(x : Int) * (v3 : Int) + ((y : Int) * (c32 : Int) + (z : Int) * (c33 : Int))")
  let t906 = @term_syntax.parse_term("(x : Int) * (v2 : Int) + ((y : Int) * (c22 : Int) + (z : Int) * (c23 : Int))")
  let t907 = @list.List([@term_syntax.parse_term("(x : Int) * (v1 : Int) + ((y : Int) * (c12 : Int) + (z : Int) * (c13 : Int))"), t906, t905])
  let t910 = @tactics.first_x_assum(fn(x909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s903 = @tactics.mp_tac(x902)
      fn(x904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s903(x904)
      }
    })(((x908 : @kernel.Thm) => @bool.specl(t907, x908))(x909))
  })
  let t901 = @tactics.repeat_tac(@tactics.strip_tac)
  let t924 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t901), t910), @tactics.ants_tac), t918), t919), @tactics.conj_tac), t923)
  conj_min_c.set(@tactics.prove(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, ∀ v1 : Int, ∀ v2 : Int, ∀ v3 : Int, ∀ c12 : Int, ∀ c13 : Int, ∀ c22 : Int, ∀ c23 : Int, ∀ c32 : Int, ∀ c33 : Int, ∀ b11 : Int, ∀ b12 : Int, ∀ b13 : Int, ∀ b22 : Int, ∀ b23 : Int, ∀ b33 : Int, (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → a11 * pow(v1, 2) + (a22 * pow(v2, 2) + (a33 * pow(v3, 2) + (int_of_num(2) * (a12 * (v1 * v2)) + (int_of_num(2) * (a13 * (v1 * v3)) + int_of_num(2) * (a23 * (v2 * v3)))))) <= a11 * pow(x, 2) + (a22 * pow(y, 2) + (a33 * pow(z, 2) + (int_of_num(2) * (a12 * (x * y)) + (int_of_num(2) * (a13 * (x * z)) + int_of_num(2) * (a23 * (y * z))))))) && v1 * (c22 * c33 - c23 * c32) - c12 * (v2 * c33 - c23 * v3) + c13 * (v2 * c32 - c22 * v3) == int_of_num(1) && b11 == a11 * pow(v1, 2) + (int_of_num(2) * (a12 * (v1 * v2)) + (int_of_num(2) * (a13 * (v1 * v3)) + (a22 * pow(v2, 2) + (int_of_num(2) * (a23 * (v2 * v3)) + a33 * pow(v3, 2))))) && b22 == a11 * pow(c12, 2) + (int_of_num(2) * (a12 * (c12 * c22)) + (int_of_num(2) * (a13 * (c12 * c32)) + (a22 * pow(c22, 2) + (int_of_num(2) * (a23 * (c22 * c32)) + a33 * pow(c32, 2))))) && b33 == a11 * pow(c13, 2) + (int_of_num(2) * (a12 * (c13 * c23)) + (int_of_num(2) * (a13 * (c13 * c33)) + (a22 * pow(c23, 2) + (int_of_num(2) * (a23 * (c23 * c33)) + a33 * pow(c33, 2))))) && b12 == a11 * (v1 * c12) + (a12 * (v1 * c22 + v2 * c12) + (a13 * (v1 * c32 + v3 * c12) + (a22 * (v2 * c22) + (a23 * (v2 * c32 + v3 * c22) + a33 * (v3 * c32))))) && b13 == a11 * (v1 * c13) + (a12 * (v1 * c23 + v2 * c13) + (a13 * (v1 * c33 + v3 * c13) + (a22 * (v2 * c23) + (a23 * (v2 * c33 + v3 * c23) + a33 * (v3 * c33))))) && b23 == a11 * (c12 * c13) + (a12 * (c12 * c23 + c22 * c13) + (a13 * (c12 * c33 + c32 * c13) + (a22 * (c22 * c23) + (a23 * (c22 * c33 + c32 * c23) + a33 * (c32 * c33))))) → (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → b11 <= b11 * pow(x, 2) + (b22 * pow(y, 2) + (b33 * pow(z, 2) + (int_of_num(2) * (b12 * (x * y)) + (int_of_num(2) * (b13 * (x * z)) + int_of_num(2) * (b23 * (y * z)))))))"), t924))
}

///|
let conj_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_MIN")

///|
/// `CONJ_MIN`
pub fn conj_min() -> @kernel.Thm {
  conj_min_c.get()
}

///|
/// POSDEF_MINOR2
fn step_21() -> Unit raise {
  let t944 = @simp.asm_simp_tac(@list.List([@int.int_lt_mul_eq()]))
  let t941 = @tactics.conv_tac(@int.int_ring)
  let t942 = @tactics.then_tac(@tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("(a : Int) == (b : Int) → int_of_num(0) < a → int_of_num(0) < b"))), t941)
  let t940 = @list.List([@int.asm_int_arith_tac, @meson.meson_tac(@list.List([]))])
  let t943 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((b11 : Int) == int_of_num(0))"), fn(x937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s938 = @tactics.mp_tac(x937)
    fn(x939 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s938(x939)
    }
  }), t940), t942])
  let t932 = @term_syntax.parse_term("int_of_num(0)")
  let t933 = @term_syntax.parse_term("(b11 : Int)")
  let t934 = @list.List([@term_syntax.parse_term("-(b12 : Int)"), t933, t932])
  let t945 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x929 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s930 = @tactics.mp_tac(x929)
      fn(x931 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s930(x931)
      }
    })(((x935 : @kernel.Thm) => @bool.specl(t934, x935))(x936))
  }), @tactics.ants_tac), t943), @tactics.all_tac), t944])
  let t928 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (b11 : Int) * (b11 * (b22 : Int) - pow((b12 : Int), 2))"), fn(x925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s926 = @tactics.mp_tac(x925)
    fn(x927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s926(x927)
    }
  })
  let t946 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t928), t945)
  posdef_minor2_c.set(@tactics.prove(@term_syntax.parse_term("∀ b11 : Int, ∀ b12 : Int, ∀ b13 : Int, ∀ b22 : Int, ∀ b23 : Int, ∀ b33 : Int, int_of_num(0) < b11 && (∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → int_of_num(0) < b11 * pow(x, 2) + (b22 * pow(y, 2) + (b33 * pow(z, 2) + (int_of_num(2) * (b12 * (x * y)) + (int_of_num(2) * (b13 * (x * z)) + int_of_num(2) * (b23 * (y * z))))))) → int_of_num(0) < b11 * b22 - pow(b12, 2)"), t946))
}

///|
let posdef_minor2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POSDEF_MINOR2")

///|
/// `POSDEF_MINOR2`
pub fn posdef_minor2() -> @kernel.Thm {
  posdef_minor2_c.get()
}

///|
/// CONJ_REPS
fn step_22() -> Unit raise {
  let t977 = @tactics.conv_tac(@int.int_ring)
  let t976 = @tactics.pop_assum_list((x975 : @list.List[@kernel.Thm]) => @tactics.map_every(fn(x972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s973 = @tactics.mp_tac(x972)
    fn(x974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s973(x974)
    }
  }, x975))
  let t969 = @term_syntax.parse_term("(y3 : Int)")
  let t970 = @term_syntax.parse_term("(y2 : Int)")
  let t971 = @tactics.map_every(fn(x966 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s967 = @tactics.exists_tac(x966)
    fn(x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s967(x968)
    }
  }, @list.List([@term_syntax.parse_term("(y1 : Int)"), t970, t969]))
  let t963 = @tactics.x_choose_then(@term_syntax.parse_term("(y3 : Int)"))(@tactics.strip_assume_tac)
  let t964 = @tactics.x_choose_then(@term_syntax.parse_term("(y2 : Int)"))(t963)
  let t965 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y1 : Int)"))(t964))
  let t962 = @list.List([@tactics.first_assum(fn(x959 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s960 = @tactics.accept_tac(x959)
    fn(x961 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s960(x961)
    }
  }), @tactics.all_tac])
  let t947 = @term_syntax.parse_term("(x3 : Int)")
  let t948 = @term_syntax.parse_term("(x2 : Int)")
  let t949 = @term_syntax.parse_term("(x1 : Int)")
  let t950 = @term_syntax.parse_term("(c33 : Int)")
  let t951 = @term_syntax.parse_term("(c23 : Int)")
  let t952 = @term_syntax.parse_term("(c13 : Int)")
  let t953 = @term_syntax.parse_term("(c32 : Int)")
  let t954 = @term_syntax.parse_term("(c22 : Int)")
  let t955 = @term_syntax.parse_term("(c12 : Int)")
  let t956 = @term_syntax.parse_term("(v3 : Int)")
  let t957 = @term_syntax.parse_term("(v2 : Int)")
  let t958 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(v1 : Int)"), t957, t956, t955, t954, t953, t952, t951, t950, t949, t948, t947]), adj_preimage()))
  let t978 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t958), @tactics.ants_tac), t962), t965), t971), t976), t977)
  conj_reps_c.set(@tactics.prove(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, ∀ v1 : Int, ∀ v2 : Int, ∀ v3 : Int, ∀ c12 : Int, ∀ c13 : Int, ∀ c22 : Int, ∀ c23 : Int, ∀ c32 : Int, ∀ c33 : Int, ∀ b11 : Int, ∀ b12 : Int, ∀ b13 : Int, ∀ b22 : Int, ∀ b23 : Int, ∀ b33 : Int, ∀ n : Int, v1 * (c22 * c33 - c23 * c32) - c12 * (v2 * c33 - c23 * v3) + c13 * (v2 * c32 - c22 * v3) == int_of_num(1) && b11 == a11 * pow(v1, 2) + (int_of_num(2) * (a12 * (v1 * v2)) + (int_of_num(2) * (a13 * (v1 * v3)) + (a22 * pow(v2, 2) + (int_of_num(2) * (a23 * (v2 * v3)) + a33 * pow(v3, 2))))) && b22 == a11 * pow(c12, 2) + (int_of_num(2) * (a12 * (c12 * c22)) + (int_of_num(2) * (a13 * (c12 * c32)) + (a22 * pow(c22, 2) + (int_of_num(2) * (a23 * (c22 * c32)) + a33 * pow(c32, 2))))) && b33 == a11 * pow(c13, 2) + (int_of_num(2) * (a12 * (c13 * c23)) + (int_of_num(2) * (a13 * (c13 * c33)) + (a22 * pow(c23, 2) + (int_of_num(2) * (a23 * (c23 * c33)) + a33 * pow(c33, 2))))) && b12 == a11 * (v1 * c12) + (a12 * (v1 * c22 + v2 * c12) + (a13 * (v1 * c32 + v3 * c12) + (a22 * (v2 * c22) + (a23 * (v2 * c32 + v3 * c22) + a33 * (v3 * c32))))) && b13 == a11 * (v1 * c13) + (a12 * (v1 * c23 + v2 * c13) + (a13 * (v1 * c33 + v3 * c13) + (a22 * (v2 * c23) + (a23 * (v2 * c33 + v3 * c23) + a33 * (v3 * c33))))) && b23 == a11 * (c12 * c13) + (a12 * (c12 * c23 + c22 * c13) + (a13 * (c12 * c33 + c32 * c13) + (a22 * (c22 * c23) + (a23 * (c22 * c33 + c32 * c23) + a33 * (c32 * c33))))) && (∃ x1 : Int, ∃ x2 : Int, ∃ x3 : Int, a11 * pow(x1, 2) + (a22 * pow(x2, 2) + (a33 * pow(x3, 2) + (int_of_num(2) * (a12 * (x1 * x2)) + (int_of_num(2) * (a13 * (x1 * x3)) + int_of_num(2) * (a23 * (x2 * x3)))))) == n) → (∃ y1 : Int, ∃ y2 : Int, ∃ y3 : Int, b11 * pow(y1, 2) + (b22 * pow(y2, 2) + (b33 * pow(y3, 2) + (int_of_num(2) * (b12 * (y1 * y2)) + (int_of_num(2) * (b13 * (y1 * y3)) + int_of_num(2) * (b23 * (y2 * y3)))))) == n)"), t978))
}

///|
let conj_reps_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJ_REPS")

///|
/// `CONJ_REPS`
pub fn conj_reps() -> @kernel.Thm {
  conj_reps_c.get()
}

///|
/// TSQ_DISC1
fn step_23() -> Unit raise {
  let t1158 = @simp.rewrite_tac(@list.List([]))
  let t1157 = @tactics.subst1_tac(@kernel.assume_rule(@term_syntax.parse_term("(b11 : Int) == int_of_num(1)")))
  let t1156 = @tactics.undisch_tac(@term_syntax.parse_term("(b11 : Int) * pow((y1 : Int), 2) + ((b22 : Int) * pow((y2 : Int), 2) + ((b33 : Int) * pow((y3 : Int), 2) + (int_of_num(2) * ((b12 : Int) * (y1 * y2)) + (int_of_num(2) * ((b13 : Int) * (y1 * y3)) + int_of_num(2) * ((b23 : Int) * (y2 * y3)))))) == (n : Int)"))
  let t1154 = @term_syntax.parse_term("(y3 : Int)")
  let t1155 = @term_syntax.parse_term("(y2 : Int)")
  let t1159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1151 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1152 = @tactics.exists_tac(x1151)
    fn(x1153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1152(x1153)
    }
  }, @list.List([@term_syntax.parse_term("(y1 : Int)"), t1155, t1154])), t1156), t1157), t1158)
  let t1150 = @tactics.conv_tac(@int.int_ring)
  let t1149 = @simp.rewrite_tac(@list.List([@int.int_mul_lid()]))
  let t1148 = @tactics.subst1_tac(@kernel.assume_rule(@term_syntax.parse_term("(b11 : Int) == int_of_num(1)")))
  let t1160 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(b11 : Int) * ((b22 : Int) * (b33 : Int) - pow((b23 : Int), 2)) - (b12 : Int) * (b12 * b33 - (b13 : Int) * b23) + b13 * (b12 * b23 - b13 * b22) == int_of_num(1)")), t1148), t1149), t1150)
  let t1147 = @simp.rewrite_tac(@list.List([@int.int_mul_lid()]))
  let t1146 = @tactics.subst1_tac(@kernel.assume_rule(@term_syntax.parse_term("(b11 : Int) == int_of_num(1)")))
  let t1161 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("int_of_num(0) < (b11 : Int) * (b22 : Int) - pow((b12 : Int), 2)")), t1146), t1147), t1160, t1159])
  let t1145 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1144 = @tactics.subst1_tac(@kernel.assume_rule(@term_syntax.parse_term("(b11 : Int) == int_of_num(1)")))
  let t1139 = @term_syntax.parse_term("(b33 : Int)")
  let t1140 = @term_syntax.parse_term("(b23 : Int)")
  let t1141 = @term_syntax.parse_term("(b22 : Int)")
  let t1142 = @term_syntax.parse_term("(b13 : Int)")
  let t1143 = @tactics.map_every(fn(x1136 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1137 = @tactics.exists_tac(x1136)
    fn(x1138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1137(x1138)
    }
  }, @list.List([@term_syntax.parse_term("(b12 : Int)"), t1142, t1141, t1140, t1139]))
  let t1135 = @tactics.match_mp_tac(tsq_disc1_a11_1())
  let t1133 = @meson.asm_meson_tac(@list.List([]))
  let t1132 = @simp.asm_rewrite_tac(@list.List([]))
  let t1117 = @term_syntax.parse_term("(c33 : Int)")
  let t1118 = @term_syntax.parse_term("(c32 : Int)")
  let t1119 = @term_syntax.parse_term("(c23 : Int)")
  let t1120 = @term_syntax.parse_term("(c22 : Int)")
  let t1121 = @term_syntax.parse_term("(c13 : Int)")
  let t1122 = @term_syntax.parse_term("(c12 : Int)")
  let t1123 = @term_syntax.parse_term("(v3 : Int)")
  let t1124 = @term_syntax.parse_term("(v2 : Int)")
  let t1125 = @term_syntax.parse_term("(v1 : Int)")
  let t1126 = @term_syntax.parse_term("(a33 : Int)")
  let t1127 = @term_syntax.parse_term("(a23 : Int)")
  let t1128 = @term_syntax.parse_term("(a22 : Int)")
  let t1129 = @term_syntax.parse_term("(a13 : Int)")
  let t1130 = @term_syntax.parse_term("(a12 : Int)")
  let t1131 = @tactics.map_every(fn(x1114 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1115 = @tactics.exists_tac(x1114)
    fn(x1116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1115(x1116)
    }
  }, @list.List([@term_syntax.parse_term("(a11 : Int)"), t1130, t1129, t1128, t1127, t1126, t1125, t1124, t1123, t1122, t1121, t1120, t1119, t1118, t1117]))
  let t1134 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(conj_reps()), t1131), t1132), t1133), @tactics.all_tac])
  let t1113 = @tactics.subgoal_then(@term_syntax.parse_term("∃ y1 : Int, ∃ y2 : Int, ∃ y3 : Int, (b11 : Int) * pow(y1, 2) + ((b22 : Int) * pow(y2, 2) + ((b33 : Int) * pow(y3, 2) + (int_of_num(2) * ((b12 : Int) * (y1 * y2)) + (int_of_num(2) * ((b13 : Int) * (y1 * y3)) + int_of_num(2) * ((b23 : Int) * (y2 * y3)))))) == (n : Int)"), @tactics.strip_assume_tac)
  let t1111 = @simp.asm_rewrite_tac(@list.List([]))
  let t1106 = @term_syntax.parse_term("(b33 : Int)")
  let t1107 = @term_syntax.parse_term("(b23 : Int)")
  let t1108 = @term_syntax.parse_term("(b22 : Int)")
  let t1109 = @term_syntax.parse_term("(b13 : Int)")
  let t1110 = @tactics.map_every(fn(x1103 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1104 = @tactics.exists_tac(x1103)
    fn(x1105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1104(x1105)
    }
  }, @list.List([@term_syntax.parse_term("(b12 : Int)"), t1109, t1108, t1107, t1106]))
  let t1112 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(hermite_a1()), t1110), t1111), @tactics.all_tac])
  let t1102 = @tactics.subgoal_then(@term_syntax.parse_term("(b11 : Int) == int_of_num(1)"), fn(x1099 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1100 = @tactics.assume_tac(x1099)
    fn(x1101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1100(x1101)
    }
  })
  let t1097 = @simp.asm_rewrite_tac(@list.List([]))
  let t1094 = @term_syntax.parse_term("(b33 : Int)")
  let t1095 = @term_syntax.parse_term("(b23 : Int)")
  let t1096 = @tactics.map_every(fn(x1091 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1092 = @tactics.exists_tac(x1091)
    fn(x1093 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1092(x1093)
    }
  }, @list.List([@term_syntax.parse_term("(b13 : Int)"), t1095, t1094]))
  let t1098 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(posdef_minor2()), t1096), t1097), @tactics.all_tac])
  let t1090 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (b11 : Int) * (b22 : Int) - pow((b12 : Int), 2)"), fn(x1087 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1088 = @tactics.assume_tac(x1087)
    fn(x1089 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1088(x1089)
    }
  })
  let t1085 = @simp.asm_rewrite_tac(@list.List([]))
  let t1084 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1083 = @simp.asm_rewrite_tac(@list.List([]))
  let t1082 = @tactics.exists_tac(@term_syntax.parse_term("(b11 : Int)"))
  let t1081 = @tactics.match_mp_tac(@int.int_lte_trans())
  let t1086 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1081), t1082), t1083), t1084), t1085), @tactics.all_tac])
  let t1080 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → int_of_num(0) < (b11 : Int) * pow(x, 2) + ((b22 : Int) * pow(y, 2) + ((b33 : Int) * pow(z, 2) + (int_of_num(2) * ((b12 : Int) * (x * y)) + (int_of_num(2) * ((b13 : Int) * (x * z)) + int_of_num(2) * ((b23 : Int) * (y * z))))))"), fn(x1077 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1078 = @tactics.assume_tac(x1077)
    fn(x1079 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1078(x1079)
    }
  })
  let t1075 = @tactics.conv_tac(@int.int_ring)
  let t1074 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(a11 : Int) * ((a22 : Int) * (a33 : Int) - pow((a23 : Int), 2)) - (a12 : Int) * (a12 * a33 - a23 * (a13 : Int)) + a13 * (a12 * a23 - a22 * a13) == int_of_num(1)")))
  let t1073 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(v1 : Int) * ((c22 : Int) * (c33 : Int) - (c23 : Int) * (c32 : Int)) - (c12 : Int) * ((v2 : Int) * c33 - c23 * (v3 : Int)) + (c13 : Int) * (v2 * c32 - c22 * v3) == int_of_num(1)")))
  let t1076 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1070 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1071 = @simp.expand_tac(x1070)
    fn(x1072 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1071(x1072)
    }
  }, @list.List(["b11", "b12", "b13", "b22", "b23", "b33"])), t1073), t1074), t1075), @tactics.all_tac])
  let t1069 = @tactics.subgoal_then(@term_syntax.parse_term("(b11 : Int) * ((b22 : Int) * (b33 : Int) - pow((b23 : Int), 2)) - (b12 : Int) * (b12 * b33 - (b13 : Int) * b23) + b13 * (b12 * b23 - b13 * b22) == int_of_num(1)"), fn(x1066 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1067 = @tactics.assume_tac(x1066)
    fn(x1068 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1067(x1068)
    }
  })
  let t1064 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(a11 : Int) * pow((v1 : Int), 2) + (int_of_num(2) * ((a12 : Int) * (v1 * (v2 : Int))) + (int_of_num(2) * ((a13 : Int) * (v1 * (v3 : Int))) + ((a22 : Int) * pow(v2, 2) + (int_of_num(2) * ((a23 : Int) * (v2 * v3)) + (a33 : Int) * pow(v3, 2))))) == (b11 : Int)")))
  let t1065 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1055 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1055
    let t1063 = @tactics.disch_then(fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let t = x1060
      let t1062 = @term_syntax.parse_term("int_of_num(0)")
      if (@kernel.rand(@kernel.rator(@kernel.concl(t))) == t1062) {
        @tactics.mp_tac(t)
      } else {
        @tactics.no_tac
      }
    })
    let t1059 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
    let t1057 = @term_syntax.parse_term("(v3 : Int)")
    let t1058 = @term_syntax.parse_term("(v2 : Int)")
    @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(v1 : Int)"), t1058, t1057]), th)), @tactics.ants_tac), t1059), t1063)
  }), t1064), @int.int_arith_tac), @tactics.all_tac])
  let t1054 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (b11 : Int)"), fn(x1051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1052 = @tactics.assume_tac(x1051)
    fn(x1053 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1052(x1053)
    }
  })
  let t1049 = @simp.asm_rewrite_tac(@list.List([]))
  let t1034 = @term_syntax.parse_term("(c33 : Int)")
  let t1035 = @term_syntax.parse_term("(c32 : Int)")
  let t1036 = @term_syntax.parse_term("(c23 : Int)")
  let t1037 = @term_syntax.parse_term("(c22 : Int)")
  let t1038 = @term_syntax.parse_term("(c13 : Int)")
  let t1039 = @term_syntax.parse_term("(c12 : Int)")
  let t1040 = @term_syntax.parse_term("(v3 : Int)")
  let t1041 = @term_syntax.parse_term("(v2 : Int)")
  let t1042 = @term_syntax.parse_term("(v1 : Int)")
  let t1043 = @term_syntax.parse_term("(a33 : Int)")
  let t1044 = @term_syntax.parse_term("(a23 : Int)")
  let t1045 = @term_syntax.parse_term("(a22 : Int)")
  let t1046 = @term_syntax.parse_term("(a13 : Int)")
  let t1047 = @term_syntax.parse_term("(a12 : Int)")
  let t1048 = @tactics.map_every(fn(x1031 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1032 = @tactics.exists_tac(x1031)
    fn(x1033 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1032(x1033)
    }
  }, @list.List([@term_syntax.parse_term("(a11 : Int)"), t1047, t1046, t1045, t1044, t1043, t1042, t1041, t1040, t1039, t1038, t1037, t1036, t1035, t1034]))
  let t1050 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(conj_min()), t1048), t1049), @tactics.all_tac])
  let t1030 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → (b11 : Int) <= b11 * pow(x, 2) + ((b22 : Int) * pow(y, 2) + ((b33 : Int) * pow(z, 2) + (int_of_num(2) * ((b12 : Int) * (x * y)) + (int_of_num(2) * ((b13 : Int) * (x * z)) + int_of_num(2) * ((b23 : Int) * (y * z))))))"), fn(x1027 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1028 = @tactics.assume_tac(x1027)
    fn(x1029 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1028(x1029)
    }
  })
  let t1026 = @simp.abbrev_tac(@term_syntax.parse_term("(b23 : Int) == (a11 : Int) * ((c12 : Int) * (c13 : Int)) + ((a12 : Int) * (c12 * (c23 : Int) + (c22 : Int) * c13) + ((a13 : Int) * (c12 * (c33 : Int) + (c32 : Int) * c13) + ((a22 : Int) * (c22 * c23) + ((a23 : Int) * (c22 * c33 + c32 * c23) + (a33 : Int) * (c32 * c33)))))"))
  let t1025 = @simp.abbrev_tac(@term_syntax.parse_term("(b13 : Int) == (a11 : Int) * ((v1 : Int) * (c13 : Int)) + ((a12 : Int) * (v1 * (c23 : Int) + (v2 : Int) * c13) + ((a13 : Int) * (v1 * (c33 : Int) + (v3 : Int) * c13) + ((a22 : Int) * (v2 * c23) + ((a23 : Int) * (v2 * c33 + v3 * c23) + (a33 : Int) * (v3 * c33)))))"))
  let t1024 = @simp.abbrev_tac(@term_syntax.parse_term("(b12 : Int) == (a11 : Int) * ((v1 : Int) * (c12 : Int)) + ((a12 : Int) * (v1 * (c22 : Int) + (v2 : Int) * c12) + ((a13 : Int) * (v1 * (c32 : Int) + (v3 : Int) * c12) + ((a22 : Int) * (v2 * c22) + ((a23 : Int) * (v2 * c32 + v3 * c22) + (a33 : Int) * (v3 * c32)))))"))
  let t1023 = @simp.abbrev_tac(@term_syntax.parse_term("(b33 : Int) == (a11 : Int) * pow((c13 : Int), 2) + (int_of_num(2) * ((a12 : Int) * (c13 * (c23 : Int))) + (int_of_num(2) * ((a13 : Int) * (c13 * (c33 : Int))) + ((a22 : Int) * pow(c23, 2) + (int_of_num(2) * ((a23 : Int) * (c23 * c33)) + (a33 : Int) * pow(c33, 2)))))"))
  let t1022 = @simp.abbrev_tac(@term_syntax.parse_term("(b22 : Int) == (a11 : Int) * pow((c12 : Int), 2) + (int_of_num(2) * ((a12 : Int) * (c12 * (c22 : Int))) + (int_of_num(2) * ((a13 : Int) * (c12 * (c32 : Int))) + ((a22 : Int) * pow(c22, 2) + (int_of_num(2) * ((a23 : Int) * (c22 * c32)) + (a33 : Int) * pow(c32, 2)))))"))
  let t1021 = @simp.abbrev_tac(@term_syntax.parse_term("(b11 : Int) == (a11 : Int) * pow((v1 : Int), 2) + (int_of_num(2) * ((a12 : Int) * (v1 * (v2 : Int))) + (int_of_num(2) * ((a13 : Int) * (v1 * (v3 : Int))) + ((a22 : Int) * pow(v2, 2) + (int_of_num(2) * ((a23 : Int) * (v2 * v3)) + (a33 : Int) * pow(v3, 2)))))"))
  let t1015 = @tactics.x_choose_then(@term_syntax.parse_term("(c33 : Int)"))(fn(x1012 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1013 = @tactics.assume_tac(x1012)
    fn(x1014 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1013(x1014)
    }
  })
  let t1016 = @tactics.x_choose_then(@term_syntax.parse_term("(c32 : Int)"))(t1015)
  let t1017 = @tactics.x_choose_then(@term_syntax.parse_term("(c23 : Int)"))(t1016)
  let t1018 = @tactics.x_choose_then(@term_syntax.parse_term("(c22 : Int)"))(t1017)
  let t1019 = @tactics.x_choose_then(@term_syntax.parse_term("(c13 : Int)"))(t1018)
  let t1020 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c12 : Int)"))(t1019))
  let t1011 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1008 = @term_syntax.parse_term("(v3 : Int)")
  let t1009 = @term_syntax.parse_term("(v2 : Int)")
  let t1010 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(v1 : Int)"), t1009, t1008]), sl3_extend()))
  let t1006 = @simp.asm_rewrite_tac(@list.List([]))
  let t1000 = @term_syntax.parse_term("(a33 : Int)")
  let t1001 = @term_syntax.parse_term("(a23 : Int)")
  let t1002 = @term_syntax.parse_term("(a22 : Int)")
  let t1003 = @term_syntax.parse_term("(a13 : Int)")
  let t1004 = @term_syntax.parse_term("(a12 : Int)")
  let t1005 = @tactics.map_every(fn(x997 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s998 = @tactics.exists_tac(x997)
    fn(x999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s998(x999)
    }
  }, @list.List([@term_syntax.parse_term("(a11 : Int)"), t1004, t1003, t1002, t1001, t1000]))
  let t1007 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(min_primitive()), t1005), t1006), @tactics.all_tac])
  let t996 = @tactics.subgoal_then(@term_syntax.parse_term("∃ p : Int, ∃ q : Int, ∃ s : Int, (v1 : Int) * p + ((v2 : Int) * q + (v3 : Int) * s) == int_of_num(1)"), @tactics.strip_assume_tac)
  let t993 = @tactics.x_choose_then(@term_syntax.parse_term("(v3 : Int)"))(@tactics.strip_assume_tac)
  let t994 = @tactics.x_choose_then(@term_syntax.parse_term("(v2 : Int)"))(t993)
  let t995 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v1 : Int)"))(t994))
  let t992 = @simp.asm_rewrite_tac(@list.List([]))
  let t986 = @term_syntax.parse_term("(a33 : Int)")
  let t987 = @term_syntax.parse_term("(a23 : Int)")
  let t988 = @term_syntax.parse_term("(a22 : Int)")
  let t989 = @term_syntax.parse_term("(a13 : Int)")
  let t990 = @term_syntax.parse_term("(a12 : Int)")
  let t991 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a11 : Int)"), t990, t989, t988, t987, t986]), ternary_min()))
  let t984 = @tactics.undisch_tac(@term_syntax.parse_term("(a11 : Int) * ((a22 : Int) * (a33 : Int) - pow((a23 : Int), 2)) - (a12 : Int) * (a12 * a33 - a23 * (a13 : Int)) + a13 * (a12 * a23 - a22 * a13) == int_of_num(1)"))
  let t983 = @simp.asm_rewrite_tac(@list.List([]))
  let t985 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(ternary_posdef()), t983), t984), @int.int_arith_tac), @tactics.all_tac])
  let t982 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Int, ∀ y : Int, ∀ z : Int, !(x == int_of_num(0) && y == int_of_num(0) && z == int_of_num(0)) → int_of_num(0) < (a11 : Int) * pow(x, 2) + ((a22 : Int) * pow(y, 2) + ((a33 : Int) * pow(z, 2) + (int_of_num(2) * ((a12 : Int) * (x * y)) + (int_of_num(2) * ((a13 : Int) * (x * z)) + int_of_num(2) * ((a23 : Int) * (y * z))))))"), fn(x979 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s980 = @tactics.assume_tac(x979)
    fn(x981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s980(x981)
    }
  })
  let t1162 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t982), t985), t991), t992), t995), t996), t1007), t1010), @tactics.ants_tac), t1011), t1020), t1021), t1022), t1023), t1024), t1025), t1026), t1030), t1050), t1054), t1065), t1069), t1076), t1080), t1086), t1090), t1098), t1102), t1112), t1113), t1134), t1135), t1143), t1144), t1145), t1161)
  tsq_disc1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a11 : Int, ∀ a12 : Int, ∀ a13 : Int, ∀ a22 : Int, ∀ a23 : Int, ∀ a33 : Int, ∀ n : Int, int_of_num(0) < a11 && int_of_num(0) < a11 * a22 - pow(a12, 2) && a11 * (a22 * a33 - pow(a23, 2)) - a12 * (a12 * a33 - a23 * a13) + a13 * (a12 * a23 - a22 * a13) == int_of_num(1) && (∃ x1 : Int, ∃ x2 : Int, ∃ x3 : Int, a11 * pow(x1, 2) + (a22 * pow(x2, 2) + (a33 * pow(x3, 2) + (int_of_num(2) * (a12 * (x1 * x2)) + (int_of_num(2) * (a13 * (x1 * x3)) + int_of_num(2) * (a23 * (x2 * x3)))))) == n) → (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == n)"), t1162))
}

///|
let tsq_disc1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TSQ_DISC1")

///|
/// `TSQ_DISC1`
pub fn tsq_disc1() -> @kernel.Thm {
  tsq_disc1_c.get()
}

///|
/// LEMMA_1_7
fn step_24() -> Unit raise {
  let t1219 = @tactics.conv_tac(@int.int_ring)
  let t1217 = @term_syntax.parse_term("int_of_num(1)")
  let t1218 = @term_syntax.parse_term("int_of_num(0)")
  let t1220 = @tactics.then_tac(@tactics.map_every(fn(x1214 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1215 = @tactics.exists_tac(x1214)
    fn(x1216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1215(x1216)
    }
  }, @list.List([@term_syntax.parse_term("int_of_num(0)"), t1218, t1217])), t1219)
  let t1213 = @tactics.conv_tac(@int.int_ring)
  let t1212 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(d' : Int) * (n : Int) - int_of_num(1) == (a22 : Int)")))
  let t1221 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(a11 : Int) * (a22 : Int) - pow((t : Int), 2) == (d' : Int)"))), t1212), t1213)
  let t1222 = @tactics.then_tac(@tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("(a11 : Int) * (a22 : Int) - pow((t : Int), 2) == (d' : Int)"))), @int.asm_int_arith_tac)
  let t1223 = @list.List([@tactics.first_assum(fn(x1209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1210 = @tactics.accept_tac(x1209)
    fn(x1211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1210(x1211)
    }
  }), t1222, t1221, t1220])
  let t1208 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1202 = @term_syntax.parse_term("(n : Int)")
  let t1203 = @term_syntax.parse_term("int_of_num(0)")
  let t1204 = @term_syntax.parse_term("(a22 : Int)")
  let t1205 = @term_syntax.parse_term("int_of_num(1)")
  let t1206 = @term_syntax.parse_term("(t : Int)")
  let t1207 = @tactics.map_every(fn(x1199 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1200 = @tactics.exists_tac(x1199)
    fn(x1201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1200(x1201)
    }
  }, @list.List([@term_syntax.parse_term("(a11 : Int)"), t1206, t1205, t1204, t1203, t1202]))
  let t1198 = @tactics.match_mp_tac(tsq_disc1())
  let t1196 = @simp.asm_simp_tac(@list.List([@int.int_lt_mul_eq()]))
  let t1194 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(t : Int)"), @int.int_le_pow_2()))
  let t1195 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(a11 : Int) * (a22 : Int) == pow((t : Int), 2) + (d' : Int)"), fn(x1191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1192 = @tactics.subst1_tac(x1191)
    fn(x1193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1192(x1193)
    }
  }), @list.List([@int.asm_int_arith_tac, @tactics.all_tac])), t1194), @int.asm_int_arith_tac), @tactics.all_tac])
  let t1197 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (a11 : Int) * (a22 : Int)"), fn(x1188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1189 = @tactics.mp_tac(x1188)
    fn(x1190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1189(x1190)
    }
  }), t1195), t1196), @tactics.all_tac])
  let t1187 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (a11 : Int)"), fn(x1184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1185 = @tactics.assume_tac(x1184)
    fn(x1186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1185(x1186)
    }
  })
  let t1183 = @list.List([@tactics.then_tac(@tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("pow((t : Int), 2) + (d' : Int) == (a22 : Int) * (a11 : Int)"))), @int.int_arith_tac), @tactics.all_tac])
  let t1182 = @tactics.subgoal_then(@term_syntax.parse_term("(a11 : Int) * (a22 : Int) - pow((t : Int), 2) == (d' : Int)"), fn(x1179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1180 = @tactics.assume_tac(x1179)
    fn(x1181 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1180(x1181)
    }
  })
  let t1177 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_mul2()), @int.asm_int_arith_tac), @int.int_arith_tac])
  let t1176 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(1) * int_of_num(2) <= (d' : Int) * (n : Int)"), fn(x1173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1174 = @tactics.mp_tac(x1173)
    fn(x1175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1174(x1175)
    }
  })
  let t1178 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.expand_tac("a22"), t1176), t1177), @tactics.all_tac])
  let t1172 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) < (a22 : Int)"), fn(x1169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1170 = @tactics.assume_tac(x1169)
    fn(x1171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1170(x1171)
    }
  })
  let t1166 = @term_syntax.parse_term("(a11 : Int)")
  let t1168 = @tactics.disch_then((x1167 : @kernel.Thm) => @tactics.x_choose_tac(t1166, x1167))
  let t1165 = @simp.rewrite_tac(@list.List([@int.int_divides()]))
  let t1164 = @tactics.undisch_tac(@term_syntax.parse_term("divides((a22 : Int), pow((t : Int), 2) + (d' : Int))"))
  let t1163 = @simp.abbrev_tac(@term_syntax.parse_term("(a22 : Int) == (d' : Int) * (n : Int) - int_of_num(1)"))
  let t1224 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1163), t1164), t1165), t1168), t1172), t1178), t1182), t1183), t1187), t1197), t1198), t1207), t1208), t1223)
  lemma_1_7_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Int, ∀ d' : Int, ∀ t : Int, int_of_num(1) < n && int_of_num(0) < d' && divides(d' * n - int_of_num(1), pow(t, 2) + d') → (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == n)"), t1224))
}

///|
let lemma_1_7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_1_7")

///|
/// `LEMMA_1_7`
pub fn lemma_1_7() -> @kernel.Thm {
  lemma_1_7_c.get()
}

///|
/// LEMMA_1_7_CONG
fn step_25() -> Unit raise {
  let t1239 = @tactics.pop_assum(fn(x1236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1237 = @tactics.mp_tac(x1236)
    fn(x1238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1237(x1238)
    }
  })
  let t1235 = @tactics.exists_tac(@term_syntax.parse_term("(d : Int)"))
  let t1234 = @simp.rewrite_tac(@list.List([@int.int_divides()]))
  let t1233 = @simp.rewrite_tac(@list.List([@int.int_congruent()]))
  let t1232 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(pow((x : Int), 2) + (d' : Int), int_of_num(0), mod(d' * (n : Int) - int_of_num(1)))"))
  let t1231 = @simp.asm_rewrite_tac(@list.List([]))
  let t1229 = @term_syntax.parse_term("(x : Int)")
  let t1230 = @tactics.map_every(fn(x1226 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1227 = @tactics.exists_tac(x1226)
    fn(x1228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1227(x1228)
    }
  }, @list.List([@term_syntax.parse_term("(d' : Int)"), t1229]))
  let t1225 = @tactics.match_mp_tac(lemma_1_7())
  let t1240 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1225), t1230), t1231), t1232), t1233), t1234), @tactics.strip_tac), t1235), t1239), @int.int_arith_tac)
  lemma_1_7_cong_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Int, ∀ d' : Int, int_of_num(1) < n && int_of_num(0) < d' && (∃ x : Int, op_eq_eq(pow(x, 2) + d', int_of_num(0), mod(d' * n - int_of_num(1)))) → (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == n)"), t1240))
}

///|
let lemma_1_7_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_1_7_CONG")

///|
/// `LEMMA_1_7_CONG`
pub fn lemma_1_7_cong() -> @kernel.Thm {
  lemma_1_7_cong_c.get()
}

///|
/// CONG_1_MOD_8
fn step_26() -> Unit raise {
  let t1241 = @meson.meson_tac(@list.List([@pocklington.cong_case(), @arith.mult_sym(), @int.arith_rule(@term_syntax.parse_term("1 < 8"))]))
  cong_1_mod_8_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, op_eq_eq(d, 1, mod(8)) → (∃ q : Num, d == 8 * q + 1)"), t1241))
}

///|
let cong_1_mod_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_1_MOD_8")

///|
/// `CONG_1_MOD_8`
pub fn cong_1_mod_8() -> @kernel.Thm {
  cong_1_mod_8_c.get()
}

///|
/// CONG_MOD_8_IMP_MOD_4
fn step_27() -> Unit raise {
  let t1247 = @tactics.conv_tac(@prime.divides_conv)
  let t1246 = @simp.asm_rewrite_tac(@list.List([]))
  let t1242 = @term_syntax.parse_term("4")
  let t1243 = @term_syntax.parse_term("8")
  let t1244 = @term_syntax.parse_term("(a : Num)")
  let t1245 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t1244, t1243, t1242]), @pocklington.cong_divides_modulus()))
  let t1248 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1245), t1246), t1247)
  cong_mod_8_imp_mod_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ a : Num, op_eq_eq(x, a, mod(8)) → op_eq_eq(x, a, mod(4))"), t1248))
}

///|
let cong_mod_8_imp_mod_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_MOD_8_IMP_MOD_4")

///|
/// `CONG_MOD_8_IMP_MOD_4`
pub fn cong_mod_8_imp_mod_4() -> @kernel.Thm {
  cong_mod_8_imp_mod_4_c.get()
}

///|
/// JACOBI_2_1MOD8
fn step_28() -> Unit raise {
  let t1257 = @simp.rewrite_tac(@list.List([@int.int_pow_neg(), @arith.even_add(), @arith.even_mult(), @calc_num.arith(), @int.int_pow_one()]))
  let t1256 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(EXP(8 * (q : Num) + 1, 2) - 1, 8) == 8 * (q * q) + 2 * q"))]))
  let t1255 = @simp.asm_rewrite_tac(@list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith()]))
  let t1254 = @simp.asm_simp_tac(@list.List([@jacobi.jacobi_of_2()]))
  let t1251 = @drule.match_mp(cong_1_mod_8())
  let t1249 = @term_syntax.parse_term("(q : Num)")
  let t1253 = @tactics.first_assum(fn(x1252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x1250 : @kernel.Thm) => @tactics.x_choose_tac(t1249, x1250))(t1251(x1252))
  })
  let t1258 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1253), t1254), t1255), t1256), t1257)
  jacobi_2_1mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, op_eq_eq(d, 1, mod(8)) → jacobi((2, d)) == int_of_num(1)"), t1258))
}

///|
let jacobi_2_1mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_2_1MOD8")

///|
/// `JACOBI_2_1MOD8`
pub fn jacobi_2_1mod8() -> @kernel.Thm {
  jacobi_2_1mod8_c.get()
}

///|
/// CONG_1_MOD_4
fn step_29() -> Unit raise {
  let t1259 = @meson.meson_tac(@list.List([@pocklington.cong_case(), @arith.mult_sym(), @int.arith_rule(@term_syntax.parse_term("1 < 4"))]))
  cong_1_mod_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, op_eq_eq(d, 1, mod(4)) → (∃ q : Num, d == 4 * q + 1)"), t1259))
}

///|
let cong_1_mod_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_1_MOD_4")

///|
/// `CONG_1_MOD_4`
pub fn cong_1_mod_4() -> @kernel.Thm {
  cong_1_mod_4_c.get()
}

///|
/// ODD_OF_1MOD4
fn step_30() -> Unit raise {
  let t1267 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1263 = @drule.match_mp(cong_1_mod_4())
  let t1264 = @tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(x1260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1261 = @tactics.subst1_tac(x1260)
    fn(x1262 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1261(x1262)
    }
  })
  let t1266 = @tactics.first_assum(fn(x1265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t1264(t1263(x1265))
  })
  let t1268 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1266), t1267)
  odd_of_1mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, op_eq_eq(p, 1, mod(4)) → ODD(p)"), t1268))
}

///|
let odd_of_1mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_OF_1MOD4")

///|
/// `ODD_OF_1MOD4`
pub fn odd_of_1mod4() -> @kernel.Thm {
  odd_of_1mod4_c.get()
}

///|
/// JACOBI_M1_1MOD4
fn step_31() -> Unit raise {
  let t1269 = @simp.simp_tac(@list.List([@jacobi.jacobi_minus1_cases(), odd_of_1mod4()]))
  jacobi_m1_1mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, op_eq_eq(p, 1, mod(4)) → jacobi((p - 1, p)) == int_of_num(1)"), t1269))
}

///|
let jacobi_m1_1mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_M1_1MOD4")

///|
/// `JACOBI_M1_1MOD4`
pub fn jacobi_m1_1mod4() -> @kernel.Thm {
  jacobi_m1_1mod4_c.get()
}

///|
/// CONG_3_MOD_8
fn step_32() -> Unit raise {
  let t1270 = @meson.meson_tac(@list.List([@pocklington.cong_case(), @arith.mult_sym(), @int.arith_rule(@term_syntax.parse_term("3 < 8"))]))
  cong_3_mod_8_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, op_eq_eq(d, 3, mod(8)) → (∃ q : Num, d == 8 * q + 3)"), t1270))
}

///|
let cong_3_mod_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_3_MOD_8")

///|
/// `CONG_3_MOD_8`
pub fn cong_3_mod_8() -> @kernel.Thm {
  cong_3_mod_8_c.get()
}

///|
/// CONG_3_MOD_4
fn step_33() -> Unit raise {
  let t1271 = @meson.meson_tac(@list.List([@pocklington.cong_case(), @arith.mult_sym(), @int.arith_rule(@term_syntax.parse_term("3 < 4"))]))
  cong_3_mod_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, op_eq_eq(d, 3, mod(4)) → (∃ q : Num, d == 4 * q + 3)"), t1271))
}

///|
let cong_3_mod_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_3_MOD_4")

///|
/// `CONG_3_MOD_4`
pub fn cong_3_mod_4() -> @kernel.Thm {
  cong_3_mod_4_c.get()
}

///|
/// ODD_OF_3MOD4
fn step_34() -> Unit raise {
  let t1277 = @simp.asm_rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1274 = @drule.match_mp(cong_3_mod_4())
  let t1272 = @term_syntax.parse_term("(q : Num)")
  let t1276 = @tactics.first_assum(fn(x1275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x1273 : @kernel.Thm) => @tactics.x_choose_tac(t1272, x1273))(t1274(x1275))
  })
  let t1278 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1276), t1277)
  odd_of_3mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, op_eq_eq(p, 3, mod(4)) → ODD(p)"), t1278))
}

///|
let odd_of_3mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_OF_3MOD4")

///|
/// `ODD_OF_3MOD4`
pub fn odd_of_3mod4() -> @kernel.Thm {
  odd_of_3mod4_c.get()
}

///|
/// JACOBI_M1_3MOD4
fn step_35() -> Unit raise {
  let t1292 = @simp.rewrite_tac(@list.List([@int.int_pow_neg(), @int.int_pow_one(), @arith.even_add(), @arith.even_mult(), @calc_num.arith()]))
  let t1291 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(4 * (q : Num) + 3 - 1, 2) == 2 * q + 1"))]))
  let t1290 = @simp.asm_simp_tac(@list.List([@jacobi.jacobi_minus1()]))
  let t1288 = @simp.asm_rewrite_tac(@list.List([]))
  let t1289 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(odd_of_3mod4()), t1288), @tactics.all_tac])
  let t1287 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((p : Num))"), fn(x1284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1285 = @tactics.assume_tac(x1284)
    fn(x1286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1285(x1286)
    }
  })
  let t1281 = @drule.match_mp(cong_3_mod_4())
  let t1279 = @term_syntax.parse_term("(q : Num)")
  let t1283 = @tactics.first_assum(fn(x1282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x1280 : @kernel.Thm) => @tactics.x_choose_tac(t1279, x1280))(t1281(x1282))
  })
  let t1293 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1283), t1287), t1289), t1290), t1291), t1292)
  jacobi_m1_3mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, op_eq_eq(p, 3, mod(4)) → jacobi((p - 1, p)) == -int_of_num(1)"), t1293))
}

///|
let jacobi_m1_3mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_M1_3MOD4")

///|
/// `JACOBI_M1_3MOD4`
pub fn jacobi_m1_3mod4() -> @kernel.Thm {
  jacobi_m1_3mod4_c.get()
}

///|
/// JACOBI_2_3MOD8
fn step_36() -> Unit raise {
  let t1302 = @simp.rewrite_tac(@list.List([@int.int_pow_neg(), @int.int_pow_one(), @arith.even_add(), @arith.even_mult(), @calc_num.arith()]))
  let t1301 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(EXP(8 * (q : Num) + 3, 2) - 1, 8) == 8 * (q * q) + (6 * q + 1)"))]))
  let t1300 = @simp.asm_rewrite_tac(@list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith()]))
  let t1299 = @simp.asm_simp_tac(@list.List([@jacobi.jacobi_of_2()]))
  let t1296 = @drule.match_mp(cong_3_mod_8())
  let t1294 = @term_syntax.parse_term("(q : Num)")
  let t1298 = @tactics.first_assum(fn(x1297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x1295 : @kernel.Thm) => @tactics.x_choose_tac(t1294, x1295))(t1296(x1297))
  })
  let t1303 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1298), t1299), t1300), t1301), t1302)
  jacobi_2_3mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, op_eq_eq(d, 3, mod(8)) → jacobi((2, d)) == -int_of_num(1)"), t1303))
}

///|
let jacobi_2_3mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_2_3MOD8")

///|
/// `JACOBI_2_3MOD8`
pub fn jacobi_2_3mod8() -> @kernel.Thm {
  jacobi_2_3mod8_c.get()
}

///|
/// JACOBI_P_DPRIME
fn step_37() -> Unit raise {
  let t1330 = @simp.asm_simp_tac(@list.List([jacobi_m1_1mod4(), jacobi_m1_3mod4(), jacobi_2_1mod8(), jacobi_2_3mod8()]))
  let t1327 = @term_syntax.parse_term("(d' : Num)")
  let t1328 = @term_syntax.parse_term("(p : Num)")
  let t1329 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("2"), t1328, t1327]), @jacobi.jacobi_lmul()))
  let t1318 = @term_syntax.parse_term("(d' : Num)")
  let t1319 = @term_syntax.parse_term("(d' : Num) - 1")
  let t1320 = @drule.match_mp(@bool.specl(@list.List([@term_syntax.parse_term("2 * (p : Num)"), t1319, t1318]), @jacobi.jacobi_cong()))
  let t1326 = @tactics.first_assum(fn(x1325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1316 = @tactics.assume_tac(x1315)
        fn(x1317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1316(x1317)
        }
      })(t1320(x1321))
    })(((x1324 : @kernel.Thm) => @lib.check(fn(x1322 : @kernel.Thm) -> Bool raise {
      let th_1 = x1322
      let t1323 = @term_syntax.parse_term("op_eq_eq(2 * (p : Num), (d' : Num) - 1, mod(d'))")
      (@kernel.concl(th_1) == t1323)
    }, x1324))(x1325))
  })
  let t1307 = @drule.match_mp(cong_mod_8_imp_mod_4())
  let t1314 = @tactics.first_assum(fn(x1313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1305 = @tactics.assume_tac(x1304)
        fn(x1306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1305(x1306)
        }
      })(t1307(x1308))
    })(((x1312 : @kernel.Thm) => @lib.check(fn(x1309 : @kernel.Thm) -> Bool raise {
      let th = x1309
      @lib.can((x1311 : @kernel.Term) => @basics.find_term(fn(x1310 : @kernel.Term) -> Bool raise {
        let t = x1310
        (t == @term_syntax.parse_term("8"))
      }, x1311), @kernel.concl(th))
    }, x1312))(x1313))
  })
  let t1331 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1314), t1326), t1329), t1330), @int.int_arith_tac)
  jacobi_p_dprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d' : Num, (op_eq_eq(d', 1, mod(8)) || op_eq_eq(d', 3, mod(8))) && op_eq_eq(2 * p, d' - 1, mod(d')) → jacobi((p, d')) == int_of_num(1)"), t1331))
}

///|
let jacobi_p_dprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_P_DPRIME")

///|
/// `JACOBI_P_DPRIME`
pub fn jacobi_p_dprime() -> @kernel.Thm {
  jacobi_p_dprime_c.get()
}

///|
/// JACOBI_FLIP_1MOD4
fn step_38() -> Unit raise {
  let t1346 = @simp.rewrite_tac(@list.List([@int.int_pow_neg(), @arith.even_mult(), @calc_num.arith(), @int.int_pow_one(), @int.int_mul_lid()]))
  let t1345 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (qp : Num) * (m : Num) == 2 * (qp * m)"))]))
  let t1344 = @list.List([@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(4 * (qp : Num) + 1 - 1, 2) == 2 * qp"))])), @tactics.all_tac])
  let t1343 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((p : Num) - 1, 2) == 2 * (qp : Num)"), fn(x1340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1341 = @tactics.subst1_tac(x1340)
    fn(x1342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1341(x1342)
    }
  })
  let t1337 = @drule.match_mp(cong_1_mod_4())
  let t1335 = @term_syntax.parse_term("(qp : Num)")
  let t1339 = @tactics.first_assum(fn(x1338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x1336 : @kernel.Thm) => @tactics.x_choose_tac(t1335, x1336))(t1337(x1338))
  })
  let t1334 = @simp.asm_rewrite_tac(@list.List([]))
  let t1332 = @term_syntax.parse_term("(d' : Num)")
  let t1333 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1332]), @jacobi.jacobi_reciprocity()))
  let t1347 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1333), t1334), t1339), t1343), t1344), t1345), t1346)
  jacobi_flip_1mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d' : Num, ODD(p) && ODD(d') && coprime((p, d')) && op_eq_eq(p, 1, mod(4)) → jacobi((d', p)) == jacobi((p, d'))"), t1347))
}

///|
let jacobi_flip_1mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_FLIP_1MOD4")

///|
/// `JACOBI_FLIP_1MOD4`
pub fn jacobi_flip_1mod4() -> @kernel.Thm {
  jacobi_flip_1mod4_c.get()
}

///|
/// JACOBI_NEG_1MOD4
fn step_39() -> Unit raise {
  let t1357 = @simp.asm_rewrite_tac(@list.List([]))
  let t1355 = @simp.asm_rewrite_tac(@list.List([]))
  let t1356 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(jacobi_flip_1mod4()), t1355), @tactics.all_tac])
  let t1354 = @tactics.subgoal_then(@term_syntax.parse_term("jacobi(((d : Num), (p : Num))) == jacobi((p, d))"), fn(x1351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1352 = @tactics.subst1_tac(x1351)
    fn(x1353 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1352(x1353)
    }
  })
  let t1350 = @simp.rewrite_tac(@list.List([@int.int_mul_rid()]))
  let t1349 = @simp.asm_simp_tac(@list.List([jacobi_m1_1mod4()]))
  let t1348 = @simp.rewrite_tac(@list.List([@jacobi.jacobi_lmul()]))
  let t1358 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1348), t1349), t1350), t1354), t1356), t1357)
  jacobi_neg_1mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d : Num, ODD(p) && ODD(d) && coprime((p, d)) && op_eq_eq(p, 1, mod(4)) && jacobi((p, d)) == int_of_num(1) → jacobi((d * (p - 1), p)) == int_of_num(1)"), t1358))
}

///|
let jacobi_neg_1mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_NEG_1MOD4")

///|
/// `JACOBI_NEG_1MOD4`
pub fn jacobi_neg_1mod4() -> @kernel.Thm {
  jacobi_neg_1mod4_c.get()
}

///|
/// JACOBI_NEGATIVE_SQUARE
fn step_40() -> Unit raise {
  let t1388 = @simp.rewrite_tac(@list.List([@prime.divides_refl()]))
  let t1387 = @tactics.match_mp_tac(@prime.divides_lmul())
  let t1389 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pocklington.cong_0_divides()])), t1387), t1388)
  let t1386 = @simp.asm_rewrite_tac(@list.List([]))
  let t1385 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(p : Num)"), @prime.prime_ge_2()))
  let t1384 = @tactics.match_mp_tac(@arith.sub_add())
  let t1383 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.left_add_distrib())]))
  let t1390 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1382 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1376 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1377 = @equal.land_conv(x1376)
      fn(x1378 : @kernel.Term) -> @kernel.Thm raise {
        s1377(x1378)
      }
    })((fn(x1379 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1380 = @equal.rand_conv(x1379)
      fn(x1381 : @kernel.Term) -> @kernel.Thm raise {
        s1380(x1381)
      }
    })(x1382))
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(d : Num) == d * 1"))])), t1383), @tactics.ap_term_tac), t1384), t1385), t1386), @int.arith_tac), t1389])
  let t1375 = @tactics.subgoal_then(@term_syntax.parse_term("(d : Num) * ((p : Num) - 1) + d == d * p"), fn(x1372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1373 = @tactics.subst1_tac(x1372)
    fn(x1374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1373(x1374)
    }
  })
  let t1370 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_refl()]))
  let t1371 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_add()), t1370), @tactics.all_tac])
  let t1369 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num) * ((p : Num) - 1) + d"))
  let t1368 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t1367 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))
  let t1365 = @simp.asm_rewrite_tac(@list.List([]))
  let t1364 = @class.asm_cases_tac(@term_syntax.parse_term("∃ x : Num, op_eq_eq(EXP(x, 2), (d : Num) * ((p : Num) - 1), mod(p))"))
  let t1363 = @simp.asm_rewrite_tac(@list.List([]))
  let t1362 = @class.asm_cases_tac(@term_syntax.parse_term("divides((p : Num), (d : Num) * (p - 1))"))
  let t1361 = @simp.asm_rewrite_tac(@list.List([]))
  let t1360 = @term_syntax.parse_term("(p : Num)")
  let t1366 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num) * ((p : Num) - 1)"), t1360]), @jacobi.jacobi_prime())), t1361), t1362), t1363), t1364), t1365), @int.int_arith_tac), @tactics.all_tac])
  let t1359 = @tactics.subgoal_then(@term_syntax.parse_term("∃ x : Num, op_eq_eq(EXP(x, 2), (d : Num) * ((p : Num) - 1), mod(p))"), @tactics.strip_assume_tac)
  let t1391 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1359), t1366), t1367), t1368), t1369), @tactics.conj_tac), t1371), t1375), t1390)
  jacobi_negative_square_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d : Num, prime(p) && jacobi((d * (p - 1), p)) == int_of_num(1) → (∃ x : Num, op_eq_eq(EXP(x, 2) + d, 0, mod(p)))"), t1391))
}

///|
let jacobi_negative_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_NEGATIVE_SQUARE")

///|
/// `JACOBI_NEGATIVE_SQUARE`
pub fn jacobi_negative_square() -> @kernel.Thm {
  jacobi_negative_square_c.get()
}

///|
/// QR_MOD_P_1MOD4
fn step_41() -> Unit raise {
  let t1401 = @simp.asm_rewrite_tac(@list.List([]))
  let t1400 = @tactics.match_mp_tac(jacobi_neg_1mod4())
  let t1399 = @simp.asm_rewrite_tac(@list.List([]))
  let t1398 = @tactics.match_mp_tac(jacobi_negative_square())
  let t1396 = @simp.asm_rewrite_tac(@list.List([]))
  let t1397 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(odd_of_1mod4()), t1396), @tactics.all_tac])
  let t1395 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((p : Num))"), fn(x1392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1393 = @tactics.assume_tac(x1392)
    fn(x1394 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1393(x1394)
    }
  })
  let t1402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1395), t1397), t1398), t1399), t1400), t1401)
  qr_mod_p_1mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d : Num, prime(p) && ODD(d) && coprime((p, d)) && op_eq_eq(p, 1, mod(4)) && jacobi((p, d)) == int_of_num(1) → (∃ x : Num, op_eq_eq(EXP(x, 2) + d, 0, mod(p)))"), t1402))
}

///|
let qr_mod_p_1mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QR_MOD_P_1MOD4")

///|
/// `QR_MOD_P_1MOD4`
pub fn qr_mod_p_1mod4() -> @kernel.Thm {
  qr_mod_p_1mod4_c.get()
}

///|
/// QR_MOD_P
fn step_42() -> Unit raise {
  let t1404 = @simp.asm_simp_tac(@list.List([jacobi_p_dprime()]))
  let t1403 = @tactics.match_mp_tac(qr_mod_p_1mod4())
  let t1405 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1403), t1404)
  qr_mod_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d' : Num, prime(p) && ODD(d') && coprime((p, d')) && op_eq_eq(p, 1, mod(4)) && (op_eq_eq(d', 1, mod(8)) || op_eq_eq(d', 3, mod(8))) && op_eq_eq(2 * p, d' - 1, mod(d')) → (∃ x : Num, op_eq_eq(EXP(x, 2) + d', 0, mod(p)))"), t1405))
}

///|
let qr_mod_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QR_MOD_P")

///|
/// `QR_MOD_P`
pub fn qr_mod_p() -> @kernel.Thm {
  qr_mod_p_c.get()
}

///|
/// QR_LIFT_2P
fn step_43() -> Unit raise {
  let t1428 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_2(), @equal.gsym(@arith.not_even()), @arith.not_odd()]))
  let t1429 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])), t1428)
  let t1426 = @simp.rewrite_tac(@list.List([@pocklington.cong_0_divides()]))
  let t1425 = @simp.asm_simp_tac(@list.List([@pocklington.cong_exp()]))
  let t1424 = @simp.rewrite_tac(@list.List([@pocklington.cong_refl()]))
  let t1423 = @tactics.match_mp_tac(@pocklington.cong_add())
  let t1422 = @simp.asm_rewrite_tac(@list.List([]))
  let t1421 = @tactics.exists_tac(@term_syntax.parse_term("EXP((x : Num), 2) + (d' : Num)"))
  let t1427 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_trans()), t1421), t1422), t1423), t1424), t1425), t1426])
  let t1430 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq(EXP((z : Num), 2) + (d' : Num), 0, mod((p : Num)))"), fn(x1418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1419 = @tactics.mp_tac(x1418)
    fn(x1420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1419(x1420)
    }
  }), t1427)
  let t1417 = @simp.asm_rewrite_tac(@list.List([]))
  let t1416 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_odd())]))
  let t1431 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@prime.divides_2(), @arith.even_add(), @arith.even_exp(), @calc_num.arith()])), t1416), t1417), t1430, t1429])
  let t1415 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1414 = @tactics.match_mp_tac(@prime.divides_mul())
  let t1413 = @simp.rewrite_tac(@list.List([@pocklington.cong_0_divides()]))
  let t1412 = @tactics.exists_tac(@term_syntax.parse_term("(z : Num)"))
  let t1408 = @simp.asm_rewrite_tac(@list.List([@arith.odd_add(), @int.number_rule(@term_syntax.parse_term("∀ x : Num, ∀ p : Num, op_eq_eq(x + p, x, mod(p))"))]))
  let t1409 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : Num) + (p : Num)")), t1408)
  let t1407 = @simp.asm_rewrite_tac(@list.List([@pocklington.cong_refl()]))
  let t1410 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : Num)")), t1407), t1409])
  let t1411 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("ODD((x : Num))")), t1410), @tactics.all_tac])
  let t1406 = @tactics.subgoal_then(@term_syntax.parse_term("∃ z : Num, ODD(z) && op_eq_eq(z, (x : Num), mod((p : Num)))"), @tactics.strip_assume_tac)
  let t1432 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1406), t1411), t1412), t1413), t1414), t1415), t1431)
  qr_lift_2p_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d' : Num, ∀ x : Num, ODD(p) && ODD(d') && op_eq_eq(EXP(x, 2) + d', 0, mod(p)) → (∃ z : Num, op_eq_eq(EXP(z, 2) + d', 0, mod(2 * p)))"), t1432))
}

///|
let qr_lift_2p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QR_LIFT_2P")

///|
/// `QR_LIFT_2P`
pub fn qr_lift_2p() -> @kernel.Thm {
  qr_lift_2p_c.get()
}

///|
/// LEGENDRE_TAIL
fn step_44() -> Unit raise {
  let t1447 = @meson.meson_tac(@list.List([]))
  let t1440 = @equal.gsym(@int.int_of_num_add())
  let t1441 = @simp.rewrite_tac(@list.List([@int.num_congruent(), @equal.gsym(@int.int_of_num_pow()), t1440]))
  let t1442 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((x : Num), 2) + (d : Num), 0, mod((q : Num)))")), t1441)
  let t1439 = @equal.gsym(@int.int_of_num_add())
  let t1443 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_of_num_mul(), @equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("(q : Num) + 1 == (d : Num) * (m : Num)"))), t1439])), @int.int_arith_tac), t1442])
  let t1438 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num((d : Num)) * int_of_num((m : Num)) - int_of_num(1) == int_of_num((q : Num))"), fn(x1435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1436 = @tactics.subst1_tac(x1435)
    fn(x1437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1436(x1437)
    }
  })
  let t1444 = @tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("int_of_num((x : Num))")), t1438), t1443)
  let t1445 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_of_num_lt()])), @int.asm_arith_tac)
  let t1446 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_of_num_lt()])), @int.asm_arith_tac), t1445, t1444])
  let t1448 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1446), t1447])
  let t1433 = @term_syntax.parse_term("int_of_num((d : Num))")
  let t1434 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("int_of_num((m : Num))"), t1433]), lemma_1_7_cong()))
  let t1449 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1434), @tactics.ants_tac), t1448)
  legendre_tail_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Num, ∀ d : Num, ∀ m : Num, ∀ x : Num, op_eq_eq(EXP(x, 2) + d, 0, mod(q)) && q + 1 == d * m && 1 < m && 1 <= d → (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(m))"), t1449))
}

///|
let legendre_tail_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEGENDRE_TAIL")

///|
/// `LEGENDRE_TAIL`
pub fn legendre_tail() -> @kernel.Thm {
  legendre_tail_c.get()
}

///|
/// LEGENDRE_TAIL_2P
fn step_45() -> Unit raise {
  let t1465 = @simp.rewrite_rule(@list.List([@arith.odd_exists()]))
  let t1471 = @tactics.first_x_assum(fn(x1470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1462 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1463 = @tactics.mp_tac(x1462)
        fn(x1464 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1463(x1464)
        }
      })(t1465(x1466))
    })(((x1469 : @kernel.Thm) => @lib.check(fn(x1467 : @kernel.Thm) -> Bool raise {
      let th = x1467
      let t1468 = @term_syntax.parse_term("ODD((d : Num))")
      (@kernel.concl(th) == t1468)
    }, x1469))(x1470))
  })
  let t1461 = @simp.asm_rewrite_tac(@list.List([]))
  let t1457 = @term_syntax.parse_term("(z : Num)")
  let t1458 = @term_syntax.parse_term("(m : Num)")
  let t1459 = @term_syntax.parse_term("(d : Num)")
  let t1460 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("2 * (p : Num)"), t1459, t1458, t1457]), legendre_tail()))
  let t1454 = @term_syntax.parse_term("(z : Num)")
  let t1456 = @tactics.disch_then((x1455 : @kernel.Thm) => @tactics.x_choose_tac(t1454, x1455))
  let t1453 = @simp.asm_rewrite_tac(@list.List([]))
  let t1450 = @term_syntax.parse_term("(x : Num)")
  let t1451 = @term_syntax.parse_term("(d : Num)")
  let t1452 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1451, t1450]), qr_lift_2p()))
  let t1472 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1452), t1453), t1456), t1460), t1461), t1471), @int.arith_tac)
  legendre_tail_2p_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d : Num, ∀ m : Num, ODD(p) && ODD(d) && (∃ x : Num, op_eq_eq(EXP(x, 2) + d, 0, mod(p))) && 2 * p + 1 == d * m && 1 < m → (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(m))"), t1472))
}

///|
let legendre_tail_2p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEGENDRE_TAIL_2P")

///|
/// `LEGENDRE_TAIL_2P`
pub fn legendre_tail_2p() -> @kernel.Thm {
  legendre_tail_2p_c.get()
}

///|
/// COPRIME_DIRICHLET
fn step_46() -> Unit raise {
  let t1478 = @term_syntax.parse_term("2")
  let t1479 = @tactics.map_every(fn(x1475 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1476 = @tactics.exists_tac(x1475)
    fn(x1477 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1476(x1477)
    }
  }, @list.List([@term_syntax.parse_term("(c : Num)"), t1478]))
  let t1480 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@prime.coprime_bezout()])), t1479), @tactics.disj2_tac), @int.asm_arith_tac)
  let t1474 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_even())]))
  let t1481 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 == 2 * 2")), @prime.coprime_rmul(), @prime.coprime_2()])), t1474), t1480])
  let t1473 = @simp.rewrite_tac(@list.List([@prime.coprime_rmul()]))
  let t1482 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1473), @tactics.conj_tac), t1481)
  coprime_dirichlet_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ODD(a) && c * b == 2 * a + 1 → coprime((a, 4 * b))"), t1482))
}

///|
let coprime_dirichlet_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_DIRICHLET")

///|
/// `COPRIME_DIRICHLET`
pub fn coprime_dirichlet() -> @kernel.Thm {
  coprime_dirichlet_c.get()
}

///|
/// DIRICHLET_PRIME_CONG
fn step_47() -> Unit raise {
  let t1493 = @meson.meson_tac(@list.List([]))
  let t1492 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_elim_thm()]))
  let t1489 = @drule.match_mp(@sets.infinite_nonempty())
  let t1491 = @tactics.disch_then(fn(x1490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1487 = @tactics.mp_tac(x1486)
      fn(x1488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1487(x1488)
      }
    })(t1489(x1490))
  })
  let t1485 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @int.asm_arith_tac), @tactics.all_tac])
  let t1483 = @term_syntax.parse_term("(a : Num)")
  let t1484 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t1483]), @dirichlet.dirichlet()))
  let t1494 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1484), @tactics.ants_tac), t1485), t1491), t1492), t1493)
  dirichlet_prime_cong_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ a : Num, 1 < m && coprime((a, m)) → (∃ p : Num, prime(p) && op_eq_eq(p, a, mod(m)))"), t1494))
}

///|
let dirichlet_prime_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_PRIME_CONG")

///|
/// `DIRICHLET_PRIME_CONG`
pub fn dirichlet_prime_cong() -> @kernel.Thm {
  dirichlet_prime_cong_c.get()
}

///|
/// DIRICHLET_PRIME
fn step_48() -> Unit raise {
  let t1498 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1495 = @term_syntax.parse_term("1")
  let t1496 = @term_syntax.parse_term("8 * (k : Num) + 3")
  let t1497 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("4 * (k : Num) + 1"), t1496, t1495]), coprime_dirichlet()))
  let t1499 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(dirichlet_prime_cong())), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1497), t1498), @int.arith_tac)
  dirichlet_prime_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ p : Num, prime(p) && op_eq_eq(p, 4 * k + 1, mod(4 * (8 * k + 3)))"), t1499))
}

///|
let dirichlet_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_PRIME")

///|
/// `DIRICHLET_PRIME`
pub fn dirichlet_prime() -> @kernel.Thm {
  dirichlet_prime_c.get()
}

///|
/// COPRIME_FROM_MULTP1
fn step_49() -> Unit raise {
  coprime_from_multp1_c.set(@int.number_rule(@term_syntax.parse_term("∀ p : Num, ∀ c : Num, ∀ d : Num, ∀ m : Num, prime(p) && c * p + 1 == d * m → coprime((p, d))")))
}

///|
let coprime_from_multp1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_FROM_MULTP1")

///|
/// `COPRIME_FROM_MULTP1`
pub fn coprime_from_multp1() -> @kernel.Thm {
  coprime_from_multp1_c.get()
}

///|
/// THREE_SQ_3MOD8
fn step_50() -> Unit raise {
  let t1567 = @tactics.map_every(fn(x1564 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1565 = @simp.expand_tac(x1564)
    fn(x1566 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1565(x1566)
    }
  }, @list.List(["d'", "m"]))
  let t1563 = @simp.asm_simp_tac(@list.List([qr_mod_p()]))
  let t1560 = @term_syntax.parse_term("(m : Num)")
  let t1561 = @term_syntax.parse_term("(d' : Num)")
  let t1562 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1561, t1560]), legendre_tail_2p()))
  let t1558 = @simp.asm_rewrite_tac(@list.List([]))
  let t1555 = @term_syntax.parse_term("(m : Num)")
  let t1556 = @term_syntax.parse_term("(d' : Num)")
  let t1557 = @term_syntax.parse_term("2")
  let t1559 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1557, t1556, t1555]), coprime_from_multp1())), t1558), @tactics.all_tac])
  let t1554 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((p : Num), (d' : Num)))"), fn(x1551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1552 = @tactics.assume_tac(x1551)
    fn(x1553 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1552(x1553)
    }
  })
  let t1549 = @simp.rewrite_tac(@list.List([@prime.divides_refl()]))
  let t1548 = @tactics.match_mp_tac(@prime.divides_rmul())
  let t1547 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("2 * (p : Num) + 1 == (d' : Num) * (m : Num)"))]))
  let t1550 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pocklington.cong_minus1()])), @tactics.disj2_tac), t1547), t1548), t1549), @tactics.all_tac])
  let t1546 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq(2 * (p : Num), (d' : Num) - 1, mod(d'))"), fn(x1543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1544 = @tactics.assume_tac(x1543)
    fn(x1545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1544(x1545)
    }
  })
  let t1542 = @list.List([@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 * ((m : Num) * (j : Num)) + (4 * (k : Num) + 1) == 2 * (2 * (m * j) + 2 * k) + 1")), @arith.odd_add(), @arith.odd_mult(), @calc_num.arith()])), @tactics.all_tac])
  let t1541 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((p : Num))"), fn(x1538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1539 = @tactics.assume_tac(x1538)
    fn(x1540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1539(x1540)
    }
  })
  let t1536 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1535 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1537 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("4 * ((m : Num) * (j : Num)) + (4 * (k : Num) + 1) == (m * j + k) * 4 + 1"))])), t1535), t1536), @tactics.all_tac])
  let t1534 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((p : Num), 1, mod(4))"), fn(x1531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1532 = @tactics.assume_tac(x1531)
    fn(x1533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1532(x1533)
    }
  })
  let t1529 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1530 = @list.List([@tactics.then_tac(@simp.expand_tac("d'"), t1529), @tactics.all_tac])
  let t1528 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((d' : Num))"), fn(x1525 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1526 = @tactics.assume_tac(x1525)
    fn(x1527 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1526(x1527)
    }
  })
  let t1523 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1522 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1521 = @simp.rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("8 * (j : Num) + 1 == j * 8 + 1"))]))
  let t1524 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("d'"), t1521), t1522), t1523), @tactics.all_tac])
  let t1520 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((d' : Num), 1, mod(8))"), fn(x1517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1518 = @tactics.assume_tac(x1517)
    fn(x1519 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1518(x1519)
    }
  })
  let t1515 = @tactics.map_every(fn(x1512 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1513 = @simp.expand_tac(x1512)
    fn(x1514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1513(x1514)
    }
  }, @list.List(["d'", "m"]))
  let t1516 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(p : Num) == 4 * ((m : Num) * (j : Num)) + (4 * (k : Num) + 1)")), t1515), @int.arith_tac), @tactics.all_tac])
  let t1511 = @tactics.subgoal_then(@term_syntax.parse_term("2 * (p : Num) == (d' : Num) * (m : Num) - 1 && 2 * p + 1 == d' * m"), @tactics.strip_assume_tac)
  let t1510 = @simp.abbrev_tac(@term_syntax.parse_term("(m : Num) == 8 * (k : Num) + 3"))
  let t1509 = @simp.abbrev_tac(@term_syntax.parse_term("(d' : Num) == 8 * (j : Num) + 1"))
  let t1507 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1506 = @simp.asm_rewrite_tac(@list.List([]))
  let t1504 = @term_syntax.parse_term("(p : Num)")
  let t1505 = @term_syntax.parse_term("4 * (k : Num) + 1")
  let t1508 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("4 * (8 * (k : Num) + 3)"), t1505, t1504]), @pocklington.cong_case())), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1506), t1507), @int.arith_tac), @tactics.all_tac])
  let t1501 = @term_syntax.parse_term("(j : Num)")
  let t1503 = @tactics.subgoal_then(@term_syntax.parse_term("∃ j : Num, (p : Num) == 4 * ((8 * (k : Num) + 3) * j) + (4 * k + 1)"), (x1502 : @kernel.Thm) => @tactics.x_choose_tac(t1501, x1502))
  let t1500 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t1568 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), dirichlet_prime()))), t1500), t1503), t1508), t1509), t1510), t1511), t1516), t1520), t1524), t1528), t1530), t1534), t1537), t1541), t1542), t1546), t1550), t1554), t1559), t1562), t1563), t1567), @int.arith_tac)
  three_sq_3mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(8 * k + 3)"), t1568))
}

///|
let three_sq_3mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_3MOD8")

///|
/// `THREE_SQ_3MOD8`
pub fn three_sq_3mod8() -> @kernel.Thm {
  three_sq_3mod8_c.get()
}

///|
/// THREE_SQ_INT_TO_NUM
fn step_51() -> Unit raise {
  let t1583 = @simp.asm_rewrite_tac(@list.List([]))
  let t1582 = @simp.rewrite_tac(@list.List([@int.int_pow2_abs()]))
  let t1581 = @simp.asm_simp_tac(@list.List([@int.int_of_num_of_int(), @int.int_abs_pos()]))
  let t1578 = @equal.gsym(@int.int_of_num_pow())
  let t1579 = @equal.gsym(@int.int_of_num_add())
  let t1580 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_eq()), t1579, t1578]))
  let t1575 = @term_syntax.parse_term("num_of_int(abs((w : Int)))")
  let t1576 = @term_syntax.parse_term("num_of_int(abs((v : Int)))")
  let t1577 = @tactics.map_every(fn(x1572 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1573 = @tactics.exists_tac(x1572)
    fn(x1574 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1573(x1574)
    }
  }, @list.List([@term_syntax.parse_term("num_of_int(abs((u : Int)))"), t1576, t1575]))
  let t1569 = @term_syntax.parse_term("(w : Int)")
  let t1571 = @tactics.x_choose_then(@term_syntax.parse_term("(v : Int)"))((x1570 : @kernel.Thm) => @tactics.x_choose_tac(t1569, x1570))
  let t1584 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Int)"))(t1571))), t1577), t1580), t1581), t1582), t1583)
  three_sq_int_to_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(n)) → (∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == n)"), t1584))
}

///|
let three_sq_int_to_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_INT_TO_NUM")

///|
/// `THREE_SQ_INT_TO_NUM`
pub fn three_sq_int_to_num() -> @kernel.Thm {
  three_sq_int_to_num_c.get()
}

///|
/// THREE_SQ_3MOD8_NUM
fn step_52() -> Unit raise {
  let t1585 = @simp.rewrite_tac(@list.List([three_sq_3mod8()]))
  let t1586 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(three_sq_int_to_num())), t1585)
  three_sq_3mod8_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ u : Num, ∃ v : Num, ∃ w : Num, EXP(u, 2) + (EXP(v, 2) + EXP(w, 2)) == 8 * k + 3"), t1586))
}

///|
let three_sq_3mod8_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_3MOD8_NUM")

///|
/// `THREE_SQ_3MOD8_NUM`
pub fn three_sq_3mod8_num() -> @kernel.Thm {
  three_sq_3mod8_num_c.get()
}

///|
/// SQUARE_MOD_8
fn step_53() -> Unit raise {
  let t1601 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1600 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1598 = @tactics.subst1_tac(x1597)
    fn(x1599 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1598(x1599)
    }
  }))
  let t1596 = @simp.simp_tac(@list.List([@arith.lt(), @calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("!((m : Num) == 0) → ((n : Num) < m) == (n == m - 1 || n < m - 1)"))]))
  let t1595 = @tactics.disch_then(fn(x1594 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1591 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1592 = @tactics.mp_tac(x1591)
      fn(x1593 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1592(x1593)
      }
    })(@bool.conjunct2(x1594))
  })
  let t1590 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1588 = @term_syntax.parse_term("8")
  let t1589 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1588]), @arith.division()))
  let t1587 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.mod_exp_mod())]))
  let t1602 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.simp_tac(@list.List([@int.cong_v1(), @calc_num.arith_eq()]))), t1587), t1589), t1590), t1595), t1596), t1600), t1601)
  square_mod_8_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, op_eq_eq(EXP(n, 2), 0, mod(8)) || op_eq_eq(EXP(n, 2), 1, mod(8)) || op_eq_eq(EXP(n, 2), 4, mod(8))"), t1602))
}

///|
let square_mod_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_MOD_8")

///|
/// `SQUARE_MOD_8`
pub fn square_mod_8() -> @kernel.Thm {
  square_mod_8_c.get()
}

///|
/// THREE_SQUARES_MOD_8
fn step_54() -> Unit raise {
  let t1624 = @simp.rewrite_tac(@list.List([]))
  let t1623 = @tactics.conv_tac(@equal.rand_conv(@pocklington.cong_conv))
  let t1622 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1619 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("op_eq_eq((x : Num), (a : Num), mod((n : Num))) && op_eq_eq((y : Num), (b : Num), mod(n)) && op_eq_eq((z : Num), (c : Num), mod(n)) && op_eq_eq(x + (y + z), (d : Num), mod(n)) → op_eq_eq(a + (b + c), d, mod(n))")))
  let t1621 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1620 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1616 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1617 = @tactics.mp_tac(x1616)
      fn(x1618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1617(x1618)
      }
    })(t1619(x1620))
  }))
  let t1613 = @equal.gsym(@theorems.conj_assoc())
  let t1614 = @equal.gsym(@theorems.disj_assoc())
  let t1615 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) == !(a && b)")), @theorems.left_or_distrib(), @theorems.right_or_distrib(), t1614, t1613]))
  let t1610 = @term_syntax.parse_term("(x : Num)")
  let t1611 = @term_syntax.parse_term("(y : Num)")
  let t1612 = @tactics.map_every(fn(x1609 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1604 = @tactics.mp_tac(x1603)
      fn(x1605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1604(x1605)
      }
    })((fn(x1608 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x1606 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x1607 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x1606, x1607)
        }
      })(x1608)(square_mod_8())
    })(x1609))
  }, @list.List([@term_syntax.parse_term("(z : Num)"), t1611, t1610]))
  let t1625 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1612), t1615), t1621), t1622), t1623), t1624)
  three_squares_mod_8_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ z : Num, !op_eq_eq(EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)), 7, mod(8))"), t1625))
}

///|
let three_squares_mod_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQUARES_MOD_8")

///|
/// `THREE_SQUARES_MOD_8`
pub fn three_squares_mod_8() -> @kernel.Thm {
  three_squares_mod_8_c.get()
}

///|
/// THREE_SQUARES_4_LEMMA
fn step_55() -> Unit raise {
  let t1652 = @simp.rewrite_tac(@list.List([]))
  let t1651 = @tactics.conv_tac(@equal.rand_conv(@prime.divides_conv))
  let t1650 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1646 = @equal.gsym(@arith.add_assoc())
  let t1647 = @int.number_rule(@term_syntax.parse_term("divides((p : Num), 1 + (p * (q : Num) + (r : Num))) == divides(p, r + 1)"))
  let t1648 = @int.number_rule(@term_syntax.parse_term("divides((p : Num), 1 + p * (q : Num)) == divides(p, 1)"))
  let t1649 = @simp.rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("divides((p : Num), p * (x : Num) + (y : Num)) == divides(p, y)")), t1648, t1647, t1646]))
  let t1644 = @int.arith_rule(@term_syntax.parse_term("EXP(2 * (n : Num), 2) == 4 * EXP(n, 2)"))
  let t1645 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("EXP(SUC(2 * (n : Num)), 2) == 4 * (EXP(n, 2) + n) + 1")), t1644]))
  let t1643 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.choose_then(fn(x1640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1641 = @tactics.subst1_tac(x1640)
    fn(x1642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1641(x1642)
    }
  })))
  let t1639 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t1638 = @simp.asm_rewrite_tac(@list.List([]))
  let t1637 = @tactics.repeat_tac(@tactics.disch_then(@tactics.disj_cases_tac))
  let t1636 = @simp.rewrite_tac(@list.List([@arith.even_exists(), @arith.odd_exists()]))
  let t1633 = @term_syntax.parse_term("(z : Num)")
  let t1634 = @term_syntax.parse_term("(y : Num)")
  let t1635 = @tactics.map_every(fn(x1632 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1627 = @tactics.mp_tac(x1626)
      fn(x1628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1627(x1628)
      }
    })((fn(x1631 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x1629 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x1630 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x1629, x1630)
        }
      })(x1631)(@arith.even_or_odd())
    })(x1632))
  }, @list.List([@term_syntax.parse_term("(x : Num)"), t1634, t1633]))
  let t1653 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1635), t1636), t1637), t1638), t1639), t1643), t1645), t1649), t1650), t1651), t1652)
  three_squares_4_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ z : Num, divides(4, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2))) → EVEN(x) && EVEN(y) && EVEN(z)"), t1653))
}

///|
let three_squares_4_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQUARES_4_LEMMA")

///|
/// `THREE_SQUARES_4_LEMMA`
pub fn three_squares_4_lemma() -> @kernel.Thm {
  three_squares_4_lemma_c.get()
}

///|
/// NOT_THREE_SQUARES
fn step_56() -> Unit raise {
  let t1679 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.left_add_distrib()), @arith.eq_mult_lcancel(), @calc_num.arith()]))
  let t1678 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("EXP(2 * (x : Num), 2) == 4 * EXP(x, 2)"))]))
  let t1677 = @tactics.undisch_tac(@term_syntax.parse_term("4 * (EXP(4, (a : Num)) * (8 * (m : Num) + 7)) == EXP((x : Num), 2) + (EXP((y : Num), 2) + EXP((z : Num), 2))"))
  let t1676 = @simp.rewrite_tac(@list.List([@arith.even_exists()]))
  let t1674 = @meson.asm_meson_tac(@list.List([@int.divides()]))
  let t1675 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(three_squares_4_lemma()), t1674), @tactics.all_tac])
  let t1673 = @tactics.subgoal_then(@term_syntax.parse_term("EVEN((x : Num)) && EVEN((y : Num)) && EVEN((z : Num))"), fn(x1670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1671 = @tactics.mp_tac(x1670)
    fn(x1672 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1671(x1672)
    }
  })
  let t1669 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1680 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.exp(), @equal.gsym(@arith.mult_assoc())])), t1669), t1673), t1675), t1676), @tactics.strip_tac), t1677), t1678), t1679)
  let t1667 = @term_syntax.parse_term("(e : Num)")
  let t1668 = @tactics.spec_tac(@term_syntax.parse_term("8"), t1667)
  let t1666 = @simp.rewrite_tac(@list.List([@class.contrapos_thm(), @calc_num.arith(), @arith.mult_clauses()]))
  let t1663 = @term_syntax.parse_term("(z : Num)")
  let t1664 = @term_syntax.parse_term("(y : Num)")
  let t1665 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t1664, t1663]), three_squares_mod_8()))
  let t1660 = @drule.match_mp(@pocklington.eq_imp_cong())
  let t1657 = @term_syntax.parse_term("8")
  let t1662 = @tactics.disch_then(fn(x1661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1659 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1655 = @tactics.mp_tac(x1654)
        fn(x1656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1655(x1656)
        }
      })(((x1658 : @kernel.Thm) => @bool.spec(t1657, x1658))(x1659))
    })(t1660(x1661))
  })
  let t1681 = @tactics.thenl(@nums.induct_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1662), t1665), t1666), t1668), @int.number_tac), t1680]))
  not_three_squares_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ x : Num, ∀ y : Num, ∀ z : Num, !(EXP(4, a) * (8 * m + 7) == EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)))"), t1681))
}

///|
let not_three_squares_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_THREE_SQUARES")

///|
/// `NOT_THREE_SQUARES`
pub fn not_three_squares() -> @kernel.Thm {
  not_three_squares_c.get()
}

///|
/// THREE_SQ_DOUBLE
fn step_57() -> Unit raise {
  let t1693 = @simp.asm_rewrite_tac(@list.List([]))
  let t1692 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.left_add_distrib())]))
  let t1691 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("EXP(2 * (m : Num), 2) == 4 * EXP(m, 2)"))]))
  let t1688 = @term_syntax.parse_term("2 * (z : Num)")
  let t1689 = @term_syntax.parse_term("2 * (y : Num)")
  let t1690 = @tactics.map_every(fn(x1685 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1686 = @tactics.exists_tac(x1685)
    fn(x1687 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1686(x1687)
    }
  }, @list.List([@term_syntax.parse_term("2 * (x : Num)"), t1689, t1688]))
  let t1682 = @term_syntax.parse_term("(z : Num)")
  let t1684 = @tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))((x1683 : @kernel.Thm) => @tactics.x_choose_tac(t1682, x1683))
  let t1694 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(t1684))), t1690), t1691), t1692), t1693)
  three_sq_double_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == n) → (∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == 4 * n)"), t1694))
}

///|
let three_sq_double_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_DOUBLE")

///|
/// `THREE_SQ_DOUBLE`
pub fn three_sq_double() -> @kernel.Thm {
  three_sq_double_c.get()
}

///|
/// ODD_PRED_EVEN
fn step_58() -> Unit raise {
  let t1698 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t1699 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("EVEN((n : Num))")), t1698), @int.asm_arith_tac])
  let t1697 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1696 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_even())]))
  let t1695 = @simp.rewrite_tac(@list.List([@arith.odd_sub(), @calc_num.arith()]))
  let t1700 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1695), t1696), t1697), t1699)
  odd_pred_even_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n && EVEN(n) → ODD(n - 1)"), t1700))
}

///|
let odd_pred_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_PRED_EVEN")

///|
/// `ODD_PRED_EVEN`
pub fn odd_pred_even() -> @kernel.Thm {
  odd_pred_even_c.get()
}

///|
/// CONG_2_MOD_4
fn step_59() -> Unit raise {
  let t1701 = @meson.meson_tac(@list.List([@pocklington.cong_case(), @arith.mult_sym(), @int.arith_rule(@term_syntax.parse_term("2 < 4"))]))
  cong_2_mod_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, op_eq_eq(n, 2, mod(4)) → (∃ t : Num, n == 4 * t + 2)"), t1701))
}

///|
let cong_2_mod_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONG_2_MOD_4")

///|
/// `CONG_2_MOD_4`
pub fn cong_2_mod_4() -> @kernel.Thm {
  cong_2_mod_4_c.get()
}

///|
/// QR_MOD_P_18
fn step_60() -> Unit raise {
  let t1707 = @simp.asm_rewrite_tac(@list.List([]))
  let t1708 = @tactics.then_tac(@tactics.match_mp_tac(jacobi_m1_1mod4()), t1707)
  let t1706 = @simp.asm_rewrite_tac(@list.List([]))
  let t1709 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@jacobi.jacobi_cong()), t1706), t1708])
  let t1705 = @tactics.exists_tac(@term_syntax.parse_term("jacobi(((d' : Num) - 1, d'))"))
  let t1704 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1703 = @simp.asm_rewrite_tac(@list.List([]))
  let t1702 = @tactics.match_mp_tac(qr_mod_p_1mod4())
  let t1710 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1702), t1703), t1704), t1705), @tactics.conj_tac), t1709)
  qr_mod_p_18_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d' : Num, prime(p) && ODD(d') && coprime((p, d')) && op_eq_eq(p, 1, mod(4)) && op_eq_eq(d', 1, mod(4)) && op_eq_eq(p, d' - 1, mod(d')) → (∃ x : Num, op_eq_eq(EXP(x, 2) + d', 0, mod(p)))"), t1710))
}

///|
let qr_mod_p_18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QR_MOD_P_18")

///|
/// `QR_MOD_P_18`
pub fn qr_mod_p_18() -> @kernel.Thm {
  qr_mod_p_18_c.get()
}

///|
/// COPRIME_DIRICHLET_18
fn step_61() -> Unit raise {
  let t1715 = @tactics.undisch_tac(@term_syntax.parse_term("1 <= (n : Num)"))
  let t1716 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@prime.coprime_minus1()), t1715), @int.arith_tac)
  let t1714 = @simp.asm_simp_tac(@list.List([odd_pred_even()]))
  let t1713 = @simp.rewrite_tac(@list.List([@prime.coprime_2()]))
  let t1712 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1717 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 == 2 * 2")), @prime.coprime_rmul()])), t1712), t1713), t1714), t1716])
  let t1711 = @simp.rewrite_tac(@list.List([@prime.coprime_rmul()]))
  let t1718 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1711), @tactics.conj_tac), t1717)
  coprime_dirichlet_18_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n && EVEN(n) → coprime((n - 1, 4 * n))"), t1718))
}

///|
let coprime_dirichlet_18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COPRIME_DIRICHLET_18")

///|
/// `COPRIME_DIRICHLET_18`
pub fn coprime_dirichlet_18() -> @kernel.Thm {
  coprime_dirichlet_18_c.get()
}

///|
/// DIRICHLET_PRIME_18
fn step_62() -> Unit raise {
  let t1720 = @simp.asm_simp_tac(@list.List([coprime_dirichlet_18()]))
  let t1719 = @tactics.match_mp_tac(dirichlet_prime_cong())
  let t1721 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1719), t1720), @int.asm_arith_tac)
  dirichlet_prime_18_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n && EVEN(n) → (∃ p : Num, prime(p) && op_eq_eq(p, n - 1, mod(4 * n)))"), t1721))
}

///|
let dirichlet_prime_18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_PRIME_18")

///|
/// `DIRICHLET_PRIME_18`
pub fn dirichlet_prime_18() -> @kernel.Thm {
  dirichlet_prime_18_c.get()
}

///|
/// THREE_SQ_2MOD4
fn step_63() -> Unit raise {
  let t1820 = @simp.expand_tac("d'")
  let t1819 = @simp.asm_rewrite_tac(@list.List([]))
  let t1815 = @term_syntax.parse_term("(x : Num)")
  let t1816 = @term_syntax.parse_term("4 * (t : Num) + 2")
  let t1817 = @term_syntax.parse_term("(d' : Num)")
  let t1818 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1817, t1816, t1815]), legendre_tail()))
  let t1813 = @simp.asm_rewrite_tac(@list.List([]))
  let t1814 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(qr_mod_p_18()), t1813), @tactics.all_tac])
  let t1810 = @term_syntax.parse_term("(x : Num)")
  let t1812 = @tactics.subgoal_then(@term_syntax.parse_term("∃ x : Num, op_eq_eq(EXP(x, 2) + (d' : Num), 0, mod((p : Num)))"), (x1811 : @kernel.Thm) => @tactics.x_choose_tac(t1810, x1811))
  let t1806 = @tactics.first_assum(fn(x1803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1804 = @tactics.accept_tac(x1803)
    fn(x1805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1804(x1805)
    }
  })
  let t1807 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.mult_clauses()])), t1806)
  let t1808 = @list.List([@tactics.first_assum(fn(x1800 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1801 = @tactics.accept_tac(x1800)
    fn(x1802 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1801(x1802)
    }
  }), t1807])
  let t1797 = @term_syntax.parse_term("4 * (t : Num) + 2")
  let t1798 = @term_syntax.parse_term("(d' : Num)")
  let t1799 = @term_syntax.parse_term("1")
  let t1809 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1799, t1798, t1797]), coprime_from_multp1())), @tactics.conj_tac), t1808), @tactics.all_tac])
  let t1796 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((p : Num), (d' : Num)))"), fn(x1793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1794 = @tactics.assume_tac(x1793)
    fn(x1795 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1794(x1795)
    }
  })
  let t1791 = @simp.rewrite_tac(@list.List([@prime.divides_refl()]))
  let t1790 = @tactics.match_mp_tac(@prime.divides_rmul())
  let t1789 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(p : Num) + 1 == (d' : Num) * (4 * (t : Num) + 2)"))]))
  let t1792 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pocklington.cong_minus1()])), @tactics.disj2_tac), t1789), t1790), t1791), @tactics.all_tac])
  let t1788 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((p : Num), (d' : Num) - 1, mod(d'))"), fn(x1785 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1786 = @tactics.assume_tac(x1785)
    fn(x1787 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1786(x1787)
    }
  })
  let t1783 = @list.List([@tactics.then_tac(@simp.expand_tac("d'"), @int.arith_tac), @int.arith_tac])
  let t1782 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (d' : Num) * (4 * (t : Num) + 2)"), fn(x1779 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1780 = @tactics.mp_tac(x1779)
    fn(x1781 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1780(x1781)
    }
  })
  let t1784 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(p : Num) == (d' : Num) * (4 * (t : Num) + 2) - 1")), t1782), t1783), @tactics.all_tac])
  let t1778 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) + 1 == (d' : Num) * (4 * (t : Num) + 2)"), fn(x1775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1776 = @tactics.assume_tac(x1775)
    fn(x1777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1776(x1777)
    }
  })
  let t1773 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1772 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1771 = @simp.rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("4 * ((4 * (t : Num) + 2) * (j : Num)) + (4 * t + 2 - 1) == ((4 * t + 2) * j + t) * 4 + 1"))]))
  let t1770 = @tactics.disch_then(fn(x1767 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1768 = @tactics.subst1_tac(x1767)
    fn(x1769 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1768(x1769)
    }
  })
  let t1774 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(p : Num) == 4 * ((4 * (t : Num) + 2) * (j : Num)) + (4 * t + 2 - 1)")), t1770), t1771), t1772), t1773), @tactics.all_tac])
  let t1766 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((p : Num), 1, mod(4))"), fn(x1763 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1764 = @tactics.assume_tac(x1763)
    fn(x1765 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1764(x1765)
    }
  })
  let t1761 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1760 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1759 = @simp.rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("4 * (j : Num) + 1 == j * 4 + 1"))]))
  let t1762 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("d'"), t1759), t1760), t1761), @tactics.all_tac])
  let t1758 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((d' : Num), 1, mod(4))"), fn(x1755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1756 = @tactics.assume_tac(x1755)
    fn(x1757 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1756(x1757)
    }
  })
  let t1753 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1754 = @list.List([@tactics.then_tac(@simp.expand_tac("d'"), t1753), @tactics.all_tac])
  let t1752 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((d' : Num))"), fn(x1749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1750 = @tactics.assume_tac(x1749)
    fn(x1751 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1750(x1751)
    }
  })
  let t1747 = @tactics.undisch_tac(@term_syntax.parse_term("(p : Num) == 4 * ((4 * (t : Num) + 2) * (j : Num)) + (4 * t + 2 - 1)"))
  let t1748 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("d'"), t1747), @int.arith_tac), @tactics.all_tac])
  let t1746 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) == (d' : Num) * (4 * (t : Num) + 2) - 1"), fn(x1743 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1744 = @tactics.assume_tac(x1743)
    fn(x1745 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1744(x1745)
    }
  })
  let t1742 = @simp.abbrev_tac(@term_syntax.parse_term("(d' : Num) == 4 * (j : Num) + 1"))
  let t1740 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1739 = @simp.asm_rewrite_tac(@list.List([]))
  let t1737 = @term_syntax.parse_term("(p : Num)")
  let t1738 = @term_syntax.parse_term("4 * (t : Num) + 2 - 1")
  let t1741 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("4 * (4 * (t : Num) + 2)"), t1738, t1737]), @pocklington.cong_case())), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1739), t1740), @int.arith_tac), @tactics.all_tac])
  let t1734 = @term_syntax.parse_term("(j : Num)")
  let t1736 = @tactics.subgoal_then(@term_syntax.parse_term("∃ j : Num, (p : Num) == 4 * ((4 * (t : Num) + 2) * j) + (4 * t + 2 - 1)"), (x1735 : @kernel.Thm) => @tactics.x_choose_tac(t1734, x1735))
  let t1733 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t1732 = @simp.asm_rewrite_tac(@list.List([]))
  let t1731 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("4 * (t : Num) + 2"), dirichlet_prime_18()))
  let t1730 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith()])), @int.arith_tac), @tactics.all_tac])
  let t1729 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= 4 * (t : Num) + 2 && EVEN(4 * t + 2)"), @tactics.strip_assume_tac)
  let t1725 = @drule.match_mp(cong_2_mod_4())
  let t1726 = @tactics.x_choose_then(@term_syntax.parse_term("(t : Num)"))(fn(x1722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1723 = @tactics.subst_all_tac(x1722)
    fn(x1724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1723(x1724)
    }
  })
  let t1728 = @tactics.first_assum(fn(x1727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t1726(t1725(x1727))
  })
  let t1821 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1728), t1729), t1730), t1731), t1732), t1733), t1736), t1741), t1742), t1746), t1748), t1752), t1754), t1758), t1762), t1766), t1774), t1778), t1784), t1788), t1792), t1796), t1809), t1812), t1814), t1818), t1819), t1820), @int.arith_tac)
  three_sq_2mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 < n && op_eq_eq(n, 2, mod(4)) → (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(n))"), t1821))
}

///|
let three_sq_2mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_2MOD4")

///|
/// `THREE_SQ_2MOD4`
pub fn three_sq_2mod4() -> @kernel.Thm {
  three_sq_2mod4_c.get()
}

///|
/// DIRICHLET_PRIME_1MOD8
fn step_64() -> Unit raise {
  let t1825 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1822 = @term_syntax.parse_term("3")
  let t1823 = @term_syntax.parse_term("8 * (k : Num) + 1")
  let t1824 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("12 * (k : Num) + 1"), t1823, t1822]), coprime_dirichlet()))
  let t1826 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(dirichlet_prime_cong())), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1824), t1825), @int.arith_tac)
  dirichlet_prime_1mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ p : Num, prime(p) && op_eq_eq(p, 12 * k + 1, mod(4 * (8 * k + 1)))"), t1826))
}

///|
let dirichlet_prime_1mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_PRIME_1MOD8")

///|
/// `DIRICHLET_PRIME_1MOD8`
pub fn dirichlet_prime_1mod8() -> @kernel.Thm {
  dirichlet_prime_1mod8_c.get()
}

///|
/// THREE_SQ_1MOD8
fn step_65() -> Unit raise {
  let t1904 = @tactics.map_every(fn(x1901 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1902 = @simp.expand_tac(x1901)
    fn(x1903 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1902(x1903)
    }
  }, @list.List(["d'", "m"]))
  let t1900 = @simp.asm_simp_tac(@list.List([qr_mod_p()]))
  let t1897 = @term_syntax.parse_term("(m : Num)")
  let t1898 = @term_syntax.parse_term("(d' : Num)")
  let t1899 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1898, t1897]), legendre_tail_2p()))
  let t1895 = @simp.asm_rewrite_tac(@list.List([]))
  let t1892 = @term_syntax.parse_term("(m : Num)")
  let t1893 = @term_syntax.parse_term("(d' : Num)")
  let t1894 = @term_syntax.parse_term("2")
  let t1896 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1894, t1893, t1892]), coprime_from_multp1())), t1895), @tactics.all_tac])
  let t1891 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((p : Num), (d' : Num)))"), fn(x1888 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1889 = @tactics.assume_tac(x1888)
    fn(x1890 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1889(x1890)
    }
  })
  let t1886 = @simp.rewrite_tac(@list.List([@prime.divides_refl()]))
  let t1885 = @tactics.match_mp_tac(@prime.divides_rmul())
  let t1884 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("2 * (p : Num) + 1 == (d' : Num) * (m : Num)"))]))
  let t1887 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pocklington.cong_minus1()])), @tactics.disj2_tac), t1884), t1885), t1886), @tactics.all_tac])
  let t1883 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq(2 * (p : Num), (d' : Num) - 1, mod(d'))"), fn(x1880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1881 = @tactics.assume_tac(x1880)
    fn(x1882 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1881(x1882)
    }
  })
  let t1879 = @list.List([@meson.asm_meson_tac(@list.List([odd_of_1mod4()])), @tactics.all_tac])
  let t1878 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((p : Num))"), fn(x1875 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1876 = @tactics.assume_tac(x1875)
    fn(x1877 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1876(x1877)
    }
  })
  let t1873 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1872 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1874 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("4 * ((m : Num) * (j : Num)) + (12 * (k : Num) + 1) == (m * j + 3 * k) * 4 + 1"))])), t1872), t1873), @tactics.all_tac])
  let t1871 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((p : Num), 1, mod(4))"), fn(x1868 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1869 = @tactics.assume_tac(x1868)
    fn(x1870 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1869(x1870)
    }
  })
  let t1866 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1867 = @list.List([@tactics.then_tac(@simp.expand_tac("d'"), t1866), @tactics.all_tac])
  let t1865 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((d' : Num))"), fn(x1862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1863 = @tactics.assume_tac(x1862)
    fn(x1864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1863(x1864)
    }
  })
  let t1860 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1859 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1858 = @simp.rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("8 * (j : Num) + 3 == j * 8 + 3"))]))
  let t1861 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("d'"), t1858), t1859), t1860), @tactics.all_tac])
  let t1857 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((d' : Num), 3, mod(8))"), fn(x1854 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1855 = @tactics.assume_tac(x1854)
    fn(x1856 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1855(x1856)
    }
  })
  let t1852 = @tactics.map_every(fn(x1849 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1850 = @simp.expand_tac(x1849)
    fn(x1851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1850(x1851)
    }
  }, @list.List(["d'", "m"]))
  let t1853 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(p : Num) == 4 * ((m : Num) * (j : Num)) + (12 * (k : Num) + 1)")), t1852), @int.arith_tac), @tactics.all_tac])
  let t1848 = @tactics.subgoal_then(@term_syntax.parse_term("2 * (p : Num) == (d' : Num) * (m : Num) - 1 && 2 * p + 1 == d' * m"), @tactics.strip_assume_tac)
  let t1847 = @simp.abbrev_tac(@term_syntax.parse_term("(m : Num) == 8 * (k : Num) + 1"))
  let t1846 = @simp.abbrev_tac(@term_syntax.parse_term("(d' : Num) == 8 * (j : Num) + 3"))
  let t1844 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1843 = @simp.asm_rewrite_tac(@list.List([]))
  let t1841 = @term_syntax.parse_term("(p : Num)")
  let t1842 = @term_syntax.parse_term("12 * (k : Num) + 1")
  let t1845 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("4 * (8 * (k : Num) + 1)"), t1842, t1841]), @pocklington.cong_case())), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1843), t1844), @int.arith_tac), @tactics.all_tac])
  let t1838 = @term_syntax.parse_term("(j : Num)")
  let t1840 = @tactics.subgoal_then(@term_syntax.parse_term("∃ j : Num, (p : Num) == 4 * ((8 * (k : Num) + 1) * j) + (12 * k + 1)"), (x1839 : @kernel.Thm) => @tactics.x_choose_tac(t1838, x1839))
  let t1837 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t1836 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), dirichlet_prime_1mod8()))
  let t1834 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1833 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1830 = @term_syntax.parse_term("int_of_num(0)")
  let t1831 = @term_syntax.parse_term("int_of_num(0)")
  let t1832 = @tactics.map_every(fn(x1827 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1828 = @tactics.exists_tac(x1827)
    fn(x1829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1828(x1829)
    }
  }, @list.List([@term_syntax.parse_term("int_of_num(1)"), t1831, t1830]))
  let t1835 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1832), t1833), t1834), @tactics.all_tac])
  let t1905 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))), t1835), t1836), t1837), t1840), t1845), t1846), t1847), t1848), t1853), t1857), t1861), t1865), t1867), t1871), t1874), t1878), t1879), t1883), t1887), t1891), t1896), t1899), t1900), t1904), @int.asm_arith_tac)
  three_sq_1mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(8 * k + 1)"), t1905))
}

///|
let three_sq_1mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_1MOD8")

///|
/// `THREE_SQ_1MOD8`
pub fn three_sq_1mod8() -> @kernel.Thm {
  three_sq_1mod8_c.get()
}

///|
/// JACOBI_FLIP_3MOD4
fn step_66() -> Unit raise {
  let t1929 = @simp.rewrite_tac(@list.List([@int.int_pow_neg(), @int.int_pow_one(), @arith.even_mult(), @arith.even_add(), @calc_num.arith()]))
  let t1928 = @list.List([@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(8 * (qd : Num) + 3 - 1, 2) == 4 * qd + 1"))])), @tactics.all_tac])
  let t1927 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((d' : Num) - 1, 2) == 4 * (qd : Num) + 1"), fn(x1924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1925 = @tactics.subst1_tac(x1924)
    fn(x1926 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1925(x1926)
    }
  })
  let t1923 = @list.List([@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(4 * (qp : Num) + 3 - 1, 2) == 2 * qp + 1"))])), @tactics.all_tac])
  let t1922 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((p : Num) - 1, 2) == 2 * (qp : Num) + 1"), fn(x1919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1920 = @tactics.subst1_tac(x1919)
    fn(x1921 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1920(x1921)
    }
  })
  let t1916 = @drule.match_mp(cong_3_mod_8())
  let t1914 = @term_syntax.parse_term("(qd : Num)")
  let t1918 = @tactics.first_assum(fn(x1917 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x1915 : @kernel.Thm) => @tactics.x_choose_tac(t1914, x1915))(t1916(x1917))
  })
  let t1911 = @drule.match_mp(cong_3_mod_4())
  let t1909 = @term_syntax.parse_term("(qp : Num)")
  let t1913 = @tactics.first_assum(fn(x1912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x1910 : @kernel.Thm) => @tactics.x_choose_tac(t1909, x1910))(t1911(x1912))
  })
  let t1908 = @simp.asm_rewrite_tac(@list.List([]))
  let t1906 = @term_syntax.parse_term("(d' : Num)")
  let t1907 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t1906]), @jacobi.jacobi_reciprocity()))
  let t1930 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1907), t1908), t1913), t1918), t1922), t1923), t1927), t1928), t1929), @int.int_arith_tac)
  jacobi_flip_3mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d' : Num, ODD(p) && ODD(d') && coprime((p, d')) && op_eq_eq(p, 3, mod(4)) && op_eq_eq(d', 3, mod(8)) → jacobi((d', p)) == -jacobi((p, d'))"), t1930))
}

///|
let jacobi_flip_3mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_FLIP_3MOD4")

///|
/// `JACOBI_FLIP_3MOD4`
pub fn jacobi_flip_3mod4() -> @kernel.Thm {
  jacobi_flip_3mod4_c.get()
}

///|
/// JACOBI_NEG_3MOD4
fn step_67() -> Unit raise {
  let t1939 = @simp.asm_rewrite_tac(@list.List([]))
  let t1937 = @simp.asm_rewrite_tac(@list.List([]))
  let t1938 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(jacobi_flip_3mod4()), t1937), @tactics.all_tac])
  let t1936 = @tactics.subgoal_then(@term_syntax.parse_term("jacobi(((d : Num), (p : Num))) == -jacobi((p, d))"), fn(x1933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1934 = @tactics.subst1_tac(x1933)
    fn(x1935 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1934(x1935)
    }
  })
  let t1932 = @simp.asm_simp_tac(@list.List([jacobi_m1_3mod4()]))
  let t1931 = @simp.rewrite_tac(@list.List([@jacobi.jacobi_lmul()]))
  let t1940 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1931), t1932), t1936), t1938), t1939), @int.int_arith_tac)
  jacobi_neg_3mod4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d : Num, ODD(p) && ODD(d) && coprime((p, d)) && op_eq_eq(p, 3, mod(4)) && op_eq_eq(d, 3, mod(8)) && jacobi((p, d)) == int_of_num(1) → jacobi((d * (p - 1), p)) == int_of_num(1)"), t1940))
}

///|
let jacobi_neg_3mod4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBI_NEG_3MOD4")

///|
/// `JACOBI_NEG_3MOD4`
pub fn jacobi_neg_3mod4() -> @kernel.Thm {
  jacobi_neg_3mod4_c.get()
}

///|
/// QR_MOD_P_5MOD8
fn step_68() -> Unit raise {
  let t1950 = @simp.asm_simp_tac(@list.List([jacobi_p_dprime()]))
  let t1949 = @tactics.match_mp_tac(jacobi_neg_3mod4())
  let t1948 = @simp.asm_rewrite_tac(@list.List([]))
  let t1947 = @tactics.match_mp_tac(jacobi_negative_square())
  let t1945 = @simp.asm_rewrite_tac(@list.List([]))
  let t1946 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(odd_of_3mod4()), t1945), @tactics.all_tac])
  let t1944 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((p : Num))"), fn(x1941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1942 = @tactics.assume_tac(x1941)
    fn(x1943 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1942(x1943)
    }
  })
  let t1951 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1944), t1946), t1947), t1948), t1949), t1950)
  qr_mod_p_5mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ d' : Num, prime(p) && ODD(d') && coprime((p, d')) && op_eq_eq(p, 3, mod(4)) && op_eq_eq(d', 3, mod(8)) && op_eq_eq(2 * p, d' - 1, mod(d')) → (∃ x : Num, op_eq_eq(EXP(x, 2) + d', 0, mod(p)))"), t1951))
}

///|
let qr_mod_p_5mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QR_MOD_P_5MOD8")

///|
/// `QR_MOD_P_5MOD8`
pub fn qr_mod_p_5mod8() -> @kernel.Thm {
  qr_mod_p_5mod8_c.get()
}

///|
/// DIRICHLET_PRIME_5MOD8
fn step_69() -> Unit raise {
  let t1955 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1952 = @term_syntax.parse_term("3")
  let t1953 = @term_syntax.parse_term("8 * (k : Num) + 5")
  let t1954 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("12 * (k : Num) + 7"), t1953, t1952]), coprime_dirichlet()))
  let t1956 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(dirichlet_prime_cong())), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1954), t1955), @int.arith_tac)
  dirichlet_prime_5mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ p : Num, prime(p) && op_eq_eq(p, 12 * k + 7, mod(4 * (8 * k + 5)))"), t1956))
}

///|
let dirichlet_prime_5mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_PRIME_5MOD8")

///|
/// `DIRICHLET_PRIME_5MOD8`
pub fn dirichlet_prime_5mod8() -> @kernel.Thm {
  dirichlet_prime_5mod8_c.get()
}

///|
/// THREE_SQ_5MOD8
fn step_70() -> Unit raise {
  let t2024 = @tactics.map_every(fn(x2021 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2022 = @simp.expand_tac(x2021)
    fn(x2023 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2022(x2023)
    }
  }, @list.List(["d'", "m"]))
  let t2020 = @simp.asm_simp_tac(@list.List([qr_mod_p_5mod8()]))
  let t2017 = @term_syntax.parse_term("(m : Num)")
  let t2018 = @term_syntax.parse_term("(d' : Num)")
  let t2019 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t2018, t2017]), legendre_tail_2p()))
  let t2015 = @simp.asm_rewrite_tac(@list.List([]))
  let t2012 = @term_syntax.parse_term("(m : Num)")
  let t2013 = @term_syntax.parse_term("(d' : Num)")
  let t2014 = @term_syntax.parse_term("2")
  let t2016 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t2014, t2013, t2012]), coprime_from_multp1())), t2015), @tactics.all_tac])
  let t2011 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((p : Num), (d' : Num)))"), fn(x2008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2009 = @tactics.assume_tac(x2008)
    fn(x2010 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2009(x2010)
    }
  })
  let t2006 = @simp.rewrite_tac(@list.List([@prime.divides_refl()]))
  let t2005 = @tactics.match_mp_tac(@prime.divides_rmul())
  let t2004 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("2 * (p : Num) + 1 == (d' : Num) * (m : Num)"))]))
  let t2007 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pocklington.cong_minus1()])), @tactics.disj2_tac), t2004), t2005), t2006), @tactics.all_tac])
  let t2003 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq(2 * (p : Num), (d' : Num) - 1, mod(d'))"), fn(x2000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2001 = @tactics.assume_tac(x2000)
    fn(x2002 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2001(x2002)
    }
  })
  let t1999 = @list.List([@meson.asm_meson_tac(@list.List([odd_of_3mod4()])), @tactics.all_tac])
  let t1998 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((p : Num))"), fn(x1995 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1996 = @tactics.assume_tac(x1995)
    fn(x1997 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1996(x1997)
    }
  })
  let t1993 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1992 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1994 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("4 * ((m : Num) * (j : Num)) + (12 * (k : Num) + 7) == (m * j + (3 * k + 1)) * 4 + 3"))])), t1992), t1993), @tactics.all_tac])
  let t1991 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((p : Num), 3, mod(4))"), fn(x1988 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1989 = @tactics.assume_tac(x1988)
    fn(x1990 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1989(x1990)
    }
  })
  let t1986 = @simp.rewrite_tac(@list.List([@arith.odd_add(), @arith.odd_mult(), @calc_num.arith()]))
  let t1987 = @list.List([@tactics.then_tac(@simp.expand_tac("d'"), t1986), @tactics.all_tac])
  let t1985 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((d' : Num))"), fn(x1982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1983 = @tactics.assume_tac(x1982)
    fn(x1984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1983(x1984)
    }
  })
  let t1980 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1979 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t1978 = @simp.rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("8 * (j : Num) + 3 == j * 8 + 3"))]))
  let t1981 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("d'"), t1978), t1979), t1980), @tactics.all_tac])
  let t1977 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((d' : Num), 3, mod(8))"), fn(x1974 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1975 = @tactics.assume_tac(x1974)
    fn(x1976 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1975(x1976)
    }
  })
  let t1972 = @tactics.map_every(fn(x1969 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1970 = @simp.expand_tac(x1969)
    fn(x1971 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1970(x1971)
    }
  }, @list.List(["d'", "m"]))
  let t1973 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(p : Num) == 4 * ((m : Num) * (j : Num)) + (12 * (k : Num) + 7)")), t1972), @int.arith_tac), @tactics.all_tac])
  let t1968 = @tactics.subgoal_then(@term_syntax.parse_term("2 * (p : Num) == (d' : Num) * (m : Num) - 1 && 2 * p + 1 == d' * m"), @tactics.strip_assume_tac)
  let t1967 = @simp.abbrev_tac(@term_syntax.parse_term("(m : Num) == 8 * (k : Num) + 5"))
  let t1966 = @simp.abbrev_tac(@term_syntax.parse_term("(d' : Num) == 8 * (j : Num) + 3"))
  let t1964 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1963 = @simp.asm_rewrite_tac(@list.List([]))
  let t1961 = @term_syntax.parse_term("(p : Num)")
  let t1962 = @term_syntax.parse_term("12 * (k : Num) + 7")
  let t1965 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("4 * (8 * (k : Num) + 5)"), t1962, t1961]), @pocklington.cong_case())), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1963), t1964), @int.arith_tac), @tactics.all_tac])
  let t1958 = @term_syntax.parse_term("(j : Num)")
  let t1960 = @tactics.subgoal_then(@term_syntax.parse_term("∃ j : Num, (p : Num) == 4 * ((8 * (k : Num) + 5) * j) + (12 * k + 7)"), (x1959 : @kernel.Thm) => @tactics.x_choose_tac(t1958, x1959))
  let t1957 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t2025 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), dirichlet_prime_5mod8()))), t1957), t1960), t1965), t1966), t1967), t1968), t1973), t1977), t1981), t1985), t1987), t1991), t1994), t1998), t1999), t2003), t2007), t2011), t2016), t2019), t2020), t2024), @int.arith_tac)
  three_sq_5mod8_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(8 * k + 5)"), t2025))
}

///|
let three_sq_5mod8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_5MOD8")

///|
/// `THREE_SQ_5MOD8`
pub fn three_sq_5mod8() -> @kernel.Thm {
  three_sq_5mod8_c.get()
}

///|
/// THREE_SQ_1MOD8_NUM
fn step_71() -> Unit raise {
  let t2026 = @simp.rewrite_tac(@list.List([three_sq_1mod8()]))
  let t2027 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(three_sq_int_to_num())), t2026)
  three_sq_1mod8_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == 8 * k + 1"), t2027))
}

///|
let three_sq_1mod8_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_1MOD8_NUM")

///|
/// `THREE_SQ_1MOD8_NUM`
pub fn three_sq_1mod8_num() -> @kernel.Thm {
  three_sq_1mod8_num_c.get()
}

///|
/// THREE_SQ_5MOD8_NUM
fn step_72() -> Unit raise {
  let t2028 = @simp.rewrite_tac(@list.List([three_sq_5mod8()]))
  let t2029 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(three_sq_int_to_num())), t2028)
  three_sq_5mod8_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, ∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == 8 * k + 5"), t2029))
}

///|
let three_sq_5mod8_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_5MOD8_NUM")

///|
/// `THREE_SQ_5MOD8_NUM`
pub fn three_sq_5mod8_num() -> @kernel.Thm {
  three_sq_5mod8_num_c.get()
}

///|
/// THREE_SQ_2MOD4_NUM
fn step_73() -> Unit raise {
  let t2032 = @simp.asm_rewrite_tac(@list.List([]))
  let t2031 = @tactics.match_mp_tac(three_sq_2mod4())
  let t2030 = @tactics.match_mp_tac(three_sq_int_to_num())
  let t2033 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2030), t2031), t2032)
  three_sq_2mod4_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 < n && op_eq_eq(n, 2, mod(4)) → (∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == n)"), t2033))
}

///|
let three_sq_2mod4_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_2MOD4_NUM")

///|
/// `THREE_SQ_2MOD4_NUM`
pub fn three_sq_2mod4_num() -> @kernel.Thm {
  three_sq_2mod4_num_c.get()
}

///|
/// THREE_SQ_RESIDUE_NUM
fn step_74() -> Unit raise {
  let t2054 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2053 = @simp.simp_tac(@list.List([@arith.mod_mult_add()]))
  let t2051 = @simp.rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("8 * (k : Num) + 6 == (2 * k + 1) * 4 + 2"))]))
  let t2052 = @list.List([@simp.rewrite_tac(@list.List([@int.cong_v1(), @int.arith_rule(@term_syntax.parse_term("8 * (k : Num) + 2 == 2 * k * 4 + 2"))])), t2051])
  let t2050 = @tactics.thenl(@tactics.conj_tac, @list.List([@int.arith_tac, @tactics.all_tac]))
  let t2049 = @tactics.match_mp_tac(three_sq_2mod4_num())
  let t2048 = @simp.rewrite_tac(@list.List([three_sq_1mod8_num(), three_sq_3mod8_num(), three_sq_5mod8_num()]))
  let t2047 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) * 8 + (r : Num) == 8 * k + r"))]))
  let t2046 = @tactics.disch_then(fn(x2037 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2037
    @simp.gen_rewrite_tac(fn(x2045 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2039 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2040 = @equal.rand_conv(x2039)
        fn(x2041 : @kernel.Term) -> @kernel.Thm raise {
          s2040(x2041)
        }
      })((fn(x2042 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2043 = @equal.once_depth_conv(x2042)
        fn(x2044 : @kernel.Term) -> @kernel.Thm raise {
          s2043(x2044)
        }
      })(x2045))
    }, @list.List([@equal.sym(th)]))
  })
  let t2036 = @simp.abbrev_tac(@term_syntax.parse_term("(k : Num) == DIV((n : Num), 8)"))
  let t2035 = @bool.conjunct1(@arith.division_simp())
  let t2034 = @term_syntax.parse_term("8")
  let t2055 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t2034]), t2035))), t2036), t2046), @tactics.strip_tac), t2047), t2048), t2049), t2050), t2052), t2053), t2054)
  three_sq_residue_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, MOD(n, 8) == 1 || MOD(n, 8) == 2 || MOD(n, 8) == 3 || MOD(n, 8) == 5 || MOD(n, 8) == 6 → (∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == n)"), t2055))
}

///|
let three_sq_residue_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_RESIDUE_NUM")

///|
/// `THREE_SQ_RESIDUE_NUM`
pub fn three_sq_residue_num() -> @kernel.Thm {
  three_sq_residue_num_c.get()
}

///|
/// MOD8_04_DIV4
fn step_75() -> Unit raise {
  let t2060 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2061 = @tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([]))), t2060)
  let t2062 = @list.List([@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("8 == 4 * 2")), @arith.mod_mod()])), t2061])
  let t2059 = @tactics.subgoal_then(@term_syntax.parse_term("MOD((n : Num), 4) == MOD(MOD(n, 8), 4)"), fn(x2056 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2057 = @tactics.subst1_tac(x2056)
    fn(x2058 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2057(x2058)
    }
  })
  let t2063 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@int.divides_mod()]))), t2059), t2062)
  mod8_04_div4_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, MOD(n, 8) == 0 || MOD(n, 8) == 4 → divides(4, n)"), t2063))
}

///|
let mod8_04_div4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD8_04_DIV4")

///|
/// `MOD8_04_DIV4`
pub fn mod8_04_div4() -> @kernel.Thm {
  mod8_04_div4_c.get()
}

///|
/// DESCENT_NOT_FORM
fn step_76() -> Unit raise {
  let t2094 = @simp.simp_tac(@list.List([@arith.div_mult(), @calc_num.arith()]))
  let t2095 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(c : Num) * 4 == 4 * c"))])), t2094), @tactics.refl_tac])
  let t2093 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((c : Num) * 4, 4) == c"), fn(x2090 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2091 = @tactics.subst1_tac(x2090)
    fn(x2092 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2091(x2092)
    }
  })
  let t2089 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 * (c : Num) == c * 4")), @arith.div_mult(), @calc_num.arith()]))
  let t2086 = @term_syntax.parse_term("(c : Num)")
  let t2088 = @tactics.disch_then((x2087 : @kernel.Thm) => @tactics.x_choose_tac(t2086, x2087))
  let t2083 = @simp.rewrite_rule(@list.List([@int.divides()]))
  let t2085 = @tactics.first_assum(fn(x2084 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2080 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2081 = @tactics.mp_tac(x2080)
      fn(x2082 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2081(x2082)
      }
    })(t2083(x2084))
  })
  let t2079 = @tactics.first_x_assum(fn(x2078 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2076 = @tactics.subst1_tac(x2075)
      fn(x2077 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2076(x2077)
      }
    })(@equal.sym(x2078))
  })
  let t2074 = @simp.rewrite_tac(@list.List([@arith.exp(), @equal.gsym(@arith.mult_assoc())]))
  let t2072 = @term_syntax.parse_term("(m : Num)")
  let t2073 = @tactics.map_every(fn(x2069 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2070 = @tactics.exists_tac(x2069)
    fn(x2071 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2070(x2071)
    }
  }, @list.List([@term_syntax.parse_term("SUC((a : Num))"), t2072]))
  let t2068 = @simp.rewrite_tac(@list.List([]))
  let t2067 = @tactics.undisch_tac(@term_syntax.parse_term("!(∃ a : Num, ∃ m : Num, (n : Num) == EXP(4, a) * (8 * m + 7))"))
  let t2065 = @term_syntax.parse_term("(m : Num)")
  let t2066 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Num)"), t2065]))
  let t2064 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t2096 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t2064), t2066), @tactics.disch_tac), t2067), t2068), t2073), t2074), t2079), t2085), t2088), t2089), t2093), t2095)
  descent_not_form_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, divides(4, n) && !(∃ a : Num, ∃ m : Num, n == EXP(4, a) * (8 * m + 7)) → !(∃ a : Num, ∃ m : Num, DIV(n, 4) == EXP(4, a) * (8 * m + 7))"), t2096))
}

///|
let descent_not_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DESCENT_NOT_FORM")

///|
/// `DESCENT_NOT_FORM`
pub fn descent_not_form() -> @kernel.Thm {
  descent_not_form_c.get()
}

///|
/// DIV4_LESS
fn step_77() -> Unit raise {
  let t2111 = @list.List([@simp.simp_tac(@list.List([@arith.div_mult(), @calc_num.arith()])), @int.asm_arith_tac])
  let t2110 = @tactics.subgoal_then(@term_syntax.parse_term("DIV(4 * (c : Num), 4) == c"), fn(x2107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2108 = @tactics.subst1_tac(x2107)
    fn(x2109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2108(x2109)
    }
  })
  let t2106 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))(fn(x2103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2104 = @tactics.subst_all_tac(x2103)
    fn(x2105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2104(x2105)
    }
  }))
  let t2100 = @simp.rewrite_rule(@list.List([@int.divides()]))
  let t2102 = @tactics.first_assum(fn(x2101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2097 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2098 = @tactics.mp_tac(x2097)
      fn(x2099 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2098(x2099)
      }
    })(t2100(x2101))
  })
  let t2112 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2102), t2106), t2110), t2111)
  div4_less_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) && divides(4, n) → DIV(n, 4) < n"), t2112))
}

///|
let div4_less_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV4_LESS")

///|
/// `DIV4_LESS`
pub fn div4_less() -> @kernel.Thm {
  div4_less_c.get()
}

///|
/// MOD8_7_FORM
fn step_78() -> Unit raise {
  let t2122 = @simp.asm_rewrite_tac(@list.List([]))
  let t2120 = @bool.conjunct1(@arith.division_simp())
  let t2119 = @term_syntax.parse_term("8")
  let t2121 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t2119]), t2120))
  let t2118 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.mult_clauses()]))
  let t2116 = @term_syntax.parse_term("DIV((n : Num), 8)")
  let t2117 = @tactics.map_every(fn(x2113 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2114 = @tactics.exists_tac(x2113)
    fn(x2115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2114(x2115)
    }
  }, @list.List([@term_syntax.parse_term("0"), t2116]))
  let t2123 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t2117), t2118), t2121), t2122), @int.arith_tac)
  mod8_7_form_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, MOD(n, 8) == 7 → (∃ a : Num, ∃ m : Num, n == EXP(4, a) * (8 * m + 7))"), t2123))
}

///|
let mod8_7_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD8_7_FORM")

///|
/// `MOD8_7_FORM`
pub fn mod8_7_form() -> @kernel.Thm {
  mod8_7_form_c.get()
}

///|
/// THREE_SQ_NOT_FORM
fn step_79() -> Unit raise {
  let t2182 = @simp.rewrite_tac(@list.List([]))
  let t2181 = @simp.simp_tac(@list.List([@arith.div_mult(), @calc_num.arith()]))
  let t2178 = @simp.rewrite_rule(@list.List([@int.divides()]))
  let t2179 = @tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))(fn(x2175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2176 = @tactics.subst1_tac(x2175)
    fn(x2177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2176(x2177)
    }
  })
  let t2183 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x2180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t2179(t2178(x2180))
  }), t2181), t2182])
  let t2174 = @tactics.subgoal_then(@term_syntax.parse_term("4 * DIV((n : Num), 4) == n"), fn(x2171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2172 = @tactics.subst1_tac(x2171)
    fn(x2173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2172(x2173)
    }
  })
  let t2168 = @drule.match_mp(three_sq_double())
  let t2170 = @tactics.disch_then(fn(x2169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2166 = @tactics.mp_tac(x2165)
      fn(x2167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2166(x2167)
      }
    })(t2168(x2169))
  })
  let t2163 = @simp.asm_rewrite_tac(@list.List([]))
  let t2162 = @tactics.match_mp_tac(descent_not_form())
  let t2161 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2159 = @simp.asm_rewrite_tac(@list.List([]))
  let t2160 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(div4_less()), t2159), @tactics.all_tac])
  let t2156 = @term_syntax.parse_term("DIV((n : Num), 4)")
  let t2164 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x2158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2154 = @tactics.mp_tac(x2153)
      fn(x2155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2154(x2155)
      }
    })(((x2157 : @kernel.Thm) => @bool.spec(t2156, x2157))(x2158))
  }), @tactics.ants_tac), t2160), t2161), t2162), t2163), @tactics.all_tac])
  let t2152 = @tactics.subgoal_then(@term_syntax.parse_term("∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == DIV((n : Num), 4)"), fn(x2149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2150 = @tactics.mp_tac(x2149)
    fn(x2151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2150(x2151)
    }
  })
  let t2147 = @simp.asm_rewrite_tac(@list.List([]))
  let t2148 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(mod8_04_div4()), t2147), @tactics.all_tac])
  let t2146 = @tactics.subgoal_then(@term_syntax.parse_term("divides(4, (n : Num))"), fn(x2143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2144 = @tactics.assume_tac(x2143)
    fn(x2145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2144(x2145)
    }
  })
  let t2141 = @simp.asm_rewrite_tac(@list.List([]))
  let t2142 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), mod8_7_form())), t2141)])
  let t2140 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t2138 = @tactics.first_x_assum(fn(x2135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2136 = @tactics.accept_tac(x2135)
    fn(x2137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2136(x2137)
    }
  })
  let t2139 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(three_sq_residue_num()), t2138), @tactics.all_tac])
  let t2134 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(MOD((n : Num), 8) == 1 || MOD(n, 8) == 2 || MOD(n, 8) == 3 || MOD(n, 8) == 5 || MOD(n, 8) == 6) || (MOD(n, 8) == 0 || MOD(n, 8) == 4) || MOD(n, 8) == 7")))
  let t2132 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2131 = @simp.asm_rewrite_tac(@list.List([]))
  let t2129 = @term_syntax.parse_term("0")
  let t2130 = @term_syntax.parse_term("0")
  let t2133 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2126 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2127 = @tactics.exists_tac(x2126)
    fn(x2128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2127(x2128)
    }
  }, @list.List([@term_syntax.parse_term("0"), t2130, t2129])), t2131), t2132), @tactics.all_tac])
  let t2125 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2124 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2184 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.num_wf()), t2124), @tactics.strip_tac), @tactics.disch_tac), t2125), t2133), t2134), t2139), t2140), t2142), t2146), t2148), t2152), t2164), t2170), t2174), t2183)
  three_sq_not_form_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(∃ a : Num, ∃ m : Num, n == EXP(4, a) * (8 * m + 7)) → (∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == n)"), t2184))
}

///|
let three_sq_not_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_NOT_FORM")

///|
/// `THREE_SQ_NOT_FORM`
pub fn three_sq_not_form() -> @kernel.Thm {
  three_sq_not_form_c.get()
}

///|
/// LEGENDRE_THREE_SQUARES
fn step_80() -> Unit raise {
  let t2185 = @meson.meson_tac(@list.List([not_three_squares(), three_sq_not_form()]))
  legendre_three_squares_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (∃ x : Num, ∃ y : Num, ∃ z : Num, EXP(x, 2) + (EXP(y, 2) + EXP(z, 2)) == n) == !(∃ a : Num, ∃ m : Num, n == EXP(4, a) * (8 * m + 7))"), t2185))
}

///|
let legendre_three_squares_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEGENDRE_THREE_SQUARES")

///|
/// `LEGENDRE_THREE_SQUARES`
pub fn legendre_three_squares() -> @kernel.Thm {
  legendre_three_squares_c.get()
}

///|
/// REM_8_CASES
fn step_81() -> Unit raise {
  let t2186 = @term_syntax.parse_term("int_of_num(8)")
  let t2187 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Int)"), t2186]), @int.int_division()))), @int.int_arith_tac)
  rem_8_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Int, rem(x, int_of_num(8)) == int_of_num(0) || rem(x, int_of_num(8)) == int_of_num(1) || rem(x, int_of_num(8)) == int_of_num(2) || rem(x, int_of_num(8)) == int_of_num(3) || rem(x, int_of_num(8)) == int_of_num(4) || rem(x, int_of_num(8)) == int_of_num(5) || rem(x, int_of_num(8)) == int_of_num(6) || rem(x, int_of_num(8)) == int_of_num(7)"), t2187))
}

///|
let rem_8_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REM_8_CASES")

///|
/// `REM_8_CASES`
pub fn rem_8_cases() -> @kernel.Thm {
  rem_8_cases_c.get()
}

///|
/// SQ_MOD_8
fn step_82() -> Unit raise {
  let t2190 = @tactics.conv_tac(@int.int_reduce_conv)
  let t2189 = @simp.asm_rewrite_tac(@list.List([]))
  let t2188 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Int)"), rem_8_cases()))
  let t2191 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@equal.gsym(@int.int_pow_rem())]))), t2188), @tactics.strip_tac), t2189), t2190)
  sq_mod_8_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Int, rem(pow(x, 2), int_of_num(8)) == int_of_num(0) || rem(pow(x, 2), int_of_num(8)) == int_of_num(1) || rem(pow(x, 2), int_of_num(8)) == int_of_num(4)"), t2191))
}

///|
let sq_mod_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQ_MOD_8")

///|
/// `SQ_MOD_8`
pub fn sq_mod_8() -> @kernel.Thm {
  sq_mod_8_c.get()
}

///|
/// ODD_SQ_MOD_8
fn step_83() -> Unit raise {
  let t2200 = @tactics.conv_tac(@int.int_reduce_conv)
  let t2199 = @simp.asm_rewrite_tac(@list.List([]))
  let t2198 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Int)"), rem_8_cases()))
  let t2197 = @list.List([@meson.meson_tac(@list.List([@int.int_rem_rem_mul(), @int.int_arith(@term_syntax.parse_term("int_of_num(8) == int_of_num(2) * int_of_num(4)"))])), @tactics.all_tac])
  let t2196 = @tactics.subgoal_then(@term_syntax.parse_term("rem((x : Int), int_of_num(2)) == rem(rem(x, int_of_num(8)), int_of_num(2))"), fn(x2193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2194 = @tactics.subst1_tac(x2193)
    fn(x2195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2194(x2195)
    }
  })
  let t2192 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_rem_eq_0())]))
  let t2201 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@equal.gsym(@int.int_pow_rem())]))), t2192), t2196), t2197), t2198), @tactics.strip_tac), t2199), t2200)
  odd_sq_mod_8_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Int, (rem(pow(x, 2), int_of_num(8)) == int_of_num(1)) == !divides(int_of_num(2), x)"), t2201))
}

///|
let odd_sq_mod_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_SQ_MOD_8")

///|
/// `ODD_SQ_MOD_8`
pub fn odd_sq_mod_8() -> @kernel.Thm {
  odd_sq_mod_8_c.get()
}

///|
/// SUM3_MOD8_CORE
fn step_84() -> Unit raise {
  let t2208 = @tactics.conv_tac(@int.int_reduce_conv)
  let t2207 = @simp.asm_rewrite_tac(@list.List([]))
  let t2206 = @tactics.pop_assum(fn(x2203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2204 = @tactics.mp_tac(x2203)
    fn(x2205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2204(x2205)
    }
  })
  let t2202 = @simp.asm_rewrite_tac(@list.List([]))
  let t2209 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t2202), t2206), t2207), t2208)
  sum3_mod8_core_c.set(@tactics.prove(@term_syntax.parse_term("∀ pu : Int, ∀ pv : Int, ∀ pw : Int, (pu == int_of_num(0) || pu == int_of_num(1) || pu == int_of_num(4)) && (pv == int_of_num(0) || pv == int_of_num(1) || pv == int_of_num(4)) && (pw == int_of_num(0) || pw == int_of_num(1) || pw == int_of_num(4)) && rem(pu + (pv + pw), int_of_num(8)) == int_of_num(3) → pu == int_of_num(1) && pv == int_of_num(1) && pw == int_of_num(1)"), t2209))
}

///|
let sum3_mod8_core_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM3_MOD8_CORE")

///|
/// `SUM3_MOD8_CORE`
pub fn sum3_mod8_core() -> @kernel.Thm {
  sum3_mod8_core_c.get()
}

///|
/// THREE_SQ_ALL_ODD
fn step_85() -> Unit raise {
  let t2218 = @tactics.conv_tac(@int.int_reduce_conv)
  let t2217 = @simp.rewrite_tac(@list.List([@int.int_rem_mul_add()]))
  let t2219 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2217), t2218)
  let t2220 = @list.List([@tactics.then_tac(@tactics.conv_tac(@int.int_rem_down_conv), @tactics.refl_tac), t2219])
  let t2216 = @tactics.subgoal_then(@term_syntax.parse_term("rem(rem(pow((u : Int), 2), int_of_num(8)) + (rem(pow((v : Int), 2), int_of_num(8)) + rem(pow((w : Int), 2), int_of_num(8))), int_of_num(8)) == rem(pow(u, 2) + (pow(v, 2) + pow(w, 2)), int_of_num(8))"), fn(x2213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2214 = @tactics.subst1_tac(x2213)
    fn(x2215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2214(x2215)
    }
  })
  let t2212 = @simp.rewrite_tac(@list.List([sq_mod_8()]))
  let t2211 = @tactics.match_mp_tac(sum3_mod8_core())
  let t2210 = @simp.rewrite_tac(@list.List([@equal.gsym(odd_sq_mod_8())]))
  let t2221 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t2210), t2211), t2212), t2216), t2220)
  three_sq_all_odd_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Int, ∀ v : Int, ∀ w : Int, ∀ n : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(8) * n + int_of_num(3) → !divides(int_of_num(2), u) && !divides(int_of_num(2), v) && !divides(int_of_num(2), w)"), t2221))
}

///|
let three_sq_all_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THREE_SQ_ALL_ODD")

///|
/// `THREE_SQ_ALL_ODD`
pub fn three_sq_all_odd() -> @kernel.Thm {
  three_sq_all_odd_c.get()
}

///|
/// INT_ODD_FORM
fn step_86() -> Unit raise {
  let t2230 = @list.List([@simp.asm_rewrite_tac(@list.List([@int.int_rem_2_divides()])), @int.int_arith_tac])
  let t2229 = @tactics.subgoal_then(@term_syntax.parse_term("rem((u : Int), int_of_num(2)) == int_of_num(1)"), fn(x2226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2227 = @tactics.subst1_tac(x2226)
    fn(x2228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2227(x2228)
    }
  })
  let t2225 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("!(int_of_num(2) == int_of_num(0))"))]))
  let t2223 = @term_syntax.parse_term("int_of_num(2)")
  let t2224 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(u : Int)"), t2223]), @int.int_division()))
  let t2222 = @tactics.exists_tac(@term_syntax.parse_term("div((u : Int), int_of_num(2))"))
  let t2231 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2222), t2224), t2225), t2229), t2230)
  int_odd_form_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Int, !divides(int_of_num(2), u) → (∃ a : Int, u == int_of_num(2) * a + int_of_num(1))"), t2231))
}

///|
let int_odd_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ODD_FORM")

///|
/// `INT_ODD_FORM`
pub fn int_odd_form() -> @kernel.Thm {
  int_odd_form_c.get()
}

///|
/// INT_TRI_NAT
fn step_87() -> Unit raise {
  let t2248 = @simp.asm_rewrite_tac(@list.List([]))
  let t2246 = @equal.gsym(@int.int_of_num_add())
  let t2247 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_mul()), t2246]))
  let t2245 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@int.int_of_num_of_int()), @int.asm_int_arith_tac), @tactics.all_tac])
  let t2244 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(num_of_int(-(a : Int) - int_of_num(1))) == -a - int_of_num(1)"), fn(x2241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2242 = @tactics.assume_tac(x2241)
    fn(x2243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2242(x2243)
    }
  })
  let t2249 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("num_of_int(-(a : Int) - int_of_num(1))")), t2244), t2245), t2247), t2248), @int.int_arith_tac)
  let t2240 = @simp.asm_rewrite_tac(@list.List([]))
  let t2238 = @equal.gsym(@int.int_of_num_add())
  let t2239 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_mul()), t2238]))
  let t2236 = @simp.asm_rewrite_tac(@list.List([]))
  let t2237 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@int.int_of_num_of_int()), t2236), @tactics.all_tac])
  let t2235 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(num_of_int((a : Int))) == a"), fn(x2232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2233 = @tactics.assume_tac(x2232)
    fn(x2234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2233(x2234)
    }
  })
  let t2250 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("num_of_int((a : Int))")), t2235), t2237), t2239), t2240), @int.int_arith_tac), t2249])
  let t2251 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.disj_cases_tac(@int.int_arith(@term_syntax.parse_term("int_of_num(0) <= (a : Int) || a < int_of_num(0)")))), t2250)
  int_tri_nat_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Int, ∃ k : Num, a * (a + int_of_num(1)) == int_of_num(k * (k + 1))"), t2251))
}

///|
let int_tri_nat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_TRI_NAT")

///|
/// `INT_TRI_NAT`
pub fn int_tri_nat() -> @kernel.Thm {
  int_tri_nat_c.get()
}

///|
/// GAUSS_TRI_FROM_3SQ
fn step_88() -> Unit raise {
  let t2300 = @simp.asm_rewrite_tac(@list.List([@int.int_of_num_clauses()]))
  let t2299 = @tactics.undisch_tac(@term_syntax.parse_term("int_of_num(2) * int_of_num((n : Num)) == (r : Int) * (r + int_of_num(1)) + ((s : Int) * (s + int_of_num(1)) + (t : Int) * (t + int_of_num(1)))"))
  let t2296 = @term_syntax.parse_term("(c : Num)")
  let t2297 = @term_syntax.parse_term("(b : Num)")
  let t2298 = @tactics.map_every(fn(x2293 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2294 = @tactics.exists_tac(x2293)
    fn(x2295 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2294(x2295)
    }
  }, @list.List([@term_syntax.parse_term("(a : Num)"), t2297, t2296]))
  let t2290 = @term_syntax.parse_term("(c : Num)")
  let t2292 = @tactics.disch_then((x2291 : @kernel.Thm) => @tactics.x_choose_tac(t2290, x2291))
  let t2289 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Int)"), int_tri_nat()))
  let t2286 = @term_syntax.parse_term("(b : Num)")
  let t2288 = @tactics.disch_then((x2287 : @kernel.Thm) => @tactics.x_choose_tac(t2286, x2287))
  let t2285 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Int)"), int_tri_nat()))
  let t2282 = @term_syntax.parse_term("(a : Num)")
  let t2284 = @tactics.disch_then((x2283 : @kernel.Thm) => @tactics.x_choose_tac(t2282, x2283))
  let t2281 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(r : Int)"), int_tri_nat()))
  let t2279 = @simp.asm_rewrite_tac(@list.List([]))
  let t2280 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("pow((u : Int), 2) + (pow((v : Int), 2) + pow((w : Int), 2)) == int_of_num(8) * int_of_num((n : Num)) + int_of_num(3)")), t2279), @int.int_arith_tac), @tactics.all_tac])
  let t2278 = @tactics.subgoal_then(@term_syntax.parse_term("int_of_num(2) * int_of_num((n : Num)) == (r : Int) * (r + int_of_num(1)) + ((s : Int) * (s + int_of_num(1)) + (t : Int) * (t + int_of_num(1)))"), fn(x2275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2276 = @tactics.assume_tac(x2275)
    fn(x2277 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2276(x2277)
    }
  })
  let t2272 = @term_syntax.parse_term("(t : Int)")
  let t2274 = @tactics.disch_then((x2273 : @kernel.Thm) => @tactics.x_choose_tac(t2272, x2273))
  let t2271 = @simp.asm_rewrite_tac(@list.List([]))
  let t2270 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Int)"), int_odd_form()))
  let t2267 = @term_syntax.parse_term("(s : Int)")
  let t2269 = @tactics.disch_then((x2268 : @kernel.Thm) => @tactics.x_choose_tac(t2267, x2268))
  let t2266 = @simp.asm_rewrite_tac(@list.List([]))
  let t2265 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : Int)"), int_odd_form()))
  let t2262 = @term_syntax.parse_term("(r : Int)")
  let t2264 = @tactics.disch_then((x2263 : @kernel.Thm) => @tactics.x_choose_tac(t2262, x2263))
  let t2261 = @simp.asm_rewrite_tac(@list.List([]))
  let t2260 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(u : Int)"), int_odd_form()))
  let t2259 = @simp.asm_rewrite_tac(@list.List([]))
  let t2255 = @term_syntax.parse_term("int_of_num((n : Num))")
  let t2256 = @term_syntax.parse_term("(w : Int)")
  let t2257 = @term_syntax.parse_term("(v : Int)")
  let t2258 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(u : Int)"), t2257, t2256, t2255]), three_sq_all_odd()))
  let t2252 = @term_syntax.parse_term("(w : Int)")
  let t2254 = @tactics.x_choose_then(@term_syntax.parse_term("(v : Int)"))((x2253 : @kernel.Thm) => @tactics.x_choose_tac(t2252, x2253))
  let t2301 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Int)"))(t2254))), t2258), t2259), @tactics.strip_tac), t2260), t2261), t2264), t2265), t2266), t2269), t2270), t2271), t2274), t2278), t2280), t2281), t2284), t2285), t2288), t2289), t2292), t2298), t2299), t2300)
  gauss_tri_from_3sq_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (∃ u : Int, ∃ v : Int, ∃ w : Int, pow(u, 2) + (pow(v, 2) + pow(w, 2)) == int_of_num(8) * int_of_num(n) + int_of_num(3)) → (∃ a : Num, ∃ b : Num, ∃ c : Num, 2 * n == a * (a + 1) + (b * (b + 1) + c * (c + 1)))"), t2301))
}

///|
let gauss_tri_from_3sq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_TRI_FROM_3SQ")

///|
/// `GAUSS_TRI_FROM_3SQ`
pub fn gauss_tri_from_3sq() -> @kernel.Thm {
  gauss_tri_from_3sq_c.get()
}

///|
/// GAUSS_TRIANGULAR
fn step_89() -> Unit raise {
  let t2302 = @simp.rewrite_tac(@list.List([@int.int_of_num_clauses(), three_sq_3mod8()]))
  let t2303 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(gauss_tri_from_3sq())), t2302)
  gauss_triangular_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∃ a : Num, ∃ b : Num, ∃ c : Num, 2 * n == a * (a + 1) + (b * (b + 1) + c * (c + 1))"), t2303))
}

///|
let gauss_triangular_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_TRIANGULAR")

///|
/// `GAUSS_TRIANGULAR`
pub fn gauss_triangular() -> @kernel.Thm {
  gauss_triangular_c.get()
}

///|
/// triangular
fn step_90() -> Unit raise {
  triangular_c.set(@pair.new_definition(@term_syntax.parse_term("(triangular : (Num) -> Bool)((t : Num)) == (∃ k : Num, t == DIV(k * (k + 1), 2))")))
}

///|
let triangular_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("triangular")

///|
/// `triangular`
pub fn triangular() -> @kernel.Thm {
  triangular_c.get()
}

///|
/// GAUSS_TRIANGULAR_SUM
fn step_91() -> Unit raise {
  let t2334 = @simp.asm_rewrite_tac(@list.List([]))
  let t2335 = @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("2 * (n : Num) == (a : Num) * (a + 1) + ((b : Num) * (b + 1) + (c : Num) * (c + 1))")), t2334), @int.arith_tac)
  let t2333 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (x : Num), 2) == x"))]))
  let t2336 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(c : Num)")), t2333)
  let t2332 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (x : Num), 2) == x"))]))
  let t2337 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(b : Num)")), t2332)
  let t2331 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (x : Num), 2) == x"))]))
  let t2338 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(a : Num)")), t2331), t2337, t2336, t2335])
  let t2330 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2329 = @simp.rewrite_tac(@list.List([triangular()]))
  let t2326 = @term_syntax.parse_term("(kc : Num)")
  let t2327 = @term_syntax.parse_term("(kb : Num)")
  let t2328 = @tactics.map_every(fn(x2323 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2324 = @tactics.exists_tac(x2323)
    fn(x2325 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2324(x2325)
    }
  }, @list.List([@term_syntax.parse_term("(ka : Num)"), t2327, t2326]))
  let t2319 = @term_syntax.parse_term("(kc : Num)")
  let t2317 = @term_syntax.parse_term("(kb : Num)")
  let t2321 = @tactics.conjuncts_then2((x2318 : @kernel.Thm) => @tactics.x_choose_tac(t2317, x2318), (x2320 : @kernel.Thm) => @tactics.x_choose_tac(t2319, x2320))
  let t2315 = @term_syntax.parse_term("(ka : Num)")
  let t2322 = @tactics.disch_then(@tactics.conjuncts_then2((x2316 : @kernel.Thm) => @tactics.x_choose_tac(t2315, x2316), t2321))
  let t2314 = @simp.rewrite_tac(@list.List([@arith.even_exists()]))
  let t2312 = @meson.meson_tac(@list.List([]))
  let t2313 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_mult(), @arith.even_add(), @calc_num.arith(), @equal.gsym(@arith.not_even())])), t2312), @tactics.all_tac])
  let t2311 = @tactics.subgoal_then(@term_syntax.parse_term("EVEN((a : Num) * (a + 1)) && EVEN((b : Num) * (b + 1)) && EVEN((c : Num) * (c + 1))"), fn(x2308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2309 = @tactics.mp_tac(x2308)
    fn(x2310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2309(x2310)
    }
  })
  let t2304 = @term_syntax.parse_term("(c : Num)")
  let t2306 = @tactics.x_choose_then(@term_syntax.parse_term("(b : Num)"))((x2305 : @kernel.Thm) => @tactics.x_choose_tac(t2304, x2305))
  let t2307 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Num)"))(t2306))
  let t2339 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), gauss_triangular()))), t2307), t2311), t2313), t2314), t2322), t2328), t2329), t2330), t2338)
  gauss_triangular_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∃ a : Num, ∃ b : Num, ∃ c : Num, triangular(a) && triangular(b) && triangular(c) && n == a + (b + c)"), t2339))
}

///|
let gauss_triangular_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS_TRIANGULAR_SUM")

///|
/// `GAUSS_TRIANGULAR_SUM`
pub fn gauss_triangular_sum() -> @kernel.Thm {
  gauss_triangular_sum_c.get()
}

///|
/// Autoformalization/three_squares.ml:2084
fn step_92() -> Unit raise {
  @realax.prioritize_real(())
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
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
}
