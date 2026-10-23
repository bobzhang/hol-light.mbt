// Translated from upstream 100/friendship.ml; edit this file directly.

///|
/// GCD_INDUCT
fn step_1() -> Unit raise {
  let t48 = @simp.rewrite_tac(@list.List([@arith.add_sub2(), @prime.gcd_add()]))
  let t47 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s45 = @tactics.subst_all_tac(x44)
    fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s45(x46)
    }
  }))
  let t41 = @simp.gen_rewrite_rule(fn(x40 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x40
  }, @list.List([@arith.le_exists()]))
  let t43 = @tactics.first_x_assum(fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s38 = @tactics.mp_tac(x37)
      fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s38(x39)
      }
    })(t41(x42))
  })
  let t36 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @int.asm_arith_tac), @tactics.all_tac])
  let t35 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t30 = @term_syntax.parse_term("(n : Num) - (m : Num)")
  let t31 = @list.List([@term_syntax.parse_term("(m : Num)"), t30])
  let t34 = @tactics.first_x_assum(fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s28 = @tactics.mp_tac(x27)
      fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s28(x29)
      }
    })(((x32 : @kernel.Thm) => @bool.specl(t31, x32))(x33))
  })
  let t26 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.lt_imp_le()]))
  let t25 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t20 = @term_syntax.parse_term("(n : Num) - (m : Num)")
  let t21 = @list.List([@term_syntax.parse_term("(m : Num)"), t20])
  let t24 = @tactics.disch_then(fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s18 = @tactics.mp_tac(x17)
      fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s18(x19)
      }
    })(((x22 : @kernel.Thm) => @bool.specl(t21, x22))(x23))
  })
  let t16 = @tactics.undisch_tac(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (P : (Num) -> Bool)(m) && P(m + n) → P(n)"))
  let t15 = @list.List([@meson.asm_meson_tac(@list.List([@prime.gcd_0()])), @tactics.all_tac])
  let t14 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t12 = @tactics.repeat_tac(@tactics.strip_tac)
  let t13 = @list.List([@simp.rewrite_tac(@list.List([@theorems.conj_aci(), @prime.gcd_sym(), @arith.add_sym()])), t12])
  let t11 = @tactics.match_mp_tac(@arith.wlog_le())
  let t9 = @term_syntax.parse_term("(m : Num)")
  let t10 = @tactics.map_every(fn(x7 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x7
    @tactics.spec_tac(t, t)
  }, @list.List([@term_syntax.parse_term("(n : Num)"), t9]))
  let t6 = @tactics.repeat_tac(@tactics.pop_assum(fn(x3 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4 = @tactics.mp_tac(x3)
    fn(x5 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4(x5)
    }
  }))
  let t2 = @wf.wf_induct_tac(@term_syntax.parse_term("(m : Num) + (n : Num)"))
  let t1 = @tactics.repeat_tac(@tactics.gen_tac)
  let t49 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t1), t2), t6), t10), t11), @tactics.conj_tac), t13), t14), t15), t16), t24), t25), t26), @tactics.disch_tac), t34), t35), @tactics.ants_tac), t36), t43), t47), t48)
  gcd_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ m : Num, ∀ n : Num, P(m) && P(m + n) → P(n)) → (∀ m : Num, ∀ n : Num, P(m) && P(n) → P(gcd((m, n))))"), t49))
}

///|
let gcd_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD_INDUCT")

///|
/// `GCD_INDUCT`
pub fn gcd_induct() -> @kernel.Thm {
  gcd_induct_c.get()
}

///|
/// LOOP_GCD
fn step_2() -> Unit raise {
  let t50 = @meson.meson_tac(@list.List([@arith.add_ac()]))
  let t51 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(gcd_induct())), t50)
  loop_gcd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> _, ∀ m : Num, ∀ n : Num, (∀ i : Num, x(i + m) == x(i)) && (∀ i : Num, x(i + n) == x(i)) → (∀ i : Num, x(i + gcd((m, n))) == x(i))"), t51))
}

///|
let loop_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOP_GCD")

///|
/// `LOOP_GCD`
pub fn loop_gcd() -> @kernel.Thm {
  loop_gcd_c.get()
}

///|
/// LOOP_COPRIME
fn step_3() -> Unit raise {
  let t53 = @meson.asm_meson_tac(@list.List([loop_gcd(), @prime.coprime_gcd()]))
  let t52 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t54 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t52), t53)
  loop_coprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> _, ∀ m : Num, ∀ n : Num, (∀ i : Num, x(i + m) == x(i)) && (∀ i : Num, x(i + n) == x(i)) && coprime((m, n)) → (∀ i : Num, x(i) == x(0))"), t54))
}

///|
let loop_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOP_COPRIME")

///|
/// `LOOP_COPRIME`
pub fn loop_coprime() -> @kernel.Thm {
  loop_coprime_c.get()
}

///|
/// EQUIVALENCE_UNIFORM_PARTITION
fn step_4() -> Unit raise {
  let t97 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t96 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t95 = @tactics.conv_tac(@equal.sym_conv)
  let t94 = @tactics.subgoal_then(@term_syntax.parse_term("CARD((s : (A) -> Bool)) == CARD({(y : A) | IN(y, s) && (R : (A, A) -> Bool)((a : A), y)}) + CARD({(y : A) | IN(y, s) && !R(a, y)})"), fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x92
    @simp.asm_simp_tac(@list.List([th, @prime.divides_add(), @prime.divides_refl()]))
  })
  let t88 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t87 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t86 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.ante_res_then(fn(x80 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s81 = @tactics.mp_tac(x80)
    fn(x82 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s81(x82)
    }
  }), fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s84 = @tactics.assume_tac(x83)
    fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s84(x85)
    }
  }))
  let t89 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))), t86), @tactics.disch_tac), t87), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t88)
  let t79 = @meson.asm_meson_tac(@list.List([]))
  let t78 = @simp.asm_simp_tac(@list.List([@sets.psubset(), @sets.subset(), @sets.extension(), @sets.in_elim_thm()]))
  let t90 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_psubset()), t78), t79), t89])
  let t77 = @simp.asm_rewrite_tac(@list.List([]))
  let t91 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @sets.finite_restrict()])), t77), @tactics.conj_tac), t90), @tactics.all_tac])
  let t76 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t72 = @term_syntax.parse_term("{(y : A) | IN(y, (s : (A) -> Bool)) && !(R : (A, A) -> Bool)((a : A), y)}")
  let t75 = @tactics.first_x_assum(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s70 = @tactics.mp_tac(x69)
      fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s70(x71)
      }
    })(((x73 : @kernel.Thm) => @bool.spec(t72, x73))(x74))
  })
  let t66 = @term_syntax.parse_term("(a : A)")
  let t68 = @tactics.disch_then((x67 : @kernel.Thm) => @tactics.x_choose_tac(t66, x67))
  let t63 = @simp.gen_rewrite_rule(fn(x62 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x62
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t65 = @tactics.first_assum(fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x59 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s60 = @tactics.mp_tac(x59)
      fn(x61 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s60(x61)
      }
    })(t63(x64))
  })
  let t57 = @tactics.repeat_tac(@tactics.strip_tac)
  let t58 = @list.List([@meson.asm_meson_tac(@list.List([@sets.card_clauses(), @prime.divides_0()])), t57])
  let t56 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t55 = @wf.wf_induct_tac(@term_syntax.parse_term("CARD((s : (A) -> Bool))"))
  let t98 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t55), t56), t58), t65), t68), t75), t76), @tactics.ants_tac), t91), @tactics.disch_tac), t94), t95), t96), t97)
  equivalence_uniform_partition_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ s : (A) -> Bool, ∀ k : Num, FINITE(s) && (∀ x : A, IN(x, s) → R(x, x)) && (∀ x : A, ∀ y : A, R(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) && (∀ x : A, IN(x, s) → CARD({(y : A) | IN(y, s) && R(x, y)}) == k) → divides(k, CARD(s))"), t98))
}

///|
let equivalence_uniform_partition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQUIVALENCE_UNIFORM_PARTITION")

///|
/// `EQUIVALENCE_UNIFORM_PARTITION`
pub fn equivalence_uniform_partition() -> @kernel.Thm {
  equivalence_uniform_partition_c.get()
}

///|
/// EQUIVALENCE_UNIFORM_PARTITION_RESTRICT
fn step_5() -> Unit raise {
  let t103 = @meson.asm_meson_tac(@list.List([]))
  let t102 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t101 = @simp.simp_tac(@list.List([]))
  let t100 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => (y : A) => IN(x, (s : (A) -> Bool)) && IN(y, s) && (R : (A, A) -> Bool)(x, y)"))
  let t99 = @tactics.match_mp_tac(equivalence_uniform_partition())
  let t104 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t99), t100), t101), t102), t103)
  equivalence_uniform_partition_restrict_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ s : (A) -> Bool, ∀ k : Num, FINITE(s) && (∀ x : A, IN(x, s) → R(x, x)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && R(x, y) → R(y, x)) && (∀ x : A, ∀ y : A, ∀ z : A, IN(x, s) && IN(y, s) && IN(z, s) && R(x, y) && R(y, z) → R(x, z)) && (∀ x : A, IN(x, s) → CARD({(y : A) | IN(y, s) && R(x, y)}) == k) → divides(k, CARD(s))"), t104))
}

///|
let equivalence_uniform_partition_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQUIVALENCE_UNIFORM_PARTITION_RESTRICT")

///|
/// `EQUIVALENCE_UNIFORM_PARTITION_RESTRICT`
pub fn equivalence_uniform_partition_restrict() -> @kernel.Thm {
  equivalence_uniform_partition_restrict_c.get()
}

