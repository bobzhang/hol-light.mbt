// Translated from upstream Examples/brunn_minkowski.ml; edit this file directly.

///|
/// BRUNN_MINKOWSKI_INTERVAL
fn step_1() -> Unit raise {
  let t110 = @simp.asm_simp_tac(@list.List([@realarith.real_mul_rid(), @real.real_mul_rinv(), @realax.real_le_refl(), @realax.real_of_num_eq(), @cart.dimindex_nonzero()]))
  let t109 = @simp.rewrite_tac(@list.List([@iterate.sum_const_numseg(), @arith.add_sub()]))
  let t108 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(a : Real) < (b : Real) && (c : Real) < (d : Real) → (b - a) * inv(b + d - (a + c)) + (d - c) * inv(b + d - (a + c)) == real_of_num(1)"))]))
  let t107 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_add_numseg())]))
  let t111 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@real.real_add_rdistrib())])), t107), t108), t109), t110)
  let t106 = @simp.asm_rewrite_tac(@list.List([]))
  let t102 = @term_syntax.parse_term("(i : Num)")
  let t105 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s100 = @tactics.mp_tac(x99)
      fn(x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s100(x101)
      }
    })(((x103 : @kernel.Thm) => @bool.spec(t102, x103))(x104))
  }))
  let t98 = @tactics.match_mp_tac(@real.real_le_div())
  let t97 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t96 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t93 = @simp.simp_tac(@list.List([@iterate.has_size_numseg_1(), @cart.dimindex_ge_1(), @arith.le_1(), @iterate.in_numseg()]))
  let t92 = @tactics.match_mp_tac(@realanalysis.agm())
  let t94 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s90 = @tactics.subst1_tac(x89)
    fn(x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s90(x91)
    }
  }), t92), t93)
  let t88 = @tactics.match_mp_tac(@iterate.sum_pos_le_numseg())
  let t95 = @tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_eq(), @cart.dimindex_ge_1(), @arith.le_1(), @real.real_le_rdiv_eq(), @calc_int.real_mul_lzero()])), t88), t94]))
  let t83 = @drule.part_match(fn(x82 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x82))
  }, @transcendentals.real_root_le())
  let t112 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_add2()), @tactics.conj_tac), fn(x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x86 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x84 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s80 = @tactics.mp_tac(x79)
          fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s80(x81)
          }
        })(t83(x84))
      })((fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x85.1
      })(x86))
    })(x87)(x87)
  }), t95), t96), @tactics.disch_tac), t97), t98), t105), t106), @calc_rat.real_arith_tac), t111])
  let t78 = @tactics.exists_tac(@term_syntax.parse_term("(sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (i : Num) => ((op_dollar : (Cart[Real, N], Num) -> Real)((b : Cart[Real, N]), i) - (op_dollar : (Cart[Real, N], Num) -> Real)((a : Cart[Real, N]), i)) / ((op_dollar : (Cart[Real, N], Num) -> Real)(b, i) + (op_dollar : (Cart[Real, N], Num) -> Real)((d : Cart[Real, N]), i) - ((op_dollar : (Cart[Real, N], Num) -> Real)(a, i) + (op_dollar : (Cart[Real, N], Num) -> Real)((c : Cart[Real, N]), i)))) / real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) + (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (i : Num) => ((op_dollar : (Cart[Real, N], Num) -> Real)(d, i) - (op_dollar : (Cart[Real, N], Num) -> Real)(c, i)) / ((op_dollar : (Cart[Real, N], Num) -> Real)(b, i) + (op_dollar : (Cart[Real, N], Num) -> Real)(d, i) - ((op_dollar : (Cart[Real, N], Num) -> Real)(a, i) + (op_dollar : (Cart[Real, N], Num) -> Real)(c, i)))) / real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))"))
  let t77 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t76 = @simp.rewrite_tac(@list.List([@equal.gsym(@products.product_div_numseg())]))
  let t75 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_root_div())]))
  let t74 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t73 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_add_rdistrib()]))
  let t71 = @tactics.disch_then(fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s68 = @tactics.subst1_tac(x67)
      fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s68(x69)
      }
    })(@equal.sym(x70))
  })
  let t65 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) && (c : Real) < (d : Real) → real_of_num(0) < b + d - (a + c)"))
  let t66 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq()), @products.product_pos_lt_numseg(), @iterate.in_numseg(), t65, @cart.dimindex_ge_1(), @arith.le_1()]))
  let t72 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.root_pos_lt()), t66), t71])
  let t60 = @drule.part_match(fn(x59 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x59))
  }, @real.real_le_ldiv_eq())
  let t55 = @simp.gen_rewrite_tac(fn(x52 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s53 = @equal.rand_conv(x52)
    fn(x54 : @kernel.Term) -> @kernel.Thm raise {
      s53(x54)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t51 = @simp.asm_simp_tac(@list.List([@measure.measure_interval(), @integration.content_closed_interval(), @vectors.vector_add_component(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) && (c : Real) <= (d : Real) → a + c <= b + d"))]))
  let t48 = @simp.rewrite_tac(@list.List([@measure.negligible_interval(), @vectors.interval_ne_empty()]))
  let t47 = @simp.simp_tac(@list.List([@measure.measurable_measure_eq_0(), @measure.measurable_interval()]))
  let t49 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s40 = @tactics.mp_tac(x39)
      fn(x41 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s40(x41)
      }
    })(((x45 : @kernel.Thm) => @lib.check(fn(x44 : @kernel.Thm) -> Bool raise {
      (fn(x42 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x42)
      })((fn(x43 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x43)
      })(x44))
    }, x45))(x46))
  }), t47), t48), @tactics.strip_tac)
  let t38 = @simp.asm_rewrite_tac(@list.List([]))
  let t34 = @term_syntax.parse_term("(i : Num)")
  let t37 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s32 = @tactics.mp_tac(x31)
      fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s32(x33)
      }
    })(((x35 : @kernel.Thm) => @bool.spec(t34, x35))(x36))
  }))
  let t30 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t29 = @tactics.match_mp_tac(@products.product_le_numseg())
  let t28 = @simp.asm_simp_tac(@list.List([@measure.measure_interval(), @integration.content_closed_interval(), @vectors.vector_add_component(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) && (c : Real) <= (d : Real) → a + c <= b + d"))]))
  let t50 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.root_0(), @cart.dimindex_ge_1(), @arith.le_1(), @calc_int.real_add_rid(), @transcendentals.root_mono_le_eq(), @measure.measure_pos_le(), @measure.measurable_interval()])), t28), t29), t30), @tactics.disch_tac), t37), t38), @calc_rat.real_arith_tac), t49])
  let t27 = @class.asm_cases_tac(@term_syntax.parse_term("measure(interval([((c : Cart[Real, N]), (d : Cart[Real, N]))])) == real_of_num(0)"))
  let t24 = @simp.rewrite_tac(@list.List([@measure.negligible_interval(), @vectors.interval_ne_empty()]))
  let t23 = @simp.simp_tac(@list.List([@measure.measurable_measure_eq_0(), @measure.measurable_interval()]))
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x15 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s16 = @tactics.mp_tac(x15)
      fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s16(x17)
      }
    })(((x21 : @kernel.Thm) => @lib.check(fn(x20 : @kernel.Thm) -> Bool raise {
      (fn(x18 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x18)
      })((fn(x19 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x19)
      })(x20))
    }, x21))(x22))
  }), t23), t24), @tactics.strip_tac)
  let t14 = @simp.asm_rewrite_tac(@list.List([]))
  let t10 = @term_syntax.parse_term("(i : Num)")
  let t13 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x12 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x7 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s8 = @tactics.mp_tac(x7)
      fn(x9 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s8(x9)
      }
    })(((x11 : @kernel.Thm) => @bool.spec(t10, x11))(x12))
  }))
  let t6 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t5 = @tactics.match_mp_tac(@products.product_le_numseg())
  let t4 = @simp.asm_simp_tac(@list.List([@measure.measure_interval(), @integration.content_closed_interval(), @vectors.vector_add_component(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) && (c : Real) <= (d : Real) → a + c <= b + d"))]))
  let t26 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.root_0(), @cart.dimindex_ge_1(), @arith.le_1(), @realax.real_add_lid(), @transcendentals.root_mono_le_eq(), @measure.measure_pos_le(), @measure.measurable_interval()])), t4), t5), t6), @tactics.disch_tac), t13), t14), @calc_rat.real_arith_tac), t25])
  let t3 = @class.asm_cases_tac(@term_syntax.parse_term("measure(interval([((a : Cart[Real, N]), (b : Cart[Real, N]))])) == real_of_num(0)"))
  let t2 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@vectors.interval_ne_empty()])))
  let t1 = @simp.asm_simp_tac(@list.List([@topology.sums_intervals(), @realax.real_ge()]))
  let t113 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1), t2), t3), t26), t27), t50), t51), t55), fn(x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x63 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x61 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s57 = @tactics.mp_tac(x56)
          fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s57(x58)
          }
        })(t60(x61))
      })((fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x62.1
      })(x63))
    })(x64)(x64)
  }), @tactics.ants_tac), t72), t73), t74), t75), t76), t77), t78), @tactics.conj_tac), t112)
  brunn_minkowski_interval_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ c : Cart[Real, N], ∀ d : Cart[Real, N], !((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(a, b)]) == ({} : (Cart[Real, N]) -> Bool)) && !((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(c, d)]) == ({} : (Cart[Real, N]) -> Bool)) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(a, b)])) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(c, d)]))})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(a, b)]))) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(c, d)])))"), t113))
}

///|
let brunn_minkowski_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRUNN_MINKOWSKI_INTERVAL")

///|
/// `BRUNN_MINKOWSKI_INTERVAL`
pub fn brunn_minkowski_interval() -> @kernel.Thm {
  brunn_minkowski_interval_c.get()
}

