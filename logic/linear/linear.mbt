// Translated from upstream Logic/linear.ml; edit this file directly.

///|
/// RESOLVE_CLAUSE
fn step_1() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@sets.delete_subset(), @sets.finite_subset()]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.clause(), @resolution.resolve(), @sets.finite_union(), @sets.in_union(), @sets.in_delete()])), t1)
  resolve_clause_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ p : Form, clause(c1) && clause(c2) → clause(resolve(p, c1, c2))"), t2))
}

///|
let resolve_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESOLVE_CLAUSE")

///|
/// `RESOLVE_CLAUSE`
pub fn resolve_clause() -> @kernel.Thm {
  resolve_clause_c.get()
}

///|
/// PRESPROOF_CLAUSE
fn step_2() -> Unit raise {
  let t5 = @meson.asm_meson_tac(@list.List([resolve_clause()]))
  let t4 = @tactics.match_mp_tac(@resolution.presproof_induct())
  let t3 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj()])), @tactics.gen_tac), t3), @tactics.disch_tac), t4), t5)
  presproof_clause_c.set(@tactics.prove(@term_syntax.parse_term("∀ hyps : ((Form) -> Bool) -> Bool, ∀ cl : (Form) -> Bool, (∀ c : (Form) -> Bool, IN(c, hyps) → clause(c)) && presproof(hyps, cl) → clause(cl)"), t6))
}

///|
let presproof_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRESPROOF_CLAUSE")

///|
/// `PRESPROOF_CLAUSE`
pub fn presproof_clause() -> @kernel.Thm {
  presproof_clause_c.get()
}

///|
/// RESOLVE_MONO
fn step_3() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t8 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @resolution.resolve(), @sets.in_union(), @sets.in_delete()])), t7)
  resolve_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ c1' : (Form) -> Bool, ∀ c2' : (Form) -> Bool, ∀ p : Form, SUBSET(c1, c1') && SUBSET(c2, c2') → SUBSET(resolve(p, c1, c2), resolve(p, c1', c2'))"), t8))
}

///|
let resolve_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESOLVE_MONO")

///|
/// `RESOLVE_MONO`
pub fn resolve_mono() -> @kernel.Thm {
  resolve_mono_c.get()
}

///|
let ppresproof_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ppresproof_RULES")

///|
/// `ppresproof_RULES`
pub fn ppresproof_rules() -> @kernel.Thm {
  ppresproof_rules_c.get()
}

///|
let ppresproof_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ppresproof_INDUCT")

///|
/// `ppresproof_INDUCT`
pub fn ppresproof_induct() -> @kernel.Thm {
  ppresproof_induct_c.get()
}

///|
let ppresproof_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ppresproof_CASES")

///|
/// `ppresproof_CASES`
pub fn ppresproof_cases() -> @kernel.Thm {
  ppresproof_cases_c.get()
}

///|
/// ppresproof_RULES, ppresproof_INDUCT, ppresproof_CASES
fn step_4() -> Unit raise {
  let (ppresproof_rules, ppresproof_induct, ppresproof_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ c : (Form) -> Bool, clause(c) → (ppresproof : (((Form) -> Bool) -> Bool, (Form) -> Bool) -> Bool)({c}, c)) && (∀ p : Form, ∀ asm1 : ((Form) -> Bool) -> Bool, ∀ asm2 : ((Form) -> Bool) -> Bool, ∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ppresproof(asm1, c1) && ppresproof(asm2, c2) && IN(p, c1) && IN(op_tilde_tilde(p), c2) → ppresproof(UNION(asm1, asm2), resolve(p, c1, c2)))"))
  ppresproof_rules_c.set(ppresproof_rules)
  ppresproof_induct_c.set(ppresproof_induct)
  ppresproof_cases_c.set(ppresproof_cases)
}

///|
/// PPRESPROOF
fn step_5() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([@resolution.presproof_rules()]))
  let t27 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.in_union(), @sets.not_in_empty()]))
  let t26 = @tactics.match_mp_tac(ppresproof_induct())
  let t24 = @term_syntax.parse_term("(asm : ((Form) -> Bool) -> Bool)")
  let t25 = @tactics.map_every(fn(x22 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s = x22
    @tactics.spec_tac(s, s)
  }, @list.List([@term_syntax.parse_term("(c : (Form) -> Bool)"), t24]))
  let t21 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj_alt()]))
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(asm : ((Form) -> Bool) -> Bool)"))(fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s19 = @tactics.mp_tac(x18)
    fn(x20 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s19(x20)
    }
  })), t21), t25), t26), t27), t28)
  let t17 = @meson.meson_tac(@list.List([ppresproof_rules(), @sets.in_union()]))
  let t16 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t14 = @sets.set_tac(@list.List([]))
  let t13 = @tactics.undisch_tac(@term_syntax.parse_term("IN((c : (Form) -> Bool), (hyps : ((Form) -> Bool) -> Bool))"))
  let t12 = @simp.asm_simp_tac(@list.List([ppresproof_rules()]))
  let t11 = @tactics.exists_tac(@term_syntax.parse_term("{(c : (Form) -> Bool)}"))
  let t15 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(c : (Form) -> Bool)")), @tactics.disch_tac), t11), t12), t13), t14), @tactics.all_tac])
  let t10 = @tactics.match_mp_tac(@resolution.presproof_induct())
  let t9 = @term_syntax.parse_term("(c : (Form) -> Bool)")
  let t30 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(c : (Form) -> Bool)"), t9), t10), @tactics.conj_tac), t15), t16), t17), t29])
  let t31 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t30)
  ppresproof_c.set(@tactics.prove(@term_syntax.parse_term("∀ hyps : ((Form) -> Bool) -> Bool, (∀ c : (Form) -> Bool, IN(c, hyps) → clause(c)) → (∀ c : (Form) -> Bool, presproof(hyps, c) == (∃ asm : ((Form) -> Bool) -> Bool, SUBSET(asm, hyps) && ppresproof(asm, c)))"), t31))
}

///|
let ppresproof_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PPRESPROOF")

///|
/// `PPRESPROOF`
pub fn ppresproof() -> @kernel.Thm {
  ppresproof_c.get()
}

///|
/// PPRESPROOF_CLAUSE
fn step_6() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([]))
  let t33 = @simp.simp_tac(@list.List([@sets.in_union(), resolve_clause()]))
  let t32 = @simp.simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(ppresproof_induct()), t32), t33), t34)
  ppresproof_clause_c.set(@tactics.prove(@term_syntax.parse_term("∀ asm : ((Form) -> Bool) -> Bool, ∀ cl : (Form) -> Bool, ppresproof(asm, cl) → clause(cl) && (∀ c : (Form) -> Bool, IN(c, asm) → clause(c))"), t35))
}

///|
let ppresproof_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PPRESPROOF_CLAUSE")

///|
/// `PPRESPROOF_CLAUSE`
pub fn ppresproof_clause() -> @kernel.Thm {
  ppresproof_clause_c.get()
}

///|
/// PPRESPROOF_CONSEQUENCE
fn step_7() -> Unit raise {
  let t77 = @meson.asm_meson_tac(@list.List([@resolution.pholds_negate()]))
  let t76 = @simp.rewrite_tac(@list.List([@resolution.resolve(), @sets.in_union(), @sets.in_delete()]))
  let t74 = @tactics.x_choose_then(@term_syntax.parse_term("(r : Form)"))(@tactics.strip_assume_tac)
  let t75 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(@tactics.strip_assume_tac), t74))
  let t73 = @simp.asm_simp_tac(@list.List([]))
  let t66 = @term_syntax.parse_term("(d : (Form) -> Bool)")
  let t72 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s64 = @tactics.mp_tac(x63)
      fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s64(x65)
      }
    })(((x67 : @kernel.Thm) => @bool.spec(t66, x67))(x68))
  }, fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s70 = @tactics.mp_tac(x69)
    fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s70(x71)
    }
  }))
  let t62 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t61 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc(), @theorems.and_forall_thm()]))
  let t60 = @tactics.disch_then(fn(x57 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x57
    let t59 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t59)
  })
  let t56 = @simp.rewrite_tac(@list.List([@fol_prop.psatisfies(), @sets.in_union()]))
  let t55 = @simp.rewrite_tac(@list.List([@sets.image_union()]))
  let t50 = @term_syntax.parse_term("(c2 : (Form) -> Bool)")
  let t51 = @term_syntax.parse_term("(c1 : (Form) -> Bool)")
  let t52 = @term_syntax.parse_term("(asm2 : ((Form) -> Bool) -> Bool)")
  let t53 = @term_syntax.parse_term("(asm1 : ((Form) -> Bool) -> Bool)")
  let t54 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Form)"), t53, t52, t51, t50]))
  let t48 = @meson.meson_tac(@list.List([]))
  let t49 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.image(), @sets.in_insert(), @sets.not_in_empty(), @fol_prop.psatisfies(), @sets.in_elim_thm()])), t48), @tactics.all_tac])
  let t47 = @tactics.match_mp_tac(ppresproof_induct())
  let t45 = @meson.asm_meson_tac(@list.List([@resolution.pholds_interp(), @resolution.clause(), ppresproof_clause()]))
  let t44 = @simp.simp_tac(@list.List([@sets.in_image(), @theorems.left_imp_exists_thm()]))
  let t43 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t42 = @simp.rewrite_tac(@list.List([@fol_prop.psatisfies()]))
  let t41 = @simp.asm_rewrite_tac(@list.List([]))
  let t40 = @class.asm_cases_tac(@term_syntax.parse_term("ppresproof((asm : ((Form) -> Bool) -> Bool), (cl : (Form) -> Bool))"))
  let t39 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t46 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac), t39), @tactics.gen_tac), t40), t41), t42), t43), @tactics.gen_tac), t44), t45)])
  let t78 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ asm : ((Form) -> Bool) -> Bool, ∀ cl : (Form) -> Bool, ppresproof(asm, cl) → (∀ d : (Form) -> Bool, (∀ c : (Form) -> Bool, IN(c, asm) → (∃ p : Form, IN(p, c) && pholds(d, p))) → (∃ p : Form, IN(p, cl) && pholds(d, p)))"), fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s37 = @tactics.mp_tac(x36)
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s37(x38)
    }
  }), t46), t47), @tactics.conj_tac), t49), t54), t55), t56), t60), t61), t62), t72), @tactics.strip_tac), t73), t75), t76), t77)
  ppresproof_consequence_c.set(@tactics.prove(@term_syntax.parse_term("∀ asm : ((Form) -> Bool) -> Bool, ∀ cl : (Form) -> Bool, ppresproof(asm, cl) → (∀ d : (Form) -> Bool, psatisfies(d, IMAGE(interp, asm)) → pholds(d, interp(cl)))"), t78))
}

///|
let ppresproof_consequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PPRESPROOF_CONSEQUENCE")

///|
/// `PPRESPROOF_CONSEQUENCE`
pub fn ppresproof_consequence() -> @kernel.Thm {
  ppresproof_consequence_c.get()
}

///|
/// PPRESPROOF_SOUND
fn step_8() -> Unit raise {
  let t87 = @meson.meson_tac(@list.List([]))
  let t86 = @simp.rewrite_tac(@list.List([@fol_prop.psatisfies()]))
  let t85 = @simp.simp_tac(@list.List([@resolution.pholds_interp(), @sets.finite_rules(), @sets.not_in_empty()]))
  let t84 = @simp.rewrite_tac(@list.List([@fol_prop.psatisfiable()]))
  let t82 = @drule.match_mp(ppresproof_consequence())
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s80 = @tactics.mp_tac(x79)
      fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s80(x81)
      }
    })(t82(x83))
  })), t84), t85), t86), t87)
  ppresproof_sound_c.set(@tactics.prove(@term_syntax.parse_term("∀ asm : ((Form) -> Bool) -> Bool, ppresproof(asm, {}) → !psatisfiable(IMAGE(interp, asm))"), t88))
}

///|
let ppresproof_sound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PPRESPROOF_SOUND")

///|
/// `PPRESPROOF_SOUND`
pub fn ppresproof_sound() -> @kernel.Thm {
  ppresproof_sound_c.get()
}

