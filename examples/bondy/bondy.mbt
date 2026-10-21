// Translated from upstream Examples/bondy.ml; edit this file directly.

///|
/// BONDY
fn step_1() -> Unit raise {
  let t87 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t86 = @tactics.match_mp_tac(@sets.image_eq())
  let t85 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t84 = @tactics.match_mp_tac(@arith.eq_imp_le())
  let t83 = @simp.asm_rewrite_tac(@list.List([]))
  let t81 = @term_syntax.parse_term("CARD({INTER((s : (A) -> Bool), DELETE((X : (A) -> Bool), (a : A))) | IN(s, (f : ((A) -> Bool) -> Bool))})")
  let t82 = @tactics.trans_tac(@arith.le_trans())(t81)
  let t80 = @list.List([@meson.asm_meson_tac(@list.List([@sets.card_image_le()])), @tactics.all_tac])
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.has_size(), @sets.simple_image(), @sets.finite_image(), @equal.gsym(@arith.le_antisym())])), @tactics.conj_tac), t80), t82), t83), t84), @tactics.ap_term_tac), t85), t86), t87)
  let t79 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.insert_subset()]))
  let t78 = @tactics.match_mp_tac(@sets.card_subset_eq())
  let t89 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("IN((a : _), (X : (_) -> Bool)) → ((d : (_) -> Bool) == DELETE(X, a)) == (!IN(a, d) && INSERT(a, d) == X)"))])), t78), t79), @int.asm_arith_tac), t88])
  let t77 = @tactics.subgoal_then(@term_syntax.parse_term("(d : (A) -> Bool) == DELETE((X : (A) -> Bool), (a : A))"), fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s75 = @tactics.subst_all_tac(x74)
    fn(x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s75(x76)
    }
  })
  let t73 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t72 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t70 = @simp.asm_rewrite_tac(@list.List([@sets.psubset_alt()]))
  let t71 = @list.List([@meson.asm_meson_tac(@list.List([@sets.psubset(), @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → !(n - 1 == n)"))])), t70])
  let t69 = @tactics.subgoal_then(@term_syntax.parse_term("PSUBSET((d : (A) -> Bool), (X : (A) -> Bool))"), fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s67 = @tactics.mp_tac(x66)
    fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s67(x68)
    }
  })
  let t65 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.has_size()])))
  let t64 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : (A) -> Bool)"))(@tactics.strip_assume_tac))
  let t90 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@arith.le_refl(), @arith.sub_add()])), t64), t65), t69), t71), t72), t73), @tactics.strip_tac), t77), t89)
  let t63 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t58 = @term_syntax.parse_term("(u : (A) -> Bool)")
  let t59 = @list.List([@term_syntax.parse_term("(t : (A) -> Bool)"), t58])
  let t62 = @tactics.disch_then(fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s56 = @tactics.mp_tac(x55)
      fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s56(x57)
      }
    })(((x60 : @kernel.Thm) => @bool.specl(t59, x60))(x61))
  })
  let t54 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t53 = @simp.asm_rewrite_tac(@list.List([]))
  let t52 = @tactics.match_mp_tac(@sets.card_image_lt2())
  let t51 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t48 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) == (m : Num) + 1 → x < (y : Num) → SUC(m) + 1 <= y")))
  let t50 = @tactics.first_x_assum(fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t48(x49))
  })
  let t47 = @list.List([@tactics.then_tac(@class.cond_cases_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))), @tactics.all_tac])
  let t46 = @simp.asm_simp_tac(@list.List([@sets.has_size(), @sets.card_clauses(), @sets.insert_subset(), @sets.finite_insert()]))
  let t45 = @tactics.exists_tac(@term_syntax.parse_term("INSERT((e : A), (d : (A) -> Bool))"))
  let t44 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t43 = @tactics.subgoal_then(@term_syntax.parse_term("∃ e : A, IN(e, (X : (A) -> Bool)) && !(IN(e, (t : (A) -> Bool)) == IN(e, (u : (A) -> Bool)))"), @tactics.strip_assume_tac)
  let t42 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t40 = @term_syntax.parse_term("(u : (A) -> Bool)")
  let t41 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(t : (A) -> Bool)"), t40]))
  let t38 = @int.arith_rule(@term_syntax.parse_term("SUC((m : Num)) <= (n : Num) - 1 → !(m + 1 == n)"))
  let t39 = @simp.asm_simp_tac(@list.List([@equal.gsym(@sets.simple_image()), @theorems.left_imp_exists_thm(), @class.not_forall_thm(), t38]))
  let t36 = @term_syntax.parse_term("(f : ((A) -> Bool) -> Bool)")
  let t37 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (A) -> Bool) => INTER(s, (d : (A) -> Bool))"), t36]), @sets.card_image_eq_inj()))
  let t34 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t33 = @tactics.match_mp_tac(@sets.card_image_le2())
  let t32 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t31 = @simp.asm_rewrite_tac(@list.List([]))
  let t29 = @term_syntax.parse_term("CARD({INTER((s : (A) -> Bool), (d : (A) -> Bool)) | IN(s, (f : ((A) -> Bool) -> Bool))})")
  let t30 = @tactics.trans_tac(@arith.le_trans())(t29)
  let t28 = @simp.asm_simp_tac(@list.List([@sets.has_size(), @sets.card_clauses(), @sets.insert_subset(), @sets.finite_insert()]))
  let t27 = @tactics.exists_tac(@term_syntax.parse_term("INSERT((a : A), (d : (A) -> Bool))"))
  let t26 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac))
  let t24 = @simp.asm_rewrite_tac(@list.List([@sets.psubset_alt()]))
  let t25 = @list.List([@meson.asm_meson_tac(@list.List([@sets.psubset(), @int.arith_rule(@term_syntax.parse_term("SUC((m : Num)) <= (n : Num) - 1 → !(m == n)"))])), t24])
  let t35 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("PSUBSET((d : (A) -> Bool), (X : (A) -> Bool))"), fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s22 = @tactics.mp_tac(x21)
    fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s22(x23)
    }
  }), t25), t26), t27), t28), t30), t31), t32), t33), t34), @tactics.all_tac])
  let t18 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(m : Num) + 1 <= (n : Num) → SUC(m) + 1 <= n || n == m + 1")))
  let t20 = @tactics.first_x_assum(fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t18(x19))
  })
  let t17 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.has_size()])))
  let t16 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : (A) -> Bool)"))(@tactics.strip_assume_tac))
  let t15 = @tactics.disch_then(fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x13
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t12 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t10 = @meson.asm_meson_tac(@list.List([@sets.has_size(), @sets.card_eq_0(), @sets.card_sing(), @arith.le_refl()]))
  let t9 = @simp.rewrite_tac(@list.List([@sets.simple_image(), @sets.image_const(), @arith.add_clauses()]))
  let t11 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.has_size_0(), @theorems.unwind_thm2(), @sets.inter_empty(), @sets.empty_subset()])), t9), t10), @tactics.all_tac])
  let t91 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@nums.num_induction()), @tactics.conj_tac), t11), t12), t15), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t16), t17), t20), t35), t37), t39), t41), t42), @tactics.strip_tac), t43), t44), t45), t46), @tactics.conj_tac), t47), t50), t51), t52), t53), @tactics.conj_tac), t54), t62), t63), t90])
  let t8 = @simp.rewrite_tac(@list.List([@arith.ge()]))
  let t4 = @term_syntax.parse_term("(n : Num) - 1")
  let t7 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, m <= (n : Num) - 1 → (∃ d : (A) -> Bool, HAS_SIZE(d, m) && SUBSET(d, (X : (A) -> Bool)) && CARD({INTER((s : (A) -> Bool), d) | IN(s, (f : ((A) -> Bool) -> Bool))}) >= m + 1)"), fn(x6 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2 = @tactics.mp_tac(x1)
      fn(x3 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2(x3)
      }
    })(((x5 : @kernel.Thm) => @bool.spec(t4, x5))(x6))
  })
  let t92 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t7), t8), t91)
  bondy_c.set(@tactics.prove(@term_syntax.parse_term("∀ X : (A) -> Bool, ∀ f : ((A) -> Bool) -> Bool, ∀ n : Num, 1 <= n && HAS_SIZE(X, n) && HAS_SIZE(f, n) && (∀ s : (A) -> Bool, IN(s, f) → SUBSET(s, X)) → (∃ x : A, IN(x, X) && HAS_SIZE({DIFF((s : (A) -> Bool), {x}) | IN(s, f)}, n))"), t92))
}

///|
let bondy_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BONDY")

///|
/// `BONDY`
pub fn bondy() -> @kernel.Thm {
  bondy_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