///|
/// BRUNN_MINKOWSKI_ELEMENTARY
fn step_2() -> Unit raise {
  let t1053 = @simp.asm_simp_tac(@list.List([@real.real_div_lmul(), @real.real_lt_imp_nz(), @realax.real_le_refl()]))
  let t1052 = @equal.gsym(@real.real_pow_mul())
  let t1054 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.real_root_mul()), @measure.measure_pos_le(), @cart.dimindex_nonzero(), @real.real_le_div(), t1052, @realax.real_add_ldistrib(), @realarith.real_mul_rid()])), t1053)
  let t1049 = @sets.set_tac(@list.List([]))
  let t1048 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym()), @realax.real_ge()]))
  let t1047 = @simp.asm_simp_tac(@list.List([@integration.negligible_standard_hyperplane()]))
  let t1046 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, N]) | op_dollar(x, (k : Num)) == real_of_num(0)}"))
  let t1050 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.negligible_subset()), t1046), t1047), t1048), t1049)
  let t1045 = @simp.asm_rewrite_tac(@list.List([]))
  let t1044 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))"))
  let t1043 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1051 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_inter(), @sets.in_elim_thm()])), t1043), t1044), t1045), @calc_rat.real_arith_tac), t1050])
  let t1042 = @simp.asm_simp_tac(@list.List([@measure.measurable_inter_halfspace_le(), @measure.measurable_inter_halfspace_ge()]))
  let t1041 = @tactics.match_mp_tac(@measure.measure_negligible_union_eq())
  let t1055 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.real_pow_root(), @cart.dimindex_nonzero(), @realarith.real_lt_imp_le()])), t1041), t1042), @tactics.conj_tac), t1051), t1054])
  let t1040 = @tactics.subgoal_then(@term_syntax.parse_term("(measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, (k : Num)) <= real_of_num(0)})) + (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)})) == pow(root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))"), fn(x1037 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1038 = @tactics.subst1_tac(x1037)
    fn(x1039 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1038(x1039)
    }
  })
  let t1036 = @simp.asm_simp_tac(@list.List([@transcendentals.real_pow_root(), @cart.dimindex_nonzero(), @measure.measure_pos_le(), @measure.measurable_inter_halfspace_le(), @measure.measurable_inter_halfspace_ge()]))
  let t1035 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_add_rdistrib()), @real.real_pow_mul()]))
  let t1033 = @simp.asm_rewrite_tac(@list.List([]))
  let t1034 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("(tn : Real) / (t : Real) == (sn : Real) / (s : Real) && (tp : Real) / t == (sp : Real) / s && real_of_num(0) < sp && real_of_num(0) < sn && real_of_num(0) < s && real_of_num(0) < t → tn / sn == t / s && tp / sp == t / s"))), t1033), @tactics.all_tac])
  let t1031 = @tactics.conjuncts_then(fn(x1028 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1029 = @tactics.subst1_tac(x1028)
    fn(x1030 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1029(x1030)
    }
  })
  let t1032 = @tactics.subgoal_then(@term_syntax.parse_term("measure(INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})) / measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)})) == measure(t) / measure(s) && measure(INTER(t, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)})) / measure(INTER(s, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)})) == measure(t) / measure(s)"), t1031)
  let t1027 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @equal.gsym(@transcendentals.real_root_div()), @measure.measure_pos_le(), @measure.measurable_inter_halfspace_le(), @measure.measurable_inter_halfspace_ge()]))
  let t1025 = @simp.asm_simp_tac(@list.List([@transcendentals.root_pos_lt(), @cart.dimindex_nonzero()]))
  let t1026 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (s : Real) → s + (t : Real) == s * (real_of_num(1) + t / s)")))), t1025), @tactics.all_tac])
  let t1023 = @tactics.conjuncts_then(fn(x1020 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1021 = @tactics.subst1_tac(x1020)
    fn(x1022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1021(x1022)
    }
  })
  let t1024 = @tactics.subgoal_then(@term_syntax.parse_term("root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, (k : Num)) <= real_of_num(0)}))) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)}))) == root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)}))) * (real_of_num(1) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(t, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)}))) / root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)})))) && root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)}))) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(t, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)}))) == root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)}))) * (real_of_num(1) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(t, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)}))) / root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)}))))"), t1023)
  let t1018 = @sets.set_tac(@list.List([]))
  let t1015 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.subset_trans()))
  let t1017 = @tactics.first_assum(fn(x1016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1015(x1016))
  })
  let t1014 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realax.real_ge()])))
  let t1012 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER(s, (u : (_) -> Bool)), INTER(t, u))")))
  let t1013 = @list.List([@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER(s, (u : (_) -> Bool)), INTER(u, t))"))), t1012])
  let t1010 = @sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))
  let t1011 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym()), @realax.real_ge(), t1010]))
  let t1008 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t1007 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of()])), @tactics.all_tac])
  let t1009 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool) == UNIONS((d1 : ((Cart[Real, N]) -> Bool) -> Bool))"), fn(x1004 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1005 = @tactics.subst1_tac(x1004)
    fn(x1006 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1005(x1006)
    }
  }), t1007), @tactics.conj_tac), t1008)
  let t1003 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("DIFF(INTER((s : (_) -> Bool), (u : (_) -> Bool)), INTER((t : (_) -> Bool), u)) == INTER(DIFF(s, t), u)"))]))
  let t1002 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) && SUBSET(DIFF(t, s), (u : (_) -> Bool)) → SUBSET(UNION(DIFF(s, t), DIFF(t, s)), u)")))
  let t1001 = @simp.asm_simp_tac(@list.List([@integration.negligible_standard_hyperplane()]))
  let t1000 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, N]) | op_dollar(x, (k : Num)) == real_of_num(0)}"))
  let t999 = @tactics.match_mp_tac(@integration.negligible_subset())
  let t998 = @tactics.match_mp_tac(@measure.measure_negligible_symdiff())
  let t996 = @equal.gsym(@sets.inter_unions())
  let t997 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.simple_image()), t996]))
  let t995 = @simp.rewrite_tac(@list.List([@sets.unions_insert(), @sets.union_empty()]))
  let t994 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((x : _), DELETE((s : (_) -> Bool), x)) == INSERT(x, s)"))]))
  let t993 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_insert())]))
  let t992 = @simp.gen_rewrite_tac(fn(x991 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x985 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s986 = @equal.land_conv(x985)
      fn(x987 : @kernel.Term) -> @kernel.Thm raise {
        s986(x987)
      }
    })((fn(x988 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s989 = @equal.rand_conv(x988)
      fn(x990 : @kernel.Term) -> @kernel.Thm raise {
        s989(x990)
      }
    })(x991))
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == UNION({}, s)"))]))
  let t984 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && !(x == (a : _))} == DELETE(s, a)"))]))
  let t983 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t1019 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x980 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s981 = @simp.expand_tac(x980)
    fn(x982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s981(x982)
    }
  }, @list.List(["dl", "dr"])), t983), t984), @tactics.conj_tac), t992), t993), t994), t995), t997), t998), t999), t1000), t1001), t1002), t1003), t1009), t1011), t1013), t1014), t1017), t1018), @tactics.all_tac])
  let t978 = @tactics.conjuncts_then(fn(x975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s976 = @tactics.subst1_tac(x975)
    fn(x977 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s976(x977)
    }
  })
  let t979 = @tactics.subgoal_then(@term_syntax.parse_term("measure(UNIONS((dl : ((Cart[Real, N]) -> Bool) -> Bool))) == measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})) && measure(UNIONS((dr : ((Cart[Real, N]) -> Bool) -> Bool))) == measure(INTER(s, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}))"), t978)
  let t974 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a' : Real) + (b' : Real) → a' <= (a : Real) && b' <= (b : Real) → x <= a + b")))
  let t972 = @list.List([@transcendentals.real_le_root(), @cart.dimindex_nonzero(), @realarith.real_le_add(), @transcendentals.root_pos_le(), @measure.measure_pos_le(), @measure.measurable_inter_halfspace_le(), @measure.measurable_inter_halfspace_ge(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (x >= real_of_num(0))"))])
  let t969 = @simp.basic_ss(@list.List([]))
  let t973 = @tactics.asm_tac(fn(x971 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x966 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s967 = @tactics.conv_tac(x966)
      fn(x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s967(x968)
      }
    })(((x970 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t969, 5, x970))(x971))
  })(t972)
  let t964 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t963 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (x >= real_of_num(0))")), @topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t962 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t961 = @simp.asm_rewrite_tac(@list.List([]))
  let t960 = @tactics.match_mp_tac(@topology.compact_sums())
  let t965 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@measure.measurable_compact())), t960), t961), t962), t963), t964), @tactics.all_tac])
  let t959 = @tactics.subgoal_then(@term_syntax.parse_term("measurable({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, UNIONS((dl : ((Cart[Real, N]) -> Bool) -> Bool))) && IN(y, INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)}))}) && measurable({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, UNIONS((dr : ((Cart[Real, N]) -> Bool) -> Bool))) && IN(y, INTER(t, {(x : Cart[Real, N]) | real_of_num(0) <= op_dollar(x, k)}))})"), @tactics.strip_assume_tac)
  let t958 = @list.List([@simp.asm_simp_tac(@list.List([@measure.measurable_compact()])), @tactics.all_tac])
  let t957 = @tactics.subgoal_then(@term_syntax.parse_term("measurable(UNIONS((dl : ((Cart[Real, N]) -> Bool) -> Bool))) && measurable(UNIONS((dr : ((Cart[Real, N]) -> Bool) -> Bool)))"), @tactics.strip_assume_tac)
  let t955 = @meson.asm_meson_tac(@list.List([@integration.division_of(), @topology.compact_interval()]))
  let t954 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t953 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t952 = @tactics.repeat_tac(@tactics.strip_tac)
  let t951 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @sets.in_elim_thm(), @sets.forall_in_image(), @sets.in_delete()]))
  let t950 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_image(), @sets.finite_delete()]))
  let t949 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t948 = @tactics.map_every(fn(x945 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s946 = @simp.expand_tac(x945)
    fn(x947 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s946(x947)
    }
  }, @list.List(["dl", "dr"]))
  let t956 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@topology.compact_unions())), t948), t949), t950), t951), t952), t953), t954), t955), @tactics.all_tac])
  let t944 = @tactics.subgoal_then(@term_syntax.parse_term("compact(UNIONS((dl : ((Cart[Real, N]) -> Bool) -> Bool))) && compact(UNIONS((dr : ((Cart[Real, N]) -> Bool) -> Bool)))"), @tactics.strip_assume_tac)
  let t943 = @simp.rewrite_tac(@list.List([@realax.real_ge(), @theorems.imp_imp()]))
  let t933 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t931 = @equal.gsym(@sets.inter_unions())
  let t932 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.simple_image()), t931]))
  let t930 = @simp.rewrite_tac(@list.List([@sets.unions_insert(), @sets.union_empty()]))
  let t929 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((x : _), DELETE((s : (_) -> Bool), x)) == INSERT(x, s)"))]))
  let t928 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_insert())]))
  let t927 = @simp.gen_rewrite_tac(fn(x924 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s925 = @equal.land_conv(x924)
    fn(x926 : @kernel.Term) -> @kernel.Thm raise {
      s925(x926)
    }
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == UNION({}, s)"))]))
  let t934 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && !(x == (a : _))} == DELETE(s, a)"))])), t927), t928), t929), t930), t932), @tactics.ap_thm_tac), @tactics.ap_term_tac), t933)
  let t923 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t922 = @simp.simp_tac(@list.List([@topology.subset_interior(), @sets.inter_subset()]))
  let t921 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(interior((s : (Cart[Real, _]) -> Bool)), interior((s' : (Cart[Real, _]) -> Bool))) == {} && SUBSET(interior(INTER(s, (t : (Cart[Real, _]) -> Bool))), interior(s)) && SUBSET(interior(INTER(s', t)), interior(s')) → INTER(interior(INTER(s, t)), interior(INTER(s', t))) == {}")))
  let t935 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t921), t922), t923)
  let t920 = @meson.asm_meson_tac(@list.List([]))
  let t919 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of()])))
  let t918 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER(s, (u : (_) -> Bool)), INTER(t, u))")))
  let t916 = @meson.meson_tac(@list.List([]))
  let t917 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@integration.interval_split()])), t916)])
  let t915 = @simp.asm_rewrite_tac(@list.List([]))
  let t914 = @tactics.repeat_tac(@tactics.disch_tac)
  let t913 = @tactics.repeat_tac(@tactics.gen_tac)
  let t936 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_10 = x910
    @simp.gen_rewrite_tac(fn(x912 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x912
    }, @list.List([@drule.match_mp(@integration.forall_in_division())(th_10)]))
  }), t913), t914), t915), @tactics.conj_tac), t917), t918), t919), t920), t935, t934])
  let t909 = @tactics.repeat_tac(@tactics.conj_tac)
  let t908 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm(), @sets.forall_in_image(), @sets.in_delete()]))
  let t907 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj(), @sets.forall_in_image(), @sets.in_delete()]))
  let t906 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_image(), @sets.finite_delete()]))
  let t905 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t904 = @tactics.map_every(fn(x901 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s902 = @simp.expand_tac(x901)
    fn(x903 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s902(x903)
    }
  }, @list.List(["dl", "dr"]))
  let t937 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.division_of()])), t904), t905), t906), t907), t908), t909), t936)
  let t898 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t897 = @simp.simp_tac(@list.List([@topology.subset_interior(), @sets.inter_subset()]))
  let t896 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(interior((s : (Cart[Real, _]) -> Bool)), interior((s' : (Cart[Real, _]) -> Bool))) == {} && SUBSET(interior(INTER(s, (t : (Cart[Real, _]) -> Bool))), interior(s)) && SUBSET(interior(INTER(s', t)), interior(s')) → INTER(interior(INTER(s, t)), interior(INTER(s', t))) == {}")))
  let t899 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t896), t897), t898)
  let t895 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t894 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((x : (_) -> Bool), (s : ((_) -> Bool) -> Bool)) → SUBSET(x, UNIONS(s))")))
  let t892 = @meson.meson_tac(@list.List([]))
  let t893 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@integration.interval_split()])), t892)])
  let t891 = @simp.asm_rewrite_tac(@list.List([]))
  let t890 = @tactics.repeat_tac(@tactics.disch_tac)
  let t889 = @tactics.repeat_tac(@tactics.gen_tac)
  let t900 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_9 = x886
    @simp.gen_rewrite_tac(fn(x888 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x888
    }, @list.List([@drule.match_mp(@integration.forall_in_division())(th_9)]))
  }), t889), t890), t891), @tactics.conj_tac), t893), t894), t895), t899])
  let t885 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm(), @sets.forall_in_image(), @sets.in_delete()]))
  let t884 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj(), @sets.forall_in_image(), @sets.in_delete()]))
  let t883 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_image(), @sets.finite_delete()]))
  let t882 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t881 = @tactics.map_every(fn(x878 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s879 = @simp.expand_tac(x878)
    fn(x880 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s879(x880)
    }
  }, @list.List(["dl", "dr"]))
  let t938 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.division_of()])), t881), t882), t883), t884), t885), @tactics.conj_tac), t900)
  let t877 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz()]))
  let t876 = @tactics.conv_tac(@equal.rand_conv(@equal.sym_conv))
  let t875 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lzero()]))
  let t874 = @simp.asm_simp_tac(@list.List([@measure.measure_empty(), @real.real_eq_rdiv_eq()]))
  let t939 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("measure(INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})) / measure(t) == measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)})) / measure(s)"))), t874), t875), t876), t877)
  let t871 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t870 = @simp.asm_rewrite_tac(@list.List([]))
  let t872 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!((s : (_) -> Bool) == {}) && SUBSET(s, (t : (_) -> Bool)) → !(INTER(s, t) == {})"))), t870), t871)
  let t869 = @simp.asm_rewrite_tac(@list.List([]))
  let t873 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i : (Cart[Real, N]) -> Bool)")), t869), t872])
  let t868 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_image(), @sets.in_delete(), @equal.gsym(@theorems.conj_assoc())]))
  let t867 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t866 = @tactics.map_every(fn(x863 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s864 = @simp.expand_tac(x863)
    fn(x865 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s864(x865)
    }
  }, @list.List(["dl", "dr"]))
  let t862 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @sets.member_not_empty()]))
  let t861 = @tactics.exists_tac(@term_syntax.parse_term("INTER((i : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})"))
  let t860 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t940 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_unions()])), t860), t861), t862), t866), t867), t868), @tactics.conj_tac), t873)
  let t859 = @sets.set_tac(@list.List([]))
  let t858 = @simp.asm_simp_tac(@list.List([@sets.finite_image(), @sets.finite_delete()]))
  let t857 = @tactics.match_mp_tac(@sets.card_subset())
  let t856 = @simp.asm_simp_tac(@list.List([@sets.card_image_le(), @sets.finite_delete()]))
  let t855 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("CARD({(x : _) | IN(x, IMAGE((f : (_) -> _), (s : (_) -> Bool))) && (P : (_) -> Bool)(x)}) <= CARD(IMAGE(f, s)) && CARD(IMAGE(f, s)) <= CARD(s) → CARD({(x : _) | IN(x, IMAGE(f, s)) && P(x)}) <= CARD(s)")))
  let t852 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t853 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@sets.card_psubset()), t852)])
  let t851 = @tactics.exists_tac(@term_syntax.parse_term("CARD(DELETE((d1 : ((Cart[Real, N]) -> Bool) -> Bool), (j : (Cart[Real, N]) -> Bool)))"))
  let t854 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.let_trans()), t851), @tactics.conj_tac), t853), @tactics.all_tac])
  let t850 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t849 = @tactics.map_every(fn(x846 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s847 = @simp.expand_tac(x846)
    fn(x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s847(x848)
    }
  }, @list.List(["dl", "dr"]))
  let t845 = @tactics.match_mp_tac(@arith.lte_add2())
  let t941 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("n"), t845), t849), t850), @tactics.conj_tac), t854), t855), t856), t857), t858), t859), t940, t939, t938, t937])
  let t942 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t941), @tactics.all_tac])
  let t844 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) → (r : Bool)) == (q → p → r)"))]))
  let t834 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t832 = @equal.gsym(@sets.inter_unions())
  let t833 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.simple_image()), t832]))
  let t831 = @simp.rewrite_tac(@list.List([@sets.unions_insert(), @sets.union_empty()]))
  let t830 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((x : _), DELETE((s : (_) -> Bool), x)) == INSERT(x, s)"))]))
  let t829 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_insert())]))
  let t828 = @simp.gen_rewrite_tac(fn(x825 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s826 = @equal.land_conv(x825)
    fn(x827 : @kernel.Term) -> @kernel.Thm raise {
      s826(x827)
    }
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == UNION({}, s)"))]))
  let t835 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && !(x == (a : _))} == DELETE(s, a)"))])), t828), t829), t830), t831), t833), @tactics.ap_thm_tac), @tactics.ap_term_tac), t834)
  let t824 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t823 = @simp.simp_tac(@list.List([@topology.subset_interior(), @sets.inter_subset()]))
  let t822 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(interior((s : (Cart[Real, _]) -> Bool)), interior((s' : (Cart[Real, _]) -> Bool))) == {} && SUBSET(interior(INTER(s, (t : (Cart[Real, _]) -> Bool))), interior(s)) && SUBSET(interior(INTER(s', t)), interior(s')) → INTER(interior(INTER(s, t)), interior(INTER(s', t))) == {}")))
  let t836 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t822), t823), t824)
  let t821 = @meson.asm_meson_tac(@list.List([]))
  let t820 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of()])))
  let t819 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER(s, (u : (_) -> Bool)), INTER(t, u))")))
  let t817 = @meson.meson_tac(@list.List([]))
  let t818 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@integration.interval_split()])), t817)])
  let t816 = @simp.asm_rewrite_tac(@list.List([]))
  let t815 = @tactics.repeat_tac(@tactics.disch_tac)
  let t814 = @tactics.repeat_tac(@tactics.gen_tac)
  let t837 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_8 = x811
    @simp.gen_rewrite_tac(fn(x813 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x813
    }, @list.List([@drule.match_mp(@integration.forall_in_division())(th_8)]))
  }), t814), t815), t816), @tactics.conj_tac), t818), t819), t820), t821), t836, t835])
  let t810 = @tactics.repeat_tac(@tactics.conj_tac)
  let t809 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm(), @sets.forall_in_image(), @sets.in_delete()]))
  let t808 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj(), @sets.forall_in_image(), @sets.in_delete()]))
  let t807 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_image(), @sets.finite_delete()]))
  let t806 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t805 = @tactics.map_every(fn(x802 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s803 = @simp.expand_tac(x802)
    fn(x804 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s803(x804)
    }
  }, @list.List(["dl", "dr"]))
  let t838 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.division_of()])), t805), t806), t807), t808), t809), t810), t837)
  let t799 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t798 = @simp.simp_tac(@list.List([@topology.subset_interior(), @sets.inter_subset()]))
  let t797 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER(interior((s : (Cart[Real, _]) -> Bool)), interior((s' : (Cart[Real, _]) -> Bool))) == {} && SUBSET(interior(INTER(s, (t : (Cart[Real, _]) -> Bool))), interior(s)) && SUBSET(interior(INTER(s', t)), interior(s')) → INTER(interior(INTER(s, t)), interior(INTER(s', t))) == {}")))
  let t800 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t797), t798), t799)
  let t796 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t795 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((x : (_) -> Bool), (s : ((_) -> Bool) -> Bool)) → SUBSET(x, UNIONS(s))")))
  let t793 = @meson.meson_tac(@list.List([]))
  let t794 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@integration.interval_split()])), t793)])
  let t792 = @simp.asm_rewrite_tac(@list.List([]))
  let t791 = @tactics.repeat_tac(@tactics.disch_tac)
  let t790 = @tactics.repeat_tac(@tactics.gen_tac)
  let t801 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x787
    @simp.gen_rewrite_tac(fn(x789 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x789
    }, @list.List([@drule.match_mp(@integration.forall_in_division())(th_7)]))
  }), t790), t791), t792), @tactics.conj_tac), t794), t795), t796), t800])
  let t786 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm(), @sets.forall_in_image(), @sets.in_delete()]))
  let t785 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj(), @sets.forall_in_image(), @sets.in_delete()]))
  let t784 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_image(), @sets.finite_delete()]))
  let t783 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t782 = @tactics.map_every(fn(x779 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s780 = @simp.expand_tac(x779)
    fn(x781 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s780(x781)
    }
  }, @list.List(["dl", "dr"]))
  let t839 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.division_of()])), t782), t783), t784), t785), t786), @tactics.conj_tac), t801)
  let t778 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz()]))
  let t777 = @tactics.conv_tac(@equal.rand_conv(@equal.sym_conv))
  let t776 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lzero()]))
  let t775 = @simp.asm_simp_tac(@list.List([@measure.measure_empty(), @real.real_eq_rdiv_eq()]))
  let t840 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("measure(INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) >= real_of_num(0)})) / measure(t) == measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)})) / measure(s)"))), t775), t776), t777), t778)
  let t772 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t771 = @simp.asm_rewrite_tac(@list.List([]))
  let t773 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!((s : (_) -> Bool) == {}) && SUBSET(s, (t : (_) -> Bool)) → !(INTER(s, t) == {})"))), t771), t772)
  let t770 = @simp.asm_rewrite_tac(@list.List([]))
  let t774 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(j : (Cart[Real, N]) -> Bool)")), t770), t773])
  let t769 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_image(), @sets.in_delete(), @equal.gsym(@theorems.conj_assoc())]))
  let t768 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t767 = @tactics.map_every(fn(x764 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s765 = @simp.expand_tac(x764)
    fn(x766 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s765(x766)
    }
  }, @list.List(["dl", "dr"]))
  let t763 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @sets.member_not_empty()]))
  let t762 = @tactics.exists_tac(@term_syntax.parse_term("INTER((j : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) >= real_of_num(0)})"))
  let t761 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t841 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_unions()])), t761), t762), t763), t767), t768), t769), @tactics.conj_tac), t774)
  let t760 = @sets.set_tac(@list.List([]))
  let t759 = @simp.asm_simp_tac(@list.List([@sets.finite_image(), @sets.finite_delete()]))
  let t758 = @tactics.match_mp_tac(@sets.card_subset())
  let t757 = @simp.asm_simp_tac(@list.List([@sets.card_image_le(), @sets.finite_delete()]))
  let t756 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("CARD({(x : _) | IN(x, IMAGE((f : (_) -> _), (s : (_) -> Bool))) && (P : (_) -> Bool)(x)}) <= CARD(IMAGE(f, s)) && CARD(IMAGE(f, s)) <= CARD(s) → CARD({(x : _) | IN(x, IMAGE(f, s)) && P(x)}) <= CARD(s)")))
  let t753 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t754 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@sets.card_psubset()), t753)])
  let t752 = @tactics.exists_tac(@term_syntax.parse_term("CARD(DELETE((d1 : ((Cart[Real, N]) -> Bool) -> Bool), (i : (Cart[Real, N]) -> Bool)))"))
  let t755 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.let_trans()), t752), @tactics.conj_tac), t754), @tactics.all_tac])
  let t751 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t750 = @tactics.map_every(fn(x747 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s748 = @simp.expand_tac(x747)
    fn(x749 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s748(x749)
    }
  }, @list.List(["dl", "dr"]))
  let t746 = @tactics.match_mp_tac(@arith.lte_add2())
  let t842 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("n"), t746), t750), t751), @tactics.conj_tac), t755), t756), t757), t758), t759), t760), t841, t840, t839, t838])
  let t843 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t842), @tactics.all_tac])
  let t745 = @simp.asm_rewrite_tac(@list.List([]))
  let t744 = @tactics.first_x_assum(fn(x735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x735
    let t740 = @term_syntax.parse_term("INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) >= real_of_num(0)})")
    let t741 = @term_syntax.parse_term("UNIONS((dr : ((Cart[Real, N]) -> Bool) -> Bool))")
    let t742 = @term_syntax.parse_term("{INTER(l, {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) >= real_of_num(0)}) | l : (Cart[Real, N]) -> Bool | IN(l, (d2 : ((Cart[Real, N]) -> Bool) -> Bool)) && !(INTER(l, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}) == {})}")
    let t743 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(dr : ((Cart[Real, N]) -> Bool) -> Bool)"), t742, t741, t740]), th_6))
    let t737 = @term_syntax.parse_term("INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})")
    let t738 = @term_syntax.parse_term("UNIONS((dl : ((Cart[Real, N]) -> Bool) -> Bool))")
    let t739 = @term_syntax.parse_term("{INTER(l, {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)}) | l : (Cart[Real, N]) -> Bool | IN(l, (d2 : ((Cart[Real, N]) -> Bool) -> Bool)) && !(INTER(l, {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)}) == {})}")
    @tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(dl : ((Cart[Real, N]) -> Bool) -> Bool)"), t739, t738, t737]), th_6)), t743)
  })
  let t733 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t732 = @simp.rewrite_tac(@list.List([@integration.division_of()]))
  let t731 = @tactics.undisch_tac(@term_syntax.parse_term("division_of((d1 : ((Cart[Real, N]) -> Bool) -> Bool), (s : (Cart[Real, N]) -> Bool))"))
  let t730 = @simp.asm_rewrite_tac(@list.List([@sets.subset_inter()]))
  let t729 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@integration.negligible_subset()))
  let t728 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t726 = @tactics.undisch_tac(@term_syntax.parse_term("!negligible((j : (Cart[Real, N]) -> Bool))"))
  let t727 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("!negligible((i : (Cart[Real, N]) -> Bool))")), t726])
  let t734 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@measure.measurable_measure_pos_lt(), @measure.measurable_inter_halfspace_le(), @measure.measurable_inter_halfspace_ge()])), @tactics.conj_tac), t727), t728), t729), t730), t731), t732), t733), @tactics.all_tac])
  let t725 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})) && real_of_num(0) < measure(INTER(s, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}))"), @tactics.strip_assume_tac)
  let t721 = @sets.set_tac(@list.List([]))
  let t720 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t719 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t718 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t717 = @tactics.match_mp_tac(@topology.compact_union())
  let t716 = @tactics.match_mp_tac(@topology.compact_sums())
  let t722 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t716), @tactics.conj_tac), t717), @tactics.conj_tac), t718), t719), t720)
  let t715 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t714 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t713 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t712 = @tactics.match_mp_tac(@topology.compact_sums())
  let t711 = @tactics.match_mp_tac(@measure.measurable_compact())
  let t723 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_union()), @tactics.conj_tac), t711), t712), @tactics.conj_tac), t713), t714), t715), t722, t721])
  let t710 = @tactics.repeat_tac(@tactics.conj_tac)
  let t709 = @tactics.match_mp_tac(@measure.measure_subset())
  let t707 = @tactics.disch_then(fn(x706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s704 = @tactics.subst1_tac(x703)
      fn(x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s704(x705)
      }
    })(@equal.sym(x706))
  })
  let t702 = @simp.simp_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm(), @realarith.real_le_add(), @vectors.vector_add_component(), @realax.real_ge(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= real_of_num(0) && (y : Real) <= real_of_num(0) → x + y <= real_of_num(0)"))]))
  let t701 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_gspec()]))
  let t700 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), {(x : _) | (P : (_) -> Bool)(x)}) && SUBSET((t : (_) -> Bool), {(x : _) | (Q : (_) -> Bool)(x)}) → SUBSET(INTER(s, t), {(x : _) | P(x) && Q(x)})")))
  let t699 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())]))
  let t698 = @simp.asm_simp_tac(@list.List([@integration.negligible_standard_hyperplane()]))
  let t697 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, N]) | op_dollar(x, (k : Num)) == real_of_num(0)}"))
  let t696 = @tactics.match_mp_tac(@integration.negligible_subset())
  let t695 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t694 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t693 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t692 = @tactics.match_mp_tac(@topology.compact_sums())
  let t708 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t692), @tactics.conj_tac), t693), t694), t695), @tactics.all_tac]))), t696), t697), t698), t699), t700), t701), t702), t707])
  let t686 = @drule.part_match(fn(x685 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x685))
  }, @measure.measure_negligible_union())
  let t680 = @tactics.disch_then(fn(x671 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x671
    @simp.gen_rewrite_tac(fn(x679 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x673 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s674 = @equal.rand_conv(x673)
        fn(x675 : @kernel.Term) -> @kernel.Thm raise {
          s674(x675)
        }
      })((fn(x676 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s677 = @equal.once_depth_conv(x676)
        fn(x678 : @kernel.Term) -> @kernel.Thm raise {
          s677(x678)
        }
      })(x679))
    }, @list.List([th_5]))
  })
  let t681 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x)) → (s : (_) -> Bool) == UNION(INTER(s, {(x : _) | P(x)}), INTER(s, {(x : _) | Q(x)}))")))), @calc_rat.real_arith_tac), t680])
  let t670 = @tactics.subgoal_then(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool) == UNION(INTER(s, {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)}), INTER(s, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)})) && (t : (Cart[Real, N]) -> Bool) == UNION(INTER(t, {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)}), INTER(t, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}))"), fn(x667 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s668 = @tactics.mp_tac(x667)
    fn(x669 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s668(x669)
    }
  })
  let t661 = @meson.asm_meson_tac(@list.List([@sets.in_unions()]))
  let t660 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of()])))
  let t659 = @simp.simp_tac(@list.List([@sets.in_delete(), @sets.in_inter(), @sets.in_elim_thm()]))
  let t658 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t657 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_unions()]))
  let t656 = @tactics.map_every(fn(x653 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s654 = @simp.expand_tac(x653)
    fn(x655 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s654(x655)
    }
  }, @list.List(["dl", "dr"]))
  let t662 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (Cart[Real, N]) -> Bool), (s' : (Cart[Real, N]) -> Bool)) → SUBSET({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s) && IN(y, (t : (Cart[Real, N]) -> Bool))}, {(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s') && IN(y, t)})"))), t656), t657), t658), t659), t660), t661)
  let t652 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t651 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t650 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t649 = @tactics.match_mp_tac(@topology.compact_sums())
  let t663 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t649), @tactics.conj_tac), t650), t651), t652)
  let t646 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t645 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t647 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.compact_inter_closed()), t645), t646)
  let t644 = @simp.asm_simp_tac(@list.List([@integration.interval_split(), @topology.compact_interval()]))
  let t643 = @tactics.first_assum(fn(x640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x640
    @simp.gen_rewrite_tac(fn(x642 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x642
    }, @list.List([@drule.match_mp(@integration.forall_in_division())(th_4)]))
  })
  let t639 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj(), @sets.forall_in_image(), @sets.in_delete()]))
  let t638 = @simp.asm_simp_tac(@list.List([@sets.in_delete(), @sets.finite_delete(), @sets.finite_image(), @sets.finite_restrict(), @theorems.imp_conj()]))
  let t637 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | IN(x, (s : (_) -> Bool)) && !(f(x) == (a : _))} == {(t : _) | IN(t, IMAGE(f, s)) && !(t == a)}"))]))
  let t636 = @tactics.map_every(fn(x633 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s634 = @simp.expand_tac(x633)
    fn(x635 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s634(x635)
    }
  }, @list.List(["dl", "dr"]))
  let t648 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.compact_unions()), t636), t637), t638), t639), t643), t644), t647])
  let t632 = @tactics.match_mp_tac(@topology.compact_sums())
  let t664 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t632), @tactics.conj_tac), t648), t663, t662])
  let t631 = @tactics.repeat_tac(@tactics.conj_tac)
  let t665 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@measure.measure_subset()), t631), t664)
  let t666 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_add2()), @tactics.conj_tac), t665), @tactics.all_tac])
  let t630 = @tactics.exists_tac(@term_syntax.parse_term("measure({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})) && IN(y, INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)}))}) + measure({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, INTER(s, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)})) && IN(y, INTER(t, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}))})"))
  let t724 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t630), @tactics.conj_tac), t666), t670), t681), fn(x691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x690 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x688 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x687 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s683 = @tactics.mp_tac(x682)
            fn(x684 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s683(x684)
            }
          })(t686(x687))
        })(@equal.lhand(x688))
      })((fn(x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x689.1
      })(x690))
    })(x691)(x691)
  }), @tactics.ants_tac), t708), t709), t710), t723)])
  let t629 = @tactics.exists_tac(@term_syntax.parse_term("measure({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, UNIONS((dl : ((Cart[Real, N]) -> Bool) -> Bool))) && IN(y, INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)}))}) + measure({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, UNIONS((dr : ((Cart[Real, N]) -> Bool) -> Bool))) && IN(y, INTER(t, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}))})"))
  let t628 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t627 = @simp.abbrev_tac(@term_syntax.parse_term("(dr : ((Cart[Real, N]) -> Bool) -> Bool) == {INTER(l, {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) >= real_of_num(0)}) | l : (Cart[Real, N]) -> Bool | IN(l, DELETE((d1 : ((Cart[Real, N]) -> Bool) -> Bool), (i : (Cart[Real, N]) -> Bool))) && !(INTER(l, {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}) == {})}"))
  let t626 = @simp.abbrev_tac(@term_syntax.parse_term("(dl : ((Cart[Real, N]) -> Bool) -> Bool) == {INTER(l, {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)}) | l : (Cart[Real, N]) -> Bool | IN(l, DELETE((d1 : ((Cart[Real, N]) -> Bool) -> Bool), (j : (Cart[Real, N]) -> Bool))) && !(INTER(l, {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)}) == {})}"))
  let t625 = @tactics.disch_then(fn(x622 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s623 = @tactics.subst1_tac(x622)
    fn(x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s623(x624)
    }
  })
  let t621 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @measure.measure_pos_le(), @transcendentals.root_pos_le(), @realarith.real_le_add()]))
  let t616 = @drule.part_match(fn(x615 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x615))
  }, @transcendentals.real_le_root())
  let t611 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of_finite()])), @tactics.all_tac])
  let t610 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && FINITE((d2 : ((Cart[Real, N]) -> Bool) -> Bool))"), @tactics.strip_assume_tac)
  let t609 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measurable_measure_pos_lt()])), @tactics.all_tac])
  let t608 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < measure((s : (Cart[Real, N]) -> Bool)) && real_of_num(0) < measure((t : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t606 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t605 = @tactics.match_mp_tac(@topology.compact_sums())
  let t607 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t605), t606), @tactics.all_tac])
  let t604 = @tactics.subgoal_then(@term_syntax.parse_term("measurable({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, (s : (Cart[Real, N]) -> Bool)) && IN(y, (t : (Cart[Real, N]) -> Bool))})"), fn(x601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s602 = @tactics.assume_tac(x601)
    fn(x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s602(x603)
    }
  })
  let t600 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measurable_elementary()])), @tactics.all_tac])
  let t599 = @tactics.subgoal_then(@term_syntax.parse_term("measurable((s : (Cart[Real, N]) -> Bool)) && measurable((t : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t598 = @simp.rewrite_tac(@list.List([@realax.real_ge()]))
  let t597 = @tactics.repeat_tac(@tactics.strip_tac)
  let t593 = @simp.rewrite_tac(@list.List([@measure.measure_translation()]))
  let t592 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : Cart[Real, N]) + ((x : Cart[Real, N]) + (y : Cart[Real, N])) | IN(x, (s : (Cart[Real, N]) -> Bool)) && IN(y, (t : (Cart[Real, N]) -> Bool))} == IMAGE((z : Cart[Real, N]) => a + z, {(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s) && IN(y, t)})"))]))
  let t591 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) + ((a : Cart[Real, N]) + (y : Cart[Real, N])) == a + (x + y)"))]))
  let t590 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_, _) -> _)((x : _), (y : _)) | IN(x, (s : (_) -> Bool)) && IN(y, IMAGE((g : (_) -> _), (t : (_) -> Bool)))} == {f((x : _), g((y : _))) | IN(x, s) && IN(y, t)}"))]))
  let t589 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a' : Real) == (a : Real) → a' >= (b : Real) → a >= b")))
  let t594 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@measure.measure_translation()])), t589), @tactics.ap_term_tac), t590), t591), t592), t593)
  let t583 = @simp.asm_simp_tac(@list.List([@integration.negligible_standard_hyperplane()]))
  let t582 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= (a : Real) && x >= a) == (x == a)"))]))
  let t581 = @tactics.match_mp_tac(@meson.meson(@list.List([@integration.negligible_subset(), @sets.inter_subset()]), @term_syntax.parse_term("negligible((t : (Cart[Real, _]) -> Bool)) → negligible(INTER((s : (Cart[Real, _]) -> Bool), t))")))
  let t584 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER(INTER((t : (_) -> Bool), {(x : _) | (P : (_) -> Bool)(x)}), INTER(t, {(x : _) | (Q : (_) -> Bool)(x)})) == INTER(t, {(x : _) | P(x) && Q(x)})"))])), t581), t582), t583)
  let t585 = @tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x)) → UNION(INTER((s : (_) -> Bool), {(x : _) | P(x)}), INTER(s, {(x : _) | Q(x)})) == s"))), @calc_rat.real_arith_tac)
  let t580 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t579 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t578 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t586 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t578), t579), t580)
  let t577 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t576 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le(), @topology.closed_halfspace_component_ge()]))
  let t575 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t587 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t575), t576), t577), t586, t585, t584])
  let t588 = @tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t587)
  let t574 = @tactics.match_mp_tac(@measure.measure_negligible_union_eq())
  let t573 = @simp.asm_rewrite_tac(@list.List([]))
  let t572 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (s : Real) && real_of_num(0) < (t : Real) && (t' : Real) / t == (s' : Real) / s && s' + (s'' : Real) == s && t' + (t'' : Real) == t → t' / t == s' / s && t'' / t == s'' / s")))
  let t571 = @simp.rewrite_tac(@list.List([@measure.measure_translation()]))
  let t569 = @tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.real_arith_tac, @vectors.vector_arith_tac]))
  let t568 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N]) => op_pct((a : Real), basis((k : Num))) + x"))
  let t567 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.basis_component(), @vectors.vector_neg_component()]))
  let t570 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ g : (_) -> _, (∀ x : _, IN((f : (_) -> _)(x), (s' : (_) -> Bool)) == IN(x, (s : (_) -> Bool))) && (∀ x : _, g(f(x)) == x) → INTER(IMAGE(f, (t : (_) -> Bool)), s') == IMAGE(f, INTER(t, s))")))), t567), t568), t569), @tactics.all_tac])
  let t565 = @tactics.conjuncts_then(fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s563 = @tactics.subst1_tac(x562)
    fn(x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s563(x564)
    }
  })
  let t566 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(IMAGE((x : Cart[Real, N]) => -op_pct((a : Real), basis((k : Num))) + x, (t : (Cart[Real, N]) -> Bool)), {(x : Cart[Real, N]) | op_dollar(x, k) >= real_of_num(0)}) == IMAGE((x : Cart[Real, N]) => -op_pct(a, basis(k)) + x, INTER(t, {(x : Cart[Real, N]) | op_dollar(x, k) >= a})) && INTER(IMAGE((x : Cart[Real, N]) => -op_pct(a, basis(k)) + x, t), {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)}) == IMAGE((x : Cart[Real, N]) => -op_pct(a, basis(k)) + x, INTER(t, {(x : Cart[Real, N]) | op_dollar(x, k) <= a}))"), t565)
  let t561 = @simp.rewrite_tac(@list.List([@sets.injective_image()]))
  let t560 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (Q : (_, _) -> Bool)(x, y) → (R : (_, _) -> Bool)(x, y)) → (∀ x : _, ∀ y : _, (P : (_) -> Bool)(x) && P(y) && Q(x, y) → R(x, y))")))
  let t559 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@integration.division_of_finite()]))])
  let t558 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t595 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("n"), @tactics.ap_term_tac), t558), @tactics.conj_tac), t559), t560), t561), @vectors.vector_arith_tac), @tactics.all_tac])), t566), t570), t571), t572), t573), @tactics.conj_tac), t574), t588), t594])
  let t557 = @simp.asm_rewrite_tac(@list.List([@sets.image_eq_empty()]))
  let t556 = @simp.asm_rewrite_tac(@list.List([@measure.negligible_translation_eq(), @integration.division_of_translation()]))
  let t555 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (a : Cart[Real, N]) == -a + x"))]))
  let t554 = @simp.asm_rewrite_tac(@list.List([]))
  let t544 = @term_syntax.parse_term("(k : Num)")
  let t545 = @term_syntax.parse_term("(j : (Cart[Real, N]) -> Bool)")
  let t546 = @term_syntax.parse_term("(i : (Cart[Real, N]) -> Bool)")
  let t547 = @term_syntax.parse_term("IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num))), (t : (Cart[Real, N]) -> Bool))")
  let t548 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t549 = @term_syntax.parse_term("IMAGE(IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num)))), (d2 : ((Cart[Real, N]) -> Bool) -> Bool))")
  let t550 = @list.List([@term_syntax.parse_term("(d1 : ((Cart[Real, N]) -> Bool) -> Bool)"), t549, t548, t547, t546, t545, t544])
  let t553 = @tactics.first_x_assum(fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x541 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s542 = @tactics.mp_tac(x541)
      fn(x543 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s542(x543)
      }
    })(((x551 : @kernel.Thm) => @bool.specl(t550, x551))(x552))
  })
  let t539 = @meson.asm_meson_tac(@list.List([@measure.measurable_elementary()]))
  let t538 = @tactics.match_mp_tac(@realanalysis.real_continuous_measure_in_halfspace_le())
  let t537 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t536 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t535 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_rmul())
  let t534 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t531 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (b : Real) → x <= b"))]))
  let t530 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm()]))
  let t529 = @simp.asm_simp_tac(@list.List([@real.real_eq_ldiv_eq(), @realax.real_mul_lid()]))
  let t527 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(u : Real) <= real_of_num(1) → (x : Real) == real_of_num(1) → u <= x")))
  let t532 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t527(x528))
  }), t529), @tactics.ap_term_tac), t530), t531)
  let t526 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (b : Real) → -b <= x"))]))
  let t525 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_inter(), @sets.in_elim_thm(), @equal.gsym(@realax.real_le_antisym())]))
  let t524 = @simp.asm_simp_tac(@list.List([@integration.negligible_standard_hyperplane()]))
  let t523 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, N]) | op_dollar(x, (k : Num)) == -(b : Real)}"))
  let t522 = @tactics.match_mp_tac(@integration.negligible_subset())
  let t521 = @tactics.match_mp_tac(@measure.measure_eq_0())
  let t520 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realarith.real_entire()]))
  let t518 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (u : Real) → (x : Real) == real_of_num(0) → x <= u")))
  let t533 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t518(x519))
  }), t520), @tactics.disj1_tac), t521), t522), t523), t524), t525), t526), t532])
  let t517 = @tactics.repeat_tac(@tactics.conj_tac)
  let t516 = @tactics.match_mp_tac(@realanalysis.real_ivt_increasing())
  let t515 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Real, IN(a, real_interval([(-(b : Real), b)])) && measure(INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= a})) / measure(t) == (u : Real)"), fn(x513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x513
    @meson.meson_tac(@list.List([th_3]))
  })
  let t511 = @meson.asm_meson_tac(@list.List([@vectors.component_le_norm(), @realax.real_le_trans()]))
  let t510 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t508 = @simp.rewrite_tac(@list.List([@topology.bounded_pos()]))
  let t509 = @list.List([@meson.asm_meson_tac(@list.List([@integration.elementary_bounded()])), t508])
  let t512 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("bounded((t : (Cart[Real, N]) -> Bool))"), fn(x505 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s506 = @tactics.mp_tac(x505)
    fn(x507 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s506(x507)
    }
  }), t509), t510), t511), @tactics.all_tac])
  let t504 = @tactics.subgoal_then(@term_syntax.parse_term("∃ b : Real, real_of_num(0) < b && (∀ x : Cart[Real, N], IN(x, (t : (Cart[Real, N]) -> Bool)) → abs(op_dollar(x, (k : Num))) <= b)"), @tactics.strip_assume_tac)
  let t503 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Real)"))
  let t500 = @term_syntax.parse_term("(u : Real)")
  let t501 = @tactics.spec_tac(@term_syntax.parse_term("measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})) / measure(s)"), t500)
  let t499 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t498 = @simp.rewrite_tac(@list.List([@topology.closed_halfspace_component_le()]))
  let t497 = @tactics.match_mp_tac(@topology.compact_inter_closed())
  let t496 = @tactics.match_mp_tac(@measure.measurable_compact())
  let t492 = @sets.set_tac(@list.List([]))
  let t493 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@measure.measurable_elementary()])), t492])
  let t491 = @tactics.repeat_tac(@tactics.conj_tac)
  let t490 = @tactics.match_mp_tac(@measure.measure_subset())
  let t494 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_mul_lid()])), t490), t491), t493)
  let t495 = @list.List([@tactics.match_mp_tac(@measure.measure_pos_le()), t494])
  let t502 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_le_ldiv_eq(), @calc_int.real_mul_lzero()])), @tactics.conj_tac), t495), t496), t497), t498), t499), t501])
  let t540 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= real_of_num(0)})) / measure(s) && measure(INTER(s, {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)})) / measure(s) <= real_of_num(1)"), fn(x487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s488 = @tactics.mp_tac(x487)
    fn(x489 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s488(x489)
    }
  }), t502), t503), @tactics.strip_tac), t504), t512), t515), t516), t517), t533), t534), t535), t536), @tactics.gen_tac), @tactics.disch_tac), t537), t538), t539), @tactics.all_tac])
  let t486 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Real, measure(INTER((t : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, (k : Num)) <= a})) / measure(t) == measure(INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, k) <= real_of_num(0)})) / measure(s)"), @tactics.strip_assume_tac)
  let t485 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measurable_measure_pos_lt(), @measure.measurable_elementary()])), @tactics.all_tac])
  let t484 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < measure((s : (Cart[Real, N]) -> Bool)) && real_of_num(0) < measure((t : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t483 = @tactics.repeat_tac(@tactics.strip_tac)
  let t596 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), @tactics.disch_tac), t483), t484), t485), t486), t540), t553), t554), t555), t556), t557), @tactics.ants_tac), t595)])
  let t481 = @tactics.subgoal_then(@term_syntax.parse_term("∀ d1 : ((Cart[Real, N]) -> Bool) -> Bool, ∀ d2 : ((Cart[Real, N]) -> Bool) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, ∀ i : (Cart[Real, N]) -> Bool, ∀ j : (Cart[Real, N]) -> Bool, ∀ k : Num, (CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)(d1) + (CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)(d2) == (n : Num) && 1 <= k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && !(i == j) && (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(i, d1) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(i, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)}) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(i) && (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(j, d1) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(j, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)}) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(j) && (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(t, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)})) / (measure : ((Cart[Real, N]) -> Bool) -> Real)(t) == (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)})) / (measure : ((Cart[Real, N]) -> Bool) -> Real)(s) && (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(t, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)})) / (measure : ((Cart[Real, N]) -> Bool) -> Real)(t) == (measure : ((Cart[Real, N]) -> Bool) -> Real)((INTER : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)})) / (measure : ((Cart[Real, N]) -> Bool) -> Real)(s) && !(s == ({} : (Cart[Real, N]) -> Bool)) && !(t == ({} : (Cart[Real, N]) -> Bool)) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(s) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(t) && (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(d1, s) && (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(d2, t) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(t))"), fn(x478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s479 = @tactics.mp_tac(x478)
    fn(x480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s479(x480)
    }
  })
  let t461 = @simp.rewrite_tac(@list.List([@measure.measure_translation()]))
  let t460 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(a : Cart[Real, N]) + ((x : Cart[Real, N]) + (y : Cart[Real, N])) | IN(x, (s : (Cart[Real, N]) -> Bool)) && IN(y, (t : (Cart[Real, N]) -> Bool))} == IMAGE((z : Cart[Real, N]) => a + z, {(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s) && IN(y, t)})"))]))
  let t458 = @sets.set_rule(@term_syntax.parse_term("{(f : (_, _) -> _)((x : _), (y : _)) | IN(x, IMAGE((g : (_) -> _), (s : (_) -> Bool))) && IN(y, (t : (_) -> Bool))} == {f(g((x : _)), (y : _)) | IN(x, s) && IN(y, t)}"))
  let t459 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vector_add_assoc()), t458]))
  let t457 = @simp.rewrite_tac(@list.List([@measure.measure_translation()]))
  let t456 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (a : Cart[Real, N]) == -a + x"))]))
  let t462 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (a' : Real) && (b : Real) == (b' : Real) → a >= b + (c : Real) → a' >= b' + c"))), t456), t457), t459), t460), t461)
  let t455 = @simp.asm_rewrite_tac(@list.List([@integration.division_of_translation()]))
  let t463 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (a : Cart[Real, N]) == -a + x"))])), t455)
  let t454 = @simp.asm_rewrite_tac(@list.List([@measure.negligible_translation_eq()]))
  let t464 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (a : Cart[Real, N]) == -a + x"))])), t454)
  let t465 = @simp.asm_rewrite_tac(@list.List([@sets.image_eq_empty()]))
  let t453 = @meson.asm_meson_tac(@list.List([@measure.negligible_interval(), @topology.interior_closed_interval()]))
  let t452 = @simp.asm_rewrite_tac(@list.List([@measure.negligible_translation_eq()]))
  let t466 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (a : Cart[Real, N]) == -a + x"))])), t452), t453)
  let t451 = @meson.asm_meson_tac(@list.List([@measure.negligible_interval(), @topology.interior_closed_interval()]))
  let t450 = @simp.asm_rewrite_tac(@list.List([@measure.negligible_translation_eq()]))
  let t467 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - (a : Cart[Real, N]) == -a + x"))])), t450), t451)
  let t449 = @meson.asm_meson_tac(@list.List([@realax.real_le_trans()]))
  let t448 = @simp.rewrite_tac(@list.List([@vectors.in_interval()]))
  let t447 = @simp.asm_simp_tac(@list.List([@vectors.vector_sub_component(), @vectors.vector_mul_component(), @vectors.basis_component(), @realarith.real_mul_rid(), @real.real_le_sub_ladd(), @realax.real_add_lid()]))
  let t468 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_elim_thm(), @realax.real_ge()])), t447), t448), t449)
  let t446 = @meson.asm_meson_tac(@list.List([]))
  let t469 = @tactics.then_tac(@tactics.match_mp_tac(@sets.fun_in_image()), t446)
  let t445 = @meson.asm_meson_tac(@list.List([@realax.real_le_trans()]))
  let t444 = @simp.rewrite_tac(@list.List([@vectors.in_interval()]))
  let t443 = @simp.asm_simp_tac(@list.List([@vectors.vector_sub_component(), @vectors.vector_mul_component(), @vectors.basis_component(), @realarith.real_mul_rid(), @real.real_le_sub_radd(), @realax.real_add_lid()]))
  let t470 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_elim_thm()])), t443), t444), t445)
  let t442 = @meson.asm_meson_tac(@list.List([]))
  let t471 = @tactics.then_tac(@tactics.match_mp_tac(@sets.fun_in_image()), t442)
  let t441 = @meson.asm_meson_tac(@list.List([]))
  let t440 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, N]) - (a : Cart[Real, N]) == (y : Cart[Real, N]) - a) == (x == y)"))]))
  let t472 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, ∀ y : _, (f : (_) -> _)(x) == f(y) → x == y) && !((s : (_) -> Bool) == (t : (_) -> Bool)) → !(IMAGE(f, s) == IMAGE(f, t))"))), t440), t441)
  let t439 = @simp.rewrite_tac(@list.List([@sets.injective_image()]))
  let t438 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (Q : (_, _) -> Bool)(x, y) → (R : (_, _) -> Bool)(x, y)) → (∀ x : _, ∀ y : _, (P : (_) -> Bool)(x) && P(y) && Q(x, y) → R(x, y))")))
  let t437 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@integration.division_of_finite()]))])
  let t436 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t473 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("n"), @tactics.ap_thm_tac), @tactics.ap_term_tac), t436), @tactics.conj_tac), t437), t438), t439), @vectors.vector_arith_tac), t472, t471, t470, t469, t468, t467, t466, t465, t464, t463, t462])
  let t435 = @tactics.repeat_tac(@tactics.conj_tac)
  let t474 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.ants_tac), t435), t473)
  let t428 = @term_syntax.parse_term("(k : Num)")
  let t429 = @term_syntax.parse_term("IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num))), (i : (Cart[Real, N]) -> Bool))")
  let t430 = @list.List([@term_syntax.parse_term("IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num))), (j : (Cart[Real, N]) -> Bool))"), t429, t428])
  let t433 = @tactics.disch_then(fn(x432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s426 = @tactics.mp_tac(x425)
      fn(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s426(x427)
      }
    })(((x431 : @kernel.Thm) => @bool.specl(t430, x431))(x432))
  })
  let t420 = @term_syntax.parse_term("(k : Num)")
  let t421 = @term_syntax.parse_term("IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num))), (j : (Cart[Real, N]) -> Bool))")
  let t422 = @list.List([@term_syntax.parse_term("IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num))), (i : (Cart[Real, N]) -> Bool))"), t421, t420])
  let t434 = @list.List([@tactics.disch_then(fn(x424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s418 = @tactics.mp_tac(x417)
      fn(x419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s418(x419)
      }
    })(((x423 : @kernel.Thm) => @bool.specl(t422, x423))(x424))
  }), t433])
  let t410 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t411 = @term_syntax.parse_term("IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num))), (s : (Cart[Real, N]) -> Bool))")
  let t412 = @term_syntax.parse_term("(d2 : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t413 = @list.List([@term_syntax.parse_term("IMAGE(IMAGE((x : Cart[Real, N]) => x - op_pct((a : Real), basis((k : Num)))), (d1 : ((Cart[Real, N]) -> Bool) -> Bool))"), t412, t411, t410])
  let t416 = @tactics.first_x_assum(fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x407 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s408 = @tactics.mp_tac(x407)
      fn(x409 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s408(x409)
      }
    })(((x414 : @kernel.Thm) => @bool.specl(t413, x414))(x415))
  })
  let t405 = @meson.asm_meson_tac(@list.List([]))
  let t404 = @simp.rewrite_tac(@list.List([@topology.interior_closed_interval(), @vectors.interval_ne_empty()]))
  let t403 = @tactics.disch_then(fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x400
    let t402 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("interval([((w : Cart[Real, N]), (z : Cart[Real, N]))])"), th_2))
    @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("interval([((u : Cart[Real, N]), (v : Cart[Real, N]))])"), th_2)), t402)
  })
  let t406 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ i : (Cart[Real, N]) -> Bool, IN(i, (d1 : ((Cart[Real, N]) -> Bool) -> Bool)) → !(interior(i) == {})")), t403), t404), t405), @tactics.all_tac])
  let t397 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("min((v : Real), (z : Real)) <= (a : Real) && a <= max((u : Real), (w : Real)) → u < v && w < z → u <= a && v <= a && a <= w && a <= z || w <= a && z <= a && a <= u && a <= v")))
  let t399 = @tactics.disch_then(fn(x398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s395 = @tactics.mp_tac(x394)
      fn(x396 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s395(x396)
      }
    })(t397(x398))
  })
  let t393 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Real)"))(fn(x390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s391 = @tactics.mp_tac(x390)
    fn(x392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s391(x392)
    }
  }))
  let t389 = @simp.gen_rewrite_tac(fn(x386 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s387 = @equal.land_conv(x386)
    fn(x388 : @kernel.Term) -> @kernel.Thm raise {
      s387(x388)
    }
  }, @list.List([@misc.real_le_between()]))
  let t384 = @kernel.assume_rule(@term_syntax.parse_term("(k : Num) <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"))
  let t385 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @kernel.assume_rule(@term_syntax.parse_term("1 <= (k : Num)")), t384]))
  let t383 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s378 = @tactics.assume_tac(x377)
    fn(x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s378(x379)
    }
  }, fn(x380 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s381 = @tactics.mp_tac(x380)
    fn(x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s381(x382)
    }
  })))
  let t376 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(fn(x373 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s374 = @tactics.mp_tac(x373)
    fn(x375 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s374(x375)
    }
  }))
  let t372 = @simp.rewrite_tac(@list.List([@topology.interior_closed_interval(), @vectors.interval_eq_empty()]))
  let t371 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.interior_inter()), @vectors.inter_interval()]))
  let t370 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of_v1()])), @tactics.all_tac])
  let t369 = @tactics.subgoal_then(@term_syntax.parse_term("∃ u : Cart[Real, N], ∃ v : Cart[Real, N], ∃ w : Cart[Real, N], ∃ z : Cart[Real, N], (i : (Cart[Real, N]) -> Bool) == interval([(u, v)]) && (j : (Cart[Real, N]) -> Bool) == interval([(w, z)])"), @tactics.strip_assume_tac)
  let t368 = @simp.asm_rewrite_tac(@list.List([]))
  let t363 = @term_syntax.parse_term("(j : (Cart[Real, N]) -> Bool)")
  let t364 = @list.List([@term_syntax.parse_term("(i : (Cart[Real, N]) -> Bool)"), t363])
  let t367 = @tactics.disch_then(fn(x366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s361 = @tactics.mp_tac(x360)
      fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s361(x362)
      }
    })(((x365 : @kernel.Thm) => @bool.specl(t364, x365))(x366))
  })
  let t359 = @tactics.disch_then(fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x357 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s354 = @tactics.mp_tac(x353)
        fn(x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s354(x355)
        }
      })(((x356 : @list.List[@kernel.Thm]) => @lib.el(2, x356))(x357))
    })(@bool.conjuncts_rule(x358))
  })
  let t352 = @simp.rewrite_tac(@list.List([@integration.division_of()]))
  let t351 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("division_of((d1 : ((Cart[Real, N]) -> Bool) -> Bool), (s : (Cart[Real, N]) -> Bool))")))
  let t350 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2(), @sets.insert_subset(), @sets.empty_subset()]))
  let t349 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool)) == (r && p && q)"))]))
  let t348 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(j : (Cart[Real, N]) -> Bool)"))(fn(x345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s346 = @tactics.mp_tac(x345)
    fn(x347 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s346(x347)
    }
  }))
  let t344 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t343 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : (Cart[Real, N]) -> Bool)"))(fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s341 = @tactics.mp_tac(x340)
    fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s341(x342)
    }
  }))
  let t339 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t338 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t337 = @tactics.conv_tac(@equal.land_conv(@equal.once_depth_conv(@sets.has_size_conv)))
  let t335 = @simp.asm_rewrite_tac(@list.List([]))
  let t333 = @drule.match_mp(@integration.division_of_finite())
  let t331 = @drule.match_mp(@sets.choose_subset())
  let t336 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.match_mp_tac(t331(x332))
    })(t333(x334))
  }), t335), @tactics.all_tac])
  let t330 = @tactics.subgoal_then(@term_syntax.parse_term("∃ d : ((Cart[Real, N]) -> Bool) -> Bool, SUBSET(d, (d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && HAS_SIZE(d, 2)"), fn(x327 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s328 = @tactics.mp_tac(x327)
    fn(x329 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s328(x329)
    }
  })
  let t326 = @tactics.remove_then("*", fn(x325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t324 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (a → !b)"))]))
  let t322 = @simp.gen_rewrite_rule(fn(x321 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x321
  }, @list.List([@class.not_exists_thm()]))
  let t475 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s319 = @tactics.mp_tac(x318)
      fn(x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s319(x320)
      }
    })(t322(x323))
  }), t324), @tactics.disch_tac), t326), t330), t336), t337), t338), t339), t343), t344), t348), t349), t350), @tactics.strip_tac), t351), t352), t359), t367), t368), t369), t370), t371), t372), t376), t383), t385), t389), t393), t399), @tactics.ants_tac), t406), @tactics.strip_tac), t416), t434), t474)
  let t311 = @simp.asm_rewrite_tac(@list.List([]))
  let t310 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of()])))
  let t308 = @sets.set_rule(@term_syntax.parse_term("UNION({(x : _) | IN(x, (s : (_) -> Bool)) && !(Q : (_) -> Bool)(x)}, {(x : _) | IN(x, s) && Q(x)}) == s"))
  let t309 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_union()), t308]))
  let t312 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("UNION((s' : (_) -> Bool), (s'' : (_) -> Bool)) == (s : (_) -> Bool) → SUBSET(UNION(DIFF(s', s), DIFF(s, s')), s'')"))), t309), t310), t311)
  let t305 = @simp.rewrite_tac(@list.List([@topology.interior_closed_interval(), @measure.negligible_interval()]))
  let t304 = @tactics.first_assum(fn(x301 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x301
    @simp.gen_rewrite_tac(fn(x303 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x303
    }, @list.List([@drule.match_mp(@integration.forall_in_division())(th_1)]))
  })
  let t306 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj()])), t304), t305)
  let t300 = @meson.asm_meson_tac(@list.List([@integration.division_of_finite()]))
  let t307 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_restrict()), t300), t306])
  let t313 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@integration.negligible_unions()), @tactics.conj_tac), t307), t312])
  let t299 = @tactics.exists_tac(@term_syntax.parse_term("UNIONS({(i : (Cart[Real, N]) -> Bool) | IN(i, (d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && interior(i) == {}})"))
  let t298 = @tactics.match_mp_tac(@integration.negligible_subset())
  let t314 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.match_mp_tac(@measure.measure_negligible_symdiff())), t298), t299), @tactics.conj_tac), t313)
  let t292 = @sets.set_tac(@list.List([]))
  let t293 = @tactics.then_tac(@tactics.match_mp_tac(@sets.subset_unions()), t292)
  let t294 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of()])), t293])
  let t291 = @tactics.subgoal_then(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool) == UNIONS((d1 : ((Cart[Real, N]) -> Bool) -> Bool))"), fn(x288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s289 = @tactics.subst1_tac(x288)
    fn(x290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s289(x290)
    }
  })
  let t295 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s' : (_) -> Bool), (s : (_) -> Bool)) → SUBSET({(f : (_, _) -> _)((x : _), (y : _)) | IN(x, s') && IN(y, (t : (_) -> Bool))}, {f((x : _), (y : _)) | IN(x, s) && IN(y, t)})"))), t291), t294)
  let t287 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t286 = @tactics.match_mp_tac(@topology.compact_sums())
  let t296 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t286), t287)
  let t285 = @meson.asm_meson_tac(@list.List([@topology.compact_interval()]))
  let t284 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict(), @sets.in_elim_thm()]))
  let t283 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of()])))
  let t282 = @tactics.match_mp_tac(@topology.compact_unions())
  let t281 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))])
  let t280 = @tactics.match_mp_tac(@topology.compact_sums())
  let t297 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t280), @tactics.conj_tac), t281), t282), t283), t284), t285), t296, t295])
  let t279 = @tactics.repeat_tac(@tactics.conj_tac)
  let t278 = @tactics.match_mp_tac(@measure.measure_subset())
  let t277 = @simp.rewrite_tac(@list.List([@cart.dimindex_nonzero()]))
  let t315 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.root_mono_le()), t277), t278), t279), t297), t314])
  let t316 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(c' : Real) <= (c : Real) && (a' : Real) == (a : Real) → c' >= a' + (b : Real) → c >= a + b"))), @tactics.conj_tac), t315)
  let t272 = @sets.set_tac(@list.List([]))
  let t273 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of()])), t272])
  let t271 = @tactics.exists_tac(@term_syntax.parse_term("(d1 : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t274 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.division_of_subset()), t271), @tactics.conj_tac), t273)
  let t268 = @simp.asm_rewrite_tac(@list.List([]))
  let t267 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of()])))
  let t266 = @sets.set_rule(@term_syntax.parse_term("UNION({(x : _) | IN(x, (s : (_) -> Bool)) && !(Q : (_) -> Bool)(x)}, {(x : _) | IN(x, s) && Q(x)}) == s"))
  let t269 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_union()), t266])), t267), t268)
  let t263 = @simp.rewrite_tac(@list.List([@topology.interior_closed_interval(), @measure.negligible_interval()]))
  let t262 = @tactics.first_assum(fn(x259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x259
    @simp.gen_rewrite_tac(fn(x261 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x261
    }, @list.List([@drule.match_mp(@integration.forall_in_division())(th)]))
  })
  let t264 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj()])), t262), t263)
  let t258 = @meson.asm_meson_tac(@list.List([@integration.division_of_finite()]))
  let t265 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_restrict()), t258), t264])
  let t257 = @tactics.match_mp_tac(@integration.negligible_unions())
  let t270 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.union_empty()])), t257), @tactics.conj_tac), t265), t269])
  let t275 = @tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("negligible(UNION(UNIONS({(i : (Cart[Real, N]) -> Bool) | IN(i, (d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && !(interior(i) == {})}), UNIONS({(i : (Cart[Real, N]) -> Bool) | IN(i, d1) && interior(i) == {}})))"), fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s255 = @tactics.mp_tac(x254)
    fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s255(x256)
    }
  })), t270)
  let t252 = @meson.asm_meson_tac(@list.List([@integration.division_of_finite()]))
  let t253 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t252])
  let t251 = @tactics.match_mp_tac(@sets.card_psubset())
  let t250 = @simp.rewrite_tac(@list.List([@arith.lt_add_rcancel()]))
  let t276 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("n"), t250), t251), @tactics.conj_tac), t253), t275, t274])
  let t317 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t276), t316])
  let t249 = @simp.asm_rewrite_tac(@list.List([]))
  let t242 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t243 = @term_syntax.parse_term("UNIONS({(i : (Cart[Real, N]) -> Bool) | IN(i, (d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && !(interior(i) == {})})")
  let t244 = @term_syntax.parse_term("(d2 : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t245 = @list.List([@term_syntax.parse_term("{(i : (Cart[Real, N]) -> Bool) | IN(i, (d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && !(interior(i) == {})}"), t244, t243, t242])
  let t248 = @tactics.disch_then(fn(x247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s240 = @tactics.mp_tac(x239)
      fn(x241 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s240(x241)
      }
    })(((x246 : @kernel.Thm) => @bool.specl(t245, x246))(x247))
  })
  let t238 = @tactics.remove_then("*", fn(x235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s236 = @tactics.mp_tac(x235)
    fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s236(x237)
    }
  })
  let t476 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("+", fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t238), t248), t249), @tactics.ants_tac), t317), t475])
  let t233 = @class.asm_cases_tac(@term_syntax.parse_term("∃ i : (Cart[Real, N]) -> Bool, IN(i, (d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && interior(i) == {}"))
  let t232 = @tactics.repeat_tac(@tactics.strip_tac)
  let t231 = @tactics.disch_then(fn(x228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s229 = ((x227 : @kernel.Thm) => @tactics.label_tac("+", x227))(x228)
    fn(x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s229(x230)
    }
  })
  let t477 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s225 = ((x223 : @kernel.Thm) => @tactics.label_tac("*", x223))(x224)
    fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s225(x226)
    }
  }), t231), t232), t233), t476)])
  let t222 = @tactics.subgoal_then(@term_syntax.parse_term("∀ d1 : ((Cart[Real, N]) -> Bool) -> Bool, ∀ d2 : ((Cart[Real, N]) -> Bool) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, ∀ i : (Cart[Real, N]) -> Bool, ∀ j : (Cart[Real, N]) -> Bool, ∀ k : Num, (CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)(d1) + (CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)(d2) == (n : Num) && 1 <= k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && !(i == j) && (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(i, d1) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(i, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) <= real_of_num(0)}) && (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(j, d1) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(j, {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, k) >= real_of_num(0)}) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(i) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(j) && !(s == ({} : (Cart[Real, N]) -> Bool)) && !(t == ({} : (Cart[Real, N]) -> Bool)) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(s) && !(negligible : ((Cart[Real, N]) -> Bool) -> Bool)(t) && (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(d1, s) && (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(d2, t) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(t))"), fn(x219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s220 = @tactics.mp_tac(x219)
    fn(x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s220(x221)
    }
  })
  let t215 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t214 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t213 = @tactics.match_mp_tac(@topology.compact_sums())
  let t212 = @tactics.match_mp_tac(@measure.measurable_compact())
  let t211 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t210 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_elim_thm()]))
  let t209 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measurable_elementary()])), @tactics.all_tac])
  let t208 = @simp.rewrite_tac(@list.List([@measure.measurable_translation_eq()]))
  let t207 = @tactics.match_mp_tac(@measure.measure_subset())
  let t206 = @list.List([@simp.rewrite_tac(@list.List([@measure.measure_translation(), @realax.real_le_refl()])), @tactics.all_tac])
  let t205 = @tactics.exists_tac(@term_syntax.parse_term("measure(IMAGE((x : Cart[Real, N]) => (a : Cart[Real, N]) + x, (t : (Cart[Real, N]) -> Bool)))"))
  let t204 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t203 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t202 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Cart[Real, N], IN(a, (s : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t201 = @simp.rewrite_tac(@list.List([@cart.dimindex_nonzero()]))
  let t200 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t199 = @simp.simp_tac(@list.List([@transcendentals.root_0(), @cart.dimindex_nonzero(), @realax.real_add_lid(), @realax.real_ge()]))
  let t198 = @list.List([@simp.asm_simp_tac(@list.List([@measure.measure_eq_0()])), @tactics.all_tac])
  let t197 = @tactics.subgoal_then(@term_syntax.parse_term("measure((s : (Cart[Real, N]) -> Bool)) == real_of_num(0)"), fn(x194 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s195 = @tactics.subst1_tac(x194)
    fn(x196 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s195(x196)
    }
  })
  let t216 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t197), t198), t199), t200), t201), t202), t203), t204), t205), @tactics.conj_tac), t206), t207), t208), @tactics.conj_tac), t209), t210), @tactics.conj_tac), t211), t212), t213), t214)
  let t193 = @meson.asm_meson_tac(@list.List([]))
  let t192 = @tactics.match_mp_tac(brunn_minkowski_interval())
  let t191 = @simp.asm_rewrite_tac(@list.List([]))
  let t190 = @tactics.repeat_tac(@tactics.strip_tac)
  let t189 = @simp.rewrite_tac(@list.List([@theorems.forall_unwind_thm2()]))
  let t186 = @tactics.conjuncts_then2(fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s179 = @tactics.mp_tac(x178)
    fn(x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s179(x180)
    }
  }, fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s182 = @tactics.subst_all_tac(x181)
        fn(x183 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s182(x183)
        }
      })(@equal.sym(x184))
    })(@bool.conjunct2(x185))
  })
  let t188 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t186(@bool.conjunct2(x187))
  }))
  let t177 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of(), @sets.unions_1(), @sets.in_sing()])))
  let t175 = @tactics.x_choose_then(@term_syntax.parse_term("(v : (Cart[Real, N]) -> Bool)"))(fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s173 = @tactics.subst_all_tac(x172)
    fn(x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s173(x174)
    }
  })
  let t176 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(u : (Cart[Real, N]) -> Bool)"))(fn(x169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s170 = @tactics.subst_all_tac(x169)
    fn(x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s170(x171)
    }
  }), t175))
  let t168 = @tactics.conv_tac(@equal.land_conv(@equal.binop_conv(@sets.has_size_conv)))
  let t167 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t166 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE((d1 : ((Cart[Real, N]) -> Bool) -> Bool), 1) && HAS_SIZE((d2 : ((Cart[Real, N]) -> Bool) -> Bool), 1)"), fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s164 = @tactics.mp_tac(x163)
    fn(x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s164(x165)
    }
  })
  let t162 = @simp.asm_rewrite_tac(@list.List([]))
  let t160 = @meson.meson_tac(@list.List([]))
  let t161 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@integration.empty_division_of()])), t160), @tactics.all_tac])
  let t159 = @class.asm_cases_tac(@term_syntax.parse_term("(d2 : ((Cart[Real, N]) -> Bool) -> Bool) == {}"))
  let t157 = @meson.meson_tac(@list.List([]))
  let t158 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@integration.empty_division_of()])), t157), @tactics.all_tac])
  let t156 = @class.asm_cases_tac(@term_syntax.parse_term("(d1 : ((Cart[Real, N]) -> Bool) -> Bool) == {}"))
  let t155 = @simp.asm_simp_tac(@list.List([@sets.card_eq_0(), @int.arith_rule(@term_syntax.parse_term("!(2 <= (n : Num)) == (n == 0 || n == 1)"))]))
  let t153 = @meson.asm_meson_tac(@list.List([]))
  let t154 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.division_of()])), t153)])
  let t152 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((d1 : ((Cart[Real, N]) -> Bool) -> Bool)) && FINITE((d2 : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t152), t154), t155), t156), t158), t159), t161), t162), @tactics.strip_tac), t166), t167), t168), t176), @tactics.strip_tac), t177), t188), t189), t190), t191), t192), t193)
  let t151 = @meson.meson_tac(@list.List([@vectors.vector_add_sym()]))
  let t150 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t149 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) → x >= (a : Real) + (b : Real) → y >= b + a")))
  let t148 = @list.List([@simp.rewrite_tac(@list.List([@arith.add_sym(), @theorems.conj_aci()])), @tactics.all_tac])
  let t147 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t218 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t147), @tactics.conj_tac), t148), t149), @tactics.ap_term_tac), @tactics.ap_term_tac), t150), t151), t217, t216, t215])
  let t146 = @tactics.repeat_tac(@tactics.conj_tac)
  let t145 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ d : (_) -> Bool, ∀ d' : (_) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ s' : (Cart[Real, _]) -> Bool, (P : ((_) -> Bool, (_) -> Bool, (Cart[Real, _]) -> Bool, (Cart[Real, _]) -> Bool) -> Bool)(d, d', s, s') → P(d', d, s', s)) && (∀ d : (_) -> Bool, ∀ d' : (_) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ s' : (Cart[Real, _]) -> Bool, !(2 <= CARD(d)) && !(2 <= CARD(d')) → P(d, d', s, s')) && (∀ d : (_) -> Bool, ∀ d' : (_) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ s' : (Cart[Real, _]) -> Bool, negligible(s) → P(d, d', s, s')) && (∀ d : (_) -> Bool, ∀ d' : (_) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ s' : (Cart[Real, _]) -> Bool, 2 <= CARD(d) && !negligible(s) && !negligible(s') → P(d, d', s, s')) → (∀ d : (_) -> Bool, ∀ d' : (_) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ s' : (Cart[Real, _]) -> Bool, P(d, d', s, s'))")))
  let t144 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ m : Num, m < (n : Num) → (∀ a : _, ∀ b : _, ∀ c : _, ∀ d : _, (f : (_, _) -> Num)(a, b) == m && (stuff : (_, _, _, _) -> Bool)(a, b, c, d) → (other : (_, _, _, _) -> Bool)(a, b, c, d))) == (∀ a : _, ∀ b : _, ∀ c : _, ∀ d : _, f(a, b) < n && stuff(a, b, c, d) → other(a, b, c, d))"))]))
  let t143 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t142 = @tactics.match_mp_tac(@arith.num_wf())
  let t137 = @term_syntax.parse_term("(n : Num)")
  let t138 = @term_syntax.parse_term("(d1 : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t139 = @term_syntax.parse_term("(d2 : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t140 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t141 = @tactics.map_every(fn(x135 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x135
    @tactics.spec_tac(t, t)
  }, @list.List([@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)"), t140, t139, t138, t137]))
  let t134 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t131 = @equal.gsym(@theorems.exists_refl())
  let t132 = @bool.ispec(@term_syntax.parse_term("CARD((d1 : ((Cart[Real, N]) -> Bool) -> Bool)) + CARD((d2 : ((Cart[Real, N]) -> Bool) -> Bool))"), t131)
  let t133 = @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s129 = @tactics.mp_tac(x128)
    fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s129(x130)
    }
  })(t132)
  let t125 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool) → (s : Bool)) == (q && p && r → s)"))]))
  let t124 = @tactics.pop_assum(fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s122 = @tactics.mp_tac(x121)
    fn(x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s122(x123)
    }
  })
  let t126 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t124), t125)
  let t120 = @simp.simp_tac(@list.List([@measure.measure_empty(), @transcendentals.root_0(), @cart.dimindex_nonzero()]))
  let t127 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.not_in_empty(), @sets.set_rule(@term_syntax.parse_term("{(f : (_, _) -> _)(x, y) | x : _, y : _ | false} == {}"))])), t120), @tactics.strip_tac), @calc_rat.real_arith_tac), t126])
  let t119 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool) == {}"))
  let t115 = @term_syntax.parse_term("(d2 : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t116 = @term_syntax.parse_term("(d1 : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t117 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t118 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t117, t116, t115]))
  let t114 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t1056 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()])), t114), t118), t119), t127), t133), t134), t141), t142), t143), t144), @tactics.disch_tac), t145), t146), t218), t222), t477), t481), t596), t597), t598), t599), t600), t604), t607), t608), t609), t610), t611), fn(x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x619 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x617 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s613 = @tactics.mp_tac(x612)
          fn(x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s613(x614)
          }
        })(t616(x617))
      })((fn(x618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x618.1
      })(x619))
    })(x620)(x620)
  }), t621), t625), t626), t627), t628), t629), @tactics.conj_tac), t724), t725), t734), t744), t745), @tactics.ants_tac), t843), t844), @tactics.ants_tac), t942), t943), t944), t956), t957), t958), t959), t965), t973), t974), t979), t1019), t1024), t1026), t1027), t1032), t1034), t1035), t1036), t1040), t1055)
  brunn_minkowski_elementary_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, (s == ({} : (Cart[Real, N]) -> Bool)) == (t == ({} : (Cart[Real, N]) -> Bool)) && (∃ d : ((Cart[Real, N]) -> Bool) -> Bool, (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(d, s)) && (∃ d : ((Cart[Real, N]) -> Bool) -> Bool, (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(d, t)) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(t))"), t1056))
}

