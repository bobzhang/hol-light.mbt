// Translated from upstream Logic/fol_prop.ml; edit this file directly.

///|
/// pholds
fn step_1() -> Unit raise {
  let t1 = @term_syntax.parse_term("(pholds : ((Form) -> Bool, Form) -> Bool)((v : (Form) -> Bool), False) == false && pholds(v, Atom((p : Num), (l : List[Term]))) == v(Atom(p, l)) && pholds(v, op_minus_minus_gt((q : Form), (r : Form))) == (pholds(v, q) → pholds(v, r)) && pholds(v, op_bang_bang((x : Num), q)) == v(op_bang_bang(x, q))")
  pholds_c.set(@recursion.new_recursive_definition(@fol.form_recursion())(t1))
}

///|
let pholds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pholds")

///|
/// `pholds`
pub fn pholds() -> @kernel.Thm {
  pholds_c.get()
}

///|
/// PHOLDS
fn step_2() -> Unit raise {
  let t2 = @tactics.conv_tac(@class.taut)
  let t3 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.true_def(), @fol.not_def(), @fol.or_def(), @fol.and_def(), @fol.iff_def(), @fol.exists_def(), pholds()])), t2)
  pholds_v1_c.set(@tactics.prove(@term_syntax.parse_term("pholds((v : (Form) -> Bool), False) == false && pholds(v, True) == true && pholds(v, Atom((p : Num), (l : List[Term]))) == v(Atom(p, l)) && pholds(v, Not((q : Form))) == !pholds(v, q) && pholds(v, op_bar_bar(q, (r : Form))) == (pholds(v, q) || pholds(v, r)) && pholds(v, op_amp_amp(q, r)) == (pholds(v, q) && pholds(v, r)) && pholds(v, op_minus_minus_gt(q, r)) == (pholds(v, q) → pholds(v, r)) && pholds(v, op_lt_minus_gt(q, r)) == (pholds(v, q) == pholds(v, r))"), t3))
}

///|
let pholds_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHOLDS")

///|
/// `PHOLDS`
pub fn pholds_v1() -> @kernel.Thm {
  pholds_v1_c.get()
}

///|
/// Logic/fol_prop.ml:28
fn step_3() -> Unit raise {
  @printer.parse_as_infix("psatisfies", (10L, "right"))
}

///|
/// psatisfies
fn step_4() -> Unit raise {
  psatisfies_c.set(@pair.new_definition(@term_syntax.parse_term("(psatisfies : ((Form) -> Bool, (Form) -> Bool) -> Bool)((v : (Form) -> Bool), (s : (Form) -> Bool)) == (∀ p : Form, IN(p, s) → pholds(v, p))")))
}

///|
let psatisfies_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("psatisfies")

///|
/// `psatisfies`
pub fn psatisfies() -> @kernel.Thm {
  psatisfies_c.get()
}

///|
/// psatisfiable
fn step_5() -> Unit raise {
  psatisfiable_c.set(@pair.new_definition(@term_syntax.parse_term("(psatisfiable : ((Form) -> Bool) -> Bool)((s : (Form) -> Bool)) == (∃ v : (Form) -> Bool, ∀ p : Form, IN(p, s) → pholds(v, p))")))
}

///|
let psatisfiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("psatisfiable")

///|
/// `psatisfiable`
pub fn psatisfiable() -> @kernel.Thm {
  psatisfiable_c.get()
}

///|
/// PSATISFIABLE_MONO
fn step_6() -> Unit raise {
  let t4 = @meson.meson_tac(@list.List([@sets.subset()]))
  let t5 = @tactics.then_tac(@simp.rewrite_tac(@list.List([psatisfiable()])), t4)
  psatisfiable_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, ∀ B : (Form) -> Bool, psatisfiable(A) && SUBSET(B, A) → psatisfiable(B)"), t5))
}

///|
let psatisfiable_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSATISFIABLE_MONO")

///|
/// `PSATISFIABLE_MONO`
pub fn psatisfiable_mono() -> @kernel.Thm {
  psatisfiable_mono_c.get()
}

///|
/// finsat
fn step_7() -> Unit raise {
  finsat_c.set(@pair.new_definition(@term_syntax.parse_term("(finsat : ((Form) -> Bool) -> Bool)((A : (Form) -> Bool)) == (∀ B : (Form) -> Bool, SUBSET(B, A) && FINITE(B) → psatisfiable(B))")))
}

///|
let finsat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("finsat")

///|
/// `finsat`
pub fn finsat() -> @kernel.Thm {
  finsat_c.get()
}

///|
/// FINSAT_MONO
fn step_8() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([@sets.subset_trans(), @sets.finite_subset()]))
  let t7 = @tactics.then_tac(@simp.rewrite_tac(@list.List([finsat()])), t6)
  finsat_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, ∀ B : (Form) -> Bool, finsat(A) && SUBSET(B, A) → finsat(B)"), t7))
}

///|
let finsat_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_MONO")

///|
/// `FINSAT_MONO`
pub fn finsat_mono() -> @kernel.Thm {
  finsat_mono_c.get()
}