///|
/// ELEMENTS_PAIR_UP
fn step_6() -> Unit raise {
  let t166 = @meson.asm_meson_tac(@list.List([]))
  let t165 = @simp.simp_tac(@list.List([]))
  let t164 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t163 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t162 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t161 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool))"))]))
  let t157 = @term_syntax.parse_term("(x : A)")
  let t160 = @tactics.disch_then(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s155 = @tactics.mp_tac(x154)
      fn(x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s155(x156)
      }
    })(((x158 : @kernel.Thm) => @bool.spec(t157, x158))(x159))
  })
  let t153 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("∀ x : A, IN(x, (s : (A) -> Bool)) → existsunique((y : A) => IN(y, s) && (r : (A, A) -> Bool)(x, y))")))
  let t152 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t150 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t151 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.card_psubset()), t150), @tactics.all_tac])
  let t149 = @simp.asm_simp_tac(@list.List([@sets.finite_delete(), @sets.in_delete()]))
  let t147 = @meson.asm_meson_tac(@list.List([@arith.even()]))
  let t146 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.in_delete()]))
  let t145 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_delete(), @sets.finite_insert()]))
  let t144 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t148 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("(s : (A) -> Bool) == INSERT((a : A), INSERT((b : A), DELETE(DELETE(s, a), b)))"), fn(x141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s142 = @tactics.subst1_tac(x141)
    fn(x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s142(x143)
    }
  })), t144), t145), t146), t147)])
  let t140 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t136 = @term_syntax.parse_term("DELETE(DELETE((s : (A) -> Bool), (a : A)), (b : A))")
  let t139 = @tactics.first_x_assum(fn(x138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x133 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s134 = @tactics.mp_tac(x133)
      fn(x135 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s134(x135)
      }
    })(((x137 : @kernel.Thm) => @bool.spec(t136, x137))(x138))
  })
  let t132 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(@tactics.strip_assume_tac))
  let t131 = @tactics.disch_then(fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s128 = @tactics.mp_tac(x127)
      fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s128(x129)
      }
    })(@bool.existence(x130))
  })
  let t126 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("IN((a : A), (s : (A) -> Bool))"))]))
  let t122 = @term_syntax.parse_term("(a : A)")
  let t125 = @tactics.disch_then(fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s120 = @tactics.mp_tac(x119)
      fn(x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s120(x121)
      }
    })(((x123 : @kernel.Thm) => @bool.spec(t122, x123))(x124))
  })
  let t118 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("∀ x : A, IN(x, (s : (A) -> Bool)) → existsunique((y : A) => IN(y, s) && (r : (A, A) -> Bool)(x, y))")))
  let t115 = @term_syntax.parse_term("(a : A)")
  let t117 = @tactics.disch_then((x116 : @kernel.Thm) => @tactics.x_choose_tac(t115, x116))
  let t112 = @simp.gen_rewrite_rule(fn(x111 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x111
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t114 = @tactics.first_x_assum(fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s109 = @tactics.mp_tac(x108)
      fn(x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s109(x110)
      }
    })(t112(x113))
  })
  let t107 = @simp.asm_rewrite_tac(@list.List([@sets.card_clauses(), @calc_num.arith()]))
  let t106 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (A) -> Bool) == {}"))
  let t105 = @wf.wf_induct_tac(@term_syntax.parse_term("CARD((s : (A) -> Bool))"))
  let t167 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t105), @tactics.strip_tac), t106), t107), t114), t117), t118), t125), t126), t131), t132), t139), t140), @tactics.ants_tac), t148), t149), @tactics.conj_tac), t151), t152), @tactics.strip_tac), t153), t160), t161), t162), @tactics.ap_term_tac), t163), t164), @tactics.eq_tac), t165), t166)
  elements_pair_up_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ r : (A, A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → !r(x, x)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && r(x, y) → r(y, x)) && (∀ x : A, IN(x, s) → existsunique((y : A) => IN(y, s) && r(x, y))) → EVEN(CARD(s))"), t167))
}

///|
let elements_pair_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ELEMENTS_PAIR_UP")

///|
/// `ELEMENTS_PAIR_UP`
pub fn elements_pair_up() -> @kernel.Thm {
  elements_pair_up_c.get()
}

///|
/// cycle
fn step_7() -> Unit raise {
  cycle_c.set(@pair.new_definition(@term_syntax.parse_term("(cycle : ((_, _) -> Bool, Num, (Num) -> _) -> Bool)((r : (_, _) -> Bool), (k : Num), (x : (Num) -> _)) == ((∀ i : Num, r(x(i), x(i + 1))) && (∀ i : Num, x(i + k) == x(i)))")))
}

///|
let cycle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cycle")

///|
/// `cycle`
pub fn cycle() -> @kernel.Thm {
  cycle_c.get()
}

///|
/// path
fn step_8() -> Unit raise {
  path_c.set(@pair.new_definition(@term_syntax.parse_term("(path : ((_, _) -> Bool, Num, (Num) -> _) -> Bool)((r : (_, _) -> Bool), (k : Num), (x : (Num) -> _)) == ((∀ i : Num, i < k → r(x(i), x(i + 1))) && (∀ i : Num, k < i → x(i) == select((x : _) => true)))")))
}

///|
let path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("path")

///|
/// `path`
pub fn path() -> @kernel.Thm {
  path_c.get()
}

///|
/// CYCLE_OFFSET
fn step_9() -> Unit raise {
  let t170 = @meson.asm_meson_tac(@list.List([@arith.add_ac()]))
  let t169 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  let t168 = @simp.rewrite_tac(@list.List([cycle()]))
  let t171 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t168), @tactics.strip_tac), @tactics.gen_tac), @nums.induct_tac), t169), t170)
  cycle_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : (A, A) -> Bool, ∀ k : Num, ∀ x : (Num) -> A, cycle(r, k, x) → (∀ i : Num, ∀ m : Num, x(m * k + i) == x(i))"), t171))
}

///|
let cycle_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CYCLE_OFFSET")

///|
/// `CYCLE_OFFSET`
pub fn cycle_offset() -> @kernel.Thm {
  cycle_offset_c.get()
}

///|
/// CYCLE_MOD
fn step_10() -> Unit raise {
  let t172 = @meson.meson_tac(@list.List([cycle_offset(), @arith.division()]))
  cycle_mod_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : (A, A) -> Bool, ∀ k : Num, ∀ x : (Num) -> A, cycle(r, k, x) && !(k == 0) → (∀ i : Num, x(MOD(i, k)) == x(i))"), t172))
}

///|
let cycle_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CYCLE_MOD")

///|
/// `CYCLE_MOD`
pub fn cycle_mod() -> @kernel.Thm {
  cycle_mod_c.get()
}

///|
/// PATHS_MONO
fn step_11() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([]))
  let t174 = @tactics.then_tac(@simp.rewrite_tac(@list.List([path(), @sets.in_elim_thm(), @sets.subset()])), t173)
  paths_mono_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : _, ∀ y : _, (r : (_, _) -> Bool)(x, y) → (s : (_, _) -> Bool)(x, y)) → SUBSET({(x : (Num) -> _) | path(r, (k : Num), x)}, {(x : (Num) -> _) | path(s, k, x)})"), t174))
}

///|
let paths_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATHS_MONO")

///|
/// `PATHS_MONO`
pub fn paths_mono() -> @kernel.Thm {
  paths_mono_c.get()
}

///|
/// HAS_SIZE_PATHS
fn step_12() -> Unit raise {
  let t221 = @simp.asm_simp_tac(@list.List([@sets.has_size_product_dependent()]))
  let t219 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) < SUC(k)"))]))
  let t218 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == SUC((k : Num))"))
  let t217 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t216 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t215 = @tactics.repeat_tac(@tactics.gen_tac)
  let t214 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), path(), @pair.pair_eq()]))
  let t220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @sets.in_elim_thm()])), t214), t215), @tactics.strip_tac), @tactics.conj_tac), t216), t217), t218), t219), @tactics.all_tac])
  let t213 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t212 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N : Num) * ((m : Num) * EXP(m, (k : Num))) == N * EXP(m, k) * m"))]))
  let t210 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((k : Num)) < (i : Num) → !(i == SUC(k)) && k < i"))]))
  let t209 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) + 1 == SUC((k : Num))) == (i == k)"))]))
  let t208 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) == (k : Num) || i < k → !(i == SUC(k))"))]))
  let t207 = @simp.asm_rewrite_tac(@list.List([]))
  let t205 = @term_syntax.parse_term("(a : A)")
  let t206 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(z : (Num) -> A)"), t205]))
  let t204 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t202 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) < (i : Num) && !(i == k + 1) → SUC(k) < i"))]))
  let t201 = @simp.asm_simp_tac(@list.List([@arith.add1(), @int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) → !(i + 1 == SUC(k))"))]))
  let t200 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) == SUC(k)) && ((i : Num) < k → !(i == SUC(k)))"))]))
  let t199 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t198 = @simp.simp_tac(@list.List([]))
  let t197 = @tactics.exists_tac(@term_syntax.parse_term("(x : (Num) -> A)(SUC((k : Num)))"))
  let t203 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => if i == SUC((k : Num)) { select((x : A) => true) } else { (x : (Num) -> A)(i) }"))), t197), t198), @tactics.conj_tac), t199), t200), t201), t202), @tactics.all_tac])
  let t196 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), path(), @arith.lt()]))
  let t195 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm1()]))
  let t194 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && (c : Bool) && (d : Bool)) == (c && d && a && b)"))]))
  let t193 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t192 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t211 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_image(), @pair.exists_pair_thm()])), t192), t193), t194), t195), t196), @tactics.eq_tac), t203), t204), t206), @tactics.strip_tac), t207), t208), t209), t210), @tactics.all_tac])
  let t191 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : (Num) -> A) | path((r : (A, A) -> Bool), SUC((k : Num)), x)} == IMAGE(GABS((f : (((Num) -> A, A), Num) -> A) => ∀ x : (Num) -> A, ∀ a : A, GEQ(f((x, a)), (i : Num) => if i == SUC(k) { a } else { x(i) })), {((x : (Num) -> A), (a : A)) | IN(x, {(x : (Num) -> A) | path(r, k, x)}) && IN(a, {(u : A) | r(x(k), u)})})"), fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s189 = @tactics.subst1_tac(x188)
    fn(x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s189(x190)
    }
  })
  let t186 = @meson.meson_tac(@list.List([]))
  let t185 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t184 = @simp.asm_rewrite_tac(@list.List([@sets.in_univ()]))
  let t183 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t181 = @meson.meson_tac(@list.List([]))
  let t180 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @arith.lt_nz()]))
  let t182 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_image(), @sets.in_univ(), path(), @arith.lt()])), t180), t181), @tactics.all_tac])
  let t187 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(x : (Num) -> A) | path((r : (A, A) -> Bool), 0, x)} == IMAGE((a : A) => (i : Num) => if i == 0 { a } else { select((x : A) => true) }, UNIV)"), fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s178 = @tactics.subst1_tac(x177)
    fn(x179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s178(x179)
    }
  }), t182), t183), t184), t185), t186), @tactics.all_tac])
  let t176 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.mult_clauses()]))
  let t175 = @tactics.repeat_tac(@tactics.gen_tac)
  let t222 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), t175), @tactics.strip_tac), @nums.induct_tac), t176), t187), t191), t211), t212), t213), @tactics.conj_tac), t220), t221)
  has_size_paths_c.set(@tactics.prove(@term_syntax.parse_term("∀ N : Num, ∀ m : Num, ∀ r : (A, A) -> Bool, ∀ k : Num, (HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), N) && (∀ x : A, (HAS_SIZE : ((A) -> Bool, Num) -> Bool)({(y : A) | r(x, y)}, m)) → (HAS_SIZE : (((Num) -> A) -> Bool, Num) -> Bool)({(x : (Num) -> A) | (path : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k, x)}, N * EXP(m, k))"), t222))
}

///|
let has_size_paths_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_PATHS")

///|
/// `HAS_SIZE_PATHS`
pub fn has_size_paths() -> @kernel.Thm {
  has_size_paths_c.get()
}

