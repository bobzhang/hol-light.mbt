// Translated from upstream 100/leibniz.ml; edit this file directly.

///|
/// 100/leibniz.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// ALTERNATING_SUM_BOUNDS
fn step_2() -> Unit raise {
  let t63 = @term_syntax.parse_term("(p : Num)")
  let t66 = @tactics.first_x_assum(fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s61 = @tactics.mp_tac(x60)
      fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s61(x62)
      }
    })(((x64 : @kernel.Thm) => @bool.spec(t63, x64))(x65))
  })
  let t59 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t58 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s56 = @tactics.subst_all_tac(x55)
    fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s56(x57)
    }
  }))
  let t54 = @simp.rewrite_tac(@list.List([@arith.odd_exists()]))
  let t52 = @simp.gen_rewrite_rule(fn(x51 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x51
  }, @list.List([@arith.not_even()]))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s49 = @tactics.mp_tac(x48)
      fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s49(x50)
      }
    })(t52(x53))
  }), t54), t58), t59), t66), @calc_rat.real_arith_tac)
  let t44 = @term_syntax.parse_term("(p : Num)")
  let t47 = @tactics.first_x_assum(fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s42 = @tactics.mp_tac(x41)
      fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s42(x43)
      }
    })(((x45 : @kernel.Thm) => @bool.spec(t44, x45))(x46))
  })
  let t40 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s38 = @tactics.subst_all_tac(x37)
    fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s38(x39)
    }
  }))
  let t35 = @simp.gen_rewrite_rule(fn(x34 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x34
  }, @list.List([@arith.even_exists()]))
  let t68 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s32 = @tactics.mp_tac(x31)
      fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s32(x33)
      }
    })(t35(x36))
  }), t40), t47), @calc_rat.real_arith_tac), t67])
  let t30 = @simp.asm_rewrite_tac(@list.List([]))
  let t29 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((m : Num))"))
  let t25 = @term_syntax.parse_term("(m : Num)")
  let t28 = @tactics.undisch_then(@term_syntax.parse_term("∀ n : Num, abs((a : (Num) -> Real)(n + 1)) <= abs(a(n))"), fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s23 = @tactics.mp_tac(x22)
      fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s23(x24)
      }
    })(((x26 : @kernel.Thm) => @bool.spec(t25, x26))(x27))
  })
  let t21 = @simp.rewrite_tac(@list.List([@arith.add1(), @equal.gsym(@arith.not_even())]))
  let t20 = @simp.rewrite_tac(@list.List([@arith.odd(), @arith.even(), @analysis.sum_1()]))
  let t16 = @term_syntax.parse_term("SUC((m : Num))")
  let t19 = @tactics.first_x_assum(fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x15 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x8 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s9 = @tactics.mp_tac(x8)
        fn(x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s9(x10)
        }
      })(((x14 : @kernel.Thm) => @lib.check(fn(x13 : @kernel.Thm) -> Bool raise {
        (fn(x11 : @kernel.Term) -> Bool raise {
          @basics.is_conj(x11)
        })((fn(x12 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x12)
        })(x13))
      }, x14))(x15))
    })(((x17 : @kernel.Thm) => @bool.spec(t16, x17))(x18))
  })
  let t6 = @equal.gsym(@analysis.sum_split())
  let t7 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) == 1 + n")), t6]))
  let t5 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t3 = @simp.asm_simp_tac(@list.List([@analysis.real_le_refl()]))
  let t4 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@analysis.sum(), @arith.odd_exists(), @arith.even_exists(), @theorems.left_imp_exists_thm(), @arith.add1()])), t3), @tactics.all_tac])
  let t2 = @simp.rewrite_tac(@list.List([@arith.odd(), @arith.even()]))
  let t1 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t69 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t1), @nums.induct_tac), t2), t4), t5), t7), t19), t20), t21), t28), t29), t30), t68)
  alternating_sum_bounds_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, (∀ n : Num, a(2 * n + 1) <= real_of_num(0) && real_of_num(0) <= a(2 * n)) && (∀ n : Num, abs(a(n + 1)) <= abs(a(n))) → (∀ m : Num, ∀ n : Num, (EVEN(m) → real_of_num(0) <= sum((m, n), a) && sum((m, n), a) <= a(m)) && (ODD(m) → a(m) <= sum((m, n), a) && sum((m, n), a) <= real_of_num(0)))"), t69))
}

///|
let alternating_sum_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALTERNATING_SUM_BOUNDS")