///|
/// SATISFIABLE_MONO
fn step_9() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([@sets.subset()]))
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([psatisfiable()])), t8)
  satisfiable_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, ∀ B : (Form) -> Bool, psatisfiable(A) && SUBSET(B, A) → psatisfiable(B)"), t9))
}

///|
let satisfiable_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SATISFIABLE_MONO")

///|
/// `SATISFIABLE_MONO`
pub fn satisfiable_mono() -> @kernel.Thm {
  satisfiable_mono_c.get()
}

///|
/// FINSAT_SATISFIABLE
fn step_10() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([satisfiable_mono(), @sets.subset_trans(), @sets.finite_subset()]))
  let t11 = @tactics.then_tac(@simp.rewrite_tac(@list.List([finsat()])), t10)
  finsat_satisfiable_c.set(@tactics.prove(@term_syntax.parse_term("psatisfiable((B : (Form) -> Bool)) → finsat(B)"), t11))
}

///|
let finsat_satisfiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_SATISFIABLE")

///|
/// `FINSAT_SATISFIABLE`
pub fn finsat_satisfiable() -> @kernel.Thm {
  finsat_satisfiable_c.get()
}

///|
/// FINSAT_MAX
fn step_11() -> Unit raise {
  let t137 = @meson.asm_meson_tac(@list.List([]))
  let t138 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.unions(), @sets.in_elim_thm(), @sets.in_()])), t137)
  let t139 = @list.List([@meson.asm_meson_tac(@list.List([])), t138])
  let t136 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Form) -> Bool)"))
  let t140 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t136), @tactics.disch_tac), @tactics.conj_tac), t139)
  let t135 = @meson.asm_meson_tac(@list.List([finsat()]))
  let t134 = @simp.asm_rewrite_tac(@list.List([]))
  let t133 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.in_()])))
  let t128 = @term_syntax.parse_term("(v : (Form) -> Bool)")
  let t129 = @list.List([@term_syntax.parse_term("(v : (Form) -> Bool)"), t128])
  let t132 = @tactics.first_x_assum(fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s126 = @tactics.mp_tac(x125)
      fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s126(x127)
      }
    })(((x130 : @kernel.Thm) => @bool.specl(t129, x130))(x131))
  })
  let t124 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t123 = @simp.asm_rewrite_tac(@list.List([]))
  let t119 = @term_syntax.parse_term("(B : (Form) -> Bool)")
  let t122 = @tactics.first_x_assum(fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s117 = @tactics.mp_tac(x116)
      fn(x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s117(x118)
      }
    })(((x120 : @kernel.Thm) => @bool.spec(t119, x120))(x121))
  })
  let t115 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : (Form) -> Bool)"))
  let t141 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([finsat()])), t115), @tactics.strip_tac), t122), t123), t124), t132), t133), t134), t135), t140])
  let t114 = @tactics.subgoal_then(@term_syntax.parse_term("finsat(UNIONS((C : ((Form) -> Bool) -> Bool)))"), fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s112 = @tactics.assume_tac(x111)
    fn(x113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s112(x113)
    }
  })
  let t107 = @meson.asm_meson_tac(@list.List([]))
  let t106 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.subset(), @sets.in_()])))
  let t105 = @simp.asm_rewrite_tac(@list.List([]))
  let t108 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(v1 : (Form) -> Bool)")), t105), t106), t107)
  let t104 = @meson.asm_meson_tac(@list.List([]))
  let t103 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.subset(), @sets.in_()])))
  let t102 = @simp.asm_rewrite_tac(@list.List([]))
  let t109 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(v2 : (Form) -> Bool)")), t102), t103), t104), t108])
  let t101 = @simp.asm_rewrite_tac(@list.List([]))
  let t96 = @term_syntax.parse_term("(v2 : (Form) -> Bool)")
  let t97 = @list.List([@term_syntax.parse_term("(v1 : (Form) -> Bool)"), t96])
  let t100 = @tactics.first_x_assum(fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x93 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s94 = @tactics.mp_tac(x93)
      fn(x95 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s94(x95)
      }
    })(((x98 : @kernel.Thm) => @bool.specl(t97, x98))(x99))
  })
  let t92 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v2 : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t91 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t90 = @simp.rewrite_tac(@list.List([]))
  let t86 = @term_syntax.parse_term("(p : Form)")
  let t89 = @tactics.disch_then(fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s84 = @tactics.mp_tac(x83)
      fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s84(x85)
      }
    })(((x87 : @kernel.Thm) => @bool.spec(t86, x87))(x88))
  })
  let t82 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.subset(), @sets.unions(), @sets.in_elim_thm()]))
  let t81 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(INSERT((p : Form), (W : (Form) -> Bool)), UNIONS((C : ((Form) -> Bool) -> Bool)))"))
  let t80 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v1 : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t79 = @simp.rewrite_tac(@list.List([@sets.in_(), @sets.subset(), @sets.insert(), @sets.in_elim_thm()]))
  let t77 = @simp.asm_rewrite_tac(@list.List([]))
  let t78 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.in_()])), t77])
  let t76 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((W : (Form) -> Bool), UNIONS((C : ((Form) -> Bool) -> Bool)))"), fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s74 = @tactics.assume_tac(x73)
    fn(x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s74(x75)
    }
  })
  let t72 = @simp.asm_rewrite_tac(@list.List([]))
  let t71 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET(INSERT((p : Form), (W : (Form) -> Bool)), UNIONS((C : ((Form) -> Bool) -> Bool)))"))
  let t70 = @tactics.x_gen_tac(@term_syntax.parse_term("(W : (Form) -> Bool)"))
  let t69 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t67 = @meson.asm_meson_tac(@list.List([@sets.in_()]))
  let t68 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.empty_subset()])), t67), @tactics.all_tac])
  let t110 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct()), @tactics.conj_tac), t68), t69), t70), t71), t72), t76), t78), t79), t80), t81), t82), t89), t90), t91), t92), t100), t101), @tactics.strip_tac), t109), @tactics.all_tac])
  let t66 = @tactics.subgoal_then(@term_syntax.parse_term("∀ B : (Form) -> Bool, FINITE(B) → SUBSET(B, UNIONS((C : ((Form) -> Bool) -> Bool))) → (∃ U : (Form) -> Bool, IN(U, C) && SUBSET(B, U))"), fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s64 = @tactics.assume_tac(x63)
    fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s64(x65)
    }
  })
  let t61 = @simp.asm_rewrite_tac(@list.List([]))
  let t60 = @meson.asm_meson_tac(@list.List([@sets.subset(), @sets.in_()]))
  let t62 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.unions(), @sets.subset(), @sets.in_elim_thm()])), t60), t61])
  let t59 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((A : (Form) -> Bool), UNIONS((C : ((Form) -> Bool) -> Bool)))"), fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s57 = @tactics.assume_tac(x56)
    fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s57(x58)
    }
  })
  let t55 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t51 = @simp.rewrite_rule(@list.List([@equal.gsym(@sets.member_not_empty())]))
  let t52 = @tactics.x_choose_then(@term_syntax.parse_term("(u : (Form) -> Bool)"))(fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s49 = @tactics.mp_tac(x48)
    fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s49(x50)
    }
  })
  let t54 = @tactics.first_assum(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t52(t51(x53))
  })
  let t47 = @tactics.exists_tac(@term_syntax.parse_term("UNIONS((C : ((Form) -> Bool) -> Bool))"))
  let t45 = @simp.asm_rewrite_tac(@list.List([@sets.empty(), @sets.subset_refl()]))
  let t46 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(A : (Form) -> Bool)")), t45), @tactics.all_tac])
  let t44 = @class.asm_cases_tac(@term_syntax.parse_term("(C : ((Form) -> Bool) -> Bool) == {}"))
  let t43 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t42 = @simp.rewrite_tac(@list.List([@wo.chain()]))
  let t41 = @tactics.x_gen_tac(@term_syntax.parse_term("(C : ((Form) -> Bool) -> Bool)"))
  let t40 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@sets.subset_trans()]))])
  let t27 = @simp.asm_rewrite_tac(@list.List([]))
  let t25 = @meson.meson_tac(@list.List([@sets.subset_trans(), finsat_mono(), @sets.subset_refl()]))
  let t26 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @reduct.fld(), @sets.in_elim_thm()])), t25), @tactics.all_tac])
  let t24 = @tactics.subgoal_then(@term_syntax.parse_term("fld((B : (Form) -> Bool) => (C : (Form) -> Bool) => SUBSET((A : (Form) -> Bool), B) && SUBSET(B, C) && finsat(C)) == ((B : (Form) -> Bool) => SUBSET(A, B) && finsat(B))"), fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s22 = @tactics.assume_tac(x21)
    fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s22(x23)
    }
  })
  let t20 = @simp.asm_rewrite_tac(@list.List([]))
  let t18 = @meson.meson_tac(@list.List([@sets.subset_trans(), @sets.subset_refl(), finsat_mono(), @sets.subset_antisym()]))
  let t19 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@wo.poset(), @reduct.fld(), @sets.in_elim_thm()])), t18), @tactics.all_tac])
  let t17 = @tactics.subgoal_then(@term_syntax.parse_term("poset((B : (Form) -> Bool) => (C : (Form) -> Bool) => SUBSET((A : (Form) -> Bool), B) && SUBSET(B, C) && finsat(C))"), fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s15 = @tactics.assume_tac(x14)
    fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s15(x16)
    }
  })
  let t13 = @simp.rewrite_tac(@list.List([]))
  let t12 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(B : (Form) -> Bool) => (C : (Form) -> Bool) => SUBSET((A : (Form) -> Bool), B) && SUBSET(B, C) && finsat(C)"), @wo.zl()))
  let t142 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t12), @wo.pbeta_tac), t13), t17), t19), t20), t24), t26), t27), fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x36 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x34 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x28 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
            fn(x29 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s30 = @tactics.subgoal_then(x28, x29)
              fn(x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s30(x31)
              }
            }
          })(x34)(fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let th = x32
            @simp.rewrite_tac(@list.List([th]))
          })
        })(((x35 : @kernel.Term) => @lib.funpow(2, @equal.lhand, x35))(x36))
      })((fn(x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x37.1
      })(x38))
    })(x39)(x39)
  }), t40), t41), t42), t43), @tactics.disch_tac), t44), t46), t47), t54), t55), @tactics.disch_tac), t59), t62), t66), t110), t114), t141)
  finsat_max_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, finsat(A) → (∃ B : (Form) -> Bool, SUBSET(A, B) && finsat(B) && (∀ C : (Form) -> Bool, SUBSET(B, C) && finsat(C) → C == B))"), t142))
}