///|
/// FINITE_PATHS
fn step_13() -> Unit raise {
  let t230 = @simp.asm_simp_tac(@list.List([@sets.has_size(), @sets.set_rule(@term_syntax.parse_term("{(y : A) | true} == UNIV"))]))
  let t226 = @term_syntax.parse_term("(k : Num)")
  let t227 = @term_syntax.parse_term("(a : A) => (b : A) => true")
  let t228 = @term_syntax.parse_term("(CARD : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool))")
  let t229 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(CARD : ((A) -> Bool) -> Num)((UNIV : (A) -> Bool))"), t228, t227, t226]), has_size_paths()))
  let t225 = @simp.simp_tac(@list.List([paths_mono()]))
  let t224 = @tactics.exists_tac(@term_syntax.parse_term("{(x : (Num) -> A) | path((a : A) => (b : A) => true, (k : Num), x)}"))
  let t223 = @tactics.match_mp_tac(@sets.finite_subset())
  let t231 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t223), t224), t225), t229), @tactics.ants_tac), t230)
  finite_paths_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : (A, A) -> Bool, ∀ k : Num, (FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) → (FINITE : (((Num) -> A) -> Bool) -> Bool)({(x : (Num) -> A) | (path : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k, x)})"), t231))
}

///|
let finite_paths_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_PATHS")

///|
/// `FINITE_PATHS`
pub fn finite_paths() -> @kernel.Thm {
  finite_paths_c.get()
}

///|
/// HAS_SIZE_CYCLES
fn step_14() -> Unit raise {
  let t306 = @meson.asm_meson_tac(@list.List([@arith.mod_0()]))
  let t303 = @simp.asm_rewrite_tac(@list.List([]))
  let t304 = @meson.asm_meson_tac(@list.List([]))
  let t305 = @list.List([@meson.asm_meson_tac(@list.List([@arith.mod_lt()])), t304, t303])
  let t300 = @term_syntax.parse_term("(k : Num)")
  let t301 = @bool.specl(@list.List([@term_syntax.parse_term("(i : Num)"), t300]), @arith.lt_cases())
  let t302 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s298 = @tactics.assume_tac(x297)
    fn(x299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s298(x299)
    }
  })(t301)
  let t296 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t295 = @simp.rewrite_tac(@list.List([path(), @class.fun_eq_thm()]))
  let t294 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t292 = @term_syntax.parse_term("(y : (Num) -> A)")
  let t293 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : (Num) -> A)"), t292]))
  let t290 = @sets.set_tac(@list.List([]))
  let t289 = @simp.asm_simp_tac(@list.List([finite_paths()]))
  let t288 = @tactics.exists_tac(@term_syntax.parse_term("{(x : (Num) -> A) | path((r : (A, A) -> Bool), (k : Num), x)}"))
  let t287 = @tactics.match_mp_tac(@sets.finite_subset())
  let t291 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.has_size()])), t287), t288), t289), t290)])
  let t286 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t282 = @tactics.undisch_tac(@term_syntax.parse_term("!((k : Num) == 0)"))
  let t281 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t280 = @tactics.match_mp_tac(@arith.mod_uniq())
  let t279 = @simp.asm_simp_tac(@list.List([@arith.mod_lt()]))
  let t278 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((j : Num) < (k : Num)) == (j + 1 < k || j + 1 == k)"))]))
  let t276 = @term_syntax.parse_term("(j : Num)")
  let t277 = @tactics.spec_tac(@term_syntax.parse_term("MOD((i : Num), (k : Num))"), t276)
  let t273 = @drule.match_mp(@arith.division())
  let t270 = @term_syntax.parse_term("(i : Num)")
  let t275 = @tactics.first_assum(fn(x274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s267 = @tactics.mp_tac(x266)
          fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s267(x268)
          }
        })(@bool.conjunct2(x269))
      })(((x271 : @kernel.Thm) => @bool.spec(t270, x271))(x272))
    })(t273(x274))
  })
  let t264 = @meson.asm_meson_tac(@list.List([@arith.division()]))
  let t263 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) + 1 == (m : Num) + 1 + (ik : Num)) == (i == ik + m)"))]))
  let t262 = @tactics.exists_tac(@term_syntax.parse_term("DIV((i : Num), (k : Num))"))
  let t265 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.mod_eq()), t262), t263), t264), @tactics.all_tac])
  let t261 = @tactics.subgoal_then(@term_syntax.parse_term("MOD((i : Num) + 1, (k : Num)) == MOD(MOD(i, k) + 1, k)"), fn(x258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s259 = @tactics.subst1_tac(x258)
    fn(x260 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s259(x260)
    }
  })
  let t257 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([path(), @arith.division()]))])
  let t256 = @tactics.subgoal_then(@term_syntax.parse_term("(y : (Num) -> A)(MOD((i : Num) + 1, (k : Num))) == y(MOD(i, k) + 1)"), fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s254 = @tactics.subst1_tac(x253)
    fn(x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s254(x255)
    }
  })
  let t251 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t250 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t252 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.match_mp_tac(@arith.mod_eq())), t250), t251)])
  let t249 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t248 = @simp.rewrite_tac(@list.List([cycle()]))
  let t247 = @simp.asm_rewrite_tac(@list.List([]))
  let t246 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : (Num) -> A)"))
  let t283 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()])), t246), @tactics.strip_tac), t247), t248), @tactics.conj_tac), t249), t252), t256), t257), t261), t265), t275), t277), @tactics.gen_tac), t278), @tactics.strip_tac), t279), @tactics.ap_term_tac), t280), t281), t282), @int.arith_tac)
  let t242 = @meson.asm_meson_tac(@list.List([cycle(), @arith.add_clauses()]))
  let t243 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_0(), @arith.le_refl()])), t242)
  let t241 = @meson.asm_meson_tac(@list.List([cycle()]))
  let t240 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) → !(k < i + 1)"))]))
  let t239 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t244 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([path(), @arith.lt_imp_le()])), t239), t240), t241)
  let t238 = @meson.asm_meson_tac(@list.List([cycle_mod()]))
  let t245 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@class.fun_eq_thm(), @arith.lt_imp_le(), @arith.division()])), t238), t244, t243])
  let t237 = @tactics.repeat_tac(@tactics.conj_tac)
  let t284 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => if i <= (k : Num) { (x : (Num) -> A)(i) } else { select((x : A) => true) }"))), t237), t245), t283])
  let t236 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t285 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t236), @tactics.eq_tac), t284), @tactics.all_tac])
  let t235 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : (Num) -> A) | cycle((r : (A, A) -> Bool), (k : Num), x)} == IMAGE((x : (Num) -> A) => (i : Num) => x(MOD(i, k)), {(x : (Num) -> A) | path(r, k, x) && x(k) == x(0)})"), fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s233 = @tactics.subst1_tac(x232)
    fn(x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s233(x234)
    }
  })
  let t307 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t235), t285), t286), @tactics.conj_tac), t291), t293), t294), t295), @tactics.strip_tac), t296), t302), t305), t306)
  has_size_cycles_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : (A, A) -> Bool, ∀ k : Num, (FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) && !(k == 0) → (HAS_SIZE : (((Num) -> A) -> Bool, Num) -> Bool)({(x : (Num) -> A) | (cycle : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k, x)}, (CARD : (((Num) -> A) -> Bool) -> Num)({(x : (Num) -> A) | (path : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k, x) && x(k) == x(0)}))"), t307))
}

///|
let has_size_cycles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_CYCLES")

///|
/// `HAS_SIZE_CYCLES`
pub fn has_size_cycles() -> @kernel.Thm {
  has_size_cycles_c.get()
}

///|
/// FINITE_CYCLES
fn step_15() -> Unit raise {
  let t308 = @meson.meson_tac(@list.List([has_size_cycles(), @sets.has_size()]))
  finite_cycles_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : (A, A) -> Bool, ∀ k : Num, (FINITE : ((A) -> Bool) -> Bool)((UNIV : (A) -> Bool)) && !(k == 0) → (FINITE : (((Num) -> A) -> Bool) -> Bool)({(x : (Num) -> A) | (cycle : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k, x)})"), t308))
}

///|
let finite_cycles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_CYCLES")

///|
/// `FINITE_CYCLES`
pub fn finite_cycles() -> @kernel.Thm {
  finite_cycles_c.get()
}