///|
/// PPRESPROOF_ALLNEGATIVE
fn step_9() -> Unit raise {
  let t132 = @meson.meson_tac(@list.List([]))
  let t131 = @simp.rewrite_tac(@list.List([@resolution.negative(), @fol.not_def(), @fol.form_inj()]))
  let t130 = @simp.asm_rewrite_tac(@list.List([@fol_prop.pholds()]))
  let t129 = @tactics.undisch_tac(@term_syntax.parse_term("!negative((q : Form))"))
  let t128 = @tactics.repeat_tac(@tactics.strip_tac)
  let t127 = @simp.rewrite_tac(@list.List([@resolution.literal(), @resolution.atom_v1()]))
  let t126 = @list.List([@meson.asm_meson_tac(@list.List([ppresproof_clause(), @resolution.clause()])), @tactics.all_tac])
  let t125 = @tactics.subgoal_then(@term_syntax.parse_term("literal((q : Form))"), fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s123 = @tactics.mp_tac(x122)
    fn(x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s123(x124)
    }
  })
  let t121 = @simp.simp_tac(@list.List([]))
  let t120 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Form)"))
  let t119 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t118 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp()]))
  let t117 = @simp.asm_rewrite_tac(@list.List([]))
  let t113 = @term_syntax.parse_term("(c : (Form) -> Bool)")
  let t116 = @tactics.first_x_assum(fn(x115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s111 = @tactics.mp_tac(x110)
      fn(x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s111(x112)
      }
    })(((x114 : @kernel.Thm) => @bool.spec(t113, x114))(x115))
  })
  let t109 = @list.List([@meson.asm_meson_tac(@list.List([ppresproof_clause(), @resolution.clause()])), @tactics.all_tac])
  let t108 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((c : (Form) -> Bool))"), fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x106
    @simp.simp_tac(@list.List([th, @resolution.pholds_interp()]))
  })
  let t105 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }, fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s103 = @tactics.assume_tac(x102)
    fn(x104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s103(x104)
    }
  }))
  let t100 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Form) -> Bool)"))
  let t99 = @simp.simp_tac(@list.List([@sets.in_image(), @theorems.left_imp_exists_thm()]))
  let t98 = @tactics.exists_tac(@term_syntax.parse_term("(x : Form) => true"))
  let t97 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t96 = @simp.rewrite_tac(@list.List([@fol_prop.psatisfiable()]))
  let t95 = @tactics.conv_tac(@class.contrapos_conv)
  let t92 = @drule.match_mp(ppresproof_sound())
  let t94 = @tactics.first_assum(fn(x93 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s90 = @tactics.mp_tac(x89)
      fn(x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s90(x91)
      }
    })(t92(x93))
  })
  let t133 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t94), t95), t96), t97), @tactics.disch_tac), t98), t99), @tactics.gen_tac), t100), t105), t108), t109), t116), t117), t118), t119), t120), t121), @tactics.strip_tac), t125), t126), t127), t128), t129), t130), t131), t132)
  ppresproof_allnegative_c.set(@tactics.prove(@term_syntax.parse_term("∀ asm : ((Form) -> Bool) -> Bool, ppresproof(asm, {}) → (∃ c : (Form) -> Bool, IN(c, asm) && (∀ p : Form, IN(p, c) → negative(p)))"), t133))
}

///|
let ppresproof_allnegative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PPRESPROOF_ALLNEGATIVE")

///|
/// `PPRESPROOF_ALLNEGATIVE`
pub fn ppresproof_allnegative() -> @kernel.Thm {
  ppresproof_allnegative_c.get()
}

///|
let lpresproof_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lpresproof_RULES")

///|
/// `lpresproof_RULES`
pub fn lpresproof_rules() -> @kernel.Thm {
  lpresproof_rules_c.get()
}

///|
let lpresproof_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lpresproof_INDUCT")

///|
/// `lpresproof_INDUCT`
pub fn lpresproof_induct() -> @kernel.Thm {
  lpresproof_induct_c.get()
}

///|
let lpresproof_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lpresproof_CASES")

///|
/// `lpresproof_CASES`
pub fn lpresproof_cases() -> @kernel.Thm {
  lpresproof_cases_c.get()
}

///|
/// lpresproof_RULES, lpresproof_INDUCT, lpresproof_CASES
fn step_10() -> Unit raise {
  let (lpresproof_rules, lpresproof_induct, lpresproof_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (hyps : ((Form) -> Bool) -> Bool)) → (lpresproof : (((Form) -> Bool) -> Bool, List[(Form) -> Bool]) -> Bool)(hyps, [cl])) && (∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ p : Form, lpresproof(hyps, CONS(c1, lis)) && (IN(c2, hyps) || MEM(c2, lis)) && IN(p, c1) && IN(op_tilde_tilde(p), c2) → lpresproof(hyps, CONS(resolve(p, c1, c2), CONS(c1, lis))))"))
  lpresproof_rules_c.set(lpresproof_rules)
  lpresproof_induct_c.set(lpresproof_induct)
  lpresproof_cases_c.set(lpresproof_cases)
}

///|
/// LPRESPROOF_MONO
fn step_11() -> Unit raise {
  let t144 = @meson.asm_meson_tac(@list.List([lpresproof_rules(), @sets.subset()]))
  let t143 = @tactics.match_mp_tac(lpresproof_induct())
  let t141 = @term_syntax.parse_term("(c : List[(Form) -> Bool])")
  let t142 = @tactics.spec_tac(@term_syntax.parse_term("(c : List[(Form) -> Bool])"), t141)
  let t140 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s135 = @tactics.assume_tac(x134)
    fn(x136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s135(x136)
    }
  }, fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s138 = @tactics.mp_tac(x137)
    fn(x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s138(x139)
    }
  }))
  let t145 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t140), t142), t143), t144)
  lpresproof_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ hyps : ((Form) -> Bool) -> Bool, ∀ hyps' : ((Form) -> Bool) -> Bool, ∀ c : List[(Form) -> Bool], SUBSET(hyps, hyps') && lpresproof(hyps, c) → lpresproof(hyps', c)"), t145))
}

///|
let lpresproof_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRESPROOF_MONO")

///|
/// `LPRESPROOF_MONO`
pub fn lpresproof_mono() -> @kernel.Thm {
  lpresproof_mono_c.get()
}

///|
/// RESOLVE_SYM
fn step_12() -> Unit raise {
  let t146 = @simp.simp_tac(@list.List([@resolution.resolve(), @resolution.negate_negate(), @sets.union_aci()]))
  resolve_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ p : Form, literal(p) → resolve(op_tilde_tilde(p), c1, c2) == resolve(p, c2, c1)"), t146))
}

///|
let resolve_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESOLVE_SYM")

///|
/// `RESOLVE_SYM`
pub fn resolve_sym() -> @kernel.Thm {
  resolve_sym_c.get()
}

///|
/// RESOLVE_TAUT_L
fn step_13() -> Unit raise {
  let t161 = @meson.asm_meson_tac(@list.List([@resolution.negate_refl(), @resolution.negate_negate()]))
  let t160 = @list.List([@tactics.first_x_assum(@tactics.disj_cases_then(fn(x157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s158 = @tactics.subst_all_tac(x157)
    fn(x159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s158(x159)
    }
  })), @tactics.all_tac])
  let t156 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Form) == (q : Form) || p == op_tilde_tilde(q)"))
  let t155 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(@tactics.strip_assume_tac))
  let t154 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s149 = @tactics.assume_tac(x148)
    fn(x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s149(x150)
    }
  }, fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s152 = @tactics.mp_tac(x151)
    fn(x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s152(x153)
    }
  }))
  let t147 = @tactics.repeat_tac(@tactics.gen_tac)
  let t162 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@given.tautologous(), @sets.subset(), @resolution.resolve(), @sets.in_delete(), @sets.in_union(), @resolution.clause()])), t147), t154), t155), t156), t160), t161)
  resolve_taut_l_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ p : Form, clause(c1) && tautologous(c1) → tautologous(resolve(p, c1, c2)) || SUBSET(c2, resolve(p, c1, c2))"), t162))
}

///|
let resolve_taut_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESOLVE_TAUT_L")

///|
/// `RESOLVE_TAUT_L`
pub fn resolve_taut_l() -> @kernel.Thm {
  resolve_taut_l_c.get()
}

///|
/// RESOLVE_TAUT_R
fn step_14() -> Unit raise {
  let t184 = @meson.asm_meson_tac(@list.List([@resolution.negate_refl(), @resolution.negate_negate()]))
  let t183 = @list.List([@tactics.first_x_assum(@tactics.disj_cases_then(fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s181 = @tactics.subst_all_tac(x180)
    fn(x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s181(x182)
    }
  })), @tactics.all_tac])
  let t179 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Form) == (q : Form) || p == op_tilde_tilde(q)"))
  let t178 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(@tactics.strip_assume_tac))
  let t177 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s172 = @tactics.mp_tac(x171)
    fn(x173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s172(x173)
    }
  }, fn(x174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s175 = @tactics.assume_tac(x174)
    fn(x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s175(x176)
    }
  }))
  let t170 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s165 = @tactics.assume_tac(x164)
    fn(x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s165(x166)
    }
  }, fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s168 = @tactics.mp_tac(x167)
    fn(x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s168(x169)
    }
  }))
  let t163 = @tactics.repeat_tac(@tactics.gen_tac)
  let t185 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@given.tautologous(), @sets.subset(), @resolution.resolve(), @sets.in_delete(), @sets.in_union(), @resolution.clause()])), t163), t170), t177), t178), t179), t183), t184)
  resolve_taut_r_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ p : Form, clause(c2) && tautologous(c2) && literal(p) → tautologous(resolve(p, c1, c2)) || SUBSET(c1, resolve(p, c1, c2))"), t185))
}

///|
let resolve_taut_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESOLVE_TAUT_R")

///|
/// `RESOLVE_TAUT_R`
pub fn resolve_taut_r() -> @kernel.Thm {
  resolve_taut_r_c.get()
}

///|
/// SUBSET_TAUT
fn step_15() -> Unit raise {
  let t186 = @meson.meson_tac(@list.List([]))
  let t187 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@given.tautologous(), @sets.subset()])), t186)
  subset_taut_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, tautologous(c1) && SUBSET(c1, c2) → tautologous(c2)"), t187))
}

///|
let subset_taut_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_TAUT")

///|
/// `SUBSET_TAUT`
pub fn subset_taut() -> @kernel.Thm {
  subset_taut_c.get()
}

///|
/// suffix
fn step_16() -> Unit raise {
  let t188 = @term_syntax.parse_term("(suffix : (List[_], List[_]) -> Bool)((lis : List[_]), NIL) == (lis == NIL) && suffix(lis, CONS((s : _), (cs : List[_]))) == (lis == CONS(s, cs) || suffix(lis, cs))")
  suffix_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t188))
}

///|
let suffix_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("suffix")

///|
/// `suffix`
pub fn suffix() -> @kernel.Thm {
  suffix_c.get()
}

///|
/// SUFFIX_REFL
fn step_17() -> Unit raise {
  let t189 = @tactics.then_tac(@lists.list_induct_tac, @simp.asm_rewrite_tac(@list.List([suffix()])))
  suffix_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ lis : List[_], suffix(lis, lis)"), t189))
}

///|
let suffix_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUFFIX_REFL")

///|
/// `SUFFIX_REFL`
pub fn suffix_refl() -> @kernel.Thm {
  suffix_refl_c.get()
}

///|
/// SUFFIX_BUTLAST
fn step_18() -> Unit raise {
  let t194 = @meson.asm_meson_tac(@list.List([suffix()]))
  let t193 = @simp.asm_simp_tac(@list.List([]))
  let t192 = @simp.asm_rewrite_tac(@list.List([@lists.last()]))
  let t191 = @simp.asm_rewrite_tac(@list.List([suffix(), @lists.last()]))
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t195 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(l1 : List[A]) == NIL"))), t190), @lists.list_induct_tac), t191), @tactics.strip_tac), t192), @class.cond_cases_tac), t193), t194)
  suffix_butlast_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], suffix(l1, l2) && !(l1 == NIL) → LAST(l1) == LAST(l2)"), t195))
}

///|
let suffix_butlast_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUFFIX_BUTLAST")