///|
let finsat_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_MAX")

///|
/// `FINSAT_MAX`
pub fn finsat_max() -> @kernel.Thm {
  finsat_max_c.get()
}

///|
/// FINSAT_EXTEND
fn step_12() -> Unit raise {
  let t192 = @simp.asm_rewrite_tac(@list.List([pholds_v1()]))
  let t191 = @tactics.undisch_tac(@term_syntax.parse_term("!pholds((v : (Form) -> Bool), Not((q : Form)))"))
  let t190 = @tactics.disch_then(fn(x187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s188 = @tactics.subst_all_tac(x187)
    fn(x189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s188(x189)
    }
  })
  let t186 = @simp.asm_rewrite_tac(@list.List([]))
  let t185 = @tactics.exists_tac(@term_syntax.parse_term("(r : Form)"))
  let t184 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Form)"))(@tactics.strip_assume_tac))
  let t180 = @term_syntax.parse_term("(v : (Form) -> Bool)")
  let t183 = @tactics.first_x_assum(fn(x182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s178 = @tactics.mp_tac(x177)
      fn(x179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s178(x179)
      }
    })(((x181 : @kernel.Thm) => @bool.spec(t180, x181))(x182))
  })
  let t176 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t175 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Form) == (q : Form)"))
  let t174 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(@tactics.strip_assume_tac))
  let t170 = @term_syntax.parse_term("(v : (Form) -> Bool)")
  let t173 = @tactics.disch_then(fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s168 = @tactics.mp_tac(x167)
      fn(x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s168(x169)
      }
    })(((x171 : @kernel.Thm) => @bool.spec(t170, x171))(x172))
  })
  let t166 = @tactics.undisch_tac(@term_syntax.parse_term("∀ v : (Form) -> Bool, ∃ p : Form, IN(p, (C : (Form) -> Bool)) && !pholds(v, p)"))
  let t165 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Form) -> Bool)"))
  let t164 = @tactics.repeat_tac(@tactics.disch_tac)
  let t163 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @class.not_forall_thm(), @class.not_imp()]))
  let t162 = @simp.rewrite_tac(@list.List([psatisfiable(), @sets.in_delete(), @sets.in_union()]))
  let t161 = @tactics.undisch_tac(@term_syntax.parse_term("!psatisfiable((D : (Form) -> Bool))"))
  let t193 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!psatisfiable((C : (Form) -> Bool))")), t161), t162), t163), t164), t165), t166), t173), t174), t175), t176), t183), t184), t185), t186), @tactics.disj2_tac), t190), t191), t192)
  let t194 = @list.List([@tactics.assum_list(@sets.set_tac), t193])
  let t160 = @simp.asm_rewrite_tac(@list.List([@class.not_imp(), @sets.finite_union(), @sets.finite_delete()]))
  let t156 = @term_syntax.parse_term("UNION(DELETE((C : (Form) -> Bool), (p : Form)), DELETE((D : (Form) -> Bool), Not(p)))")
  let t159 = @tactics.first_x_assum(fn(x158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s154 = @tactics.mp_tac(x153)
      fn(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s154(x155)
      }
    })(((x157 : @kernel.Thm) => @bool.spec(t156, x157))(x158))
  })
  let t151 = @tactics.x_choose_then(@term_syntax.parse_term("(D : (Form) -> Bool)"))(@tactics.strip_assume_tac)
  let t152 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(C : (Form) -> Bool)"))(@tactics.strip_assume_tac), t151))
  let t148 = @simp.rewrite_rule(@list.List([@class.de_morgan_thm(), @class.not_forall_thm(), @class.not_imp()]))
  let t150 = @tactics.disch_then(fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s146 = @tactics.mp_tac(x145)
      fn(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s146(x147)
      }
    })(t148(x149))
  })
  let t144 = @simp.gen_rewrite_tac(fn(x143 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x143
  }, @list.List([@class.taut(@term_syntax.parse_term("(p : Bool) == !!p"))]))
  let t195 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([finsat()])), @tactics.disch_tac), t144), t150), t152), t159), t160), @tactics.conj_tac), t194)
  finsat_extend_c.set(@tactics.prove(@term_syntax.parse_term("finsat((B : (Form) -> Bool)) → finsat(INSERT((p : Form), B)) || finsat(INSERT(Not(p), B))"), t195))
}