///|
/// `ALTERNATING_SUM_BOUNDS`
pub fn alternating_sum_bounds() -> @kernel.Thm {
  alternating_sum_bounds_c.get()
}

///|
/// ALTERNATING_SUM_BOUND
fn step_3() -> Unit raise {
  let t78 = @simp.asm_rewrite_tac(@list.List([]))
  let t77 = @class.asm_cases_tac(@term_syntax.parse_term("EVEN((m : Num))"))
  let t76 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_even())]))
  let t75 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t73 = @drule.match_mp(alternating_sum_bounds())
  let t79 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s71 = @tactics.mp_tac(x70)
      fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s71(x72)
      }
    })(t73(x74))
  })), t75), t76), t77), t78), @calc_rat.real_arith_tac)
  alternating_sum_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, (∀ n : Num, a(2 * n + 1) <= real_of_num(0) && real_of_num(0) <= a(2 * n)) && (∀ n : Num, abs(a(n + 1)) <= abs(a(n))) → (∀ m : Num, ∀ n : Num, abs(sum((m, n), a)) <= abs(a(m)))"), t79))
}

///|
let alternating_sum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALTERNATING_SUM_BOUND")

///|
/// `ALTERNATING_SUM_BOUND`
pub fn alternating_sum_bound() -> @kernel.Thm {
  alternating_sum_bound_c.get()
}

///|
/// SUMMABLE_ALTERNATING
fn step_4() -> Unit raise {
  let t96 = @meson.asm_meson_tac(@list.List([alternating_sum_bound(), @realarith.real_let_trans()]))
  let t95 = @simp.rewrite_tac(@list.List([@analysis.real_sub_rzero()]))
  let t94 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t93 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t92 = @simp.asm_rewrite_tac(@list.List([]))
  let t89 = @simp.gen_rewrite_rule(fn(x88 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x88
  }, @list.List([@analysis.seq()]))
  let t85 = @term_syntax.parse_term("(e : Real)")
  let t91 = @tactics.first_x_assum(fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s83 = @tactics.mp_tac(x82)
        fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s83(x84)
        }
      })(((x86 : @kernel.Thm) => @bool.spec(t85, x86))(x87))
    })(t89(x90))
  })
  let t81 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t80 = @simp.rewrite_tac(@list.List([@analysis.ser_cauchy()]))
  let t97 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t80), t81), @tactics.strip_tac), t91), t92), t93), t94), t95), t96)
  summable_alternating_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : _, (∀ n : Num, (a : (Num) -> Real)(2 * n + 1) <= real_of_num(0) && real_of_num(0) <= a(2 * n)) && (∀ n : Num, abs(a(n + 1)) <= abs(a(n))) && tends_num_real(a, real_of_num(0)) → summable(a)"), t97))
}

///|
let summable_alternating_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_ALTERNATING")

///|
/// `SUMMABLE_ALTERNATING`
pub fn summable_alternating() -> @kernel.Thm {
  summable_alternating_c.get()
}

///|
/// REAL_ATN_POWSER_ALT
fn step_5() -> Unit raise {
  let t130 = @simp.simp_tac(@list.List([@arith.div_mult(), @calc_num.arith_eq(), @analysis.real_mul_lzero(), @realax.real_add_lid()]))
  let t129 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) * 2 == 2 * n"))]))
  let t128 = @simp.rewrite_tac(@list.List([@analysis.sum_2(), @arith.even_mult(), @arith.even_add(), @calc_num.arith_even(), @arith.add_sub()]))
  let t125 = @drule.match_mp(@analysis.sum_uniq())
  let t127 = @tactics.first_assum(fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s122 = @tactics.subst1_tac(x121)
        fn(x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s122(x123)
        }
      })(@equal.sym(x124))
    })(t125(x126))
  })
  let t118 = @drule.match_mp(@analysis.ser_group())
  let t120 = @tactics.disch_then(fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s116 = @tactics.mp_tac(x115)
      fn(x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s116(x117)
      }
    })(t118(x119))
  })
  let t112 = @drule.match_mp(@analysis.sum_summable())
  let t109 = @int.arith_rule(@term_syntax.parse_term("0 < 2"))
  let t114 = @tactics.first_assum(fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s105 = @tactics.mp_tac(x104)
        fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s105(x106)
        }
      })((fn(x110 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x107 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          fn(x108 : @kernel.Thm) -> @kernel.Thm raise {
            @bool.conj(x107, x108)
          }
        })(x110)(t109)
      })(x111))
    })(t112(x113))
  })
  let t101 = @drule.match_mp(@transc.real_atn_powser())
  let t103 = @tactics.first_assum(fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s99 = @tactics.assume_tac(x98)
      fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s99(x100)
      }
    })(t101(x102))
  })
  let t131 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t103), t114), t120), t127), t128), t129), t130)
  real_atn_powser_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(x) < real_of_num(1) → sums((n : Num) => pow(-real_of_num(1), n) / real_of_num(2 * n + 1) * pow(x, 2 * n + 1), atn(x))"), t131))
}