///|
let brunn_minkowski_elementary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRUNN_MINKOWSKI_ELEMENTARY")

///|
/// `BRUNN_MINKOWSKI_ELEMENTARY`
pub fn brunn_minkowski_elementary() -> @kernel.Thm {
  brunn_minkowski_elementary_c.get()
}

///|
/// BRUNN_MINKOWSKI_OPEN
fn step_3() -> Unit raise {
  let t1145 = @simp.asm_simp_tac(@list.List([@topology.bounded_sums(), @topology.open_sums()]))
  let t1144 = @tactics.match_mp_tac(@measure.measurable_open())
  let t1143 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t1142 = @simp.asm_rewrite_tac(@list.List([]))
  let t1140 = @tactics.match_mp_tac(@measure.measure_subset())
  let t1139 = @meson.asm_meson_tac(@list.List([@integration.elementary_compact()]))
  let t1138 = @tactics.match_mp_tac(@topology.compact_sums())
  let t1141 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_compact()), t1138), t1139), t1140])
  let t1137 = @tactics.subgoal_then(@term_syntax.parse_term("measurable({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, UNIONS((D : ((Cart[Real, N]) -> Bool) -> Bool))) && IN(y, UNIONS((E : ((Cart[Real, N]) -> Bool) -> Bool)))})"), fn(x1134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1135 = @tactics.assume_tac(x1134)
    fn(x1136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1135(x1136)
    }
  })
  let t1133 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @realarith.real_sub_le(), @realarith.real_lt_imp_le()]))
  let t1132 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t1131 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1130 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s1 : Real) <= (r1 : Real) && (s2 : Real) <= (r2 : Real) && (rs : Real) <= (s : Real) → rs >= r1 + r2 → s1 + s2 <= s")))
  let t1129 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measure_empty(), @calc_rat.real_arith(@term_syntax.parse_term("(e : Real) < (s : Real) → !(s - e < real_of_num(0))"))])), @tactics.all_tac])
  let t1127 = @term_syntax.parse_term("UNIONS((E : ((Cart[Real, N]) -> Bool) -> Bool))")
  let t1128 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("UNIONS((D : ((Cart[Real, N]) -> Bool) -> Bool))"), t1127]), brunn_minkowski_elementary()))
  let t1126 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(E : ((Cart[Real, N]) -> Bool) -> Bool)"))(@tactics.strip_assume_tac))
  let t1125 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(D : ((Cart[Real, N]) -> Bool) -> Bool)"))(@tactics.strip_assume_tac))
  let t1124 = @simp.asm_simp_tac(@list.List([@measure.measurable_open(), @equal.gsym(@real.real_lt_sub_radd())]))
  let t1121 = @term_syntax.parse_term("(e : Real)")
  let t1122 = @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t1121])
  let t1120 = @term_syntax.parse_term("(e : Real)")
  let t1123 = @tactics.map_every(fn(x1118 : @list.List[@kernel.Term]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let l = x1118
    @tactics.mp_tac(@bool.ispecl(l, @measure.open_measurable_inner_division()))
  }, @list.List([@list.List([@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)"), t1120]), t1122]))
  let t1117 = @simp.asm_rewrite_tac(@list.List([]))
  let t1116 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (e : Real)"))
  let t1115 = @simp.rewrite_tac(@list.List([@realax.real_abs()]))
  let t1114 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1113 = @simp.asm_simp_tac(@list.List([@real.real_lt_min(), @sets.in_elim_thm(), @real.real_sub_rzero(), @measure.measure_open_pos_lt()]))
  let t1112 = @tactics.exists_tac(@term_syntax.parse_term("min(measure((s : (Cart[Real, N]) -> Bool)), measure((t : (Cart[Real, N]) -> Bool)))"))
  let t1146 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t1112), t1113), t1114), t1115), t1116), t1117), @tactics.strip_tac), t1123), t1124), t1125), t1126), t1128), @tactics.ants_tac), t1129), t1130), t1131), t1132), t1133), t1137), t1141), t1142), @tactics.conj_tac), t1143), t1144), t1145)
  let t1109 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1105 = @term_syntax.parse_term("real_of_num(1)")
  let t1108 = @tactics.disch_then(fn(x1107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1103 = @tactics.mp_tac(x1102)
      fn(x1104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1103(x1104)
      }
    })(((x1106 : @kernel.Thm) => @bool.spec(t1105, x1106))(x1107))
  })
  let t1101 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_sing()]))
  let t1110 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1099 = @tactics.subst1_tac(x1098)
    fn(x1100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1099(x1100)
    }
  }), t1101), t1108), t1109), @calc_rat.real_arith_tac)
  let t1111 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.is_realinterval(), @sets.in_elim_thm()])), @calc_rat.real_arith_tac), t1110])
  let t1092 = @drule.part_match(fn(x1091 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1091))
  }, @realanalysis.trivial_limit_within_realinterval())
  let t1147 = @tactics.thenl(@tactics.then_tac(fn(x1097 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1096 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1094 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1093 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1088 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1089 = @tactics.mp_tac(x1088)
            fn(x1090 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1089(x1090)
            }
          })(t1092(x1093))
        })(@kernel.rand(x1094))
      })((fn(x1095 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1095.1
      })(x1096))
    })(x1097)(x1097)
  }, @tactics.ants_tac), t1111)
  let t1085 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1084 = @tactics.match_mp_tac(@realanalysis.real_continuous_within_rpow())
  let t1083 = @simp.asm_simp_tac(@list.List([@realanalysis.real_continuous_sub(), @realanalysis.real_continuous_within_id(), @realanalysis.real_continuous_const()]))
  let t1082 = @tactics.match_mp_tac(@realanalysis.real_continuous_withinreal_compose())
  let t1080 = @term_syntax.parse_term("o((x : Real) => rpow(x, (y : Real)), (e : Real) => (s : Real) - e)")
  let t1081 = @simp.rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_conv(@list.List([@trivia.o_def()]))(t1080))]))
  let t1079 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_withinreal())]))
  let t1078 = @simp.gen_rewrite_tac(fn(x1077 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1071 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1072 = @equal.land_conv(x1071)
      fn(x1073 : @kernel.Term) -> @kernel.Thm raise {
        s1072(x1073)
      }
    })((fn(x1074 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1075 = @equal.once_depth_conv(x1074)
      fn(x1076 : @kernel.Term) -> @kernel.Thm raise {
        s1075(x1076)
      }
    })(x1077))
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("measure((s : (Cart[Real, N]) -> Bool)) == measure(s) - real_of_num(0)"))]))
  let t1070 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t1086 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.real_root_rpow(), @measure.measure_open_pos_lt(), @cart.dimindex_nonzero(), @realarith.real_lt_imp_le()])), t1070), @tactics.conj_tac), t1078), t1079), t1081), t1082), t1083), t1084), t1085)
  let t1069 = @simp.rewrite_tac(@list.List([@cart.dimindex_nonzero()]))
  let t1068 = @tactics.match_mp_tac(@transcendentals.real_root_rpow())
  let t1067 = @tactics.conv_tac(@equal.sym_conv)
  let t1066 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1065 = @simp.asm_simp_tac(@list.List([@real.real_lt_min(), @sets.in_elim_thm(), @real.real_sub_rzero(), @measure.measure_open_pos_lt()]))
  let t1064 = @tactics.exists_tac(@term_syntax.parse_term("min(measure((s : (Cart[Real, N]) -> Bool)), measure((t : (Cart[Real, N]) -> Bool)))"))
  let t1087 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t1064), t1065), t1066), @tactics.binop_tac), t1067), t1068), t1069), @calc_rat.asm_real_arith_tac), t1086])
  let t1063 = @simp.rewrite_tac(@list.List([]))
  let t1062 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) => rpow((measure : ((Cart[Real, N]) -> Bool) -> Real)((s : (Cart[Real, N]) -> Bool)) - e, inv(real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))) + rpow((measure : ((Cart[Real, N]) -> Bool) -> Real)((t : (Cart[Real, N]) -> Bool)) - e, inv(real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))))"))
  let t1148 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_transform_eventually()), t1062), t1063), @tactics.conj_tac), t1087), t1147, t1146])
  let t1061 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1060 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) => root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((s : (Cart[Real, N]) -> Bool)) - e) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((t : (Cart[Real, N]) -> Bool)) - e)"))
  let t1059 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("within(atreal(real_of_num(0)), {(e : Real) | real_of_num(0) <= e})"), @realanalysis.reallim_ubound()))
  let t1058 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, {}) && IN(y, {})} == {}")), @realax.real_le_refl(), @measure.measure_empty(), @transcendentals.root_0(), @cart.dimindex_nonzero(), @realax.real_ge(), @realax.real_add_lid()]))
  let t1057 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool) == {}"))
  let t1149 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1057), t1058), @tactics.strip_tac), t1059), t1060), t1061), t1148)
  brunn_minkowski_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, (s == ({} : (Cart[Real, N]) -> Bool)) == (t == ({} : (Cart[Real, N]) -> Bool)) && (bounded : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (open : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (bounded : ((Cart[Real, N]) -> Bool) -> Bool)(t) && (open : ((Cart[Real, N]) -> Bool) -> Bool)(t) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(t))"), t1149))
}