///|
let finsat_extend_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_EXTEND")

///|
/// `FINSAT_EXTEND`
pub fn finsat_extend() -> @kernel.Thm {
  finsat_extend_c.get()
}

///|
/// FINSAT_MAX_COMPLETE
fn step_13() -> Unit raise {
  let t202 = @sets.set_tac(@list.List([]))
  let t201 = @simp.asm_rewrite_tac(@list.List([]))
  let t200 = @tactics.first_assum(@tactics.match_mp_tac)
  let t199 = @simp.rewrite_tac(@list.List([@sets.absorption()]))
  let t196 = @drule.match_mp(finsat_extend())
  let t198 = @tactics.first_assum(fn(x197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t196(x197))
  })
  let t203 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t198), @list.List([@tactics.disj1_tac, @tactics.disj2_tac])), t199), t200), t201), t202)
  finsat_max_complete_c.set(@tactics.prove(@term_syntax.parse_term("finsat((B : (Form) -> Bool)) && (∀ C : (Form) -> Bool, SUBSET(B, C) && finsat(C) → C == B) → (∀ p : Form, IN(p, B) || IN(Not(p), B))"), t203))
}

///|
let finsat_max_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_MAX_COMPLETE")

///|
/// `FINSAT_MAX_COMPLETE`
pub fn finsat_max_complete() -> @kernel.Thm {
  finsat_max_complete_c.get()
}