///|
let real_atn_powser_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ATN_POWSER_ALT")

///|
/// `REAL_ATN_POWSER_ALT`
pub fn real_atn_powser_alt() -> @kernel.Thm {
  real_atn_powser_alt_c.get()
}

///|
/// SUMMABLE_LEIBNIZ
fn step_6() -> Unit raise {
  let t157 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq(), @realax.real_of_num_le()]))
  let t154 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) * (e : Real) → e * x <= (y : Real) → real_of_num(1) < y")))
  let t156 = @tactics.first_x_assum(fn(x155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t154(x155))
  })
  let t153 = @tactics.repeat_tac(@tactics.strip_tac)
  let t152 = @simp.rewrite_tac(@list.List([@arith.ge()]))
  let t151 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t148 = @drule.match_mp(@analysis.real_arch())
  let t145 = @term_syntax.parse_term("real_of_num(1)")
  let t150 = @tactics.first_assum(fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s143 = @tactics.mp_tac(x142)
        fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s143(x144)
        }
      })(((x146 : @kernel.Thm) => @bool.spec(t145, x146))(x147))
    })(t148(x149))
  })
  let t141 = @simp.simp_tac(@list.List([@real.real_lt_ldiv_eq(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) + 1"))]))
  let t140 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_neg(), @calc_int.real_abs_num(), @real.real_pow_one()]))
  let t158 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@analysis.seq(), @analysis.real_sub_rzero(), @real.real_abs_div(), @real.real_abs_pow()])), t140), t141), @tactics.gen_tac), @tactics.disch_tac), t150), t151), t152), t153), t156), t157), @int.asm_arith_tac)
  let t139 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le()]))
  let t138 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t137 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_num(), @real.real_pow_one(), @realax.real_div(), @realax.real_mul_lid()]))
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@real.real_abs_div(), @real.real_abs_pow(), @calc_int.real_abs_neg()]))), t137), t138), t139), @int.arith_tac)
  let t136 = @simp.rewrite_tac(@list.List([@calc_int.real_le_lneg(), @calc_int.real_add_rid(), @real.real_le_inv_eq(), @analysis.real_pos()]))
  let t135 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @realax.real_div(), @realax.real_mul_lid(), @calc_int.real_mul_lneg()]))
  let t134 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t160 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_add(), @real.real_pow_mul(), @equal.gsym(@real.real_pow_pow())])), t134), t135), t136), t159, t158])
  let t133 = @tactics.repeat_tac(@tactics.conj_tac)
  let t132 = @simp.rewrite_tac(@list.List([]))
  let t161 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(summable_alternating()), t132), t133), t160)
  summable_leibniz_c.set(@tactics.prove(@term_syntax.parse_term("summable((n : Num) => pow(-real_of_num(1), n) / real_of_num(2 * n + 1))"), t161))
}

///|
let summable_leibniz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_LEIBNIZ")

///|
/// `SUMMABLE_LEIBNIZ`
pub fn summable_leibniz() -> @kernel.Thm {
  summable_leibniz_c.get()
}

///|
/// SUM_DIFFERENCES
fn step_7() -> Unit raise {
  let t168 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t167 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_numseg(), @int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) + 1 → m <= SUC(n) && m <= SUC(n) + 1"))]))
  let t166 = @simp.asm_simp_tac(@list.List([@iterate.sum_triv_numseg(), @int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1")), @analysis.real_sub_refl()]))
  let t165 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) <= SUC((n : Num)) + 1) == (m <= n + 1 || m == SUC(n) + 1)"))]))
  let t163 = @simp.asm_simp_tac(@list.List([@iterate.sum_triv_numseg(), @calc_num.arith(), @analysis.real_sub_refl()]))
  let t162 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_sing_numseg()]))
  let t164 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) <= 0 + 1) == (m == 0 || m == 1)"))])), @tactics.strip_tac), t162), t163), @tactics.all_tac])
  let t169 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t164), t165), @tactics.strip_tac), t166), t167), t168), @calc_rat.real_arith_tac)
  sum_differences_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ m : Num, ∀ n : Num, m <= n + 1 → sum(op_dot_dot(m, n), (i : Num) => a(i) - a(i + 1)) == a(m) - a(n + 1)"), t169))
}