///|
/// `SUFFIX_BUTLAST`
pub fn suffix_butlast() -> @kernel.Thm {
  suffix_butlast_c.get()
}

///|
/// SUFFIX_TRANS
fn step_19() -> Unit raise {
  let t197 = @meson.asm_meson_tac(@list.List([suffix()]))
  let t196 = @simp.rewrite_tac(@list.List([suffix()]))
  let t198 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t196), t197)
  suffix_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], ∀ l3 : List[_], suffix(l1, l2) && suffix(l2, l3) → suffix(l1, l3)"), t198))
}

///|
let suffix_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUFFIX_TRANS")

///|
/// `SUFFIX_TRANS`
pub fn suffix_trans() -> @kernel.Thm {
  suffix_trans_c.get()
}

///|
/// SUFFIX_MEM
fn step_20() -> Unit raise {
  let t200 = @meson.asm_meson_tac(@list.List([]))
  let t199 = @simp.rewrite_tac(@list.List([@lists.mem(), suffix(), @lists.not_cons_nil(), @lists.cons_11()]))
  let t201 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t199), t200)
  suffix_mem_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ l : List[A], ∀ lis : List[A], suffix(CONS(x, l), lis) → MEM(x, lis)"), t201))
}

///|
let suffix_mem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUFFIX_MEM")

///|
/// `SUFFIX_MEM`
pub fn suffix_mem() -> @kernel.Thm {
  suffix_mem_c.get()
}

///|
/// SUFFIX_CONS
fn step_21() -> Unit raise {
  let t202 = @meson.meson_tac(@list.List([suffix()]))
  suffix_cons_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ l1 : List[_], ∀ l2 : List[_], suffix(l1, l2) → suffix(l1, CONS(x, l2))"), t202))
}

///|
let suffix_cons_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUFFIX_CONS")

///|
/// `SUFFIX_CONS`
pub fn suffix_cons() -> @kernel.Thm {
  suffix_cons_c.get()
}

///|
/// SUFFIX_LENGTH
fn step_22() -> Unit raise {
  let t206 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) → x <= SUC(y)"))]))
  let t205 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @arith.le_suc(), @arith.le_refl()]))
  let t204 = @tactics.repeat_tac(@tactics.strip_tac)
  let t203 = @simp.asm_simp_tac(@list.List([suffix(), @lists.length(), @lists.not_cons_nil(), @arith.le_0()]))
  let t207 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()])), @lists.list_induct_tac), t203), t204), t205), t206)
  suffix_length_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], suffix(l1, l2) → LENGTH(l1) <= LENGTH(l2)"), t207))
}

///|
let suffix_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUFFIX_LENGTH")

///|
/// `SUFFIX_LENGTH`
pub fn suffix_length() -> @kernel.Thm {
  suffix_length_c.get()
}

///|
/// NOT_SUFFIX_TAIL
fn step_23() -> Unit raise {
  let t208 = @meson.meson_tac(@list.List([suffix_length(), @lists.length(), @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)"))]))
  not_suffix_tail_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ l : List[_], !suffix(CONS(x, l), l)"), t208))
}

///|
let not_suffix_tail_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_SUFFIX_TAIL")

///|
/// `NOT_SUFFIX_TAIL`
pub fn not_suffix_tail() -> @kernel.Thm {
  not_suffix_tail_c.get()
}

///|
/// SUFFIX_ANTISYM
fn step_24() -> Unit raise {
  let t210 = @meson.asm_meson_tac(@list.List([not_suffix_tail(), suffix_trans(), suffix_cons()]))
  let t209 = @simp.rewrite_tac(@list.List([suffix(), @lists.not_cons_nil(), @lists.cons_11()]))
  let t211 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @lists.list_induct_tac), t209), t210)
  suffix_antisym_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], suffix(l1, l2) && suffix(l2, l1) → l1 == l2"), t211))
}

///|
let suffix_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUFFIX_ANTISYM")

///|
/// `SUFFIX_ANTISYM`
pub fn suffix_antisym() -> @kernel.Thm {
  suffix_antisym_c.get()
}

///|
/// NEGATE_LITERAL
fn step_25() -> Unit raise {
  let t214 = @meson.asm_meson_tac(@list.List([@resolution.atom_v1(), @resolution.negate_atom(), @resolution.negate_neg()]))
  let t213 = @simp.asm_simp_tac(@list.List([]))
  let t212 = @tactics.repeat_tac(@tactics.strip_tac)
  let t215 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.literal(), @resolution.atom_v1()])), t212), t213), t214)
  negate_literal_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Form, literal(q) → literal(op_tilde_tilde(q))"), t215))
}

///|
let negate_literal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEGATE_LITERAL")

///|
/// `NEGATE_LITERAL`
pub fn negate_literal() -> @kernel.Thm {
  negate_literal_c.get()
}

///|
/// SYMMETRY_LEMMA_1
fn step_26() -> Unit raise {
  let t216 = @meson.meson_tac(@list.List([negate_literal(), @resolution.negate_negate()]))
  let t217 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union()])), t216)
  symmetry_lemma_1_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Form, ∀ basm : (_) -> Bool, ∀ B : _, ∀ casm : (_) -> Bool, ∀ C : _, ∀ c : _, literal(q) → (P : (Form, (_) -> Bool, _, (_) -> Bool, _, _) -> Bool)(q, basm, B, casm, C, c) == P(op_tilde_tilde(q), casm, C, basm, B, c)) && (∀ q : Form, ∀ basm : (_) -> Bool, ∀ B : _, ∀ casm : (_) -> Bool, ∀ C : _, literal(q) → (Q : (Form, (_) -> Bool, _, (_) -> Bool, _) -> Bool)(q, basm, B, casm, C) == Q(op_tilde_tilde(q), casm, C, basm, B)) && (∀ q : Form, ∀ basm : (_) -> Bool, ∀ B : _, ∀ casm : (_) -> Bool, ∀ C : _, Q(q, basm, B, casm, C) → literal(q) → (∀ c : _, IN(c, basm) → P(q, basm, B, casm, C, c))) → (∀ q : Form, ∀ basm : (_) -> Bool, ∀ B : _, ∀ casm : (_) -> Bool, ∀ C : _, Q(q, basm, B, casm, C) → literal(q) → (∀ c : _, IN(c, UNION(basm, casm)) → P(q, basm, B, casm, C, c)))"), t217))
}

///|
let symmetry_lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMMETRY_LEMMA_1")

///|
/// `SYMMETRY_LEMMA_1`
pub fn symmetry_lemma_1() -> @kernel.Thm {
  symmetry_lemma_1_c.get()
}

///|
/// SYMMETRY_LEMMA_2
fn step_27() -> Unit raise {
  let t218 = @meson.meson_tac(@list.List([negate_literal(), @resolution.negate_negate()]))
  let t219 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union()])), t218)
  symmetry_lemma_2_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Form, ∀ q : Form, ∀ basm : _, ∀ B : (Form) -> Bool, ∀ casm : _, ∀ C : (Form) -> Bool, ∀ main : _, ∀ aasm : _, ∀ A : _, literal(q) → (P : (Form, Form, _, (Form) -> Bool, _, (Form) -> Bool, _, _, _) -> Bool)(p, q, basm, B, casm, C, main, aasm, A) == P(p, op_tilde_tilde(q), casm, C, basm, B, main, aasm, A)) && (∀ p : Form, ∀ q : Form, ∀ basm : _, ∀ B : (Form) -> Bool, ∀ casm : _, ∀ C : (Form) -> Bool, ∀ main : _, ∀ aasm : _, ∀ A : _, IN(op_tilde_tilde(p), B) → literal(q) → P(p, q, basm, B, casm, C, main, aasm, A)) → (∀ p : Form, ∀ q : Form, ∀ basm : _, ∀ B : (Form) -> Bool, ∀ casm : _, ∀ C : (Form) -> Bool, ∀ main : _, ∀ aasm : _, ∀ A : _, IN(op_tilde_tilde(p), B) || IN(op_tilde_tilde(p), C) → literal(q) → P(p, q, basm, B, casm, C, main, aasm, A))"), t219))
}

///|
let symmetry_lemma_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMMETRY_LEMMA_2")

///|
/// `SYMMETRY_LEMMA_2`
pub fn symmetry_lemma_2() -> @kernel.Thm {
  symmetry_lemma_2_c.get()
}