///|
let brunn_minkowski_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRUNN_MINKOWSKI_OPEN")

///|
/// `BRUNN_MINKOWSKI_OPEN`
pub fn brunn_minkowski_open() -> @kernel.Thm {
  brunn_minkowski_open_c.get()
}

///|
/// BRUNN_MINKOWSKI_CONVEX
fn step_4() -> Unit raise {
  let t1194 = @simp.rewrite_tac(@list.List([@topology.interior_subset()]))
  let t1193 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s' : (Cart[Real, N]) -> Bool), (s : (Cart[Real, N]) -> Bool)) && SUBSET((t' : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool)) → SUBSET({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s') && IN(y, t')}, {(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s) && IN(y, t)})")))
  let t1192 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @measure.measure_pos_le(), @topology.bounded_sums(), @measure.measurable_convex(), @topology.bounded_interior(), @convex.convex_sums(), @convex.convex_interior()]))
  let t1191 = @tactics.match_mp_tac(@measure.measure_subset())
  let t1190 = @simp.rewrite_tac(@list.List([@cart.dimindex_nonzero()]))
  let t1189 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t1188 = @simp.rewrite_tac(@list.List([@realax.real_ge()]))
  let t1187 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_ge()), brunn_minkowski_open(), @topology.bounded_interior(), @topology.open_interior()]))
  let t1186 = @tactics.exists_tac(@term_syntax.parse_term("root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interior : ((Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((s : (Cart[Real, N]) -> Bool))) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, (interior : ((Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((t : (Cart[Real, N]) -> Bool)))}))"))
  let t1185 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1181 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1180 = @simp.gen_rewrite_tac(fn(x1179 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1173 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1174 = @equal.land_conv(x1173)
      fn(x1175 : @kernel.Term) -> @kernel.Thm raise {
        s1174(x1175)
      }
    })((fn(x1176 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1177 = @equal.once_depth_conv(x1176)
      fn(x1178 : @kernel.Term) -> @kernel.Thm raise {
        s1177(x1178)
      }
    })(x1179))
  }, @list.List([@vectors.vector_add_sym()]))
  let t1172 = @simp.asm_simp_tac(@list.List([@measure.measurable_translation_eq(), @measure.measurable_convex(), @convex.convex_sums(), @topology.bounded_sums()]))
  let t1182 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measure_subset()), t1172), t1180), t1181)
  let t1183 = @list.List([@simp.asm_simp_tac(@list.List([@measure.measure_translation(), @measure.measure_interior(), @measure.negligible_convex_frontier(), @realax.real_le_refl()])), t1182])
  let t1171 = @tactics.exists_tac(@term_syntax.parse_term("measure(IMAGE((x : Cart[Real, N]) => (a : Cart[Real, N]) + x, (s : (Cart[Real, N]) -> Bool)))"))
  let t1170 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1169 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1168 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Cart[Real, N], IN(a, (t : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t1167 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @measure.measure_pos_le(), @measure.measurable_interior()]))
  let t1166 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t1184 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@measure.measure_empty(), @transcendentals.root_0(), @cart.dimindex_nonzero(), @calc_int.real_add_rid()])), t1166), t1167), t1168), t1169), t1170), t1171), @tactics.conj_tac), t1183), @tactics.all_tac])
  let t1165 = @class.asm_cases_tac(@term_syntax.parse_term("interior((t : (Cart[Real, N]) -> Bool)) == {}"))
  let t1161 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1160 = @simp.asm_simp_tac(@list.List([@measure.measurable_translation_eq(), @measure.measurable_convex(), @convex.convex_sums(), @topology.bounded_sums()]))
  let t1162 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measure_subset()), t1160), t1161)
  let t1163 = @list.List([@simp.asm_simp_tac(@list.List([@measure.measure_translation(), @measure.measure_interior(), @measure.negligible_convex_frontier(), @realax.real_le_refl()])), t1162])
  let t1159 = @tactics.exists_tac(@term_syntax.parse_term("measure(IMAGE((x : Cart[Real, N]) => (a : Cart[Real, N]) + x, (t : (Cart[Real, N]) -> Bool)))"))
  let t1158 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1157 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1156 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Cart[Real, N], IN(a, (s : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t1155 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @measure.measure_pos_le(), @measure.measurable_interior()]))
  let t1154 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t1164 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@measure.measure_empty(), @transcendentals.root_0(), @cart.dimindex_nonzero(), @realax.real_add_lid()])), t1154), t1155), t1156), t1157), t1158), t1159), @tactics.conj_tac), t1163), @tactics.all_tac])
  let t1153 = @class.asm_cases_tac(@term_syntax.parse_term("interior((s : (Cart[Real, N]) -> Bool)) == {}"))
  let t1152 = @simp.asm_simp_tac(@list.List([@equal.gsym(@measure.measure_interior()), @measure.negligible_convex_frontier(), @realax.real_ge()]))
  let t1151 = @simp.asm_simp_tac(@list.List([brunn_minkowski_open(), @topology.open_empty()]))
  let t1150 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool) == {}"))
  let t1195 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1150), t1151), @tactics.strip_tac), t1152), t1153), t1164), t1165), t1184), t1185), t1186), t1187), t1188), t1189), t1190), t1191), t1192), t1193), t1194)
  brunn_minkowski_convex_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, (s == ({} : (Cart[Real, N]) -> Bool)) == (t == ({} : (Cart[Real, N]) -> Bool)) && (bounded : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (convex : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (bounded : ((Cart[Real, N]) -> Bool) -> Bool)(t) && (convex : ((Cart[Real, N]) -> Bool) -> Bool)(t) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(t))"), t1195))
}