///|
let sum_differences_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DIFFERENCES")

///|
/// `SUM_DIFFERENCES`
pub fn sum_differences() -> @kernel.Thm {
  sum_differences_c.get()
}

///|
/// SUM_REARRANGE_LEMMA
fn step_8() -> Unit raise {
  let t204 = @simp.rewrite_tac(@list.List([@analysis.real_sub_add(), @analysis.real_sub_rdistrib()]))
  let t202 = @equal.gsym(@iterate.sum_add_numseg())
  let t203 = @simp.simp_tac(@list.List([@realax.real_add_ldistrib(), @equal.gsym(@analysis.sum_cmul()), t202]))
  let t201 = @simp.gen_rewrite_tac(fn(x198 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s199 = @equal.land_conv(x198)
    fn(x200 : @kernel.Term) -> @kernel.Thm raise {
      s199(x200)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t197 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(s1 : Real) * ((v : Real) - (w : Real)) + (x : Real) + ((s2 : Real) + (y : Real)) * w == x + y * w + ((v - w) * s1 + w * s2)"))]))
  let t196 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= SUC((n : Num) + 1) && !(m == SUC(n + 1)) → m <= SUC(n)"))]))
  let t195 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @iterate.sum_clauses_numseg()]))
  let t194 = @simp.rewrite_tac(@list.List([@realax.real_add_assoc(), @real.real_add_rdistrib(), @calc_int.real_eq_add_rcancel()]))
  let t193 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_add_assoc()), @calc_int.real_eq_add_lcancel()]))
  let t192 = @simp.asm_rewrite_tac(@list.List([]))
  let t191 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) <= SUC((n : Num))) == (m <= SUC(n + 1) && !(m == SUC(n + 1)))"))]))
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t189 = @tactics.disch_then(fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s187 = @tactics.subst1_tac(x186)
    fn(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s187(x188)
    }
  })
  let t184 = @simp.asm_simp_tac(@list.List([@iterate.sum_triv_numseg(), @int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n) && n < SUC(n + 1)"))]))
  let t185 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.le_suc(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) + 1 <= n)"))])), t184), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t183 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == SUC((n : Num) + 1)"))
  let t182 = @tactics.first_x_assum(fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s175 = @tactics.mp_tac(x174)
      fn(x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s175(x176)
      }
    })(((x180 : @kernel.Thm) => @lib.check(fn(x179 : @kernel.Thm) -> Bool raise {
      (fn(x177 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x177)
      })((fn(x178 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x178)
      })(x179))
    }, x180))(x181))
  })
  let t173 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @iterate.sum_clauses_numseg()]))
  let t171 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t170 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t172 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @calc_num.num_conv(@term_syntax.parse_term("1")), @arith.add_clauses()])), t170), t171), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t205 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.replicate_tac(3, @tactics.gen_tac), @nums.induct_tac), t172), t173), @tactics.disch_tac), t182), t183), t185), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t189), t190), t191), t192), t193), t194), t195), t196), t197), t201), t203), t204), @calc_rat.real_arith_tac)
  sum_rearrange_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ v : (Num) -> Real, ∀ m : Num, ∀ n : Num, m <= n + 1 → sum(op_dot_dot(m, n + 1), (i : Num) => a(i) * v(i)) == sum(op_dot_dot(m, n), (k : Num) => sum(op_dot_dot(m, k), a) * (v(k) - v(k + 1))) + sum(op_dot_dot(m, n + 1), a) * v(n + 1)"), t205))
}

///|
let sum_rearrange_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_REARRANGE_LEMMA")

///|
/// `SUM_REARRANGE_LEMMA`
pub fn sum_rearrange_lemma() -> @kernel.Thm {
  sum_rearrange_lemma_c.get()
}