///|
/// CARD_PATHCYCLES_STEP
fn step_16() -> Unit raise {
  let t538 = @meson.asm_meson_tac(@list.List([path(), @int.arith_rule(@term_syntax.parse_term("(k : Num) + 2 < (i : Num) → k < i"))]))
  let t537 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) + 2 < (i : Num) → !(i == k + 1) && !(i == k + 2)"))]))
  let t533 = @term_syntax.parse_term("(i : Num) < (k : Num) + 2")
  let t534 = @term_syntax.parse_term("!((i : Num) == (k : Num) + 1)")
  let t535 = @tactics.map_every(fn(x530 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s531 = @tactics.undisch_tac(x530)
    fn(x532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s531(x532)
    }
  }, @list.List([@term_syntax.parse_term("!((i : Num) == (k : Num))"), t534, t533]))
  let t529 = @tactics.disch_then(fn(x528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(@bool.conjunct1(x528))
  })
  let t527 = @simp.rewrite_tac(@list.List([path()]))
  let t526 = @tactics.undisch_tac(@term_syntax.parse_term("path((r : (A, A) -> Bool), (k : Num), (y : (Num) -> A))"))
  let t525 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t524 = @simp.asm_simp_tac(@list.List([]))
  let t523 = @simp.rewrite_tac(@list.List([@arith.eq_add_rcancel()]))
  let t522 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) + 2 → !(i == k + 2)"))]))
  let t520 = @meson.asm_meson_tac(@list.List([]))
  let t521 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((k : Num) + 1 + 1 == k + 1) == false"))])), t520), @tactics.all_tac])
  let t519 = @simp.asm_rewrite_tac(@list.List([]))
  let t518 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (k : Num) + 1"))
  let t536 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) + 1 == (k : Num) + 2) == (i == k + 1)"))])), t518), t519), t521), t522), t523), @class.cond_cases_tac), t524), t525), t526), t527), t529), t535), @int.arith_tac), @tactics.all_tac])
  let t517 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t516 = @simp.rewrite_tac(@list.List([path()]))
  let t515 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) + 2 == k + 1) && !(0 == k + 1) && !(0 == k + 2) && !(k == k + 1) && !(k == k + 2)"))]))
  let t514 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : (Num) -> A)"))(@tactics.strip_assume_tac))
  let t512 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((i : Num) <= (k : Num)) && !(i == k + 1) && !(i == k + 2) → k + 2 < i"))]))
  let t511 = @tactics.disch_then(fn(x510 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x507 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s508 = @tactics.mp_tac(x507)
      fn(x509 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s508(x509)
      }
    })(@bool.conjunct2(x510))
  })
  let t506 = @simp.rewrite_tac(@list.List([path()]))
  let t505 = @tactics.undisch_tac(@term_syntax.parse_term("path((r : (A, A) -> Bool), (k : Num) + 2, (x : (Num) -> A))"))
  let t504 = @simp.asm_rewrite_tac(@list.List([]))
  let t503 = @simp.asm_rewrite_tac(@list.List([]))
  let t502 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (k : Num) + 2"))
  let t500 = @meson.asm_meson_tac(@list.List([]))
  let t499 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc()), @calc_num.arith()]))
  let t498 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) < k + 2 && k + 1 < k + 2"))]))
  let t497 = @tactics.disch_then(fn(x494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x494
    let t496 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num) + 1"), th_4))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), th_4)), t496)
  })
  let t493 = @tactics.disch_then(fn(x492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x489 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s490 = @tactics.mp_tac(x489)
      fn(x491 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s490(x491)
      }
    })(@bool.conjunct1(x492))
  })
  let t488 = @simp.rewrite_tac(@list.List([path()]))
  let t487 = @tactics.undisch_tac(@term_syntax.parse_term("path((r : (A, A) -> Bool), (k : Num) + 2, (x : (Num) -> A))"))
  let t486 = @tactics.match_mp_tac(@class.select_unique())
  let t501 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t486), t487), t488), t493), t497), t498), t499), t500), @tactics.all_tac])
  let t485 = @simp.asm_rewrite_tac(@list.List([]))
  let t484 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (k : Num) + 1"))
  let t483 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t482 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t480 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) → i < k + 2"))]))
  let t479 = @simp.simp_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t478 = @simp.simp_tac(@list.List([path(), @arith.lt_imp_le(), @int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) → i + 1 <= k"))]))
  let t481 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("path((r : (A, A) -> Bool), (k : Num) + 2, (x : (Num) -> A))")), t478), t479), t480)])
  let t477 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl(), @arith.le_0()]))
  let t513 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => if i <= (k : Num) { (x : (Num) -> A)(i) } else { select((x : A) => true) }"))), t477), @tactics.conj_tac), t481), t482), t483), t484), t485), t501), t502), t503), @class.cond_cases_tac), t504), t505), t506), t511), t512), @tactics.all_tac])
  let t476 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t475 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t474 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()]))
  let t472 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) < k + 1 && k < k + 2"))]))
  let t468 = @term_syntax.parse_term("(i : Num)")
  let t471 = @tactics.disch_then(fn(x470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s466 = @tactics.mp_tac(x465)
      fn(x467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s466(x467)
      }
    })(((x469 : @kernel.Thm) => @bool.spec(t468, x469))(x470))
  })
  let t462 = @simp.gen_rewrite_rule(fn(x461 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x461
  }, @list.List([@class.fun_eq_thm()]))
  let t464 = @tactics.first_x_assum(fn(x463 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x458 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s459 = @tactics.mp_tac(x458)
      fn(x460 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s459(x460)
      }
    })(t462(x463))
  })
  let t457 = @list.List([@meson.asm_meson_tac(@list.List([path()])), @tactics.all_tac])
  let t456 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) < (i : Num)"))
  let t455 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t454 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t453 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t451 = @term_syntax.parse_term("(y : (Num) -> A)")
  let t452 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : (Num) -> A)"), t451]))
  let t449 = @meson.asm_meson_tac(@list.List([@sets.has_size(), finite_paths()]))
  let t448 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t447 = @tactics.exists_tac(@term_syntax.parse_term("{(x : (Num) -> A) | path((r : (A, A) -> Bool), (k : Num), x)}"))
  let t446 = @tactics.match_mp_tac(@sets.finite_subset())
  let t450 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.has_size()])), t446), t447), @tactics.conj_tac), t448), t449)])
  let t473 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_image_inj()), @tactics.conj_tac), t450), t452), t453), @tactics.strip_tac), t454), t455), t456), t457), t464), t471), t472)])
  let t445 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : (Num) -> A) | path((r : (A, A) -> Bool), (k : Num) + 2, x) && !(x(k) == x(0)) && x(k + 2) == x(0)} == IMAGE((x : (Num) -> A) => (i : Num) => if i == k + 1 { select((z : A) => r(x(k), z) && r(z, x(0))) } else { if i == k + 2 { x(0) } else { x(i) } }, {(x : (Num) -> A) | path(r, k, x) && !(x(k) == x(0))})"), fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s443 = @tactics.subst1_tac(x442)
    fn(x444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s443(x444)
    }
  })
  let t440 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) + 2 && !(i == k) && !(i == k + 1) → i < k"))]))
  let t439 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t438 = @simp.asm_simp_tac(@list.List([]))
  let t437 = @simp.rewrite_tac(@list.List([@arith.eq_add_rcancel()]))
  let t436 = @list.List([@meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((x : Num) + 1 == x)"))])), @tactics.all_tac])
  let t435 = @simp.asm_rewrite_tac(@list.List([]))
  let t434 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (k : Num) + 1"))
  let t433 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) + 1 == (k : Num) + 2) == (i == k + 1)"))]))
  let t432 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) + 2 → !(i == k + 2)"))]))
  let t431 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t430 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) + 2 < (i : Num) → k < i && !(i == k + 1) && !(i == k + 2)"))]))
  let t429 = @simp.asm_rewrite_tac(@list.List([path()]))
  let t428 = @tactics.undisch_tac(@term_syntax.parse_term("path((r : (A, A) -> Bool), (k : Num), (z : (Num) -> A))"))
  let t426 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) == k + 2) && !(k == k + 1)"))]))
  let t423 = @term_syntax.parse_term("(k : Num)")
  let t427 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.remove_then("*", fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s421 = @tactics.mp_tac(x420)
      fn(x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s421(x422)
      }
    })(((x424 : @kernel.Thm) => @bool.spec(t423, x424))(x425))
  }), t426)])
  let t418 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) + 2 == k + 1)"))]))
  let t415 = @term_syntax.parse_term("(k : Num) + 2")
  let t419 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.remove_then("*", fn(x417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x412 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s413 = @tactics.mp_tac(x412)
      fn(x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s413(x414)
      }
    })(((x416 : @kernel.Thm) => @bool.spec(t415, x416))(x417))
  }), t418)])
  let t411 = @tactics.disch_then(fn(x408 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s409 = ((x407 : @kernel.Thm) => @tactics.label_tac("*", x407))(x408)
    fn(x410 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s409(x410)
    }
  })
  let t406 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t405 = @simp.rewrite_tac(@list.List([@class.cond_id(), @int.arith_rule(@term_syntax.parse_term("!(0 == (k : Num) + 1)"))]))
  let t404 = @tactics.disch_then(fn(x401 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x401
    let t403 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("0"), th_3))
    @tactics.then_tac(@tactics.mp_tac(th_3), t403)
  })
  let t400 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x397 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s398 = @tactics.mp_tac(x397)
    fn(x399 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s398(x399)
    }
  }, @tactics.strip_assume_tac))
  let t395 = @term_syntax.parse_term("(b : A)")
  let t396 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(z : (Num) -> A)"), t395]))
  let t394 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t392 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((k : Num) + 2 < (i : Num)) == (!(i <= k) && !(i == k + 1) && !(i == k + 2))"))]))
  let t387 = @term_syntax.parse_term("(i : Num)")
  let t391 = @tactics.disch_then(fn(x390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x389 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s385 = @tactics.mp_tac(x384)
        fn(x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s385(x386)
        }
      })(((x388 : @kernel.Thm) => @bool.spec(t387, x388))(x389))
    })(@bool.conjunct2(x390))
  })
  let t383 = @simp.asm_rewrite_tac(@list.List([]))
  let t380 = @simp.gen_rewrite_rule(fn(x379 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x379
  }, @list.List([path()]))
  let t382 = @tactics.first_x_assum(fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s377 = @tactics.mp_tac(x376)
      fn(x378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s377(x378)
      }
    })(t380(x381))
  })
  let t375 = @simp.asm_rewrite_tac(@list.List([]))
  let t374 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (k : Num) + 2"))
  let t373 = @simp.asm_rewrite_tac(@list.List([]))
  let t372 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (k : Num) + 1"))
  let t371 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t369 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) → i < k + 2"))]))
  let t368 = @simp.simp_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t367 = @simp.simp_tac(@list.List([path(), @arith.lt_imp_le(), @int.arith_rule(@term_syntax.parse_term("(i : Num) < (k : Num) → i + 1 <= k"))]))
  let t370 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("path((r : (A, A) -> Bool), (k : Num) + 2, (x : (Num) -> A))")), t367), t368), t369)])
  let t366 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([path(), @int.arith_rule(@term_syntax.parse_term("(k : Num) < k + 2"))]))])
  let t365 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t364 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @arith.le_refl(), @arith.le_0()]))
  let t363 = @tactics.exists_tac(@term_syntax.parse_term("(x : (Num) -> A)((k : Num) + 1)"))
  let t393 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => if i <= (k : Num) { (x : (Num) -> A)(i) } else { select((x : A) => true) }"))), t363), t364), t365), @tactics.conj_tac), t366), @tactics.conj_tac), t370), t371), t372), t373), t374), t375), t382), @class.cond_cases_tac), t383), t391), t392), @tactics.all_tac])
  let t362 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t361 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @sets.in_elim_thm()]))
  let t360 = @simp.rewrite_tac(@list.List([@pair.exists_pair_thm(), @sets.in_elim_pair_thm()]))
  let t359 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image()]))
  let t357 = @meson.asm_meson_tac(@list.List([@sets.has_size(), finite_paths()]))
  let t356 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t355 = @tactics.exists_tac(@term_syntax.parse_term("{(x : (Num) -> A) | path((r : (A, A) -> Bool), (k : Num), x)}"))
  let t354 = @tactics.match_mp_tac(@sets.finite_subset())
  let t353 = @simp.rewrite_tac(@list.List([@sets.has_size()]))
  let t352 = @simp.asm_rewrite_tac(@list.List([]))
  let t351 = @tactics.match_mp_tac(@sets.has_size_product_dependent())
  let t350 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t348 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) < k + 1 && k < k + 2"))]))
  let t344 = @term_syntax.parse_term("(i : Num)")
  let t347 = @tactics.disch_then(fn(x346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s342 = @tactics.mp_tac(x341)
      fn(x343 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s342(x343)
      }
    })(((x345 : @kernel.Thm) => @bool.spec(t344, x345))(x346))
  })
  let t340 = @list.List([@meson.asm_meson_tac(@list.List([path()])), @tactics.all_tac])
  let t339 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) < (i : Num)"))
  let t338 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(0 == (k : Num) + 1) && !(0 == k + 2)"))]))
  let t337 = @tactics.disch_then(fn(x334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x334
    let t336 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("0"), th_2))
    @tactics.then_tac(@tactics.mp_tac(th_2), t336)
  })
  let t333 = @tactics.disch_then(fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x330
    let t332 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")), t332)
  })
  let t329 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s327 = @tactics.mp_tac(x326)
    fn(x328 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s327(x328)
    }
  })))
  let t325 = @tactics.disch_then(fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x322
    let t324 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
    @tactics.thenl(@tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th)), t324)
  })
  let t318 = @term_syntax.parse_term("(b : A)")
  let t319 = @term_syntax.parse_term("(z : (Num) -> A)")
  let t320 = @term_syntax.parse_term("(a : A)")
  let t321 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : (Num) -> A)"), t320, t319, t318]))
  let t317 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @class.fun_eq_thm(), @pair.pair_eq()]))
  let t349 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()])), t317), t321), t325), t329), t333), t337), t338), @tactics.disch_tac), t339), t340), t347), t348), @tactics.all_tac])
  let t358 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_image_inj()), @tactics.conj_tac), t349), t350), t351), t352), t353), t354), t355), @tactics.conj_tac), t356), t357)])
  let t441 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(x : (Num) -> A) | path((r : (A, A) -> Bool), (k : Num) + 2, x) && x(k) == x(0) && x(k + 2) == x(0)} == IMAGE(GABS((f : (((Num) -> A, A), Num) -> A) => ∀ x : (Num) -> A, ∀ a : A, GEQ(f((x, a)), (i : Num) => if i == k + 1 { a } else { if i == k + 2 { x(0) } else { x(i) } })), {((x : (Num) -> A), (a : A)) | IN(x, {(x : (Num) -> A) | path(r, k, x) && x(k) == x(0)}) && IN(a, {(u : A) | r(x(k), u)})})"), fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s315 = @tactics.subst1_tac(x314)
    fn(x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s315(x316)
    }
  }), t358), t359), t360), t361), t362), @tactics.eq_tac), t393), t394), t396), t400), t404), t405), @tactics.disch_tac), t406), t411), @tactics.conj_tac), t419), @tactics.conj_tac), t427), t428), t429), t430), @tactics.strip_tac), t431), @tactics.disch_tac), t432), t433), t434), t435), t436), t437), @class.cond_cases_tac), t438), t439), t440), @tactics.all_tac])
  let t313 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t312 = @simp.gen_rewrite_tac(fn(x311 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x311
  }, @list.List([@theorems.conj_assoc()]))
  let t310 = @tactics.match_mp_tac(@sets.has_size_union())
  let t309 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : (Num) -> _) | path((r : (_, _) -> Bool), (k : Num) + 2, x) && x(k + 2) == x(0)} == UNION({(x : (Num) -> _) | path(r, k + 2, x) && x(k) == x(0) && x(k + 2) == x(0)}, {(x : (Num) -> _) | path(r, k + 2, x) && !(x(k) == x(0)) && x(k + 2) == x(0)})"))]))
  let t539 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t309), t310), t312), @tactics.conj_tac), t313), @tactics.conj_tac), t441), t445), t473), t474), t475), t476), @tactics.eq_tac), t513), t514), t515), t516), @tactics.conj_tac), t517), @tactics.disch_tac), t536), t537), t538)
  card_pathcycles_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ N : Num, ∀ m : Num, ∀ r : (A, A) -> Bool, ∀ k : Num, (HAS_SIZE : ((A) -> Bool, Num) -> Bool)((UNIV : (A) -> Bool), N) && !(k == 0) && !(m == 0) && (∀ x : A, (HAS_SIZE : ((A) -> Bool, Num) -> Bool)({(y : A) | r(x, y)}, m)) && (∀ x : A, ∀ y : A, r(x, y) → r(y, x)) && (∀ x : A, ∀ y : A, !(x == y) → (existsunique : ((A) -> Bool) -> Bool)((z : A) => r(x, z) && r(z, y))) → (HAS_SIZE : (((Num) -> A) -> Bool, Num) -> Bool)({(x : (Num) -> A) | (path : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k + 2, x) && x(k + 2) == x(0)}, m * (CARD : (((Num) -> A) -> Bool) -> Num)({(x : (Num) -> A) | (path : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k, x) && x(k) == x(0)}) + (CARD : (((Num) -> A) -> Bool) -> Num)({(x : (Num) -> A) | (path : ((A, A) -> Bool, Num, (Num) -> A) -> Bool)(r, k, x) && !(x(k) == x(0))}))"), t539))
}