///|
let brunn_minkowski_convex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRUNN_MINKOWSKI_CONVEX")

///|
/// `BRUNN_MINKOWSKI_CONVEX`
pub fn brunn_minkowski_convex() -> @kernel.Thm {
  brunn_minkowski_convex_c.get()
}

///|
/// INTERS_SUMS_CLOSED_BALL_SEQUENTIAL
fn step_5() -> Unit raise {
  let t1251 = @simp.asm_rewrite_tac(@list.List([@topology.centre_in_ball(), @vectors.vector_add_rid(), @real.real_lt_inv_eq()]))
  let t1249 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])(0)")
  let t1250 = @tactics.map_every(fn(x1246 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1247 = @tactics.exists_tac(x1246)
    fn(x1248 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1247(x1248)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, N])"), t1249]))
  let t1252 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))), t1250), t1251), @calc_rat.real_arith_tac)
  let t1244 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le(), @real.real_of_num_lt()]))
  let t1245 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_inv2()), t1244), @int.asm_arith_tac), @calc_rat.asm_real_arith_tac])
  let t1243 = @tactics.subgoal_then(@term_syntax.parse_term("inv(real_of_num((n : Num)) + real_of_num(1)) <= inv(real_of_num(n))"), fn(x1240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1241 = @tactics.mp_tac(x1240)
    fn(x1242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1241(x1242)
    }
  })
  let t1239 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((y : Cart[Real, N]) + (e : Cart[Real, N]), y)) == norm(e)"))]))
  let t1235 = @term_syntax.parse_term("(y : Cart[Real, N])")
  let t1238 = @tactics.first_x_assum(fn(x1237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1233 = @tactics.mp_tac(x1232)
      fn(x1234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1233(x1234)
      }
    })(((x1236 : @kernel.Thm) => @bool.spec(t1235, x1236))(x1237))
  })
  let t1231 = @tactics.first_x_assum(fn(x1228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1229 = @tactics.subst_all_tac(x1228)
    fn(x1230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1229(x1230)
    }
  })
  let t1227 = @simp.rewrite_tac(@list.List([@topology.in_ball_0()]))
  let t1225 = @term_syntax.parse_term("(e : Cart[Real, N])")
  let t1226 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Cart[Real, N])"), t1225]))
  let t1224 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1220 = @term_syntax.parse_term("(n : Num)")
  let t1223 = @tactics.disch_then(fn(x1222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1217 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1218 = @tactics.mp_tac(x1217)
      fn(x1219 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1218(x1219)
      }
    })(((x1221 : @kernel.Thm) => @bool.spec(t1220, x1221))(x1222))
  })
  let t1216 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(@tactics.strip_assume_tac))
  let t1215 = @simp.gen_rewrite_tac(fn(x1212 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1213 = @equal.land_conv(x1212)
    fn(x1214 : @kernel.Term) -> @kernel.Thm raise {
      s1213(x1214)
    }
  }, @list.List([@real.real_arch_inv()]))
  let t1211 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1206 = @tactics.mp_tac(x1205)
    fn(x1207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1206(x1207)
    }
  }, fn(x1208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1209 = @tactics.assume_tac(x1208)
    fn(x1210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1209(x1210)
    }
  }))
  let t1204 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t1203 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1201 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t1202 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t1201]), @topology.separate_point_closed()))
  let t1200 = @simp.asm_rewrite_tac(@list.List([]))
  let t1253 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("IN((x : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))")), t1200), t1202), t1203), t1204), t1211), t1215), t1216), t1223), t1224), t1226), t1227), @tactics.strip_tac), t1231), t1238), t1239), t1243), t1245), t1252])
  let t1199 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1198 = @simp.rewrite_tac(@list.List([@sets.inters_gspec(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t1197 = @simp.gen_rewrite_tac(fn(x1196 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1196
  }, @list.List([@sets.extension()]))
  let t1254 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1197), t1198), t1199), @tactics.eq_tac), t1253)
  inters_sums_closed_ball_sequential_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, closed(s) → INTERS({{(x : Cart[Real, N]) + (d : Cart[Real, N]) | IN(x, s) && IN(d, ball((vec(0), inv(real_of_num((n : Num)) + real_of_num(1)))))} | IN(n, UNIV)}) == s"), t1254))
}