///|
/// SUM_BOUNDS_LEMMA
fn step_9() -> Unit raise {
  let t228 = @simp.asm_simp_tac(@list.List([@analysis.real_sub_le(), @int.arith_rule(@term_syntax.parse_term("(k : Num) <= (n : Num) → k <= n + 1"))]))
  let t227 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t226 = @simp.rewrite_tac(@list.List([]))
  let t225 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t224 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t223 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul(), @arith.le_refl()]))
  let t222 = @tactics.match_mp_tac(@real.real_le_add2())
  let t219 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.sum_lmul(), sum_differences()])), @calc_rat.real_arith_tac)])
  let t218 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((m : Num), (n : Num)), (k : Num) => (u : Real) * ((v : (Num) -> Real)(k) - v(k + 1))) + u * v(n + 1)"))
  let t220 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_trans()), t218), @tactics.conj_tac), t219)
  let t217 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.sum_lmul(), sum_differences()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t216 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((m : Num), (n : Num)), (k : Num) => (l : Real) * ((v : (Num) -> Real)(k) - v(k + 1))) + l * v(n + 1)"))
  let t221 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.real_le_trans()), t216), @tactics.conj_tac), t217), t220])
  let t215 = @simp.simp_tac(@list.List([sum_rearrange_lemma()]))
  let t212 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t213 = @tactics.then_tac(@tactics.pop_assum(fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t212)
  let t210 = @simp.simp_tac(@list.List([@real.real_le_rmul()]))
  let t209 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_sing_numseg()]))
  let t208 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t207 = @simp.rewrite_tac(@list.List([@theorems.left_forall_imp_thm(), @theorems.right_exists_and_thm(), @theorems.exists_refl()]))
  let t206 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) <= (i : Num) && i == 0) == (m == 0 && i == 0)"))]))
  let t214 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le(), @iterate.sum_clauses_numseg()])), t206), t207), t208), t209), t210), t213])
  let t229 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.replicate_tac(5, @tactics.gen_tac), @nums.induct_tac), t214), t215), @tactics.strip_tac), @tactics.conj_tac), t221), t222), t223), t224), t225), @tactics.strip_tac), t226), t227), t228)
  sum_bounds_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ v : (Num) -> Real, ∀ l : Real, ∀ u : Real, ∀ m : Num, ∀ n : Num, m <= n && (∀ i : Num, m <= i && i <= n → real_of_num(0) <= v(i) && v(i + 1) <= v(i)) && (∀ k : Num, m <= k && k <= n → l <= sum(op_dot_dot(m, k), a) && sum(op_dot_dot(m, k), a) <= u) → l * v(m) <= sum(op_dot_dot(m, n), (i : Num) => a(i) * v(i)) && sum(op_dot_dot(m, n), (i : Num) => a(i) * v(i)) <= u * v(m)"), t229))
}

///|
let sum_bounds_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BOUNDS_LEMMA")

///|
/// `SUM_BOUNDS_LEMMA`
pub fn sum_bounds_lemma() -> @kernel.Thm {
  sum_bounds_lemma_c.get()
}

///|
/// SUM_BOUND_LEMMA
fn step_10() -> Unit raise {
  let t233 = @simp.asm_rewrite_tac(@list.List([@real.real_bounds_le()]))
  let t232 = @tactics.match_mp_tac(sum_bounds_lemma())
  let t231 = @simp.asm_simp_tac(@list.List([@arith.le_refl(), @realax.real_abs()]))
  let t230 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("-(b : Real) * (k : Real) <= (a : Real) && a <= b * k → abs(a) <= b * k")))
  let t234 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t230), t231), t232), t233)
  sum_bound_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ v : (Num) -> Real, ∀ b : Real, ∀ m : Num, ∀ n : Num, m <= n && (∀ i : Num, m <= i && i <= n → real_of_num(0) <= v(i) && v(i + 1) <= v(i)) && (∀ k : Num, m <= k && k <= n → abs(sum(op_dot_dot(m, k), a)) <= b) → abs(sum(op_dot_dot(m, n), (i : Num) => a(i) * v(i))) <= b * abs(v(m))"), t234))
}

///|
let sum_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BOUND_LEMMA")

///|
/// `SUM_BOUND_LEMMA`
pub fn sum_bound_lemma() -> @kernel.Thm {
  sum_bound_lemma_c.get()
}