///|
/// FINSAT_MAX_COMPLETE_STRONG
fn step_14() -> Unit raise {
  let t226 = @tactics.conv_tac(@class.taut)
  let t225 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm2(), pholds_v1()]))
  let t224 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))]))
  let t223 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @class.de_morgan_thm()]))
  let t222 = @tactics.disch_then(@tactics.choose_then(fn(x219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s220 = @tactics.mp_tac(x219)
    fn(x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s220(x221)
    }
  }))
  let t218 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t217 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t216 = @simp.rewrite_tac(@list.List([psatisfiable(), @sets.in_insert(), @sets.subset(), @sets.not_in_empty()]))
  let t215 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_rules()]))
  let t211 = @term_syntax.parse_term("{(p : Form), Not(p)}")
  let t214 = @tactics.disch_then(fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s209 = @tactics.mp_tac(x208)
      fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s209(x210)
      }
    })(((x212 : @kernel.Thm) => @bool.spec(t211, x212))(x213))
  })
  let t207 = @simp.rewrite_tac(@list.List([finsat()]))
  let t206 = @tactics.undisch_tac(@term_syntax.parse_term("finsat((B : (Form) -> Bool))"))
  let t205 = @list.List([@meson.asm_meson_tac(@list.List([finsat_max_complete()])), @tactics.all_tac])
  let t204 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) && !(a && b) → b == !a")))
  let t227 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t204), @tactics.conj_tac), t205), @tactics.disch_tac), t206), t207), t214), t215), t216), t217), @tactics.conj_tac), t218), t222), t223), t224), t225), t226)
  finsat_max_complete_strong_c.set(@tactics.prove(@term_syntax.parse_term("finsat((B : (Form) -> Bool)) && (∀ C : (Form) -> Bool, SUBSET(B, C) && finsat(C) → C == B) → (∀ p : Form, IN(Not(p), B) == !IN(p, B))"), t227))
}

///|
let finsat_max_complete_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_MAX_COMPLETE_STRONG")

///|
/// `FINSAT_MAX_COMPLETE_STRONG`
pub fn finsat_max_complete_strong() -> @kernel.Thm {
  finsat_max_complete_strong_c.get()
}

///|
/// FINSAT_DEDUCTION
fn step_15() -> Unit raise {
  let t243 = @meson.meson_tac(@list.List([]))
  let t242 = @simp.rewrite_tac(@list.List([psatisfiable(), @sets.in_union(), @sets.in_delete()]))
  let t241 = @tactics.undisch_tac(@term_syntax.parse_term("!psatisfiable((A1 : (Form) -> Bool))"))
  let t240 = @tactics.undisch_tac(@term_syntax.parse_term("∀ v : (Form) -> Bool, (∀ q : Form, IN(q, (A : (Form) -> Bool)) → pholds(v, q)) → pholds(v, (p : Form))"))
  let t239 = @list.List([@tactics.assum_list(@sets.set_tac), @tactics.all_tac])
  let t238 = @simp.asm_rewrite_tac(@list.List([@sets.finite_union(), @sets.finite_delete()]))
  let t237 = @tactics.exists_tac(@term_syntax.parse_term("UNION((A : (Form) -> Bool), DELETE((A1 : (Form) -> Bool), (p : Form)))"))
  let t236 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(A1 : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t235 = @simp.rewrite_tac(@list.List([finsat(), @class.not_forall_thm(), @class.not_imp()]))
  let t234 = @tactics.conv_tac(@class.contrapos_conv)
  let t233 = @tactics.undisch_tac(@term_syntax.parse_term("finsat((B : (Form) -> Bool))"))
  let t232 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t231 = @tactics.first_assum(@tactics.match_mp_tac)
  let t244 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.rewrite_tac(@list.List([@sets.absorption()]))), t231), @tactics.conj_tac), t232), t233), t234), t235), t236), t237), t238), @tactics.conj_tac), t239), t240), t241), t242), t243)
  let t230 = @meson.asm_meson_tac(@list.List([]))
  let t229 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.not_in_empty()]))
  let t228 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_rules()]))
  let t245 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.exists_tac(@term_syntax.parse_term("{(p : Form)}"))), t228), t229), t230), t244])
  let t246 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t245)
  finsat_deduction_c.set(@tactics.prove(@term_syntax.parse_term("finsat((B : (Form) -> Bool)) && (∀ C : (Form) -> Bool, SUBSET(B, C) && finsat(C) → C == B) → (∀ p : Form, IN(p, B) == (∃ A : (Form) -> Bool, FINITE(A) && SUBSET(A, B) && (∀ v : (Form) -> Bool, (∀ q : Form, IN(q, A) → pholds(v, q)) → pholds(v, p))))"), t246))
}