///|
let inters_sums_closed_ball_sequential_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERS_SUMS_CLOSED_BALL_SEQUENTIAL")

///|
/// `INTERS_SUMS_CLOSED_BALL_SEQUENTIAL`
pub fn inters_sums_closed_ball_sequential() -> @kernel.Thm {
  inters_sums_closed_ball_sequential_c.get()
}

///|
/// MEASURE_SUMS_COMPACT_EPSILON
fn step_6() -> Unit raise {
  let t1304 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t1303 = @tactics.match_mp_tac(@topology.subset_ball())
  let t1305 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((t' : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool)) → SUBSET({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, (s : (Cart[Real, N]) -> Bool)) && IN(y, t')}, {(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s) && IN(y, t)})"))), t1303), t1304)
  let t1302 = @simp.asm_rewrite_tac(@list.List([@topology.centre_in_ball(), @vectors.vector_add_rid()]))
  let t1300 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])(0)")
  let t1301 = @tactics.map_every(fn(x1297 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1298 = @tactics.exists_tac(x1297)
    fn(x1299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1298(x1299)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, N])"), t1300]))
  let t1296 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1306 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()])), t1296), @tactics.disch_tac), t1301), t1302), t1305])
  let t1295 = @simp.asm_simp_tac(@list.List([@measure.measurable_open(), @topology.bounded_sums(), @topology.open_sums(), @topology.compact_imp_bounded(), @topology.bounded_ball(), @topology.open_ball()]))
  let t1294 = @tactics.match_mp_tac(@measure.measure_subset())
  let t1293 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(m : Real) <= (m1 : Real) && m1 <= (m2 : Real) → abs(m2 - m) < (e : Real) → abs(m1 - m) < e")))
  let t1292 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t1288 = @term_syntax.parse_term("(N : Num)")
  let t1291 = @tactics.first_x_assum(fn(x1290 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1286 = @tactics.mp_tac(x1285)
      fn(x1287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1286(x1287)
      }
    })(((x1289 : @kernel.Thm) => @bool.spec(t1288, x1289))(x1290))
  })
  let t1284 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x1281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1282 = @tactics.subst1_tac(x1281)
    fn(x1283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1282(x1283)
    }
  }), @tactics.strip_tac), @calc_rat.asm_real_arith_tac])
  let t1280 = @class.asm_cases_tac(@term_syntax.parse_term("abs((d : Real)) == d"))
  let t1279 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @real.real_sub_rzero()]))
  let t1278 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t1277 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_inv_eq()]))
  let t1276 = @tactics.exists_tac(@term_syntax.parse_term("inv(real_of_num((N : Num)) + real_of_num(1))"))
  let t1273 = @term_syntax.parse_term("(N : Num)")
  let t1275 = @tactics.disch_then((x1274 : @kernel.Thm) => @tactics.x_choose_tac(t1273, x1274))
  let t1272 = @simp.asm_rewrite_tac(@list.List([]))
  let t1268 = @term_syntax.parse_term("(e : Real)")
  let t1271 = @tactics.first_x_assum(fn(x1270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1266 = @tactics.mp_tac(x1265)
      fn(x1267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1266(x1267)
      }
    })(((x1269 : @kernel.Thm) => @bool.spec(t1268, x1269))(x1270))
  })
  let t1264 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1263 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially(), @realanalysis.reallim_withinreal()]))
  let t1262 = @simp.rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@realanalysis.tendsto_real_v1()))]))
  let t1260 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le(), @real.real_of_num_lt()]))
  let t1259 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1258 = @tactics.match_mp_tac(@topology.subset_ball())
  let t1257 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((t' : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool)) → SUBSET({(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, (s : (Cart[Real, N]) -> Bool)) && IN(y, t')}, {(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s) && IN(y, t)})")))
  let t1261 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@measure.measurable_open(), @topology.bounded_sums(), @topology.open_sums(), @topology.compact_imp_bounded(), @topology.bounded_ball(), @topology.open_ball()])), @tactics.gen_tac), t1257), t1258), t1259), t1260), @int.arith_tac), @tactics.all_tac])
  let t1256 = @simp.asm_simp_tac(@list.List([inters_sums_closed_ball_sequential(), @topology.compact_imp_closed()]))
  let t1255 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(n : Num) => {(x : Cart[Real, N]) + (d : Cart[Real, N]) | IN(x, (s : (Cart[Real, N]) -> Bool)) && IN(d, ball((vec(0), inv(real_of_num(n) + real_of_num(1)))))}"), @measure.has_measure_nested_inters()))
  let t1307 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1255), t1256), @tactics.ants_tac), t1261), t1262), t1263), @tactics.strip_tac), t1264), @tactics.disch_tac), t1271), t1272), t1275), t1276), t1277), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t1278), t1279), t1280), t1284), t1291), t1292), t1293), @tactics.conj_tac), t1294), t1295), t1306)
  measure_sums_compact_epsilon_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, compact(s) → op_minus_minus_minus_gt((e : Real) => measure({(x : Cart[Real, N]) + (d : Cart[Real, N]) | IN(x, s) && IN(d, ball((vec(0), e)))}), measure(s), within(atreal(real_of_num(0)), {(e : Real) | real_of_num(0) <= e}))"), t1307))
}