///|
/// LEIBNIZ_PI
fn step_11() -> Unit raise {
  let t428 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((s1 : Real) - (sx : Real)) < (e : Real) / real_of_num(6) → !(abs(sx - (s : Real)) < e / real_of_num(2)) → !(abs(s1 - s) < e / real_of_num(3))")))
  let t430 = @tactics.first_x_assum(fn(x429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t428(x429))
  })
  let t427 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@analysis.real_sub_ldistrib(), @analysis.sum_sub(), @analysis.real_mul_rid()])))
  let t424 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((slo : Real) + (shi : Real) - (s : Real)) < (e : Real) / real_of_num(6) → !(abs(slo - s) < e / real_of_num(3)) → !(abs(shi) < e / real_of_num(7))")))
  let t426 = @tactics.first_x_assum(fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t424(x425))
  })
  let t423 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_refl()]))
  let t418 = @term_syntax.parse_term("(N1 : Num) + (N2 : Num)")
  let t419 = @list.List([@term_syntax.parse_term("(N : Num)"), t418])
  let t422 = @tactics.first_x_assum(fn(x421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s416 = @tactics.mp_tac(x415)
      fn(x417 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s416(x417)
      }
    })(((x420 : @kernel.Thm) => @bool.specl(t419, x420))(x421))
  })
  let t410 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_refl(), @analysis.real_lt_imp_le()]))
  let t409 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N : Num) <= (k : Num) → N + (k - N + 1) - 1 == k"))]))
  let t408 = @simp.simp_tac(@list.List([@analysis.psum_sum_numseg(), @arith.add_eq_0(), @calc_num.arith_eq()]))
  let t403 = @term_syntax.parse_term("(k : Num) - (N : Num) + 1")
  let t404 = @list.List([@term_syntax.parse_term("(N : Num)"), t403])
  let t407 = @tactics.first_x_assum(fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s401 = @tactics.mp_tac(x400)
      fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s401(x402)
      }
    })(((x405 : @kernel.Thm) => @bool.specl(t404, x405))(x406))
  })
  let t411 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.real_lt_imp_le()), t407), t408), t409), t410)
  let t399 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @real.real_pow_1_le(), @analysis.real_lt_imp_le()]))
  let t398 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t397 = @simp.gen_rewrite_tac(fn(x394 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s395 = @equal.rand_conv(x394)
    fn(x396 : @kernel.Term) -> @kernel.Thm raise {
      s395(x396)
    }
  }, @list.List([@equal.gsym(@analysis.real_mul_rid())]))
  let t393 = @simp.gen_rewrite_tac(fn(x390 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s391 = @equal.land_conv(x390)
    fn(x392 : @kernel.Term) -> @kernel.Thm raise {
      s391(x392)
    }
  }, @list.List([@real.real_pow_add()]))
  let t412 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * ((m : Num) + 1) + 1 == 2 * m + 1 + 2"))])), t393), t397), t398), t399)
  let t413 = @list.List([@simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_le(), @real.real_pow_lt()])), t412, t411])
  let t389 = @tactics.repeat_tac(@tactics.strip_tac)
  let t388 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((N1 : Num) + (N2 : Num) == 0)")), @int.arith_tac), @tactics.all_tac])
  let t387 = @tactics.match_mp_tac(sum_bound_lemma())
  let t386 = @simp.asm_simp_tac(@list.List([@analysis.psum_sum_numseg()]))
  let t383 = @term_syntax.parse_term("(x : Real) < real_of_num(1)")
  let t384 = @tactics.map_every(fn(x380 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s381 = @tactics.undisch_tac(x380)
    fn(x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s381(x382)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0) < (x : Real)"), t383]))
  let t379 = @tactics.match_mp_tac(@real.real_pow_1_le())
  let t378 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t377 = @simp.asm_simp_tac(@list.List([@analysis.real_lt_imp_le(), @real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t376 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t375 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t385 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x372 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s373 = @equal.rand_conv(x372)
    fn(x374 : @kernel.Term) -> @kernel.Thm raise {
      s373(x374)
    }
  }, @list.List([@equal.gsym(@analysis.real_mul_rid())])), t375), t376), t377), t378), t379), t384), @calc_rat.real_arith_tac)])
  let t371 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) / real_of_num(7) * abs(pow((x : Real), 2 * (N : Num) + 1))"))
  let t370 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t369 = @simp.asm_rewrite_tac(@list.List([]))
  let t368 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (e : Real) / real_of_num(7) && real_of_num(0) < e → x < e / real_of_num(6)")))
  let t367 = @list.List([@simp.asm_simp_tac(@list.List([@analysis.sum(), @real.real_lt_div(), @real.real_of_num_lt(), @calc_int.real_abs_num(), @calc_num.arith()])), @tactics.all_tac])
  let t414 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num) == 0")), t367), t368), t369), t370), t371), @tactics.conj_tac), t385), t386), t387), @tactics.conj_tac), t388), t389), t413), @tactics.all_tac])
  let t366 = @tactics.subgoal_then(@term_syntax.parse_term("abs(sum(((N : Num), (N1 : Num) + (N2 : Num)), (n : Num) => pow(-real_of_num(1), n) / real_of_num(2 * n + 1) * pow((x : Real), 2 * n + 1))) < (e : Real) / real_of_num(6)"), fn(x363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s364 = @tactics.assume_tac(x363)
    fn(x365 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s364(x365)
    }
  })
  let t362 = @tactics.repeat_tac(@tactics.strip_tac)
  let t361 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t360 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split())]))
  let t359 = @simp.rewrite_tac(@list.List([]))
  let t355 = @term_syntax.parse_term("(N : Num) + ((N1 : Num) + (N2 : Num))")
  let t358 = @tactics.repeat_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s353 = @tactics.mp_tac(x352)
      fn(x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s353(x354)
      }
    })(((x356 : @kernel.Thm) => @bool.spec(t355, x356))(x357))
  }), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])))
  let t349 = @term_syntax.parse_term("(N2 : Num)")
  let t351 = @tactics.disch_then((x350 : @kernel.Thm) => @tactics.x_choose_tac(t349, x350))
  let t348 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t344 = @term_syntax.parse_term("(e : Real) / real_of_num(6)")
  let t347 = @tactics.disch_then(fn(x346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s342 = @tactics.mp_tac(x341)
      fn(x343 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s342(x343)
      }
    })(((x345 : @kernel.Thm) => @bool.spec(t344, x345))(x346))
  })
  let t340 = @simp.rewrite_tac(@list.List([@analysis.seq()]))
  let t337 = @simp.gen_rewrite_rule(fn(x336 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x336
  }, @list.List([@analysis.sums()]))
  let t339 = @tactics.first_x_assum(fn(x338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s334 = @tactics.mp_tac(x333)
      fn(x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s334(x335)
      }
    })(t337(x338))
  })
  let t330 = @term_syntax.parse_term("(N1 : Num)")
  let t332 = @tactics.disch_then((x331 : @kernel.Thm) => @tactics.x_choose_tac(t330, x331))
  let t329 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t325 = @term_syntax.parse_term("(e : Real) / real_of_num(6)")
  let t328 = @tactics.disch_then(fn(x327 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s323 = @tactics.mp_tac(x322)
      fn(x324 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s323(x324)
      }
    })(((x326 : @kernel.Thm) => @bool.spec(t325, x326))(x327))
  })
  let t321 = @simp.rewrite_tac(@list.List([@analysis.sums(), @analysis.seq()]))
  let t318 = @drule.match_mp(real_atn_powser_alt())
  let t320 = @tactics.first_x_assum(fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s316 = @tactics.mp_tac(x315)
      fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s316(x317)
      }
    })(t318(x319))
  })
  let t314 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (x : Real) && x < real_of_num(1) && abs(x) < real_of_num(1)"), @tactics.strip_assume_tac)
  let t310 = @term_syntax.parse_term("(x : Real)")
  let t313 = @tactics.repeat_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s308 = @tactics.mp_tac(x307)
      fn(x309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s308(x309)
      }
    })(((x311 : @kernel.Thm) => @bool.spec(t310, x311))(x312))
  }), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_tac])))
  let t306 = @simp.abbrev_tac(@term_syntax.parse_term("(x : Real) == real_of_num(1) - min(min((d1 : Real) / real_of_num(2), (d2 : Real) / real_of_num(2)), real_of_num(1) / real_of_num(2))"))
  let t304 = @tactics.x_choose_then(@term_syntax.parse_term("(d2 : Real)"))(@tactics.strip_assume_tac)
  let t305 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(d1 : Real)"))(@tactics.strip_assume_tac), t304))
  let t303 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @equal.gsym(@analysis.real_sub_ldistrib())]))
  let t301 = @equal.gsym(@calc_int.real_mul_rneg())
  let t302 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.sum_neg()), @analysis.real_neg_sub(), t301]))
  let t300 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@calc_int.real_abs_neg())]))
  let t299 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith(), @equal.gsym(@analysis.sum_sub())]))
  let t295 = @term_syntax.parse_term("(e : Real) / real_of_num(6)")
  let t298 = @tactics.disch_then(fn(x297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s293 = @tactics.mp_tac(x292)
      fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s293(x294)
      }
    })(((x296 : @kernel.Thm) => @bool.spec(t295, x296))(x297))
  })
  let t291 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) == !(a && b)")), @theorems.and_forall_thm()]))
  let t290 = @simp.rewrite_tac(@list.List([@analysis.contl_lim(), @analysis.lim_v1()]))
  let t289 = @list.List([@meson.meson_tac(@list.List([@analysis.diff_cont(), @transc.diff_atn()])), @tactics.all_tac])
  let t288 = @tactics.subgoal_then(@term_syntax.parse_term("contl(atn, real_of_num(1))"), fn(x285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s286 = @tactics.mp_tac(x285)
    fn(x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s286(x287)
    }
  })
  let t283 = @tactics.conv_tac(@calc_rat.real_field)
  let t282 = @simp.rewrite_tac(@list.List([@real.real_pow_one()]))
  let t280 = @equal.gsym(@realax.real_of_num_mul())
  let t281 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t280]))
  let t279 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t278 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) == (b : Bool) → a → b")))
  let t275 = @drule.match_mp(@analysis.diff_cmul())
  let t272 = @term_syntax.parse_term("inv(real_of_num(2 * (k : Num) + 1))")
  let t277 = @tactics.disch_then(fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s270 = @tactics.mp_tac(x269)
        fn(x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s270(x271)
        }
      })(((x273 : @kernel.Thm) => @bool.spec(t272, x273))(x274))
    })(t275(x276))
  })
  let t267 = @term_syntax.parse_term("real_of_num(1)")
  let t268 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("2 * (k : Num) + 1"), t267]), @analysis.diff_pow()))
  let t266 = @tactics.match_mp_tac(@analysis.diff_cmul())
  let t265 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t264 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t263 = @tactics.match_mp_tac(@analysis.diff_sum())
  let t262 = @tactics.exists_tac(@term_syntax.parse_term("sum((0, (N : Num)), (n : Num) => pow(-real_of_num(1), n) * pow(real_of_num(1), 2 * n))"))
  let t284 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.diff_cont()), t262), t263), t264), @tactics.strip_tac), t265), t266), t268), t277), t278), t279), @tactics.ap_thm_tac), @tactics.ap_term_tac), t281), t282), t283), @tactics.all_tac])
  let t261 = @tactics.subgoal_then(@term_syntax.parse_term("contl((x : Real) => sum((0, (N : Num)), (n : Num) => pow(-real_of_num(1), n) / real_of_num(2 * n + 1) * pow(x, 2 * n + 1)), real_of_num(1))"), fn(x258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s259 = @tactics.mp_tac(x258)
    fn(x260 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s259(x260)
    }
  })
  let t257 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(@tactics.strip_assume_tac))
  let t256 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t252 = @term_syntax.parse_term("(e : Real) / real_of_num(7)")
  let t255 = @tactics.disch_then(fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x249 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s250 = @tactics.mp_tac(x249)
      fn(x251 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s250(x251)
      }
    })(((x253 : @kernel.Thm) => @bool.spec(t252, x253))(x254))
  })
  let t248 = @simp.rewrite_tac(@list.List([@analysis.ser_cauchy()]))
  let t245 = @drule.match_mp(@analysis.sum_summable())
  let t247 = @tactics.first_assum(fn(x246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s243 = @tactics.mp_tac(x242)
      fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s243(x244)
      }
    })(t245(x246))
  })
  let t241 = @simp.abbrev_tac(@term_syntax.parse_term("(e : Real) == abs((s : Real) - atn(real_of_num(1)))"))
  let t240 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) < abs((x : Real) - (y : Real))) → x == y")))
  let t239 = @tactics.subgoal_then(@term_syntax.parse_term("(s : Real) == atn(real_of_num(1))"), fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x237
    @meson.asm_meson_tac(@list.List([th]))
  })
  let t236 = @simp.abbrev_tac(@term_syntax.parse_term("(s : Real) == suminf((n : Num) => pow(-real_of_num(1), n) / real_of_num(2 * n + 1))"))
  let t235 = @tactics.assume_tac(@drule.match_mp(@analysis.summable_sum())(summable_leibniz()))
  let t431 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@transc.atn_1())])), t235), t236), t239), t240), t241), @tactics.disch_tac), t247), t248), t255), t256), t257), t261), t284), t288), t289), t290), t291), t298), t299), t300), t302), t303), t305), t306), t313), t314), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t320), t321), t328), t329), t332), t339), t340), t347), t348), t351), t358), t359), t360), t361), t362), t366), t414), t422), t423), t426), t427), t430), @calc_rat.asm_real_arith_tac)
  leibniz_pi_c.set(@tactics.prove(@term_syntax.parse_term("sums((n : Num) => pow(-real_of_num(1), n) / real_of_num(2 * n + 1), pi / real_of_num(4))"), t431))
}

///|
let leibniz_pi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEIBNIZ_PI")

///|
/// `LEIBNIZ_PI`
pub fn leibniz_pi() -> @kernel.Thm {
  leibniz_pi_c.get()
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
}