///|
/// LINEARIZATION
fn step_28() -> Unit raise {
  let t590 = @meson.meson_tac(@list.List([]))
  let t589 = @simp.rewrite_tac(@list.List([@sets.subset(), @resolution.resolve(), @sets.in_union(), @sets.in_delete()]))
  let t588 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((A : (Form) -> Bool), resolve((q : Form), resolve((p : Form), A, (B : (Form) -> Bool)), (C : (Form) -> Bool)))"))
  let t587 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((A : (Form) -> Bool), resolve((p : Form), A, (B : (Form) -> Bool)))"))
  let t586 = @simp.asm_rewrite_tac(@list.List([]))
  let t584 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t585 = @tactics.map_every(fn(x581 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s582 = @tactics.exists_tac(x581)
    fn(x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s582(x583)
    }
  }, @list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t584]))
  let t580 = @tactics.disch_then(@tactics.conjuncts_then(fn(x577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s578 = @tactics.subst_all_tac(x577)
    fn(x579 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s578(x579)
    }
  }))
  let t576 = @simp.rewrite_tac(@list.List([@lists.cons_11()]))
  let t575 = @list.List([@meson.asm_meson_tac(@list.List([suffix_antisym()])), @tactics.all_tac])
  let t574 = @tactics.subgoal_then(@term_syntax.parse_term("CONS((D : (Form) -> Bool), (middle : List[(Form) -> Bool])) == CONS((A : (Form) -> Bool), (main : List[(Form) -> Bool]))"), fn(x571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s572 = @tactics.mp_tac(x571)
    fn(x573 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s572(x573)
    }
  })
  let t570 = @tactics.disch_then(@tactics.conjuncts_then(fn(x569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s567 = @tactics.subst_all_tac(x566)
      fn(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s567(x568)
      }
    })(@equal.sym(x569))
  }))
  let t565 = @simp.rewrite_tac(@list.List([@lists.cons_11()]))
  let t564 = @tactics.undisch_tac(@parser.parse_term("CONS (A:form->bool) main = CONS E final_"))
  let t559 = @meson.meson_tac(@list.List([]))
  let t558 = @simp.rewrite_tac(@list.List([@resolution.resolve(), @sets.in_union(), @sets.in_delete(), @sets.subset()]))
  let t549 = @term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), (B : (Form) -> Bool))")
  let t550 = @term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), resolve((q : Form), (B : (Form) -> Bool), (C : (Form) -> Bool)))")
  let t551 = @term_syntax.parse_term("IN((p : Form), (A : (Form) -> Bool))")
  let t552 = @term_syntax.parse_term("IN(op_tilde_tilde((q : Form)), (C : (Form) -> Bool))")
  let t553 = @term_syntax.parse_term("IN((q : Form), (B : (Form) -> Bool))")
  let t554 = @term_syntax.parse_term("!((p : Form) == (q : Form))")
  let t555 = @term_syntax.parse_term("!((p : Form) == op_tilde_tilde((q : Form)))")
  let t556 = @term_syntax.parse_term("SUBSET((E : (Form) -> Bool), resolve((q : Form), resolve((p : Form), (A : (Form) -> Bool), (B : (Form) -> Bool)), (C : (Form) -> Bool)))")
  let t557 = @tactics.map_every(fn(x546 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s547 = @tactics.undisch_tac(x546)
    fn(x548 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s547(x548)
    }
  }, @list.List([@term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), (E : (Form) -> Bool))"), t556, t555, t554, t553, t552, t551, t550, t549]))
  let t545 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.negate_negate(), @resolution.clause()])), @tactics.all_tac])
  let t560 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("op_tilde_tilde(op_tilde_tilde((p : Form))) == p && op_tilde_tilde(op_tilde_tilde((q : Form))) == q"), fn(x542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s543 = @tactics.mp_tac(x542)
    fn(x544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s543(x544)
    }
  }), t545), t557), t558), t559)
  let t539 = @meson.asm_meson_tac(@list.List([@resolution.clause()]))
  let t538 = @tactics.match_mp_tac(@resolution.negate_negate())
  let t540 = @tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("op_tilde_tilde(op_tilde_tilde((p : Form))) == p"), fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x536
    @simp.asm_rewrite_tac(@list.List([th_3]))
  }), t538), t539)
  let t535 = @meson.meson_tac(@list.List([suffix_mem()]))
  let t534 = @simp.asm_rewrite_tac(@list.List([suffix()]))
  let t541 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.undisch_tac(@parser.parse_term("suffix (CONS (A:form->bool) main) (CONS E final_)"))), t534), t535), t540])
  let t533 = @simp.asm_rewrite_tac(@list.List([]))
  let t561 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@bool.conjunct2(@bool.spec_all(lpresproof_rules()))), t533), @tactics.conj_tac), t541)
  let t562 = @list.List([@meson.asm_meson_tac(@list.List([suffix()])), t561, t560])
  let t532 = @tactics.repeat_tac(@tactics.conj_tac)
  let t531 = @tactics.exists_tac(@parser.parse_term("CONS (E:form->bool) final_"))
  let t563 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("resolve(op_tilde_tilde((p : Form)), (E : (Form) -> Bool), (A : (Form) -> Bool))")), t531), t532), t562)])
  let t530 = @class.asm_cases_tac(@parser.parse_term("CONS (A:form->bool) main = CONS E final_"))
  let t528 = @meson.meson_tac(@list.List([]))
  let t527 = @simp.rewrite_tac(@list.List([@resolution.resolve(), @sets.in_union(), @sets.in_delete(), @sets.subset()]))
  let t519 = @term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), (B : (Form) -> Bool))")
  let t520 = @term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), resolve((q : Form), (B : (Form) -> Bool), (C : (Form) -> Bool)))")
  let t521 = @term_syntax.parse_term("IN(op_tilde_tilde((q : Form)), (C : (Form) -> Bool))")
  let t522 = @term_syntax.parse_term("IN((q : Form), (B : (Form) -> Bool))")
  let t523 = @term_syntax.parse_term("!((p : Form) == (q : Form))")
  let t524 = @term_syntax.parse_term("!((p : Form) == op_tilde_tilde((q : Form)))")
  let t525 = @term_syntax.parse_term("!IN(op_tilde_tilde((p : Form)), (E : (Form) -> Bool))")
  let t526 = @tactics.map_every(fn(x516 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s517 = @tactics.undisch_tac(x516)
    fn(x518 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s517(x518)
    }
  }, @list.List([@term_syntax.parse_term("SUBSET((E : (Form) -> Bool), resolve((q : Form), resolve((p : Form), (A : (Form) -> Bool), (B : (Form) -> Bool)), (C : (Form) -> Bool)))"), t525, t524, t523, t522, t521, t520, t519]))
  let t515 = @simp.asm_rewrite_tac(@list.List([]))
  let t514 = @parser.parse_term("final_:(form->bool)list")
  let t529 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x511 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s512 = @tactics.exists_tac(x511)
    fn(x513 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s512(x513)
    }
  }, @list.List([@term_syntax.parse_term("(E : (Form) -> Bool)"), t514])), t515), t526), t527), t528)])
  let t510 = @class.asm_cases_tac(@term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), (E : (Form) -> Bool))"))
  let t508 = @parser.parse_term("final_:(form->bool)list")
  let t509 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(E : (Form) -> Bool)"), t508]))
  let t507 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t505 = @meson.meson_tac(@list.List([]))
  let t504 = @simp.rewrite_tac(@list.List([@resolution.resolve(), @sets.subset(), @sets.in_union(), @sets.in_delete()]))
  let t503 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((q : Form), (D : (Form) -> Bool))"))
  let t502 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((D : (Form) -> Bool), resolve((p : Form), (A : (Form) -> Bool), (B : (Form) -> Bool)))"))
  let t501 = @list.List([@meson.asm_meson_tac(@list.List([lpresproof_mono(), @sets.subset(), @sets.in_union()])), @tactics.all_tac])
  let t500 = @simp.asm_rewrite_tac(@list.List([suffix_refl()]))
  let t498 = @term_syntax.parse_term("(middle : List[(Form) -> Bool])")
  let t499 = @tactics.map_every(fn(x495 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s496 = @tactics.exists_tac(x495)
    fn(x497 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s496(x497)
    }
  }, @list.List([@term_syntax.parse_term("(D : (Form) -> Bool)"), t498]))
  let t493 = @meson.asm_meson_tac(@list.List([resolve_mono(), @sets.subset_refl(), @sets.subset_trans()]))
  let t492 = @list.List([@meson.asm_meson_tac(@list.List([suffix_trans()])), @tactics.all_tac])
  let t491 = @tactics.repeat_tac(@tactics.strip_tac)
  let t490 = @simp.simp_tac(@list.List([@sets.union_aci()]))
  let t489 = @tactics.x_gen_tac(@parser.parse_term("final_:(form->bool)list"))
  let t488 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t487 = @tactics.x_gen_tac(@term_syntax.parse_term("(E : (Form) -> Bool)"))
  let t486 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t485 = @list.List([@meson.asm_meson_tac(@list.List([resolve_clause(), @given.clause_subset()])), @tactics.all_tac])
  let t484 = @simp.asm_rewrite_tac(@list.List([]))
  let t477 = @term_syntax.parse_term("UNION((basm : ((Form) -> Bool) -> Bool), (aasm : ((Form) -> Bool) -> Bool))")
  let t478 = @term_syntax.parse_term("(q : Form)")
  let t479 = @term_syntax.parse_term("(middle : List[(Form) -> Bool])")
  let t480 = @list.List([@term_syntax.parse_term("(D : (Form) -> Bool)"), t479, t478, t477])
  let t483 = @tactics.disch_then(fn(x482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x474 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s475 = @tactics.mp_tac(x474)
      fn(x476 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s475(x476)
      }
    })(((x481 : @kernel.Thm) => @bool.specl(t480, x481))(x482))
  })
  let t494 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ p : Form, ∀ asm' : ((Form) -> Bool) -> Bool, clause(c) && lpresproof(asm', CONS(c, lis)) && IN(p, c) && IN(op_tilde_tilde(p), (C : (Form) -> Bool)) → (∃ c' : (Form) -> Bool, ∃ lis' : List[(Form) -> Bool], suffix(CONS(c, lis), CONS(c', lis')) && lpresproof(UNION((casm : ((Form) -> Bool) -> Bool), asm'), CONS(c', lis')) && SUBSET(c', resolve(p, c, C)))")), t483), t484), @tactics.ants_tac), t485), t486), t487), t488), t489), t490), t491), t492), t493), @tactics.all_tac])
  let t506 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("IN((q : Form), (D : (Form) -> Bool))")), t494), t499), t500), @tactics.conj_tac), t501), t502), t503), t504), t505), @tactics.all_tac])
  let t473 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c' : (Form) -> Bool, ∃ lis' : List[(Form) -> Bool], suffix(CONS((D : (Form) -> Bool), (middle : List[(Form) -> Bool])), CONS(c', lis')) && suffix(CONS((A : (Form) -> Bool), (main : List[(Form) -> Bool])), CONS(c', lis')) && lpresproof(UNION(UNION((basm : ((Form) -> Bool) -> Bool), (casm : ((Form) -> Bool) -> Bool)), (aasm : ((Form) -> Bool) -> Bool)), CONS(c', lis')) && SUBSET(c', resolve((q : Form), resolve((p : Form), A, (B : (Form) -> Bool)), (C : (Form) -> Bool)))"), fn(x470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s471 = @tactics.mp_tac(x470)
    fn(x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s471(x472)
    }
  })
  let t468 = @term_syntax.parse_term("(middle : List[(Form) -> Bool])")
  let t469 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(D : (Form) -> Bool)"), t468]))
  let t467 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t466 = @simp.asm_rewrite_tac(@list.List([]))
  let t459 = @term_syntax.parse_term("(aasm : ((Form) -> Bool) -> Bool)")
  let t460 = @term_syntax.parse_term("(p : Form)")
  let t461 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t462 = @list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t461, t460, t459])
  let t465 = @tactics.disch_then(fn(x464 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x456 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s457 = @tactics.mp_tac(x456)
      fn(x458 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s457(x458)
      }
    })(((x463 : @kernel.Thm) => @bool.specl(t462, x463))(x464))
  })
  let t455 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ p : Form, ∀ asm' : ((Form) -> Bool) -> Bool, clause(c) && lpresproof(asm', CONS(c, lis)) && IN(p, c) && IN(op_tilde_tilde(p), (B : (Form) -> Bool)) → (∃ c' : (Form) -> Bool, ∃ lis' : List[(Form) -> Bool], suffix(CONS(c, lis), CONS(c', lis')) && lpresproof(UNION((basm : ((Form) -> Bool) -> Bool), asm'), CONS(c', lis')) && SUBSET(c', resolve(p, c, B)))"))
  let t451 = @meson.meson_tac(@list.List([]))
  let t450 = @simp.rewrite_tac(@list.List([@resolution.resolve(), @sets.in_union(), @sets.in_delete()]))
  let t449 = @tactics.undisch_tac(@term_syntax.parse_term("IN((q : Form), resolve(q, (B : (Form) -> Bool), (C : (Form) -> Bool)))"))
  let t447 = @meson.meson_tac(@list.List([@resolution.negate_refl()]))
  let t448 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @resolution.resolve(), @sets.in_union(), @sets.in_delete()])), t447)])
  let t446 = @tactics.subgoal_then(@term_syntax.parse_term("IN((q : Form), (C : (Form) -> Bool))"), fn(x443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s444 = @tactics.mp_tac(x443)
    fn(x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s444(x445)
    }
  })
  let t452 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("SUBSET((B : (Form) -> Bool), resolve((q : Form), B, (C : (Form) -> Bool)))"), fn(x441 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x441
    @meson.asm_meson_tac(@list.List([@sets.subset_trans(), resolve_mono(), @sets.subset_refl(), th_2]))
  }), t446), t448), t449), t450), t451)
  let t440 = @tactics.conv_tac(@class.taut)
  let t439 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union()]))
  let t438 = @simp.asm_rewrite_tac(@list.List([]))
  let t437 = @tactics.exists_tac(@term_syntax.parse_term("UNION((basm : ((Form) -> Bool) -> Bool), (aasm : ((Form) -> Bool) -> Bool))"))
  let t453 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lpresproof_mono()), t437), t438), t439), @tactics.gen_tac), t440), t452])
  let t436 = @simp.asm_rewrite_tac(@list.List([]))
  let t435 = @tactics.repeat_tac(@tactics.strip_tac)
  let t434 = @tactics.x_gen_tac(@parser.parse_term("final_:(form->bool)list"))
  let t433 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t432 = @tactics.x_gen_tac(@term_syntax.parse_term("(D : (Form) -> Bool)"))
  let t431 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t430 = @simp.asm_rewrite_tac(@list.List([]))
  let t428 = @kernel.assume_rule(@term_syntax.parse_term("literal((q : Form))"))
  let t429 = @tactics.subst_all_tac(@drule.match_mp(@resolution.negate_negate())(t428))
  let t421 = @term_syntax.parse_term("(aasm : ((Form) -> Bool) -> Bool)")
  let t422 = @term_syntax.parse_term("op_tilde_tilde((q : Form))")
  let t423 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t424 = @list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t423, t422, t421])
  let t427 = @tactics.disch_then(fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s419 = @tactics.mp_tac(x418)
      fn(x420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s419(x420)
      }
    })(((x425 : @kernel.Thm) => @bool.specl(t424, x425))(x426))
  })
  let t417 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ p : Form, ∀ asm' : ((Form) -> Bool) -> Bool, clause(c) && lpresproof(asm', CONS(c, lis)) && IN(p, c) && IN(op_tilde_tilde(p), (B : (Form) -> Bool)) → (∃ c' : (Form) -> Bool, ∃ lis' : List[(Form) -> Bool], suffix(CONS(c, lis), CONS(c', lis')) && lpresproof(UNION((basm : ((Form) -> Bool) -> Bool), asm'), CONS(c', lis')) && SUBSET(c', resolve(p, c, B)))"))
  let t454 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(p : Form) == op_tilde_tilde((q : Form))"), fn(x414 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s415 = @tactics.subst_all_tac(x414)
    fn(x416 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s415(x416)
    }
  }), t417), t427), t429), t430), t431), t432), t433), t434), t435), t436), t453), @tactics.all_tac])
  let t413 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Form) == op_tilde_tilde((q : Form))"))
  let t409 = @meson.meson_tac(@list.List([@resolution.negate_refl()]))
  let t408 = @simp.rewrite_tac(@list.List([@sets.subset(), @resolution.resolve(), @sets.in_union(), @sets.in_delete()]))
  let t407 = @tactics.undisch_tac(@term_syntax.parse_term("IN(op_tilde_tilde((q : Form)), (B : (Form) -> Bool))"))
  let t410 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("SUBSET((C : (Form) -> Bool), resolve((q : Form), (B : (Form) -> Bool), C))"), fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x405
    @meson.asm_meson_tac(@list.List([@sets.subset_trans(), resolve_mono(), @sets.subset_refl(), th_1]))
  }), t407), t408), t409)
  let t404 = @tactics.conv_tac(@class.taut)
  let t403 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union()]))
  let t402 = @simp.asm_rewrite_tac(@list.List([]))
  let t401 = @tactics.exists_tac(@term_syntax.parse_term("UNION((casm : ((Form) -> Bool) -> Bool), (aasm : ((Form) -> Bool) -> Bool))"))
  let t411 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lpresproof_mono()), t401), t402), t403), @tactics.gen_tac), t404), t410])
  let t400 = @simp.asm_rewrite_tac(@list.List([]))
  let t399 = @tactics.repeat_tac(@tactics.strip_tac)
  let t398 = @tactics.x_gen_tac(@parser.parse_term("final_:(form->bool)list"))
  let t397 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t396 = @tactics.x_gen_tac(@term_syntax.parse_term("(D : (Form) -> Bool)"))
  let t395 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t394 = @simp.asm_rewrite_tac(@list.List([]))
  let t387 = @term_syntax.parse_term("(aasm : ((Form) -> Bool) -> Bool)")
  let t388 = @term_syntax.parse_term("(q : Form)")
  let t389 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t390 = @list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t389, t388, t387])
  let t393 = @tactics.disch_then(fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s385 = @tactics.mp_tac(x384)
      fn(x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s385(x386)
      }
    })(((x391 : @kernel.Thm) => @bool.specl(t390, x391))(x392))
  })
  let t383 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ p : Form, ∀ asm' : ((Form) -> Bool) -> Bool, clause(c) && lpresproof(asm', CONS(c, lis)) && IN(p, c) && IN(op_tilde_tilde(p), (C : (Form) -> Bool)) → (∃ c' : (Form) -> Bool, ∃ lis' : List[(Form) -> Bool], suffix(CONS(c, lis), CONS(c', lis')) && lpresproof(UNION((casm : ((Form) -> Bool) -> Bool), asm'), CONS(c', lis')) && SUBSET(c', resolve(p, c, C)))"))
  let t412 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(p : Form) == (q : Form)"), fn(x380 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s381 = @tactics.subst_all_tac(x380)
    fn(x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s381(x382)
    }
  }), t383), t393), t394), t395), t396), t397), t398), t399), t400), t411), @tactics.all_tac])
  let t379 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Form) == (q : Form)"))
  let t378 = @tactics.repeat_tac(@tactics.strip_tac)
  let t369 = @term_syntax.parse_term("(A : (Form) -> Bool)")
  let t370 = @term_syntax.parse_term("(aasm : ((Form) -> Bool) -> Bool)")
  let t371 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t372 = @term_syntax.parse_term("(C : (Form) -> Bool)")
  let t373 = @term_syntax.parse_term("(casm : ((Form) -> Bool) -> Bool)")
  let t374 = @term_syntax.parse_term("(B : (Form) -> Bool)")
  let t375 = @term_syntax.parse_term("(basm : ((Form) -> Bool) -> Bool)")
  let t376 = @term_syntax.parse_term("(q : Form)")
  let t377 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Form)"), t376, t375, t374, t373, t372, t371, t370, t369]))
  let t367 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t366 = @simp.rewrite_tac(@list.List([@sets.union_aci()]))
  let t368 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@resolution.resolve(), @resolution.negate_negate()])), t366), t367), @tactics.all_tac])
  let t365 = @tactics.match_mp_tac(symmetry_lemma_2())
  let t356 = @term_syntax.parse_term("(p : Form)")
  let t357 = @term_syntax.parse_term("(q : Form)")
  let t358 = @term_syntax.parse_term("(basm : ((Form) -> Bool) -> Bool)")
  let t359 = @term_syntax.parse_term("(B : (Form) -> Bool)")
  let t360 = @term_syntax.parse_term("(casm : ((Form) -> Bool) -> Bool)")
  let t361 = @term_syntax.parse_term("(C : (Form) -> Bool)")
  let t362 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t363 = @term_syntax.parse_term("(aasm : ((Form) -> Bool) -> Bool)")
  let t364 = @tactics.map_every(fn(x354 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s_1 = x354
    @tactics.spec_tac(s_1, s_1)
  }, @list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t363, t362, t361, t360, t359, t358, t357, t356]))
  let t352 = @meson.meson_tac(@list.List([]))
  let t351 = @simp.rewrite_tac(@list.List([@resolution.resolve(), @sets.in_union(), @sets.in_delete()]))
  let t353 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), resolve((q : Form), (B : (Form) -> Bool), (C : (Form) -> Bool)))")), t351), t352), @tactics.all_tac])
  let t350 = @tactics.subgoal_then(@term_syntax.parse_term("IN(op_tilde_tilde((p : Form)), (B : (Form) -> Bool)) || IN(op_tilde_tilde(p), (C : (Form) -> Bool))"), fn(x338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th1 = x338
    let t349 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause()])), @tactics.all_tac])
    @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("literal((q : Form))"), fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th2 = x340
      let t348 = @tactics.mp_tac(th1)
      let t347 = @tactics.mp_tac(th2)
      @tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x346 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s343 = @tactics.mp_tac(x342)
          fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s343(x344)
          }
        })(((x345 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x345))(x346))
      }), t347), t348)
    }), t349)
  })
  let t334 = @term_syntax.parse_term("(aasm : ((Form) -> Bool) -> Bool)")
  let t335 = @term_syntax.parse_term("(p : Form)")
  let t336 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t337 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t336, t335, t334]))
  let t331 = @meson.meson_tac(@list.List([]))
  let t330 = @simp.rewrite_tac(@list.List([@resolution.resolve(), @sets.subset(), @sets.in_union(), @sets.in_delete()]))
  let t329 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((q : Form), (B1 : (Form) -> Bool))"))
  let t328 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((B1 : (Form) -> Bool), (B : (Form) -> Bool))"))
  let t327 = @list.List([@meson.asm_meson_tac(@list.List([lpresproof_mono(), @sets.in_union(), @sets.subset()])), @tactics.all_tac])
  let t326 = @simp.asm_rewrite_tac(@list.List([]))
  let t324 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t325 = @tactics.map_every(fn(x321 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s322 = @tactics.exists_tac(x321)
    fn(x323 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s322(x323)
    }
  }, @list.List([@term_syntax.parse_term("(B1 : (Form) -> Bool)"), t324]))
  let t317 = @meson.asm_meson_tac(@list.List([suffix_butlast(), @lists.not_cons_nil()]))
  let t318 = @meson.asm_meson_tac(@list.List([resolve_mono(), @sets.subset_trans(), @sets.subset_refl()]))
  let t316 = @simp.asm_rewrite_tac(@list.List([]))
  let t319 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.union_comm()])), t316), t318, t317])
  let t315 = @tactics.repeat_tac(@tactics.conj_tac)
  let t314 = @tactics.x_gen_tac(@parser.parse_term("final_:(form->bool)list"))
  let t313 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t312 = @tactics.x_gen_tac(@term_syntax.parse_term("(D : (Form) -> Bool)"))
  let t311 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t310 = @list.List([@meson.asm_meson_tac(@list.List([@given.clause_subset()])), @tactics.all_tac])
  let t309 = @simp.asm_rewrite_tac(@list.List([]))
  let t302 = @term_syntax.parse_term("(basm : ((Form) -> Bool) -> Bool)")
  let t303 = @term_syntax.parse_term("(q : Form)")
  let t304 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t305 = @list.List([@term_syntax.parse_term("(B1 : (Form) -> Bool)"), t304, t303, t302])
  let t308 = @tactics.disch_then(fn(x307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s300 = @tactics.mp_tac(x299)
      fn(x301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s300(x301)
      }
    })(((x306 : @kernel.Thm) => @bool.specl(t305, x306))(x307))
  })
  let t320 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ p : Form, ∀ asm' : ((Form) -> Bool) -> Bool, clause(c) && lpresproof(asm', CONS(c, lis)) && IN(p, c) && IN(op_tilde_tilde(p), (C : (Form) -> Bool)) → (∃ c' : (Form) -> Bool, ∃ lis' : List[(Form) -> Bool], suffix(CONS(c, lis), CONS(c', lis')) && lpresproof(UNION((casm : ((Form) -> Bool) -> Bool), asm'), CONS(c', lis')) && SUBSET(c', resolve(p, c, C)))")), t308), t309), @tactics.ants_tac), t310), t311), t312), t313), t314), @tactics.strip_tac), t315), t319), @tactics.all_tac])
  let t298 = @class.asm_cases_tac(@term_syntax.parse_term("IN((q : Form), (B1 : (Form) -> Bool))"))
  let t296 = @term_syntax.parse_term("(main : List[(Form) -> Bool])")
  let t297 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(B1 : (Form) -> Bool)"), t296]))
  let t295 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t294 = @simp.asm_rewrite_tac(@list.List([]))
  let t290 = @term_syntax.parse_term("(c : (Form) -> Bool)")
  let t293 = @tactics.disch_then(fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s288 = @tactics.mp_tac(x287)
      fn(x289 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s288(x289)
      }
    })(((x291 : @kernel.Thm) => @bool.spec(t290, x291))(x292))
  })
  let t286 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, IN(c, (basm : ((Form) -> Bool) -> Bool)) → (∃ cl' : (Form) -> Bool, ∃ lis : List[(Form) -> Bool], lpresproof(basm, CONS(cl', lis)) && SUBSET(cl', (B : (Form) -> Bool)) && LAST(CONS(cl', lis)) == c)"))
  let t285 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Form) -> Bool)"))
  let t284 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s282 = @tactics.assume_tac(x281)
    fn(x283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s282(x283)
    }
  }))
  let t280 = @tactics.repeat_tac(@tactics.gen_tac)
  let t278 = @simp.simp_tac(@list.List([@theorems.conj_aci(), @resolution.negate_negate()]))
  let t279 = @list.List([@simp.simp_tac(@list.List([@resolution.resolve(), @resolution.negate_negate(), @sets.union_aci()])), t278, @tactics.all_tac])
  let t277 = @tactics.repeat_tac(@tactics.conj_tac)
  let t276 = @tactics.match_mp_tac(symmetry_lemma_1())
  let t271 = @term_syntax.parse_term("(q : Form)")
  let t272 = @term_syntax.parse_term("(basm : ((Form) -> Bool) -> Bool)")
  let t273 = @term_syntax.parse_term("(B : (Form) -> Bool)")
  let t274 = @term_syntax.parse_term("(casm : ((Form) -> Bool) -> Bool)")
  let t275 = @tactics.map_every(fn(x269 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s = x269
    @tactics.spec_tac(s, s)
  }, @list.List([@term_syntax.parse_term("(C : (Form) -> Bool)"), t274, t273, t272, t271]))
  let t268 = @tactics.pop_assum_list(fn(x267 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x263 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s264 = @tactics.mp_tac(x263)
      fn(x265 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s264(x265)
      }
    })(((x266 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x266))(x267))
  })
  let t262 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause()])), @tactics.all_tac])
  let t261 = @tactics.subgoal_then(@term_syntax.parse_term("literal((q : Form))"), fn(x258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s259 = @tactics.mp_tac(x258)
    fn(x260 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s259(x260)
    }
  })
  let t332 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_simp_tac(@list.List([resolve_clause()])), t261), t262), t268), t275), t276), t277), t279), t280), t284), @tactics.disch_tac), t285), @tactics.disch_tac), t286), t293), t294), t295), t297), @tactics.strip_tac), t298), t320), t325), t326), @tactics.conj_tac), t327), t328), t329), t330), t331)
  let t333 = @list.List([@meson.asm_meson_tac(@list.List([@sets.in_union()])), t332, @tactics.all_tac])
  let t257 = @tactics.repeat_tac(@tactics.conj_tac)
  let t256 = @simp.asm_simp_tac(@list.List([resolve_clause()]))
  let t255 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s253 = @tactics.assume_tac(x252)
    fn(x254 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s253(x254)
    }
  }))
  let t247 = @term_syntax.parse_term("(C : (Form) -> Bool)")
  let t248 = @term_syntax.parse_term("(B : (Form) -> Bool)")
  let t249 = @term_syntax.parse_term("(casm : ((Form) -> Bool) -> Bool)")
  let t250 = @term_syntax.parse_term("(basm : ((Form) -> Bool) -> Bool)")
  let t251 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(q : Form)"), t250, t249, t248, t247]))
  let t245 = @meson.asm_meson_tac(@list.List([@sets.in_union(), @sets.subset(), lpresproof_mono()]))
  let t244 = @simp.asm_rewrite_tac(@list.List([@sets.in_union(), @sets.in_insert()]))
  let t243 = @tactics.match_mp_tac(@bool.conjunct2(@bool.spec_all(lpresproof_rules())))
  let t242 = @simp.rewrite_tac(@list.List([@sets.subset_refl(), suffix(), suffix_refl()]))
  let t240 = @term_syntax.parse_term("CONS((c : (Form) -> Bool), (lis : List[(Form) -> Bool]))")
  let t241 = @tactics.map_every(fn(x237 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s238 = @tactics.exists_tac(x237)
    fn(x239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s238(x239)
    }
  }, @list.List([@term_syntax.parse_term("resolve((p : Form), (c : (Form) -> Bool), (cl : (Form) -> Bool))"), t240]))
  let t233 = @term_syntax.parse_term("(hyp : ((Form) -> Bool) -> Bool)")
  let t234 = @term_syntax.parse_term("(p : Form)")
  let t235 = @term_syntax.parse_term("(lis : List[(Form) -> Bool])")
  let t236 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : (Form) -> Bool)"), t235, t234, t233]))
  let t231 = @simp.simp_tac(@list.List([lpresproof_rules(), @sets.in_insert(), @sets.not_in_empty()]))
  let t230 = @simp.rewrite_tac(@list.List([@lists.last(), @sets.subset_refl()]))
  let t228 = @term_syntax.parse_term("(NIL : List[(Form) -> Bool])")
  let t229 = @tactics.map_every(fn(x225 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s226 = @tactics.exists_tac(x225)
    fn(x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s226(x227)
    }
  }, @list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t228]))
  let t232 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })), t229), t230), t231), @tactics.all_tac])
  let t223 = @simp.asm_simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t246 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)")), @tactics.disch_tac), t223), @tactics.conj_tac), t232), t236), @tactics.strip_tac), t241), t242), t243), t244), t245), @tactics.all_tac])
  let t222 = @tactics.match_mp_tac(ppresproof_induct())
  let t591 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ asm : ((Form) -> Bool) -> Bool, ∀ cl : (Form) -> Bool, ppresproof(asm, cl) → (∀ c : (Form) -> Bool, IN(c, asm) → clause(c)) && clause(cl) && (∀ c : (Form) -> Bool, IN(c, asm) → (∃ cl' : (Form) -> Bool, ∃ lis : List[(Form) -> Bool], lpresproof(asm, CONS(cl', lis)) && SUBSET(cl', cl) && LAST(CONS(cl', lis)) == c)) && (∀ c : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ p : Form, ∀ asm' : ((Form) -> Bool) -> Bool, clause(c) && lpresproof(asm', CONS(c, lis)) && IN(p, c) && IN(op_tilde_tilde(p), cl) → (∃ c' : (Form) -> Bool, ∃ lis' : List[(Form) -> Bool], suffix(CONS(c, lis), CONS(c', lis')) && lpresproof(UNION(asm, asm'), CONS(c', lis')) && SUBSET(c', resolve(p, c, cl))))"), fn(x220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x220
    @simp.simp_tac(@list.List([th]))
  }), t222), @tactics.conj_tac), t246), t251), t255), t256), t257), t333), t337), @tactics.strip_tac), t350), t353), t364), t365), @tactics.conj_tac), t368), t377), t378), t379), t412), t413), t454), t455), t465), t466), t467), t469), @tactics.strip_tac), t473), t506), t507), t509), @tactics.strip_tac), t510), t529), t530), t563), t564), t565), t570), t574), t575), t576), t580), t585), t586), t587), t588), t589), t590)
  linearization_c.set(@tactics.prove(@term_syntax.parse_term("∀ asm : ((Form) -> Bool) -> Bool, ∀ cl : (Form) -> Bool, ppresproof(asm, cl) → (∀ c : (Form) -> Bool, IN(c, asm) → (∃ cl' : (Form) -> Bool, ∃ lis : List[(Form) -> Bool], lpresproof(asm, CONS(cl', lis)) && SUBSET(cl', cl) && LAST(CONS(cl', lis)) == c))"), t591))
}