///|
let measure_sums_compact_epsilon_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEASURE_SUMS_COMPACT_EPSILON")

///|
/// `MEASURE_SUMS_COMPACT_EPSILON`
pub fn measure_sums_compact_epsilon() -> @kernel.Thm {
  measure_sums_compact_epsilon_c.get()
}

///|
/// BRUNN_MINKOWSKI_COMPACT
fn step_7() -> Unit raise {
  let t1326 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_mul()]))
  let t1325 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(inv(real_of_num(2)), (d : Cart[Real, N]))"))
  let t1323 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1324 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N])")), t1323])
  let t1322 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, N]) + op_pct(inv(real_of_num(2)), (d : Cart[Real, N]))"))
  let t1321 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N]) + op_pct(inv(real_of_num(2)), (d : Cart[Real, N]))"))
  let t1320 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Cart[Real, N])"))
  let t1319 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1327 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])")), @tactics.disch_tac), t1319), @tactics.disch_tac), t1320), @tactics.disch_tac), t1321), t1322), @tactics.conj_tac), @list.List([@tactics.all_tac, @vectors.vector_arith_tac])), @tactics.conj_tac), t1324), t1325), t1326), @calc_rat.asm_real_arith_tac)
  let t1318 = @simp.asm_rewrite_tac(@list.List([]))
  let t1317 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1316 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1315 = @simp.asm_simp_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("norm((d : Cart[Real, N])) < (e : Real) && norm((k : Cart[Real, N])) < e → norm(d + k) < real_of_num(2) * e"))]))
  let t1314 = @tactics.exists_tac(@term_syntax.parse_term("(d : Cart[Real, N]) + (k : Cart[Real, N])"))
  let t1313 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N]) + (y : Cart[Real, N])"))
  let t1312 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Cart[Real, N])"))
  let t1311 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1310 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Cart[Real, N])"))
  let t1328 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])")), @tactics.disch_tac), t1310), @tactics.disch_tac), t1311), @tactics.disch_tac), t1312), @tactics.disch_tac), t1313), t1314), @tactics.conj_tac), @list.List([@tactics.all_tac, @vectors.vector_arith_tac])), t1315), t1316), t1317), t1318), @vectors.vector_arith_tac), t1327])
  let t1309 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @topology.in_ball_0()]))
  let t1308 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_gspec(), @theorems.right_forall_imp_thm(), @theorems.imp_conj()]))
  let t1329 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), t1308), t1309), @tactics.conj_tac), t1328)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("{(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, {(x : Cart[Real, N]) + (d : Cart[Real, N]) | IN(x, (s : (Cart[Real, N]) -> Bool)) && IN(d, ball((vec(0), (e : Real))))}) && IN(y, {(y : Cart[Real, N]) + (d : Cart[Real, N]) | IN(y, (t : (Cart[Real, N]) -> Bool)) && IN(d, ball((vec(0), e)))})} == {(z : Cart[Real, N]) + (d : Cart[Real, N]) | IN(z, {(x : Cart[Real, N]) + (y : Cart[Real, N]) | IN(x, s) && IN(y, t)}) && IN(d, ball((vec(0), real_of_num(2) * e)))}"), t1329)
  let t1344 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1343 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1342 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1341 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real) / real_of_num(2)"))
  let t1340 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t1339 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @real.real_sub_rzero()]))
  let t1338 = @simp.asm_rewrite_tac(@list.List([]))
  let t1334 = @term_syntax.parse_term("(e : Real)")
  let t1337 = @tactics.first_x_assum(fn(x1336 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1332 = @tactics.mp_tac(x1331)
      fn(x1333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1332(x1333)
      }
    })(((x1335 : @kernel.Thm) => @bool.spec(t1334, x1335))(x1336))
  })
  let t1330 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1345 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()])), @tactics.disch_tac), t1330), @tactics.disch_tac), t1337), t1338), t1339), t1340), t1341), t1342), t1343), t1344), @calc_rat.asm_real_arith_tac)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((f : (Real) -> Real), (l : Real), within(atreal(real_of_num(0)), {(e : Real) | real_of_num(0) <= e})) → op_minus_minus_minus_gt((e : Real) => f(real_of_num(2) * e), l, within(atreal(real_of_num(0)), {(e : Real) | real_of_num(0) <= e}))"), t1345)
  let t1406 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1405 = @simp.asm_simp_tac(@list.List([@topology.bounded_sums(), @topology.bounded_ball(), @topology.compact_imp_bounded()]))
  let t1404 = @simp.simp_tac(@list.List([@topology.open_sums(), @topology.open_ball()]))
  let t1403 = @tactics.match_mp_tac(brunn_minkowski_open())
  let t1402 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_ge())]))
  let t1401 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1407 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t1401), t1402), t1403), t1404), t1405), t1406)
  let t1398 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1394 = @term_syntax.parse_term("real_of_num(1)")
  let t1397 = @tactics.disch_then(fn(x1396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1392 = @tactics.mp_tac(x1391)
      fn(x1393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1392(x1393)
      }
    })(((x1395 : @kernel.Thm) => @bool.spec(t1394, x1395))(x1396))
  })
  let t1390 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_sing()]))
  let t1399 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1388 = @tactics.subst1_tac(x1387)
    fn(x1389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1388(x1389)
    }
  }), t1390), t1397), t1398), @calc_rat.real_arith_tac)
  let t1400 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.is_realinterval(), @sets.in_elim_thm()])), @calc_rat.real_arith_tac), t1399])
  let t1381 = @drule.part_match(fn(x1380 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1380))
  }, @realanalysis.trivial_limit_within_realinterval())
  let t1408 = @tactics.thenl(@tactics.then_tac(fn(x1386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1383 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1382 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1378 = @tactics.mp_tac(x1377)
            fn(x1379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1378(x1379)
            }
          })(t1381(x1382))
        })(@kernel.rand(x1383))
      })((fn(x1384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1384.1
      })(x1385))
    })(x1386)(x1386)
  }, @tactics.ants_tac), t1400)
  let t1376 = @simp.asm_simp_tac(@list.List([@topology.compact_sums()]))
  let t1375 = @tactics.match_mp_tac(measure_sums_compact_epsilon())
  let t1374 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1373 = @tactics.match_mp_tac(@realanalysis.reallim_rpow())
  let t1369 = @simp.basic_ss(@list.List([]))
  let t1372 = @tactics.asm_tac(fn(x1371 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1366 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1367 = @tactics.conv_tac(x1366)
      fn(x1368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1367(x1368)
      }
    })(((x1370 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t1369, 6, x1370))(x1371))
  })(@list.List([@transcendentals.real_root_rpow(), @cart.dimindex_nonzero(), @measure.measure_pos_le(), @measure.measurable_compact(), @measure.measurable_open(), @topology.bounded_sums(), @topology.open_sums(), @topology.compact_sums(), @topology.compact_imp_bounded(), @topology.bounded_ball(), @topology.open_ball()]))
  let t1365 = @tactics.match_mp_tac(lemma2)
  let t1409 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lemma1])), t1365), t1372), t1373), t1374), t1375), t1376)
  let t1364 = @simp.asm_rewrite_tac(@list.List([]))
  let t1363 = @tactics.match_mp_tac(measure_sums_compact_epsilon())
  let t1362 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1361 = @tactics.match_mp_tac(@realanalysis.reallim_rpow())
  let t1360 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t1357 = @simp.basic_ss(@list.List([]))
  let t1410 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.asm_tac(fn(x1359 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1354 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1355 = @tactics.conv_tac(x1354)
      fn(x1356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1355(x1356)
      }
    })(((x1358 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t1357, 5, x1358))(x1359))
  })(@list.List([@transcendentals.real_root_rpow(), @cart.dimindex_nonzero(), @measure.measure_pos_le(), @measure.measurable_compact(), @measure.measurable_open(), @topology.bounded_sums(), @topology.open_sums(), @topology.compact_imp_bounded(), @topology.bounded_ball(), @topology.open_ball()])), t1360), @tactics.conj_tac), t1361), t1362), t1363), t1364), t1409, t1408, t1407])
  let t1353 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1352 = @simp.rewrite_tac(@list.List([]))
  let t1351 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) => root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, {(x : Cart[Real, N]) + (d : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (s : (Cart[Real, N]) -> Bool)) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(d, (ball : ((Cart[Real, N], Real), Cart[Real, N]) -> Bool)(((vec : (Num) -> Cart[Real, N])(0), e)))}) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, {(y : Cart[Real, N]) + (d : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, (t : (Cart[Real, N]) -> Bool)) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(d, (ball : ((Cart[Real, N], Real), Cart[Real, N]) -> Bool)(((vec : (Num) -> Cart[Real, N])(0), e)))})}))"))
  let t1350 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) => root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (d : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (s : (Cart[Real, N]) -> Bool)) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(d, (ball : ((Cart[Real, N], Real), Cart[Real, N]) -> Bool)(((vec : (Num) -> Cart[Real, N])(0), e)))})) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (d : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (t : (Cart[Real, N]) -> Bool)) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(d, (ball : ((Cart[Real, N], Real), Cart[Real, N]) -> Bool)(((vec : (Num) -> Cart[Real, N])(0), e)))}))"))
  let t1349 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("within(atreal(real_of_num(0)), {(e : Real) | real_of_num(0) <= e})"), @realanalysis.reallim_le()))
  let t1348 = @simp.rewrite_tac(@list.List([@realax.real_ge()]))
  let t1347 = @simp.asm_simp_tac(@list.List([brunn_minkowski_open(), @topology.open_empty(), @topology.bounded_empty()]))
  let t1346 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool) == {}"))
  let t1411 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1346), t1347), @tactics.strip_tac), t1348), t1349), t1350), t1351), t1352), t1353), t1410)
  brunn_minkowski_compact_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, (s == ({} : (Cart[Real, N]) -> Bool)) == (t == ({} : (Cart[Real, N]) -> Bool)) && (compact : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (compact : ((Cart[Real, N]) -> Bool) -> Bool)(t) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(t))"), t1411))
}