///|
let card_pathcycles_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_PATHCYCLES_STEP")

///|
/// `CARD_PATHCYCLES_STEP`
pub fn card_pathcycles_step() -> @kernel.Thm {
  card_pathcycles_step_c.get()
}

///|
/// shiftable
fn step_17() -> Unit raise {
  shiftable_c.set(@pair.new_definition(@term_syntax.parse_term("(shiftable : ((Num) -> _, (Num) -> _) -> Bool)((x : (Num) -> _), (y : (Num) -> _)) == (∃ k : Num, ∀ i : Num, x(i) == y(i + k))")))
}

///|
let shiftable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("shiftable")

///|
/// `shiftable`
pub fn shiftable() -> @kernel.Thm {
  shiftable_c.get()
}

///|
/// SHIFTABLE_REFL
fn step_18() -> Unit raise {
  let t540 = @meson.meson_tac(@list.List([@arith.add_clauses()]))
  let t541 = @tactics.then_tac(@simp.rewrite_tac(@list.List([shiftable()])), t540)
  shiftable_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> _, shiftable(x, x)"), t541))
}

///|
let shiftable_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SHIFTABLE_REFL")

///|
/// `SHIFTABLE_REFL`
pub fn shiftable_refl() -> @kernel.Thm {
  shiftable_refl_c.get()
}

///|
/// SHIFTABLE_TRANS
fn step_19() -> Unit raise {
  let t542 = @meson.meson_tac(@list.List([@arith.add_assoc()]))
  let t543 = @tactics.then_tac(@simp.rewrite_tac(@list.List([shiftable()])), t542)
  shiftable_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> _, ∀ y : (Num) -> _, ∀ z : (Num) -> _, shiftable(x, y) && shiftable(y, z) → shiftable(x, z)"), t543))
}

///|
let shiftable_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SHIFTABLE_TRANS")

///|
/// `SHIFTABLE_TRANS`
pub fn shiftable_trans() -> @kernel.Thm {
  shiftable_trans_c.get()
}

///|
/// SHIFTABLE_LOCAL
fn step_20() -> Unit raise {
  let t581 = @meson.asm_meson_tac(@list.List([cycle_offset(), @arith.add_ac()]))
  let t580 = @tactics.disch_then(fn(x567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x567
    @simp.gen_rewrite_tac(fn(x579 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x575 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x569 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s570 = @equal.binder_conv(x569)
          fn(x571 : @kernel.Term) -> @kernel.Thm raise {
            s570(x571)
          }
        })((fn(x572 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s573 = @equal.land_conv(x572)
          fn(x574 : @kernel.Term) -> @kernel.Thm raise {
            s573(x574)
          }
        })(x575))
      })((fn(x576 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s577 = @equal.once_depth_conv(x576)
        fn(x578 : @kernel.Term) -> @kernel.Thm raise {
          s577(x578)
        }
      })(x579))
    }, @list.List([th]))
  })
  let t566 = @simp.asm_rewrite_tac(@list.List([]))
  let t565 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s560 = @tactics.mp_tac(x559)
    fn(x561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s560(x561)
    }
  }, fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s563 = @tactics.assume_tac(x562)
    fn(x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s563(x564)
    }
  }))
  let t556 = @drule.match_mp(@arith.division())
  let t553 = @term_syntax.parse_term("(k : Num)")
  let t558 = @tactics.first_assum(fn(x557 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x555 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s551 = @tactics.mp_tac(x550)
        fn(x552 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s551(x552)
        }
      })(((x554 : @kernel.Thm) => @bool.spec(t553, x554))(x555))
    })(t556(x557))
  })
  let t549 = @tactics.exists_tac(@term_syntax.parse_term("MOD((k : Num), (p : Num))"))
  let t546 = @term_syntax.parse_term("(k : Num)")
  let t548 = @tactics.disch_then((x547 : @kernel.Thm) => @tactics.x_choose_tac(t546, x547))
  let t545 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t544 = @simp.rewrite_tac(@list.List([shiftable()]))
  let t582 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t544), @tactics.eq_tac), t545), t548), t549), t558), t565), t566), t580), t581)
  shiftable_local_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> _, ∀ y : (Num) -> _, ∀ p : Num, ∀ r : (_, _) -> Bool, cycle(r, p, x) && cycle(r, p, y) && !(p == 0) → shiftable(x, y) == (∃ k : Num, k < p && (∀ i : Num, x(i) == y(i + k)))"), t582))
}

///|
let shiftable_local_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SHIFTABLE_LOCAL")

///|
/// `SHIFTABLE_LOCAL`
pub fn shiftable_local() -> @kernel.Thm {
  shiftable_local_c.get()
}

///|
/// SHIFTABLE_SYM
fn step_21() -> Unit raise {
  let t601 = @meson.asm_meson_tac(@list.List([cycle()]))
  let t600 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) < (p : Num) → (i : Num) + (p - k) + k == i + p"))]))
  let t599 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) - (k : Num)"))
  let t598 = @simp.rewrite_tac(@list.List([shiftable()]))
  let t597 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(@tactics.strip_assume_tac))
  let t594 = @drule.match_mp(shiftable_local())
  let t596 = @tactics.first_assum(fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x591 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s592 = @tactics.subst1_tac(x591)
      fn(x593 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s592(x593)
      }
    })(t594(x595))
  })
  let t590 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s585 = @tactics.assume_tac(x584)
    fn(x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s585(x586)
    }
  }, fn(x587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s588 = @tactics.mp_tac(x587)
    fn(x589 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s588(x589)
    }
  }))
  let t583 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) == ((a && b && c) && d)"))]))
  let t602 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t583), t590), t596), t597), t598), t599), t600), t601)
  shiftable_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> _, ∀ y : (Num) -> _, ∀ p : Num, ∀ r : (_, _) -> Bool, cycle(r, p, x) && cycle(r, p, y) && !(p == 0) && shiftable(x, y) → shiftable(y, x)"), t602))
}

///|
let shiftable_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SHIFTABLE_SYM")

///|
/// `SHIFTABLE_SYM`
pub fn shiftable_sym() -> @kernel.Thm {
  shiftable_sym_c.get()
}