///|
let linearization_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEARIZATION")

///|
/// `LINEARIZATION`
pub fn linearization() -> @kernel.Thm {
  linearization_c.get()
}

///|
let lresproof_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lresproof_RULES")

///|
/// `lresproof_RULES`
pub fn lresproof_rules() -> @kernel.Thm {
  lresproof_rules_c.get()
}

///|
let lresproof_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lresproof_INDUCT")

///|
/// `lresproof_INDUCT`
pub fn lresproof_induct() -> @kernel.Thm {
  lresproof_induct_c.get()
}

///|
let lresproof_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lresproof_CASES")

///|
/// `lresproof_CASES`
pub fn lresproof_cases() -> @kernel.Thm {
  lresproof_cases_c.get()
}

///|
/// lresproof_RULES, lresproof_INDUCT, lresproof_CASES
fn step_29() -> Unit raise {
  let (lresproof_rules, lresproof_induct, lresproof_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (hyps : ((Form) -> Bool) -> Bool)) → (lresproof : (((Form) -> Bool) -> Bool, List[(Form) -> Bool]) -> Bool)(hyps, [cl])) && (∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ cl : (Form) -> Bool, lresproof(hyps, CONS(c1, lis)) && (IN(c2, hyps) || MEM(c2, lis)) && isaresolvent(cl, (c1, c2)) → lresproof(hyps, CONS(cl, CONS(c1, lis))))"))
  lresproof_rules_c.set(lresproof_rules)
  lresproof_induct_c.set(lresproof_induct)
  lresproof_cases_c.set(lresproof_cases)
}