///|
let finsat_deduction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_DEDUCTION")

///|
/// `FINSAT_DEDUCTION`
pub fn finsat_deduction() -> @kernel.Thm {
  finsat_deduction_c.get()
}

///|
/// FINSAT_MAX_CONSISTENT
fn step_16() -> Unit raise {
  let t266 = @meson.meson_tac(@list.List([pholds_v1()]))
  let t265 = @simp.asm_rewrite_tac(@list.List([]))
  let t264 = @tactics.repeat_tac(@tactics.strip_tac)
  let t263 = @simp.rewrite_tac(@list.List([@class.not_imp(), @class.not_forall_thm(), @class.not_exists_thm()]))
  let t262 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.not_in_empty()]))
  let t261 = @simp.asm_rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_rules(), psatisfiable()]))
  let t257 = @term_syntax.parse_term("{False}")
  let t260 = @tactics.disch_then(fn(x259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s255 = @tactics.mp_tac(x254)
      fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s255(x256)
      }
    })(((x258 : @kernel.Thm) => @bool.spec(t257, x258))(x259))
  })
  let t253 = @simp.rewrite_tac(@list.List([finsat()]))
  let t252 = @simp.rewrite_tac(@list.List([]))
  let t251 = @tactics.conv_tac(@class.contrapos_conv)
  let t267 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s248 = @tactics.mp_tac(x247)
      fn(x249 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s248(x249)
      }
    })(@bool.conjunct1(x250))
  }), t251), t252), @tactics.disch_tac), t253), t260), t261), t262), t263), t264), t265), t266)
  finsat_max_consistent_c.set(@tactics.prove(@term_syntax.parse_term("finsat((B : (Form) -> Bool)) && (∀ C : (Form) -> Bool, SUBSET(B, C) && finsat(C) → C == B) → !IN(False, B)"), t267))
}

///|
let finsat_max_consistent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_MAX_CONSISTENT")

///|
/// `FINSAT_MAX_CONSISTENT`
pub fn finsat_max_consistent() -> @kernel.Thm {
  finsat_max_consistent_c.get()
}

///|
/// FINSAT_MAX_HOMO
fn step_17() -> Unit raise {
  let t300 = @meson.meson_tac(@list.List([]))
  let t299 = @simp.rewrite_tac(@list.List([pholds_v1()]))
  let t298 = @tactics.first_assum(fn(x297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x295 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x290 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s291 = @tactics.undisch_tac(x290)
        fn(x292 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s291(x292)
        }
      })(((x294 : @kernel.Term) => @lib.check(fn(x293 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x293)
      }, x294))(x295))
    })((fn(x296 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x296)
    })(x297))
  })
  let t289 = @simp.asm_rewrite_tac(@list.List([]))
  let t288 = @tactics.exists_tac(@term_syntax.parse_term("(A : (Form) -> Bool)"))
  let t287 = @tactics.first_assum(fn(x285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x285
    @simp.rewrite_tac(@list.List([@drule.match_mp(finsat_deduction())(th_2)]))
  })
  let t284 = @tactics.first_assum(fn(x282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x282
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(finsat_max_complete_strong())(th_1))]))
  })
  let t301 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x279 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s280 = @equal.land_conv(x279)
    fn(x281 : @kernel.Term) -> @kernel.Thm raise {
      s280(x281)
    }
  }, @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) == (!p || q)"))])), t284), t287), @tactics.strip_tac), t288), t289), t298), t299), t300)
  let t278 = @meson.meson_tac(@list.List([]))
  let t277 = @simp.rewrite_tac(@list.List([@fol.entails(), @sets.in_union(), pholds_v1()]))
  let t276 = @tactics.undisch_tac(@term_syntax.parse_term("∀ v : (Form) -> Bool, (∀ q : Form, IN(q, (A1 : (Form) -> Bool)) → pholds(v, q)) → pholds(v, op_minus_minus_gt((p : Form), (q : Form)))"))
  let t275 = @tactics.undisch_tac(@term_syntax.parse_term("∀ v : (Form) -> Bool, (∀ q : Form, IN(q, (A2 : (Form) -> Bool)) → pholds(v, q)) → pholds(v, (p : Form))"))
  let t274 = @list.List([@tactics.assum_list(@sets.set_tac), @tactics.all_tac])
  let t273 = @simp.asm_rewrite_tac(@list.List([@sets.finite_union()]))
  let t272 = @tactics.exists_tac(@term_syntax.parse_term("UNION((A1 : (Form) -> Bool), (A2 : (Form) -> Bool))"))
  let t271 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(A2 : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t270 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(A1 : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t302 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x268
    @simp.rewrite_tac(@list.List([@drule.match_mp(finsat_deduction())(th)]))
  }), t270), t271), t272), t273), @tactics.conj_tac), t274), t275), t276), t277), t278), t301])
  let t303 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.repeat_tac(@tactics.gen_tac)), @tactics.eq_tac), t302)
  finsat_max_homo_c.set(@tactics.prove(@term_syntax.parse_term("finsat((B : (Form) -> Bool)) && (∀ C : (Form) -> Bool, SUBSET(B, C) && finsat(C) → C == B) → (∀ p : Form, ∀ q : Form, IN(op_minus_minus_gt(p, q), B) == (IN(p, B) → IN(q, B)))"), t303))
}