///|
/// CYCLES_PRIME_LEMMA
fn step_22() -> Unit raise {
  let t688 = @simp.asm_rewrite_tac(@list.List([]))
  let t687 = @tactics.match_mp_tac(@prime.prime_coprime_lt())
  let t686 = @simp.rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("coprime(((p : Num), p + (d : Num))) == coprime((d, p))"))]))
  let t684 = @term_syntax.parse_term("(k : Num) <= (l : Num)")
  let t685 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x681 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s682 = @tactics.undisch_tac(x681)
    fn(x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s682(x683)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num) < (p : Num)"), t684])), @int.arith_tac), @tactics.all_tac])
  let t680 = @tactics.subgoal_then(@term_syntax.parse_term("(l : Num) + ((p : Num) - (k : Num)) == p + (l - k)"), fn(x677 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s678 = @tactics.subst1_tac(x677)
    fn(x679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s678(x679)
    }
  })
  let t675 = @meson.asm_meson_tac(@list.List([cycle()]))
  let t673 = @kernel.assume_rule(@term_syntax.parse_term("(k : Num) < (p : Num)"))
  let t674 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) < (p : Num) → (i : Num) + (p - k) + k == i + p")), t673]))
  let t672 = @tactics.assum_list(fn(x671 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @simp.rewrite_tac(((x670 : @list.List[@kernel.Thm]) => @lib.map(@equal.gsym, x670))(x671))
  })
  let t669 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) + ((l : Num) + (pk : Num)) == i + pk + l"))]))
  let t676 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")), t669), t672), t674), t675), @tactics.all_tac])
  let t668 = @tactics.exists_tac(@term_syntax.parse_term("(l : Num) + ((p : Num) - (k : Num))"))
  let t667 = @list.List([@meson.asm_meson_tac(@list.List([cycle()])), @tactics.all_tac])
  let t666 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm()]))
  let t665 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t664 = @tactics.match_mp_tac(loop_coprime())
  let t663 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([cycle()]))])
  let t662 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, (x : (Num) -> A)(i) == x(0)"), fn(x659 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s660 = @tactics.mp_tac(x659)
    fn(x661 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s660(x661)
    }
  })
  let t658 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p")))
  let t657 = @tactics.repeat_tac(@tactics.strip_tac)
  let t655 = @term_syntax.parse_term("(l : Num)")
  let t656 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Num)"), t655]))
  let t654 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t653 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t652 = @tactics.match_mp_tac(@arith.wlog_le())
  let t651 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t650 = @simp.rewrite_tac(@list.List([@sets.has_size_numseg_lt()]))
  let t649 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t647 = @meson.meson_tac(@list.List([@arith.add_ac()]))
  let t646 = @simp.asm_rewrite_tac(@list.List([cycle(), shiftable()]))
  let t643 = @simp.gen_rewrite_rule(fn(x642 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x642
  }, @list.List([cycle()]))
  let t645 = @tactics.first_x_assum(fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x639 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s640 = @tactics.mp_tac(x639)
      fn(x641 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s640(x641)
      }
    })(t643(x644))
  })
  let t638 = @simp.asm_rewrite_tac(@list.List([]))
  let t636 = @term_syntax.parse_term("(r : (A, A) -> Bool)")
  let t637 = @tactics.map_every(fn(x633 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s634 = @tactics.exists_tac(x633)
    fn(x635 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s634(x635)
    }
  }, @list.List([@term_syntax.parse_term("(p : Num)"), t636]))
  let t632 = @tactics.match_mp_tac(shiftable_sym())
  let t630 = @meson.meson_tac(@list.List([@arith.add_ac()]))
  let t629 = @simp.asm_rewrite_tac(@list.List([cycle()]))
  let t627 = @simp.gen_rewrite_rule(fn(x626 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x626
  }, @list.List([cycle()]))
  let t631 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s624 = @tactics.mp_tac(x623)
      fn(x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s624(x625)
      }
    })(t627(x628))
  }), t629), t630), @tactics.all_tac])
  let t622 = @tactics.repeat_tac(@tactics.strip_tac)
  let t621 = @list.List([@meson.asm_meson_tac(@list.List([shiftable_local(), shiftable_sym()])), @tactics.all_tac])
  let t620 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t619 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : (Num) -> A)"))
  let t648 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t619), t620), @tactics.eq_tac), t621), t622), t631), t632), t637), t638), t645), t646), t647), @tactics.all_tac])
  let t618 = @tactics.subgoal_then(@term_syntax.parse_term("{(y : (Num) -> A) | cycle((r : (A, A) -> Bool), (p : Num), y) && shiftable((x : (Num) -> A), y)} == IMAGE((k : Num) => (i : Num) => x(i + k), {(k : Num) | k < p})"), fn(x615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s616 = @tactics.subst1_tac(x615)
    fn(x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s616(x617)
    }
  })
  let t614 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE({(y : (Num) -> A) | cycle((r : (A, A) -> Bool), (p : Num), y) && shiftable((x : (Num) -> A), y)}, p)"), fn(x612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x612
    @meson.meson_tac(@list.List([@sets.has_size(), th]))
  })
  let t611 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t610 = @list.List([@meson.meson_tac(@list.List([shiftable_trans()])), @tactics.all_tac])
  let t609 = @list.List([@meson.asm_meson_tac(@list.List([shiftable_sym()])), @tactics.all_tac])
  let t608 = @list.List([@meson.meson_tac(@list.List([shiftable_refl()])), @tactics.all_tac])
  let t607 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), finite_cycles()]))
  let t606 = @tactics.exists_tac(@term_syntax.parse_term("(shiftable : ((Num) -> A, (Num) -> A) -> Bool)"))
  let t605 = @tactics.match_mp_tac(equivalence_uniform_partition_restrict())
  let t604 = @simp.asm_rewrite_tac(@list.List([@prime.prime_0()]))
  let t603 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t689 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t603), t604), @tactics.strip_tac), t605), t606), t607), @tactics.conj_tac), t608), @tactics.conj_tac), t609), @tactics.conj_tac), t610), t611), @tactics.disch_tac), t614), t618), t648), t649), t650), t651), t652), t653), @tactics.conj_tac), t654), t656), t657), t658), @tactics.disch_tac), t662), t663), t664), t665), t666), @tactics.conj_tac), t667), t668), @tactics.conj_tac), t676), t680), t685), t686), t687), t688), @int.asm_arith_tac)
  cycles_prime_lemma_c.set(@tactics.prove(@parser.parse_term("forall r p x. FINITE(:A) /\\ prime p /\\ (forall x. ~(r x x))\n           ==> p divides CARD {x:num->A | cycle r p x}"), t689))
}

///|
let cycles_prime_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CYCLES_PRIME_LEMMA")

///|
/// `CYCLES_PRIME_LEMMA`
pub fn cycles_prime_lemma() -> @kernel.Thm {
  cycles_prime_lemma_c.get()
}