///|
/// ALL2_BUTLAST
fn step_30() -> Unit raise {
  let t604 = @simp.asm_rewrite_tac(@list.List([@lists.all2(), @lists.not_cons_nil()]))
  let t602 = @term_syntax.parse_term("(t : List[A])")
  let t603 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[A])"), t602)
  let t601 = @tactics.undisch_tac(@term_syntax.parse_term("!((t : List[A]) == NIL)"))
  let t600 = @simp.asm_simp_tac(@list.List([]))
  let t598 = @simp.asm_rewrite_tac(@list.List([@lists.all2(), @lists.not_cons_nil()]))
  let t597 = @term_syntax.parse_term("(t' : List[A])")
  let t599 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(t' : List[A])"), t597), @lists.list_induct_tac), t598), @tactics.all_tac])
  let t596 = @simp.asm_rewrite_tac(@list.List([]))
  let t595 = @class.asm_cases_tac(@term_syntax.parse_term("(t : List[A]) == NIL"))
  let t594 = @simp.rewrite_tac(@list.List([@lists.last()]))
  let t593 = @simp.rewrite_tac(@list.List([@lists.all2()]))
  let t592 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t605 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t592), @lists.list_induct_tac), t593), t594), t595), t596), t599), @class.cond_cases_tac), t600), t601), t603), @lists.list_induct_tac), t604)
  all2_butlast_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (A, A) -> Bool, ∀ l1 : List[A], ∀ l2 : List[A], !(l1 == NIL) && ALL2(P, l1, l2) → P(LAST(l1), LAST(l2))"), t605))
}

///|
let all2_butlast_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_BUTLAST")

///|
/// `ALL2_BUTLAST`
pub fn all2_butlast() -> @kernel.Thm {
  all2_butlast_c.get()
}

///|
/// ALL2_MEM
fn step_31() -> Unit raise {
  let t607 = @meson.asm_meson_tac(@list.List([]))
  let t606 = @simp.rewrite_tac(@list.List([@lists.all2(), @lists.mem()]))
  let t608 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.mem()]))), @lists.list_induct_tac), t606), t607)
  all2_mem_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], ALL2((P : (_, _) -> Bool), l1, l2) && MEM((x : _), l1) → (∃ y : _, MEM(y, l2) && P(x, y))"), t608))
}

///|
let all2_mem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_MEM")

///|
/// `ALL2_MEM`
pub fn all2_mem() -> @kernel.Thm {
  all2_mem_c.get()
}

///|
/// LRESPROOF_CLAUSE
fn step_32() -> Unit raise {
  let t611 = @meson.asm_meson_tac(@list.List([@given.isaresolvent_clause(), @lists.all_mem()]))
  let t610 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t609 = @tactics.match_mp_tac(lresproof_induct())
  let t612 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t609), t610), t611)
  lresproof_clause_c.set(@tactics.prove(@term_syntax.parse_term("∀ hyps : ((Form) -> Bool) -> Bool, (∀ c : (Form) -> Bool, IN(c, hyps) → clause(c)) → (∀ lis : List[(Form) -> Bool], lresproof(hyps, lis) → ALL(clause, lis))"), t612))
}

///|
let lresproof_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LRESPROOF_CLAUSE")

///|
/// `LRESPROOF_CLAUSE`
pub fn lresproof_clause() -> @kernel.Thm {
  lresproof_clause_c.get()
}