///|
let brunn_minkowski_compact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRUNN_MINKOWSKI_COMPACT")

///|
/// `BRUNN_MINKOWSKI_COMPACT`
pub fn brunn_minkowski_compact() -> @kernel.Thm {
  brunn_minkowski_compact_c.get()
}

///|
/// BRUNN_MINKOWSKI_MEASURABLE
fn step_8() -> Unit raise {
  let t1527 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1526 = @simp.asm_simp_tac(@list.List([@measure.measure_pos_le(), @topology.compact_sums(), @measure.measurable_compact()]))
  let t1525 = @tactics.match_mp_tac(@measure.measure_subset())
  let t1524 = @simp.asm_simp_tac(@list.List([@measure.measure_pos_le(), @topology.compact_sums(), @measure.measurable_compact()]))
  let t1523 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @realarith.real_sub_le(), @realarith.real_lt_imp_le()]))
  let t1522 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t1521 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1520 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s1 : Real) <= (r1 : Real) && (s2 : Real) <= (r2 : Real) && (rs : Real) <= (s : Real) → rs >= r1 + r2 → s1 + s2 <= s")))
  let t1519 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measure_empty(), @calc_rat.real_arith(@term_syntax.parse_term("(e : Real) < (s : Real) → !(s - e < real_of_num(0))"))])), @tactics.all_tac])
  let t1517 = @term_syntax.parse_term("(t' : (Cart[Real, N]) -> Bool)")
  let t1518 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s' : (Cart[Real, N]) -> Bool)"), t1517]), brunn_minkowski_compact()))
  let t1516 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t' : (Cart[Real, N]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1515 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s' : (Cart[Real, N]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1514 = @simp.asm_simp_tac(@list.List([@measure.measurable_open(), @equal.gsym(@real.real_lt_sub_radd())]))
  let t1511 = @term_syntax.parse_term("(e : Real)")
  let t1512 = @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t1511])
  let t1510 = @term_syntax.parse_term("(e : Real)")
  let t1513 = @tactics.map_every(fn(x1508 : @list.List[@kernel.Term]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let l = x1508
    @tactics.mp_tac(@bool.ispecl(l, @measure.measurable_inner_compact()))
  }, @list.List([@list.List([@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)"), t1510]), t1512]))
  let t1507 = @simp.asm_rewrite_tac(@list.List([]))
  let t1506 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (e : Real)"))
  let t1505 = @simp.rewrite_tac(@list.List([@realax.real_abs()]))
  let t1504 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1503 = @simp.asm_simp_tac(@list.List([@real.real_lt_min(), @sets.in_elim_thm(), @real.real_sub_rzero()]))
  let t1502 = @tactics.exists_tac(@term_syntax.parse_term("min(measure((s : (Cart[Real, N]) -> Bool)), measure((t : (Cart[Real, N]) -> Bool)))"))
  let t1528 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t1502), t1503), t1504), t1505), t1506), t1507), @tactics.strip_tac), t1513), t1514), t1515), t1516), t1518), @tactics.ants_tac), t1519), t1520), t1521), t1522), t1523), t1524), t1525), t1526), t1527)
  let t1499 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1495 = @term_syntax.parse_term("real_of_num(1)")
  let t1498 = @tactics.disch_then(fn(x1497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1493 = @tactics.mp_tac(x1492)
      fn(x1494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1493(x1494)
      }
    })(((x1496 : @kernel.Thm) => @bool.spec(t1495, x1496))(x1497))
  })
  let t1491 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_sing()]))
  let t1500 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1489 = @tactics.subst1_tac(x1488)
    fn(x1490 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1489(x1490)
    }
  }), t1491), t1498), t1499), @calc_rat.real_arith_tac)
  let t1501 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.is_realinterval(), @sets.in_elim_thm()])), @calc_rat.real_arith_tac), t1500])
  let t1482 = @drule.part_match(fn(x1481 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1481))
  }, @realanalysis.trivial_limit_within_realinterval())
  let t1529 = @tactics.thenl(@tactics.then_tac(fn(x1487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1484 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1483 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1479 = @tactics.mp_tac(x1478)
            fn(x1480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1479(x1480)
            }
          })(t1482(x1483))
        })(@kernel.rand(x1484))
      })((fn(x1485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1485.1
      })(x1486))
    })(x1487)(x1487)
  }, @tactics.ants_tac), t1501)
  let t1475 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1474 = @tactics.match_mp_tac(@realanalysis.real_continuous_within_rpow())
  let t1473 = @simp.asm_simp_tac(@list.List([@realanalysis.real_continuous_sub(), @realanalysis.real_continuous_within_id(), @realanalysis.real_continuous_const()]))
  let t1472 = @tactics.match_mp_tac(@realanalysis.real_continuous_withinreal_compose())
  let t1470 = @term_syntax.parse_term("o((x : Real) => rpow(x, (y : Real)), (e : Real) => (s : Real) - e)")
  let t1471 = @simp.rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_conv(@list.List([@trivia.o_def()]))(t1470))]))
  let t1469 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_withinreal())]))
  let t1468 = @simp.gen_rewrite_tac(fn(x1467 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1461 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1462 = @equal.land_conv(x1461)
      fn(x1463 : @kernel.Term) -> @kernel.Thm raise {
        s1462(x1463)
      }
    })((fn(x1464 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1465 = @equal.once_depth_conv(x1464)
      fn(x1466 : @kernel.Term) -> @kernel.Thm raise {
        s1465(x1466)
      }
    })(x1467))
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("measure((s : (Cart[Real, N]) -> Bool)) == measure(s) - real_of_num(0)"))]))
  let t1460 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t1476 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.real_root_rpow(), @measure.measure_open_pos_lt(), @cart.dimindex_nonzero(), @realarith.real_lt_imp_le()])), t1460), @tactics.conj_tac), t1468), t1469), t1471), t1472), t1473), t1474), t1475)
  let t1459 = @simp.rewrite_tac(@list.List([@cart.dimindex_nonzero()]))
  let t1458 = @tactics.match_mp_tac(@transcendentals.real_root_rpow())
  let t1457 = @tactics.conv_tac(@equal.sym_conv)
  let t1456 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1455 = @simp.asm_simp_tac(@list.List([@real.real_lt_min(), @sets.in_elim_thm(), @real.real_sub_rzero(), @measure.measure_open_pos_lt()]))
  let t1454 = @tactics.exists_tac(@term_syntax.parse_term("min(measure((s : (Cart[Real, N]) -> Bool)), measure((t : (Cart[Real, N]) -> Bool)))"))
  let t1477 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t1454), t1455), t1456), @tactics.binop_tac), t1457), t1458), t1459), @calc_rat.asm_real_arith_tac), t1476])
  let t1453 = @simp.rewrite_tac(@list.List([]))
  let t1452 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) => rpow((measure : ((Cart[Real, N]) -> Bool) -> Real)((s : (Cart[Real, N]) -> Bool)) - e, inv(real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))) + rpow((measure : ((Cart[Real, N]) -> Bool) -> Real)((t : (Cart[Real, N]) -> Bool)) - e, inv(real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))))"))
  let t1530 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_transform_eventually()), t1452), t1453), @tactics.conj_tac), t1477), t1529, t1528])
  let t1451 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1450 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) => root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((s : (Cart[Real, N]) -> Bool)) - e) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)((t : (Cart[Real, N]) -> Bool)) - e)"))
  let t1449 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("within(atreal(real_of_num(0)), {(e : Real) | real_of_num(0) <= e})"), @realanalysis.reallim_ubound()))
  let t1448 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measurable_measure_pos_lt(), @measure.measurable_measure_eq_0()])), @tactics.all_tac])
  let t1447 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < measure((s : (Cart[Real, N]) -> Bool)) && real_of_num(0) < measure((t : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t1443 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1442 = @simp.gen_rewrite_tac(fn(x1441 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1435 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1436 = @equal.land_conv(x1435)
      fn(x1437 : @kernel.Term) -> @kernel.Thm raise {
        s1436(x1437)
      }
    })((fn(x1438 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1439 = @equal.once_depth_conv(x1438)
      fn(x1440 : @kernel.Term) -> @kernel.Thm raise {
        s1439(x1440)
      }
    })(x1441))
  }, @list.List([@vectors.vector_add_sym()]))
  let t1434 = @simp.asm_rewrite_tac(@list.List([@measure.measurable_translation_eq()]))
  let t1444 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measure_subset()), t1434), t1442), t1443)
  let t1445 = @list.List([@simp.asm_simp_tac(@list.List([@measure.measure_translation(), @realax.real_le_refl()])), t1444])
  let t1433 = @tactics.exists_tac(@term_syntax.parse_term("measure(IMAGE((x : Cart[Real, N]) => (a : Cart[Real, N]) + x, (s : (Cart[Real, N]) -> Bool)))"))
  let t1432 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1431 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1430 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Cart[Real, N], IN(a, (t : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t1429 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @measure.measure_pos_le()]))
  let t1428 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t1446 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.root_0(), @cart.dimindex_nonzero(), @calc_int.real_add_rid()])), t1428), t1429), t1430), t1431), t1432), t1433), @tactics.conj_tac), t1445), @tactics.all_tac])
  let t1427 = @class.asm_cases_tac(@term_syntax.parse_term("measure((t : (Cart[Real, N]) -> Bool)) == real_of_num(0)"))
  let t1423 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1422 = @simp.asm_rewrite_tac(@list.List([@measure.measurable_translation_eq()]))
  let t1424 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measure_subset()), t1422), t1423)
  let t1425 = @list.List([@simp.asm_simp_tac(@list.List([@measure.measure_translation(), @realax.real_le_refl()])), t1424])
  let t1421 = @tactics.exists_tac(@term_syntax.parse_term("measure(IMAGE((x : Cart[Real, N]) => (a : Cart[Real, N]) + x, (t : (Cart[Real, N]) -> Bool)))"))
  let t1420 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1419 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1418 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Cart[Real, N], IN(a, (s : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t1417 = @simp.asm_simp_tac(@list.List([@cart.dimindex_nonzero(), @measure.measure_pos_le()]))
  let t1416 = @tactics.match_mp_tac(@transcendentals.root_mono_le())
  let t1426 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.root_0(), @cart.dimindex_nonzero(), @realax.real_add_lid()])), t1416), t1417), t1418), t1419), t1420), t1421), @tactics.conj_tac), t1425), @tactics.all_tac])
  let t1415 = @class.asm_cases_tac(@term_syntax.parse_term("measure((s : (Cart[Real, N]) -> Bool)) == real_of_num(0)"))
  let t1414 = @simp.rewrite_tac(@list.List([@realax.real_ge()]))
  let t1413 = @simp.asm_simp_tac(@list.List([brunn_minkowski_open(), @topology.open_empty(), @topology.bounded_empty()]))
  let t1412 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool) == {}"))
  let t1531 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1412), t1413), @tactics.strip_tac), t1414), t1415), t1426), t1427), t1446), t1447), t1448), t1449), t1450), t1451), t1530)
  brunn_minkowski_measurable_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, (s == ({} : (Cart[Real, N]) -> Bool)) == (t == ({} : (Cart[Real, N]) -> Bool)) && (measurable : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (measurable : ((Cart[Real, N]) -> Bool) -> Bool)(t) && (measurable : ((Cart[Real, N]) -> Bool) -> Bool)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)}) → root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)({(x : Cart[Real, N]) + (y : Cart[Real, N]) | (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, s) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(y, t)})) >= root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(s)) + root((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)), (measure : ((Cart[Real, N]) -> Bool) -> Real)(t))"), t1531))
}

///|
let brunn_minkowski_measurable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRUNN_MINKOWSKI_MEASURABLE")

///|
/// `BRUNN_MINKOWSKI_MEASURABLE`
pub fn brunn_minkowski_measurable() -> @kernel.Thm {
  brunn_minkowski_measurable_c.get()
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
}