///|
/// FRIENDSHIP
fn step_23() -> Unit raise {
  let t1064 = @sets.set_tac(@list.List([]))
  let t1063 = @simp.asm_simp_tac(@list.List([finite_paths()]))
  let t1062 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t1061 = @tactics.disch_then(fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1059 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1056 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1057 = @tactics.subst1_tac(x1056)
        fn(x1058 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1057(x1058)
        }
      })(@equal.sym(x1059))
    })(@bool.conjunct2(x1060))
  })
  let t1055 = @simp.asm_rewrite_tac(@list.List([@sets.has_size()]))
  let t1054 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t1050 = @term_syntax.parse_term("(p : Num) - 2")
  let t1051 = @term_syntax.parse_term("(friend : (Person, Person) -> Bool)")
  let t1052 = @term_syntax.parse_term("(m : Num)")
  let t1053 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(N : Num)"), t1052, t1051, t1050]), has_size_paths()))
  let t1048 = @tactics.undisch_tac(@term_syntax.parse_term("3 <= (p : Num)"))
  let t1047 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1046 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t1045 = @simp.asm_rewrite_tac(@list.List([]))
  let t1044 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t1043 = @tactics.match_mp_tac(card_pathcycles_step())
  let t1042 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_ge_2(), @arith.sub_add()])), @tactics.all_tac])
  let t1041 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) == p - 2 + 2"), fn(x1032 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1032
    @simp.gen_rewrite_tac(fn(x1040 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1034 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1035 = @equal.land_conv(x1034)
        fn(x1036 : @kernel.Term) -> @kernel.Thm raise {
          s1035(x1036)
        }
      })((fn(x1037 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1038 = @equal.once_depth_conv(x1037)
        fn(x1039 : @kernel.Term) -> @kernel.Thm raise {
          s1038(x1039)
        }
      })(x1040))
    }, @list.List([th_1]))
  })
  let t1031 = @tactics.match_mp_tac(@sets.has_size_card())
  let t1030 = @tactics.disch_then(fn(x1029 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1028 = @simp.simp_tac(@list.List([@sets.has_size()]))
  let t1027 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t1026 = @term_syntax.parse_term("(p : Num)")
  let t1049 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(friend : (Person, Person) -> Bool)"), t1026]), has_size_cycles())), @tactics.ants_tac), t1027), t1028), t1030), t1031), t1041), t1042), t1043), t1044), t1045), @tactics.conj_tac), t1046), @tactics.conj_tac), t1047), t1048), @int.arith_tac), @tactics.all_tac])
  let t1025 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((m : Num) == 0) → m - 1 + 1 == m"))]))
  let t1023 = @tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) == 0)"))
  let t1022 = @simp.asm_rewrite_tac(@list.List([]))
  let t1021 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) - 1"))
  let t1020 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("∀ q : Num, divides((t : Num), q) && (m : Num) == q + 1 → divides(t, m) → divides(t, (w : Num))")))
  let t1019 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t1018 = @tactics.mp_tac(@prime.divides_conv(@term_syntax.parse_term("divides(2, 1)")))
  let t1015 = @simp.gen_rewrite_rule(fn(x1014 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1014
  }, @list.List([@equal.gsym(@prime.divides_2())]))
  let t1017 = @tactics.first_x_assum(fn(x1016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1011 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1012 = @tactics.mp_tac(x1011)
      fn(x1013 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1012(x1013)
      }
    })(t1015(x1016))
  })
  let t1010 = @tactics.disch_then(fn(x1007 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1008 = @tactics.subst_all_tac(x1007)
    fn(x1009 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1008(x1009)
    }
  })
  let t1006 = @simp.asm_simp_tac(@list.List([@prime.prime_ge_2()]))
  let t1024 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) && !(p == 2) → 3 <= p"))), t1006), t1010), t1017), t1018), t1019), t1020), t1021), t1022), t1023), @int.arith_tac), @tactics.all_tac])
  let t1005 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= (p : Num)"), fn(x1002 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1003 = @tactics.assume_tac(x1002)
    fn(x1004 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1003(x1004)
    }
  })
  let t1000 = @simp.asm_rewrite_tac(@list.List([]))
  let t1001 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(cycles_prime_lemma()), t1000), @tactics.all_tac])
  let t999 = @simp.asm_rewrite_tac(@list.List([]))
  let t995 = @term_syntax.parse_term("CARD({(x : (Num) -> Person) | path((friend : (Person, Person) -> Bool), (p : Num) - 2, x) && !(x(p - 2) == x(0))})")
  let t996 = @term_syntax.parse_term("CARD({(x : (Num) -> Person) | path((friend : (Person, Person) -> Bool), (p : Num) - 2, x) && x(p - 2) == x(0)})")
  let t997 = @term_syntax.parse_term("CARD({(x : (Num) -> Person) | cycle((friend : (Person, Person) -> Bool), (p : Num), x)})")
  let t998 = @tactics.map_every(fn(x992 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s993 = @tactics.exists_tac(x992)
    fn(x994 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s993(x994)
    }
  }, @list.List([@term_syntax.parse_term("(m : Num) - 1"), t997, t996, t995]))
  let t991 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("∀ q : Num, ∀ c : Num, ∀ K1 : Num, ∀ K2 : Num, divides((p : Num), q) && divides(p, c) && c == (q + 1) * K1 + K2 && K1 + K2 == ((q + 1) * q + 1) * (nep2 : Num) → divides(p, nep2)")))
  let t990 = @simp.asm_rewrite_tac(@list.List([]))
  let t989 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) - 2"))
  let t988 = @tactics.match_mp_tac(@prime.prime_divexp())
  let t987 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((m : Num) == 0) → m - 1 + 1 == m"))]))
  let t986 = @simp.asm_rewrite_tac(@list.List([]))
  let t985 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) - 1"))
  let t984 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("∀ x : Num, divides((p : Num), x + 1) && divides(p, x) → divides(p, 1)")))
  let t983 = @simp.rewrite_tac(@list.List([]))
  let t982 = @list.List([@meson.asm_meson_tac(@list.List([@int.divides_one(), @prime.prime_1()])), @tactics.all_tac])
  let t981 = @tactics.subgoal_then(@term_syntax.parse_term("!divides((p : Num), 1)"), fn(x978 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s979 = @tactics.mp_tac(x978)
    fn(x980 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s979(x980)
    }
  })
  let t977 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t976 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) == 2)")), @int.arith_tac), @tactics.all_tac])
  let t975 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num) - 1"), @prime.prime_factor()))
  let t973 = @meson.asm_meson_tac(@list.List([]))
  let t972 = @tactics.disch_then(fn(x966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x966
    let t970 = @term_syntax.parse_term("(z : Person)")
    let t971 = @term_syntax.parse_term("(y : Person)")
    @tactics.map_every(fn(x968 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let x = x968
      @tactics.mp_tac(@bool.spec(x, th))
    }, @list.List([@term_syntax.parse_term("(x : Person)"), t971, t970]))
  })
  let t965 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Person, x == (a : Person) || x == (b : Person) || x == (c : Person)"))
  let t964 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Person)"))
  let t962 = @term_syntax.parse_term("(y : Person)")
  let t963 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Person)"), t962]))
  let t961 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t960 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty()]))
  let t959 = @tactics.conv_tac(@equal.land_conv(@sets.has_size_conv))
  let t958 = @simp.asm_rewrite_tac(@list.List([]))
  let t954 = @term_syntax.parse_term("(a : Person)")
  let t957 = @tactics.disch_then(fn(x956 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x951 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s952 = @tactics.mp_tac(x951)
      fn(x953 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s952(x953)
      }
    })(((x955 : @kernel.Thm) => @bool.spec(t954, x955))(x956))
  })
  let t950 = @tactics.undisch_tac(@term_syntax.parse_term("∀ p : Person, HAS_SIZE({(q : Person) | (friend : (Person, Person) -> Bool)(p, q)}, 2)"))
  let t949 = @tactics.exists_tac(@term_syntax.parse_term("(a : Person)"))
  let t948 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_exists_thm()]))
  let t947 = @tactics.undisch_tac(@term_syntax.parse_term("∀ u : Person, ∃ v : Person, !(v == u) && !(friend : (Person, Person) -> Bool)(u, v)"))
  let t946 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.in_insert(), @sets.not_in_empty()]))
  let t943 = @term_syntax.parse_term("(c : Person)")
  let t944 = @term_syntax.parse_term("(b : Person)")
  let t945 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Person)"), t944, t943]))
  let t942 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t941 = @tactics.conv_tac(@equal.land_conv(@sets.has_size_conv))
  let t940 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t939 = @tactics.subgoal_then(@term_syntax.parse_term("(HAS_SIZE : ((Person) -> Bool, Num) -> Bool)((UNIV : (Person) -> Bool), 3)"), fn(x936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s937 = @tactics.mp_tac(x936)
    fn(x938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s937(x938)
    }
  })
  let t935 = @tactics.rule_assum_tac((x934 : @kernel.Thm) => @equal.conv_rule(@calc_num.num_reduce_conv, x934))
  let t974 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s932 = @tactics.subst_all_tac(x931)
    fn(x933 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s932(x933)
    }
  }), t935), t939), t940), t941), t942), t945), t946), @tactics.strip_tac), t947), t948), t949), t950), t957), t958), t959), t960), t961), t963), @tactics.strip_tac), t964), t965), t972), t973), @tactics.all_tac])
  let t930 = @tactics.subgoal_then(@term_syntax.parse_term("!((m : Num) == 2)"), fn(x927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s928 = @tactics.assume_tac(x927)
    fn(x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s928(x929)
    }
  })
  let t925 = @meson.asm_meson_tac(@list.List([]))
  let t924 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_insert()]))
  let t923 = @tactics.map_every(fn(x920 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s921 = @simp.expand_tac(x920)
    fn(x922 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s921(x922)
    }
  }, @list.List(["u", "t"]))
  let t919 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t918 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t917 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && (c : Bool)) == (b && a && c)"))]))
  let t916 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_and_exists_thm()]))
  let t915 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.in_inter(), @sets.not_in_empty(), @sets.in_unions()]))
  let t914 = @simp.asm_rewrite_tac(@list.List([]))
  let t913 = @tactics.match_mp_tac(@sets.card_union())
  let t912 = @tactics.disch_then(fn(x911 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s908 = @tactics.subst1_tac(x907)
        fn(x909 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s908(x909)
        }
      })(@equal.sym(x910))
    })(@bool.conjunct2(x911))
  })
  let t906 = @simp.rewrite_tac(@list.List([@sets.has_size()]))
  let t904 = @meson.asm_meson_tac(@list.List([@sets.has_size()]))
  let t903 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) - 1 - 1 == m - 2"))]))
  let t902 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t901 = @tactics.subgoal_then(@term_syntax.parse_term("{(q : Person) | (friend : (Person, Person) -> Bool)(q, (b : Person))} == {(q : Person) | friend(b, q)}"), fn(x898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s899 = @tactics.subst1_tac(x898)
    fn(x900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s899(x900)
    }
  })
  let t897 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t896 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_delete()]))
  let t895 = @simp.asm_simp_tac(@list.List([@sets.card_delete(), @sets.has_size()]))
  let t893 = @meson.asm_meson_tac(@list.List([]))
  let t886 = @term_syntax.parse_term("(x : Person)")
  let t887 = @term_syntax.parse_term("(mutualfriend : (Person, Person) -> Person)((a : Person), (b : Person))")
  let t888 = @term_syntax.parse_term("(b : Person)")
  let t889 = @list.List([@term_syntax.parse_term("(a : Person)"), t888, t887, t886])
  let t892 = @tactics.first_x_assum(fn(x891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x883 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s884 = @tactics.mp_tac(x883)
      fn(x885 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s884(x885)
      }
    })(((x890 : @kernel.Thm) => @bool.specl(t889, x890))(x891))
  })
  let t882 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Person)"))
  let t881 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.in_delete(), @sets.in_elim_thm()]))
  let t894 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x878 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s879 = @simp.expand_tac(x878)
    fn(x880 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s879(x880)
    }
  }, @list.List(["u", "t"])), t881), t882), t892), t893), @tactics.all_tac])
  let t877 = @tactics.subgoal_then(@term_syntax.parse_term("(u : (Person, Person) -> Bool)((b : Person)) == DELETE(DELETE({(q : Person) | (friend : (Person, Person) -> Bool)(q, b)}, (a : Person)), (mutualfriend : (Person, Person) -> Person)(a, b))"), fn(x874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s875 = @tactics.subst1_tac(x874)
    fn(x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s875(x876)
    }
  })
  let t873 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t872 = @simp.expand_tac("t")
  let t871 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("IN((b : Person), (t : (Person) -> Bool))")))
  let t870 = @tactics.repeat_tac(@tactics.strip_tac)
  let t868 = @meson.asm_meson_tac(@list.List([]))
  let t867 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t866 = @simp.expand_tac("t")
  let t865 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.in_elim_thm(), @sets.in_insert()]))
  let t864 = @simp.rewrite_tac(@list.List([@sets.disjoint(), @sets.extension(), @sets.in_inter()]))
  let t869 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("u"), t864), t865), t866), t867), t868)])
  let t863 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t905 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.has_size_unions()), @tactics.conj_tac), t863), @tactics.conj_tac), t869), t870), t871), t872), t873), @tactics.disch_tac), t877), t894), t895), t896), @class.cond_cases_tac), t897), t901), t902), t903), t904), @tactics.all_tac])
  let t862 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE(UNIONS({(u : (Person, Person) -> Bool)((b : Person)) | IN(b, (t : (Person) -> Bool))}), (m : Num) * (m - 2))"), fn(x859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s860 = @tactics.mp_tac(x859)
    fn(x861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s860(x861)
    }
  })
  let t857 = @meson.asm_meson_tac(@list.List([]))
  let t856 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t855 = @simp.expand_tac("t")
  let t858 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.card_clauses(), @arith.add1()])), t855), t856), t857), @tactics.all_tac])
  let t854 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) + 1 == CARD(INSERT((a : Person), (t : (Person) -> Bool)))"), fn(x851 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s852 = @tactics.subst1_tac(x851)
    fn(x853 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s852(x853)
    }
  })
  let t848 = @term_syntax.parse_term("!((m : Num) == 1)")
  let t849 = @tactics.map_every(fn(x845 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s846 = @tactics.undisch_tac(x845)
    fn(x847 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s846(x847)
    }
  }, @list.List([@term_syntax.parse_term("!((m : Num) == 0)"), t848]))
  let t844 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t843 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 1"))
  let t842 = @tactics.undisch_tac(@term_syntax.parse_term("EVEN((m : Num))"))
  let t850 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) + 1 == (m : Num) + 1 + m * (c : Num)) == (a == m * (1 + c))"))])), @tactics.ap_term_tac), t842), t843), t844), @tactics.disch_tac), t849), @int.arith_tac), @tactics.all_tac])
  let t841 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) * (m - 1) + 1 == m + 1 + m * (m - 2)"), fn(x838 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s839 = @tactics.subst1_tac(x838)
    fn(x840 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s839(x840)
    }
  })
  let t836 = @meson.asm_meson_tac(@list.List([]))
  let t835 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t834 = @simp.expand_tac("t")
  let t833 = @tactics.exists_tac(@term_syntax.parse_term("(mutualfriend : (Person, Person) -> Person)((a : Person), (x : Person))"))
  let t832 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_insert(), @class.de_morgan_thm()]))
  let t831 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t830 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t829 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && (c : Bool)) == (b && a && c)"))]))
  let t828 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t827 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(a : Bool) && !(b : Bool) → (c : Bool)) → (a || b) || c")))
  let t826 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Person)"))
  let t825 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t824 = @tactics.map_every(fn(x821 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s822 = @simp.expand_tac(x821)
    fn(x823 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s822(x823)
    }
  }, @list.List(["t", "u"]))
  let t837 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.in_univ(), @sets.in_union(), @sets.in_unions()])), t824), t825), t826), t827), @tactics.strip_tac), t828), t829), t830), t831), t832), t833), t834), t835), t836), @tactics.all_tac])
  let t820 = @tactics.subgoal_then(@term_syntax.parse_term("UNIV == UNION(INSERT((a : Person), (t : (Person) -> Bool)), UNIONS({(u : (Person, Person) -> Bool)((b : Person)) | IN(b, t)}))"), fn(x817 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s818 = @tactics.subst1_tac(x817)
    fn(x819 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s818(x819)
    }
  })
  let t816 = @simp.expand_tac("N")
  let t815 = @simp.abbrev_tac(@term_syntax.parse_term("(u : (Person, Person) -> Bool) == ((b : Person) => {(c : Person) | (friend : (Person, Person) -> Bool)(b, c) && !IN(c, INSERT((a : Person), (t : (Person) -> Bool)))})"))
  let t814 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t813 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((t : (Person) -> Bool)) && CARD(t) == (m : Num)"), @tactics.strip_assume_tac)
  let t926 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.abbrev_tac(@term_syntax.parse_term("(t : (Person) -> Bool) == {(q : Person) | (friend : (Person, Person) -> Bool)((a : Person), q)}")), t813), t814), t815), t816), t820), t837), t841), t850), t854), t858), t862), t905), t906), t912), t913), t914), t915), t916), t917), t918), t919), t923), t924), t925), @tactics.all_tac])
  let t812 = @tactics.subgoal_then(@term_syntax.parse_term("(N : Num) == (m : Num) * (m - 1) + 1"), fn(x809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s810 = @tactics.assume_tac(x809)
    fn(x811 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s810(x811)
    }
  })
  let t808 = @simp.abbrev_tac(@term_syntax.parse_term("(N : Num) == (CARD : ((Person) -> Bool) -> Num)((UNIV : (Person) -> Bool))"))
  let t806 = @meson.asm_meson_tac(@list.List([@sets.has_size()]))
  let t805 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t804 = @tactics.exists_tac(@term_syntax.parse_term("(x : Person) => (y : Person) => (friend : (Person, Person) -> Bool)((a : Person), x) && friend(a, y) && friend(x, y)"))
  let t803 = @tactics.match_mp_tac(elements_pair_up())
  let t802 = @simp.expand_tac("degree")
  let t798 = @term_syntax.parse_term("(a : Person)")
  let t801 = @tactics.disch_then(fn(x800 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s795 = @tactics.subst1_tac(x794)
        fn(x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s795(x796)
        }
      })(@equal.sym(x797))
    })(((x799 : @kernel.Thm) => @bool.spec(t798, x799))(x800))
  })
  let t807 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ x : Person, (degree : (Person) -> Num)(x) == (m : Num)")), t801), t802), t803), t804), t805), t806), @tactics.all_tac])
  let t793 = @tactics.subgoal_then(@term_syntax.parse_term("EVEN((m : Num))"), fn(x790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s791 = @tactics.assume_tac(x790)
    fn(x792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s791(x792)
    }
  })
  let t788 = @meson.asm_meson_tac(@list.List([]))
  let t787 = @simp.asm_rewrite_tac(@list.List([@sets.has_size_0(), @sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()]))
  let t789 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("∀ p : Person, HAS_SIZE({(q : Person) | (friend : (Person, Person) -> Bool)(p, q)}, (m : Num))"))), t787), t788), @tactics.all_tac])
  let t786 = @tactics.subgoal_then(@term_syntax.parse_term("!((m : Num) == 0)"), fn(x783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s784 = @tactics.assume_tac(x783)
    fn(x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s784(x785)
    }
  })
  let t782 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size()])), @tactics.all_tac])
  let t781 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Person, HAS_SIZE({(q : Person) | (friend : (Person, Person) -> Bool)(p, q)}, (m : Num))"), fn(x778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s779 = @tactics.assume_tac(x778)
    fn(x780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s779(x780)
    }
  })
  let t776 = @meson.asm_meson_tac(@list.List([]))
  let t775 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Person, !(x == (c : Person)) → (degree : (Person) -> Num)(x) == (k : Num)"), fn(x772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s773 = @tactics.assume_tac(x772)
    fn(x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s773(x774)
    }
  })
  let t771 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t770 = @tactics.subgoal_then(@term_syntax.parse_term("(degree : (Person) -> Num)((b : Person)) == (k : Num) && !(friend : (Person, Person) -> Bool)((a : Person), b) && friend(a, (c : Person)) && friend(b, c)"), @tactics.strip_assume_tac)
  let t769 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num)"))
  let t768 = @simp.abbrev_tac(@term_syntax.parse_term("(k : Num) == (degree : (Person) -> Num)((a : Person))"))
  let t767 = @simp.abbrev_tac(@term_syntax.parse_term("(c : Person) == (mutualfriend : (Person, Person) -> Person)((a : Person), (b : Person))"))
  let t763 = @term_syntax.parse_term("(a : Person)")
  let t765 = @tactics.x_choose_then(@term_syntax.parse_term("(b : Person)"))(@tactics.strip_assume_tac)
  let t777 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x766 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t765(((x764 : @kernel.Thm) => @bool.spec(t763, x764))(x766))
  }), t767), t768), t769), t770), t771), t775), t776), @tactics.all_tac])
  let t762 = @tactics.subgoal_then(@term_syntax.parse_term("∃ m : Num, ∀ x : Person, (degree : (Person) -> Num)(x) == m"), @tactics.strip_assume_tac)
  let t759 = @simp.rewrite_rule(@list.List([@class.not_forall_thm(), @class.not_imp()]))
  let t761 = @tactics.disch_then(fn(x760 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s757 = @tactics.assume_tac(x756)
      fn(x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s757(x758)
      }
    })(t759(x760))
  })
  let t755 = @simp.gen_rewrite_tac(fn(x752 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s753 = @equal.rand_conv(x752)
    fn(x754 : @kernel.Term) -> @kernel.Thm raise {
      s753(x754)
    }
  }, @list.List([@class.not_exists_thm()]))
  let t751 = @simp.gen_rewrite_tac(fn(x750 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x750
  }, @list.List([@class.taut(@term_syntax.parse_term("(p : Bool) == !!p"))]))
  let t749 = @list.List([@meson.asm_meson_tac(@list.List([@arith.le_antisym()])), @tactics.all_tac])
  let t748 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Person, ∀ y : Person, !(friend : (Person, Person) -> Bool)(x, y) → (degree : (Person) -> Num)(x) == degree(y)"), fn(x745 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s746 = @tactics.assume_tac(x745)
    fn(x747 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s746(x747)
    }
  })
  let t743 = @meson.asm_meson_tac(@list.List([]))
  let t736 = @term_syntax.parse_term("(u2 : Person)")
  let t737 = @term_syntax.parse_term("(u1 : Person)")
  let t738 = @term_syntax.parse_term("(mutualfriend : (Person, Person) -> Person)((u1 : Person), (y : Person))")
  let t739 = @list.List([@term_syntax.parse_term("(x : Person)"), t738, t737, t736])
  let t742 = @tactics.first_x_assum(fn(x741 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x733 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s734 = @tactics.mp_tac(x733)
      fn(x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s734(x735)
      }
    })(((x740 : @kernel.Thm) => @bool.specl(t739, x740))(x741))
  })
  let t731 = @term_syntax.parse_term("(u2 : Person)")
  let t732 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u1 : Person)"), t731]))
  let t730 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t729 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t728 = @tactics.conv_tac(@equal.sym_conv)
  let t727 = @tactics.match_mp_tac(@arith.eq_imp_le())
  let t725 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t726 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@sets.card_subset()), t725)])
  let t724 = @tactics.exists_tac(@term_syntax.parse_term("CARD(IMAGE((u : Person) => (mutualfriend : (Person, Person) -> Person)(u, (y : Person)), {(q : Person) | (friend : (Person, Person) -> Bool)((x : Person), q)}))"))
  let t723 = @tactics.match_mp_tac(@arith.le_trans())
  let t722 = @simp.expand_tac("degree")
  let t721 = @list.List([@meson.asm_meson_tac(@list.List([@arith.le_refl()])), @tactics.all_tac])
  let t720 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Person) == (y : Person)"))
  let t744 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t720), t721), t722), t723), t724), @tactics.conj_tac), t726), t727), t728), t729), t730), t732), @tactics.strip_tac), t742), t743), @tactics.all_tac])
  let t719 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Person, ∀ y : Person, !(friend : (Person, Person) -> Bool)(x, y) → (degree : (Person) -> Num)(x) <= degree(y)"), fn(x716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s717 = @tactics.assume_tac(x716)
    fn(x718 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s717(x718)
    }
  })
  let t715 = @simp.abbrev_tac(@term_syntax.parse_term("(degree : (Person) -> Num) == ((p : Person) => CARD({(q : Person) | (friend : (Person, Person) -> Bool)(p, q)}))"))
  let t714 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset_univ(), @sets.finite_subset()])), @tactics.all_tac])
  let t713 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : (Person) -> Bool, FINITE(s)"), fn(x710 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s711 = @tactics.assume_tac(x710)
    fn(x712 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s711(x712)
    }
  })
  let t707 = @term_syntax.parse_term("(mutualfriend : (Person, Person) -> Person)")
  let t709 = @tactics.disch_then((x708 : @kernel.Thm) => @tactics.x_choose_tac(t707, x708))
  let t706 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s704 = @tactics.mp_tac(x703)
    fn(x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s704(x705)
    }
  }, @tactics.strip_assume_tac))
  let t702 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t701 = @simp.gen_rewrite_tac(fn(x700 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x694 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s695 = @equal.land_conv(x694)
      fn(x696 : @kernel.Term) -> @kernel.Thm raise {
        s695(x696)
      }
    })((fn(x697 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s698 = @equal.once_depth_conv(x697)
      fn(x699 : @kernel.Term) -> @kernel.Thm raise {
        s698(x699)
      }
    })(x700))
  }, @list.List([@class.right_imp_exists_thm()]))
  let t693 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm(), @theorems.right_imp_forall_thm()]))
  let t692 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) && (c : Bool)) == ((a → b) && (a → c))"))]))
  let t691 = @simp.rewrite_tac(@list.List([@theorems.exists_unique_thm()]))
  let t690 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Person, ∀ y : Person, !(x == y) → existsunique((z : Person) => (friend : (Person, Person) -> Bool)(x, z) && friend(y, z))"))
  let t1065 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t690), t691), t692), t693), t701), t702), t706), t709), t713), t714), t715), t719), t744), t748), t749), t751), t755), t761), t762), t777), t781), t782), t786), t789), t793), t807), t808), t812), t926), t930), t974), t975), @tactics.ants_tac), t976), t977), t981), t982), t983), t984), t985), t986), t987), t988), t989), t990), t991), t998), t999), @tactics.conj_tac), t1001), t1005), t1024), t1025), @tactics.conj_tac), t1049), t1053), @tactics.ants_tac), t1054), t1055), t1061), t1062), t1063), t1064)
  friendship_c.set(@tactics.prove(@term_syntax.parse_term("∀ friend : (Person, Person) -> Bool, (FINITE : ((Person) -> Bool) -> Bool)((UNIV : (Person) -> Bool)) && (∀ x : Person, !friend(x, x)) && (∀ x : Person, ∀ y : Person, friend(x, y) → friend(y, x)) && (∀ x : Person, ∀ y : Person, !(x == y) → (existsunique : ((Person) -> Bool) -> Bool)((z : Person) => friend(x, z) && friend(y, z))) → (∃ u : Person, ∀ v : Person, !(v == u) → friend(u, v))"), t1065))
}

///|
let friendship_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRIENDSHIP")

///|
/// `FRIENDSHIP`
pub fn friendship() -> @kernel.Thm {
  friendship_c.get()
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
}