///|
let finsat_max_homo_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINSAT_MAX_HOMO")

///|
/// `FINSAT_MAX_HOMO`
pub fn finsat_max_homo() -> @kernel.Thm {
  finsat_max_homo_c.get()
}

///|
/// COMPACT_PROP
fn step_18() -> Unit raise {
  let t331 = @simp.simp_tac(@list.List([]))
  let t330 = @tactics.first_assum(fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x328
    @simp.rewrite_tac(@list.List([@drule.match_mp(finsat_max_homo())(th_2)]))
  })
  let t327 = @tactics.first_assum(fn(x325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x325
    @simp.rewrite_tac(@list.List([@drule.match_mp(finsat_max_consistent())(th_1)]))
  })
  let t324 = @simp.rewrite_tac(@list.List([pholds()]))
  let t323 = @tactics.match_mp_tac(@fol.form_induction())
  let t322 = @tactics.subgoal_then(@term_syntax.parse_term("∀ r : Form, pholds((p : Form) => IN(p, (B : (Form) -> Bool)), r) == IN(r, B)"), fn(x320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x320
    @meson.asm_meson_tac(@list.List([th, @sets.subset()]))
  })
  let t319 = @tactics.exists_tac(@term_syntax.parse_term("(p : Form) => IN(p, (B : (Form) -> Bool))"))
  let t318 = @tactics.disch_then(@tactics.conjuncts_then(fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s316 = @tactics.assume_tac(x315)
    fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s316(x317)
    }
  }))
  let t314 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : (Form) -> Bool)"))(fn(x311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s312 = @tactics.mp_tac(x311)
    fn(x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s312(x313)
    }
  }))
  let t309 = @meson.asm_meson_tac(@list.List([]))
  let t310 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([finsat(), psatisfiable()])), t309), @tactics.all_tac])
  let t307 = @drule.match_mp(finsat_max())
  let t332 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.strip_tac, @tactics.subgoal_then(@term_syntax.parse_term("finsat((A : (Form) -> Bool))"), fn(x308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s305 = @tactics.mp_tac(x304)
      fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s305(x306)
      }
    })(t307(x308))
  })), t310), t314), t318), t319), t322), t323), t324), t327), t330), t331)
  compact_prop_c.set(@tactics.prove(@term_syntax.parse_term("(∀ B : (Form) -> Bool, FINITE(B) && SUBSET(B, (A : (Form) -> Bool)) → (∃ d : (Form) -> Bool, ∀ r : Form, IN(r, B) → pholds(d, r))) → (∃ d : (Form) -> Bool, ∀ r : Form, IN(r, A) → pholds(d, r))"), t332))
}

///|
let compact_prop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPACT_PROP")

///|
/// `COMPACT_PROP`
pub fn compact_prop() -> @kernel.Thm {
  compact_prop_c.get()
}

///|
/// COMPACT_PROP_ALT
fn step_19() -> Unit raise {
  let t359 = @meson.asm_meson_tac(@list.List([@lib.el(3, @bool.conjuncts_rule(pholds_v1()))]))
  let t358 = @meson.meson_tac(@list.List([]))
  let t357 = @simp.rewrite_tac(@list.List([@fol.not_def(), @fol.form_inj()]))
  let t360 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(@tactics.ante_res_then(fn(x354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s355 = @tactics.mp_tac(x354)
    fn(x356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s355(x356)
    }
  }))), t357), t358), t359])
  let t353 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t361 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET((B : (Form) -> Bool), {Not((q : Form)) | IN(q, (A : (Form) -> Bool))})")), t353), @tactics.disch_tac), @tactics.conj_tac), t360)
  let t352 = @simp.rewrite_tac(@list.List([@fol.not_def(), @fol.form_inj()]))
  let t351 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t362 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_image_inj()), t351), t352), t361])
  let t350 = @simp.asm_rewrite_tac(@list.List([]))
  let t349 = @tactics.exists_tac(@term_syntax.parse_term("{(r : Form) | IN(Not(r), (B : (Form) -> Bool))}"))
  let t348 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t347 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_exists_thm(), @class.not_imp()]))
  let t344 = @drule.match_mp(@simp.gen_rewrite_rule(fn(x343 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x343
  }, @list.List([@equal.gsym(@class.contrapos_thm())]))(compact_prop()))
  let t346 = @tactics.disch_then(fn(x345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s341 = @tactics.mp_tac(x340)
      fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s341(x342)
      }
    })(t344(x345))
  })
  let t338 = @meson.asm_meson_tac(@list.List([pholds()]))
  let t337 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @fol.not_def()]))
  let t339 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_exists_thm(), @class.not_imp()])), t337), t338), @tactics.all_tac])
  let t336 = @tactics.subgoal_then(@term_syntax.parse_term("!(∃ d : (Form) -> Bool, ∀ r : Form, IN(r, {Not((q : Form)) | IN(q, (A : (Form) -> Bool))}) → pholds(d, r))"), fn(x333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s334 = @tactics.mp_tac(x333)
    fn(x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s334(x335)
    }
  })
  let t363 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t336), t339), t346), t347), t348), t349), t350), @tactics.conj_tac), t362)
  compact_prop_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, (∀ d : (Form) -> Bool, ∃ p : Form, IN(p, A) && pholds(d, p)) → (∃ B : (Form) -> Bool, FINITE(B) && SUBSET(B, A) && (∀ d : (Form) -> Bool, ∃ p : Form, IN(p, B) && pholds(d, p)))"), t363))
}