///|
/// LINEAR_RESOLUTION_COMPLETE
fn step_33() -> Unit raise {
  let t954 = @simp.asm_rewrite_tac(@list.List([@lists.all2()]))
  let t952 = @simp.rewrite_tac(@list.List([]))
  let t951 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t950 = @simp.asm_rewrite_tac(@list.List([]))
  let t948 = @term_syntax.parse_term("(B1 : (Form) -> Bool)")
  let t949 = @tactics.map_every(fn(x945 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s946 = @tactics.exists_tac(x945)
    fn(x947 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s946(x947)
    }
  }, @list.List([@term_syntax.parse_term("(A1 : (Form) -> Bool)"), t948]))
  let t944 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t943 = @simp.asm_rewrite_tac(@list.List([]))
  let t942 = @simp.rewrite_tac(@list.List([@resolution.isaresolvent()]))
  let t941 = @simp.asm_rewrite_tac(@list.List([]))
  let t940 = @tactics.exists_tac(@term_syntax.parse_term("(B : (Form) -> Bool)"))
  let t953 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@bool.conjunct2(@bool.spec_all(lresproof_rules()))), t940), t941), t942), t943), t944), t949), t950), t951), t952), @tactics.all_tac])
  let t939 = @tactics.exists_tac(@term_syntax.parse_term("CONS(IMAGE(formsubst(mgu(UNION((A1 : (Form) -> Bool), {op_tilde_tilde((l : Form)) | IN(l, (B1 : (Form) -> Bool))}))), UNION(DIFF((A : (Form) -> Bool), A1), DIFF((C : (Form) -> Bool), B1))), CONS(A, (lis : List[(Form) -> Bool])))"))
  let t934 = @meson.asm_meson_tac(@list.List([@resolution.resproof_clause(), @resolution.clause(), @resolution.qfree_literal(), @sets.subset(), @resolution.image_formsubst_clause(), @resolution.qfree_negate()]))
  let t935 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_elim_thm()])), t934)
  let t933 = @meson.asm_meson_tac(@list.List([@resolution.resproof_clause(), @resolution.clause(), @sets.finite_subset(), @sets.finite_image()]))
  let t931 = @meson.meson_tac(@list.List([]))
  let t932 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t931), @tactics.all_tac])
  let t936 = @tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{op_tilde_tilde((l : Form)) | IN(l, (B1 : (Form) -> Bool))} == IMAGE(op_tilde_tilde, B1)"), fn(x928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s929 = @tactics.subst1_tac(x928)
    fn(x930 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s929(x930)
    }
  }), t932), t933)
  let t937 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.resproof_clause(), @resolution.clause(), @sets.finite_subset()])), t936, t935])
  let t927 = @tactics.repeat_tac(@tactics.conj_tac)
  let t926 = @simp.asm_rewrite_tac(@list.List([@sets.finite_union()]))
  let t938 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@unif.ismgu_mgu()), t926), t927), t937), @tactics.all_tac])
  let t925 = @simp.asm_rewrite_tac(@list.List([]))
  let t921 = @term_syntax.parse_term("mgu(UNION((A1 : (Form) -> Bool), {op_tilde_tilde((l : Form)) | IN(l, (B1 : (Form) -> Bool))}))")
  let t924 = @tactics.disch_then(fn(x923 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s919 = @tactics.mp_tac(x918)
      fn(x920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s919(x920)
      }
    })(((x922 : @kernel.Thm) => @bool.spec(t921, x922))(x923))
  })
  let t917 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x911 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s912 = @tactics.assume_tac(x911)
    fn(x913 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s912(x913)
    }
  }, fn(x914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s915 = @tactics.mp_tac(x914)
    fn(x916 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s915(x916)
    }
  })))
  let t909 = @tactics.x_choose_then(@term_syntax.parse_term("(B1 : (Form) -> Bool)"))(fn(x906 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s907 = @tactics.mp_tac(x906)
    fn(x908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s907(x908)
    }
  })
  let t910 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(A1 : (Form) -> Bool)"))(t909))
  let t902 = @meson.asm_meson_tac(@list.List([@resolution.resproof_clause(), @resolution.clause(), @resolution.qfree_literal()]))
  let t901 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @trivia.o_thm()]))
  let t900 = @simp.rewrite_tac(@list.List([@equal.gsym(@unif.formsubst_termsubst_lemma())]))
  let t896 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t895 = @tactics.match_mp_tac(@lists.map_eq())
  let t894 = @tactics.repeat_tac(@tactics.strip_tac)
  let t897 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@fol.termsubst(), @fol.term_inj(), @trivia.o_thm(), @equal.gsym(@lists.map_o())])), t894), t895), t896)
  let t898 = @list.List([@simp.asm_rewrite_tac(@list.List([@fol.termsubst(), @equal.gsym(@fol.termsubst_termsubst()), @trivia.o_thm()])), t897])
  let t893 = @tactics.match_mp_tac(@fol.term_induct())
  let t899 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t893), @tactics.conj_tac), t898), @tactics.all_tac])
  let t892 = @tactics.subgoal_then(@term_syntax.parse_term("termsubst((k : (Num) -> Term)) == o(termsubst(o(termsubst(k), (j : (Num) -> Term))), termsubst(rename((B : (Form) -> Bool), FVS((A : (Form) -> Bool)))))"), fn(x889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s890 = @tactics.mp_tac(x889)
    fn(x891 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s890(x891)
    }
  })
  let t888 = @tactics.exists_tac(@term_syntax.parse_term("o(termsubst((k : (Num) -> Term)), (j : (Num) -> Term))"))
  let t887 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t886 = @fol.expand_tac("C")
  let t885 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : (Num) -> Term)"))(fn(x882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s883 = @tactics.subst1_tac(x882)
    fn(x884 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s883(x884)
    }
  }))
  let t881 = @simp.rewrite_tac(@list.List([@resolution.instance_of()]))
  let t903 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("instance_of((B' : (Form) -> Bool), (B : (Form) -> Bool))")), t881), t885), t886), t887), t888), t892), t899), t900), t901), t902)
  let t880 = @simp.asm_rewrite_tac(@list.List([]))
  let t904 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.inter_comm()])), t880)
  let t905 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.image_formsubst_clause(), @resolution.resproof_clause()])), t904, t903, @tactics.all_tac])
  let t879 = @tactics.repeat_tac(@tactics.conj_tac)
  let t878 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(j : (Num) -> Term)"))(fn(x877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s875 = @tactics.assume_tac(x874)
      fn(x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s875(x876)
      }
    })(@bool.conjunct1(x877))
  }))
  let t873 = @simp.gen_rewrite_tac(fn(x872 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x866 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s867 = @equal.land_conv(x866)
      fn(x868 : @kernel.Term) -> @kernel.Thm raise {
        s867(x868)
      }
    })((fn(x869 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s870 = @equal.top_depth_conv(x869)
      fn(x871 : @kernel.Term) -> @kernel.Thm raise {
        s870(x871)
      }
    })(x872))
  }, @list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_def(), @theorems.beta_thm()]))
  let t865 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s860 = @tactics.mp_tac(x859)
    fn(x861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s860(x861)
    }
  }, fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s863 = @tactics.assume_tac(x862)
    fn(x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s863(x864)
    }
  }))
  let t858 = @simp.asm_rewrite_tac(@list.List([@unif.renaming()]))
  let t857 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.fvs_clause_finite(), @resolution.resproof_clause()])), @tactics.all_tac])
  let t855 = @term_syntax.parse_term("FVS((A : (Form) -> Bool))")
  let t856 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(B : (Form) -> Bool)"), t855]), @resolution.rename()))
  let t854 = @simp.abbrev_tac(@term_syntax.parse_term("(C : (Form) -> Bool) == IMAGE(formsubst(rename((B : (Form) -> Bool), FVS((A : (Form) -> Bool)))), B)"))
  let t848 = @term_syntax.parse_term("(p : Form)")
  let t849 = @term_syntax.parse_term("resolve((p : Form), (A' : (Form) -> Bool), (B' : (Form) -> Bool))")
  let t850 = @term_syntax.parse_term("(B' : (Form) -> Bool)")
  let t851 = @term_syntax.parse_term("(A' : (Form) -> Bool)")
  let t852 = @term_syntax.parse_term("IMAGE(formsubst(rename((B : (Form) -> Bool), FVS((A : (Form) -> Bool)))), B)")
  let t853 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t852, t851, t850, t849, t848]), @resolution.lifting_lemma()))
  let t847 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t846 = @tactics.subgoal_then(@term_syntax.parse_term("clause((B : (Form) -> Bool))"), fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s844 = @tactics.assume_tac(x843)
    fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s844(x845)
    }
  })
  let t841 = @tactics.conjuncts_then(fn(x838 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s839 = @tactics.assume_tac(x838)
    fn(x840 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s839(x840)
    }
  })
  let t842 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : (Form) -> Bool)"))(t841))
  let t836 = @meson.asm_meson_tac(@list.List([all2_mem()]))
  let t834 = @meson.meson_tac(@list.List([]))
  let t833 = @simp.rewrite_tac(@list.List([@resolution.instance_of()]))
  let t832 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_image()]))
  let t828 = @term_syntax.parse_term("(B' : (Form) -> Bool)")
  let t831 = @tactics.disch_then(fn(x830 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s826 = @tactics.mp_tac(x825)
      fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s826(x827)
      }
    })(((x829 : @kernel.Thm) => @bool.spec(t828, x829))(x830))
  })
  let t824 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t835 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET((asm : ((Form) -> Bool) -> Bool), {IMAGE(formsubst(v), cl) | cl : (Form) -> Bool, v : (Num) -> Term | IN(cl, (hyps : ((Form) -> Bool) -> Bool))})")), t824), t831), t832), t833), t834), @tactics.all_tac])
  let t837 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.first_x_assum(@tactics.disj_cases_tac), t835), t836), @tactics.all_tac])
  let t823 = @tactics.subgoal_then(@term_syntax.parse_term("∃ B : (Form) -> Bool, instance_of((B' : (Form) -> Bool), B) && (IN(B, (hyps : ((Form) -> Bool) -> Bool)) || MEM(B, (lis : List[(Form) -> Bool])))"), fn(x820 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s821 = @tactics.mp_tac(x820)
    fn(x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s821(x822)
    }
  })
  let t818 = @meson.asm_meson_tac(@list.List([lresproof_clause()]))
  let t819 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.all_mem(), @equal.gsym(@bool.conjunct2(@lists.all()))])), t818), @tactics.all_tac])
  let t817 = @tactics.subgoal_then(@term_syntax.parse_term("clause((A : (Form) -> Bool)) && (∀ c : (Form) -> Bool, MEM(c, (lis : List[(Form) -> Bool])) → clause(c))"), @tactics.strip_assume_tac)
  let t816 = @tactics.disch_then(fn(x815 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t813 = @term_syntax.parse_term("(lis : List[(Form) -> Bool])")
  let t814 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(A : (Form) -> Bool)"), t813]))
  let t812 = @simp.rewrite_tac(@list.List([@lists.all2()]))
  let t811 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t809 = @term_syntax.parse_term("(alist : List[(Form) -> Bool])")
  let t810 = @tactics.spec_tac(@term_syntax.parse_term("(alist : List[(Form) -> Bool])"), t809)
  let t808 = @tactics.undisch_tac(@term_syntax.parse_term("ALL2(instance_of, CONS((A' : (Form) -> Bool), (lis' : List[(Form) -> Bool])), (alist : List[(Form) -> Bool]))"))
  let t807 = @tactics.undisch_tac(@term_syntax.parse_term("lresproof((hyps : ((Form) -> Bool) -> Bool), (alist : List[(Form) -> Bool]))"))
  let t805 = @meson.asm_meson_tac(@list.List([resolve_clause()]))
  let t806 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@lists.mem()]))), t805), @tactics.all_tac])
  let t803 = @meson.asm_meson_tac(@list.List([@resolution.image_formsubst_clause()]))
  let t802 = @simp.asm_rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t798 = @term_syntax.parse_term("(B' : (Form) -> Bool)")
  let t801 = @tactics.disch_then(fn(x800 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x795 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s796 = @tactics.mp_tac(x795)
      fn(x797 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s796(x797)
      }
    })(((x799 : @kernel.Thm) => @bool.spec(t798, x799))(x800))
  })
  let t794 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t793 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((asm : ((Form) -> Bool) -> Bool), {IMAGE(formsubst(v), cl) | cl : (Form) -> Bool, v : (Num) -> Term | IN(cl, (hyps : ((Form) -> Bool) -> Bool))})"))
  let t792 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@lists.mem()]))])
  let t804 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.first_x_assum(@tactics.disj_cases_tac), t792), t793), t794), t801), t802), t803), @tactics.all_tac])
  let t791 = @tactics.subgoal_then(@term_syntax.parse_term("clause((B' : (Form) -> Bool))"), fn(x788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s789 = @tactics.assume_tac(x788)
    fn(x790 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s789(x790)
    }
  })
  let t787 = @list.List([@meson.asm_meson_tac(@list.List([@lists.mem()])), @tactics.all_tac])
  let t786 = @tactics.subgoal_then(@term_syntax.parse_term("clause((A' : (Form) -> Bool))"), fn(x783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s784 = @tactics.assume_tac(x783)
    fn(x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s784(x785)
    }
  })
  let t781 = @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s779 = @tactics.assume_tac(x778)
    fn(x780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s779(x780)
    }
  })
  let t782 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.conjuncts_then2(fn(x775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s776 = @tactics.assume_tac(x775)
    fn(x777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s776(x777)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(alist : List[(Form) -> Bool])"))(@tactics.strip_assume_tac)), t781))
  let t771 = @term_syntax.parse_term("(p : Form)")
  let t772 = @term_syntax.parse_term("(lis' : List[(Form) -> Bool])")
  let t773 = @term_syntax.parse_term("(B' : (Form) -> Bool)")
  let t774 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(A' : (Form) -> Bool)"), t773, t772, t771]))
  let t769 = @meson.meson_tac(@list.List([]))
  let t768 = @simp.rewrite_tac(@list.List([@resolution.instance_of()]))
  let t767 = @simp.asm_simp_tac(@list.List([lresproof_rules(), @lists.all2()]))
  let t766 = @tactics.exists_tac(@term_syntax.parse_term("[(cl0 : (Form) -> Bool)]"))
  let t764 = @term_syntax.parse_term("(jj : (Num) -> Term)")
  let t765 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(cl0 : (Form) -> Bool)"), t764]))
  let t763 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t759 = @term_syntax.parse_term("(cl : (Form) -> Bool)")
  let t762 = @tactics.disch_then(fn(x761 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s757 = @tactics.mp_tac(x756)
      fn(x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s757(x758)
      }
    })(((x760 : @kernel.Thm) => @bool.spec(t759, x760))(x761))
  })
  let t755 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t754 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((asm : ((Form) -> Bool) -> Bool), {IMAGE(formsubst(v), cl) | cl : (Form) -> Bool, v : (Num) -> Term | IN(cl, (hyps : ((Form) -> Bool) -> Bool))})"))
  let t752 = @meson.asm_meson_tac(@list.List([@resolution.image_formsubst_clause()]))
  let t751 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_image()]))
  let t747 = @term_syntax.parse_term("(cl : (Form) -> Bool)")
  let t750 = @tactics.disch_then(fn(x749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x744 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s745 = @tactics.mp_tac(x744)
      fn(x746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s745(x746)
      }
    })(((x748 : @kernel.Thm) => @bool.spec(t747, x748))(x749))
  })
  let t743 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t742 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((asm : ((Form) -> Bool) -> Bool), {IMAGE(formsubst(v), cl) | cl : (Form) -> Bool, v : (Num) -> Term | IN(cl, (hyps : ((Form) -> Bool) -> Bool))})"))
  let t753 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("clause((cl : (Form) -> Bool))"), fn(x740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x740
    @meson.asm_meson_tac(@list.List([@lists.mem(), th_3]))
  }), t742), t743), t750), t751), t752), @tactics.all_tac])
  let t770 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)")), @tactics.disch_tac), @tactics.conj_tac), t753), t754), t755), t762), t763), t765), @tactics.strip_tac), t766), t767), t768), t769), @tactics.all_tac])
  let t739 = @tactics.match_mp_tac(lpresproof_induct())
  let t738 = @tactics.subgoal_then(@term_syntax.parse_term("∀ plis : List[(Form) -> Bool], lpresproof((asm : ((Form) -> Bool) -> Bool), plis) → (∀ c : (Form) -> Bool, MEM(c, plis) → clause(c)) && (∃ lis : List[(Form) -> Bool], lresproof((hyps : ((Form) -> Bool) -> Bool), lis) && ALL2(instance_of, plis, lis))"), fn(x736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x736
    @meson.meson_tac(@list.List([th_2]))
  })
  let t734 = @meson.asm_meson_tac(@list.List([]))
  let t733 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t732 = @tactics.disch_then(@tactics.match_mp_tac)
  let t731 = @simp.rewrite_tac(@list.List([@resolution.negative_formsubst()]))
  let t727 = @term_syntax.parse_term("formsubst((jj : (Num) -> Term), (p : Form))")
  let t730 = @tactics.first_assum(fn(x729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s725 = @tactics.mp_tac(x724)
      fn(x726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s725(x726)
      }
    })(((x728 : @kernel.Thm) => @bool.spec(t727, x728))(x729))
  })
  let t723 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(jj : (Num) -> Term)"))(fn(x720 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s721 = @tactics.subst_all_tac(x720)
    fn(x722 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s721(x722)
    }
  }))
  let t719 = @simp.rewrite_tac(@list.List([@resolution.instance_of()]))
  let t717 = @simp.asm_rewrite_tac(@list.List([@lists.all2(), @lists.not_cons_nil()]))
  let t716 = @tactics.match_mp_tac(all2_butlast())
  let t718 = @list.List([@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("sos"), t716), t717), @tactics.all_tac])
  let t715 = @tactics.subgoal_then(@term_syntax.parse_term("instance_of((sos : (Form) -> Bool), LAST(CONS({}, (lis : List[(Form) -> Bool]))))"), fn(x712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s713 = @tactics.mp_tac(x712)
    fn(x714 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s713(x714)
    }
  })
  let t711 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t710 = @simp.asm_rewrite_tac(@list.List([]))
  let t709 = @tactics.exists_tac(@term_syntax.parse_term("(lis : List[(Form) -> Bool])"))
  let t707 = @meson.meson_tac(@list.List([]))
  let t706 = @simp.rewrite_tac(@list.List([@resolution.instance_of(), @sets.extension(), @sets.in_image(), @sets.not_in_empty()]))
  let t708 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("instance_of({}, (emp : (Form) -> Bool))")), t706), t707), @tactics.all_tac])
  let t705 = @tactics.subgoal_then(@term_syntax.parse_term("(emp : (Form) -> Bool) == {}"), fn(x702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s703 = @tactics.subst_all_tac(x702)
    fn(x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s703(x704)
    }
  })
  let t701 = @tactics.disch_then(fn(x700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t698 = @term_syntax.parse_term("(lis : List[(Form) -> Bool])")
  let t699 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(emp : (Form) -> Bool)"), t698]))
  let t697 = @simp.rewrite_tac(@list.List([@lists.all2()]))
  let t696 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t695 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t694 = @simp.asm_rewrite_tac(@list.List([]))
  let t691 = @term_syntax.parse_term("CONS({}, (qlist : List[(Form) -> Bool]))")
  let t735 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x693 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x688 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s689 = @tactics.mp_tac(x688)
      fn(x690 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s689(x690)
      }
    })(((x692 : @kernel.Thm) => @bool.spec(t691, x692))(x693))
  }), t694), t695), t696), t697), t699), t701), @tactics.strip_tac), t705), t708), t709), t710), t711), t715), t718), t719), t723), @tactics.disch_tac), t730), t731), t732), t733), t734)])
  let t687 = @tactics.subgoal_then(@term_syntax.parse_term("∀ plis : List[(Form) -> Bool], lpresproof((asm : ((Form) -> Bool) -> Bool), plis) → (∃ lis : List[(Form) -> Bool], lresproof((hyps : ((Form) -> Bool) -> Bool), lis) && ALL2(instance_of, plis, lis))"), fn(x684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s685 = @tactics.mp_tac(x684)
    fn(x686 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s685(x686)
    }
  })
  let t683 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(qlist : List[(Form) -> Bool])"))(@tactics.strip_assume_tac))
  let t682 = @simp.asm_rewrite_tac(@list.List([]))
  let t681 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x675 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s676 = @tactics.assume_tac(x675)
    fn(x677 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s676(x677)
    }
  }, fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s679 = @tactics.mp_tac(x678)
    fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s679(x680)
    }
  }))
  let t674 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm()]))
  let t673 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) == (b && a && c)"))]))
  let t672 = @simp.rewrite_tac(@list.List([@sets.subset_empty()]))
  let t671 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(emptyclause : (Form) -> Bool)"))(fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s669 = @tactics.mp_tac(x668)
    fn(x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s669(x670)
    }
  }))
  let t667 = @simp.asm_rewrite_tac(@list.List([]))
  let t663 = @term_syntax.parse_term("(sos : (Form) -> Bool)")
  let t666 = @tactics.disch_then(fn(x665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s661 = @tactics.mp_tac(x660)
      fn(x662 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s661(x662)
      }
    })(((x664 : @kernel.Thm) => @bool.spec(t663, x664))(x665))
  })
  let t657 = @drule.match_mp(linearization())
  let t659 = @tactics.first_assum(fn(x658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s655 = @tactics.mp_tac(x654)
      fn(x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s655(x656)
      }
    })(t657(x658))
  })
  let t653 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(sos : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t650 = @drule.match_mp(ppresproof_allnegative())
  let t652 = @tactics.first_assum(fn(x651 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s648 = @tactics.mp_tac(x647)
      fn(x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s648(x649)
      }
    })(t650(x651))
  })
  let t646 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(asm : ((Form) -> Bool) -> Bool)"))(@tactics.strip_assume_tac))
  let t645 = @tactics.disch_then(fn(x643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x643
    @simp.once_rewrite_tac(@list.List([th_1]))
  })
  let t641 = @meson.asm_meson_tac(@list.List([@resolution.image_formsubst_clause()]))
  let t642 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()])), t641), @tactics.all_tac])
  let t640 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("{IMAGE(formsubst(v), cl) | cl : (Form) -> Bool, v : (Num) -> Term | IN(cl, (hyps : ((Form) -> Bool) -> Bool))}"), ppresproof()))
  let t638 = @simp.asm_simp_tac(@list.List([@resolution.image_formsubst_clause()]))
  let t639 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()])), t638), @tactics.all_tac])
  let t635 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@resolution.presproof_refutation_complete()))
  let t637 = @tactics.disch_then(fn(x636 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s633 = @tactics.mp_tac(x632)
      fn(x634 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s633(x634)
      }
    })(t635(x636))
  })
  let t630 = @meson.meson_tac(@list.List([]))
  let t629 = @simp.asm_simp_tac(@list.List([@resolution.pholds_interp_image()]))
  let t628 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm(), @theorems.left_and_exists_thm(), @theorems.right_and_exists_thm(), @sets.in_image()]))
  let t627 = @simp.rewrite_tac(@list.List([@fol_prop.psatisfies()]))
  let t626 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : (Form) -> Bool)"))
  let t625 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t624 = @tactics.first_x_assum(fn(x621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x621
    let t623 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool)) → !a → !b")))
    @tactics.then_tac(@tactics.mp_tac(th), t623)
  })
  let t631 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol_prop.psatisfiable()])), t624), t625), t626), t627), t628), t629), t630), @tactics.all_tac])
  let t620 = @tactics.subgoal_then(@term_syntax.parse_term("!psatisfiable({interp((cl : (Form) -> Bool)) | IN(cl, {IMAGE(formsubst(v), cl) | cl : (Form) -> Bool, v : (Num) -> Term | IN(cl, (hyps : ((Form) -> Bool) -> Bool))})})"), fn(x617 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s618 = @tactics.mp_tac(x617)
    fn(x619 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s618(x619)
    }
  })
  let t615 = @meson.asm_meson_tac(@list.List([@resolution.qfree_interp()]))
  let t616 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_image()])), t615), @tactics.all_tac])
  let t614 = @simp.asm_rewrite_tac(@list.List([]))
  let t613 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("IMAGE(interp, (hyps : ((Form) -> Bool) -> Bool))"), @herbrand.herbrand_theorem()))
  let t955 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t613), t614), @tactics.ants_tac), t616), @tactics.disch_tac), t620), t631), t637), @tactics.ants_tac), t639), t640), @tactics.ants_tac), t642), t645), t646), t652), t653), t659), t666), t667), t671), t672), t673), t674), t681), t682), t683), t687), t735), t738), t739), @tactics.conj_tac), t770), t774), t782), t786), t787), t791), t804), @tactics.conj_tac), t806), t807), t808), t810), t811), t812), t814), t816), @tactics.strip_tac), @tactics.disch_tac), t817), t819), t823), t837), t842), t846), t847), t853), t854), t856), @tactics.ants_tac), t857), t858), t865), t873), t878), @tactics.ants_tac), t879), t905), t910), t917), t924), t925), @tactics.ants_tac), t938), @tactics.disch_tac), t939), @tactics.conj_tac), t953), t954)
  linear_resolution_complete_c.set(@tactics.prove(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (hyps : ((Form) -> Bool) -> Bool)) → clause(cl)) && !(∃ M : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), interpretation(language(IMAGE(interp, hyps)), M) && !(Dom(M) == {}) && satisfies(M, IMAGE(interp, hyps))) → (∃ lis : List[(Form) -> Bool], lresproof(hyps, CONS({}, lis)) && (∀ p : Form, IN(p, LAST(CONS({}, lis))) → negative(p)))"), t955))
}

///|
let linear_resolution_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_RESOLUTION_COMPLETE")

///|
/// `LINEAR_RESOLUTION_COMPLETE`
pub fn linear_resolution_complete() -> @kernel.Thm {
  linear_resolution_complete_c.get()
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
}