///|
let compact_prop_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPACT_PROP_ALT")

///|
/// `COMPACT_PROP_ALT`
pub fn compact_prop_alt() -> @kernel.Thm {
  compact_prop_alt_c.get()
}

///|
/// FINITE_DISJ_LEMMA
fn step_20() -> Unit raise {
  let t374 = @meson.meson_tac(@list.List([]))
  let t373 = @meson.meson_tac(@list.List([]))
  let t372 = @simp.asm_rewrite_tac(@list.List([]))
  let t371 = @tactics.exists_tac(@term_syntax.parse_term("(p : Form) => IN(p, (s : (Form) -> Bool))"))
  let t375 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@lists.all_imp()), t371), t372), t373), t374])
  let t370 = @simp.asm_rewrite_tac(@list.List([pholds_v1(), @sets.in_insert()]))
  let t369 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.itlist()]))
  let t368 = @tactics.exists_tac(@term_syntax.parse_term("CONS((q : Form), (ps : List[Form]))"))
  let t367 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ps : List[Form])"))(@tactics.strip_assume_tac))
  let t366 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Form) -> Bool)"))
  let t376 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(q : Form)")), t366), t367), t368), t369), t370), @tactics.conj_tac), t375)
  let t365 = @simp.rewrite_tac(@list.List([pholds(), @sets.not_in_empty()]))
  let t364 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.itlist()]))
  let t377 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Form])")), t364), t365), t376])
  let t378 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct()), @tactics.conj_tac), t377)
  finite_disj_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, FINITE(A) → (∃ ps : List[Form], ALL((p : Form) => IN(p, A), ps) && (∀ d : (Form) -> Bool, pholds(d, ITLIST(op_bar_bar, ps, False)) == (∃ p : Form, IN(p, A) && pholds(d, p))))"), t378))
}

///|
let finite_disj_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_DISJ_LEMMA")

///|
/// `FINITE_DISJ_LEMMA`
pub fn finite_disj_lemma() -> @kernel.Thm {
  finite_disj_lemma_c.get()
}

///|
/// COMPACT_DISJ
fn step_21() -> Unit raise {
  let t401 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t400 = @simp.asm_rewrite_tac(@list.List([]))
  let t399 = @tactics.exists_tac(@term_syntax.parse_term("(p : Form) => IN(p, (B : (Form) -> Bool))"))
  let t398 = @tactics.match_mp_tac(@lists.all_imp())
  let t397 = @simp.asm_rewrite_tac(@list.List([]))
  let t396 = @tactics.exists_tac(@term_syntax.parse_term("(ps : List[Form])"))
  let t392 = @drule.match_mp(finite_disj_lemma())
  let t393 = @tactics.x_choose_then(@term_syntax.parse_term("(ps : List[Form])"))(@tactics.strip_assume_tac)
  let t395 = @tactics.disch_then(fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t393(t392(x394))
  })
  let t391 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s389 = @tactics.mp_tac(x388)
    fn(x390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s389(x390)
    }
  }, @tactics.strip_assume_tac))
  let t387 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : (Form) -> Bool)"))(fn(x384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s385 = @tactics.mp_tac(x384)
    fn(x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s385(x386)
    }
  }))
  let t382 = @drule.match_mp(compact_prop_alt())
  let t402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s380 = @tactics.mp_tac(x379)
      fn(x381 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s380(x381)
      }
    })(t382(x383))
  })), t387), t391), t395), t396), t397), t398), t399), t400), t401)
  compact_disj_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, (∀ d : (Form) -> Bool, ∃ p : Form, IN(p, A) && pholds(d, p)) → (∃ ps : List[Form], ALL((p : Form) => IN(p, A), ps) && (∀ d : (Form) -> Bool, pholds(d, ITLIST(op_bar_bar, ps, False))))"), t402))
}

///|
let compact_disj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPACT_DISJ")

///|
/// `COMPACT_DISJ`
pub fn compact_disj() -> @kernel.Thm {
  compact_disj_c.get()
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
}
