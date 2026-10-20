// Translated from upstream Logic/prenex.ml; edit this file directly.

///|
/// qfree
fn step_1() -> Unit raise {
  let t1 = @term_syntax.parse_term("(qfree : (Form) -> Bool)(False) == true && qfree(Atom((n : Num), (l : List[Term]))) == true && qfree(op_minus_minus_gt((p : Form), (q : Form))) == (qfree(p) && qfree(q)) && qfree(op_bang_bang((x : Num), p)) == false")
  qfree_c.set(@recursion.new_recursive_definition(@fol.form_recursion())(t1))
}

///|
let qfree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qfree")

///|
/// `qfree`
pub fn qfree() -> @kernel.Thm {
  qfree_c.get()
}

///|
/// QFREE
fn step_2() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([@fol.not_def(), @fol.true_def(), @fol.or_def(), @fol.and_def(), @fol.iff_def(), @fol.exists_def(), qfree(), @theorems.conj_aci()]))
  qfree_v1_c.set(@tactics.prove(@term_syntax.parse_term("qfree(False) == true && qfree(True) == true && (∀ a : Num, ∀ l : List[Term], qfree(Atom(a, l)) == true) && (∀ p : Form, qfree(Not(p)) == qfree(p)) && (∀ p : Form, ∀ q : Form, qfree(op_bar_bar(p, q)) == (qfree(p) && qfree(q))) && (∀ p : Form, ∀ q : Form, qfree(op_amp_amp(p, q)) == (qfree(p) && qfree(q))) && (∀ p : Form, ∀ q : Form, qfree(op_minus_minus_gt(p, q)) == (qfree(p) && qfree(q))) && (∀ p : Form, ∀ q : Form, qfree(op_lt_minus_gt(p, q)) == (qfree(p) && qfree(q))) && (∀ x : Num, ∀ p : Form, qfree(op_bang_bang(x, p)) == false) && (∀ x : Num, ∀ p : Form, qfree(op_q_q(x, p)) == false)"), t2))
}

///|
let qfree_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QFREE")

///|
/// `QFREE`
pub fn qfree_v1() -> @kernel.Thm {
  qfree_v1_c.get()
}

///|
/// QFREE_FORMSUBST
fn step_3() -> Unit raise {
  let t5 = @simp.asm_rewrite_tac(@list.List([]))
  let t4 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3 = @simp.asm_rewrite_tac(@list.List([@fol.formsubst(), qfree(), @pair.let_def(), @pair.let_end_def()]))
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induction()), t3), t4), t5)
  qfree_formsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ v : (Num) -> Term, qfree(formsubst(v, p)) == qfree(p)"), t6))
}

///|
let qfree_formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QFREE_FORMSUBST")

///|
/// `QFREE_FORMSUBST`
pub fn qfree_formsubst() -> @kernel.Thm {
  qfree_formsubst_c.get()
}

///|
/// QFREE_BV_EMPTY
fn step_4() -> Unit raise {
  let t11 = @meson.asm_meson_tac(@list.List([]))
  let t10 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.extension(), @sets.in_insert(), @sets.not_in_empty()])))
  let t9 = @simp.asm_rewrite_tac(@list.List([@sets.empty_union()]))
  let t8 = @tactics.repeat_tac(@tactics.strip_tac)
  let t7 = @simp.rewrite_tac(@list.List([qfree(), @fol.bv()]))
  let t12 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induction()), t7), t8), t9), t10), t11)
  qfree_bv_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, qfree(p) == (BV(p) == {})"), t12))
}

///|
let qfree_bv_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QFREE_BV_EMPTY")

///|
/// `QFREE_BV_EMPTY`
pub fn qfree_bv_empty() -> @kernel.Thm {
  qfree_bv_empty_c.get()
}

///|
let prenex_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prenex_RULES")

///|
/// `prenex_RULES`
pub fn prenex_rules() -> @kernel.Thm {
  prenex_rules_c.get()
}

///|
let prenex_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prenex_INDUCT")

///|
/// `prenex_INDUCT`
pub fn prenex_induct() -> @kernel.Thm {
  prenex_induct_c.get()
}

///|
let prenex_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prenex_CASES")

///|
/// `prenex_CASES`
pub fn prenex_cases() -> @kernel.Thm {
  prenex_cases_c.get()
}

///|
/// prenex_RULES, prenex_INDUCT, prenex_CASES
fn step_5() -> Unit raise {
  let (prenex_rules, prenex_induct, prenex_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ p : Form, qfree(p) → (prenex : (Form) -> Bool)(p)) && (∀ x : Num, ∀ p : Form, prenex(p) → prenex(op_bang_bang(x, p))) && (∀ x : Num, ∀ p : Form, prenex(p) → prenex(op_q_q(x, p)))"))
  prenex_rules_c.set(prenex_rules)
  prenex_induct_c.set(prenex_induct)
  prenex_cases_c.set(prenex_cases)
}

///|
let universal_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("universal_RULES")

///|
/// `universal_RULES`
pub fn universal_rules() -> @kernel.Thm {
  universal_rules_c.get()
}

///|
let universal_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("universal_INDUCT")

///|
/// `universal_INDUCT`
pub fn universal_induct() -> @kernel.Thm {
  universal_induct_c.get()
}

///|
let universal_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("universal_CASES")

///|
/// `universal_CASES`
pub fn universal_cases() -> @kernel.Thm {
  universal_cases_c.get()
}

///|
/// universal_RULES, universal_INDUCT, universal_CASES
fn step_6() -> Unit raise {
  let (universal_rules, universal_induct, universal_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ p : Form, qfree(p) → (universal : (Form) -> Bool)(p)) && (∀ x : Num, ∀ p : Form, universal(p) → universal(op_bang_bang(x, p)))"))
  universal_rules_c.set(universal_rules)
  universal_induct_c.set(universal_induct)
  universal_cases_c.set(universal_cases)
}

///|
/// prenex_INDUCT_NOT
fn step_7() -> Unit raise {
  let t15 = @meson.asm_meson_tac(@list.List([]))
  let t14 = @simp.rewrite_tac(@list.List([@fol.exists_def()]))
  let t13 = @tactics.match_mp_tac(prenex_induct())
  let t16 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t13), t14), t15)
  prenex_induct_not_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Form) -> Bool, (∀ p : Form, qfree(p) → P(p)) && (∀ x : Num, ∀ p : Form, P(p) → P(op_bang_bang(x, p))) && (∀ x : _, ∀ p : Form, P(p) → P(Not(p))) → (∀ a : Form, prenex(a) → P(a))"), t16))
}

///|
let prenex_induct_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prenex_INDUCT_NOT")

///|
/// `prenex_INDUCT_NOT`
pub fn prenex_induct_not() -> @kernel.Thm {
  prenex_induct_not_c.get()
}

///|
/// PRENEX
fn step_8() -> Unit raise {
  let t23 = @meson.meson_tac(@list.List([]))
  let t22 = @simp.rewrite_tac(@list.List([@fol.form_distinct(), @fol.form_inj(), qfree_v1(), @theorems.conj_aci()]))
  let t21 = @simp.rewrite_tac(@list.List([@fol.true_def(), @fol.not_def(), @fol.or_def(), @fol.and_def(), @fol.iff_def(), @fol.exists_def()]))
  let t20 = @simp.gen_rewrite_tac(fn(x17 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s18 = @equal.land_conv(x17)
    fn(x19 : @kernel.Term) -> @kernel.Thm raise {
      s18(x19)
    }
  }, @list.List([prenex_cases()]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t20), t21), t22), t23)
  prenex_c.set(@tactics.prove(@term_syntax.parse_term("prenex(False) == true && prenex(True) == true && (∀ a : Num, ∀ l : List[Term], prenex(Atom(a, l)) == true) && (∀ p : Form, prenex(Not(p)) == (qfree(p) || (∃ q : Form, ∃ x : Num, Not(p) == op_q_q(x, q) && prenex(q)))) && (∀ p : Form, ∀ q : Form, prenex(op_bar_bar(p, q)) == (qfree(p) && qfree(q))) && (∀ p : Form, ∀ q : Form, prenex(op_amp_amp(p, q)) == (qfree(p) && qfree(q))) && (∀ p : Form, ∀ q : Form, prenex(op_minus_minus_gt(p, q)) == (qfree(p) && qfree(q) || (∃ r : Form, ∃ x : Num, op_minus_minus_gt(p, q) == op_q_q(x, r) && prenex(r)))) && (∀ p : Form, ∀ q : Form, prenex(op_lt_minus_gt(p, q)) == (qfree(p) && qfree(q))) && (∀ x : Num, ∀ p : Form, prenex(op_bang_bang(x, p)) == prenex(p)) && (∀ x : Num, ∀ p : Form, prenex(op_q_q(x, p)) == prenex(p))"), t24))
}

///|
let prenex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX")

///|
/// `PRENEX`
pub fn prenex() -> @kernel.Thm {
  prenex_c.get()
}

///|
/// FORMSUBST_STRUCTURE_LEMMA
fn step_9() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([]))
  let t27 = @tactics.repeat_tac(@tactics.strip_tac)
  let t26 = @simp.rewrite_tac(@list.List([@fol.form_distinct(), @fol.form_inj()]))
  let t25 = @simp.rewrite_tac(@list.List([@fol.formsubst(), @pair.let_def(), @pair.let_end_def()]))
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induction()), t25), t26), t27), t28)
  formsubst_structure_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, (formsubst(i, p) == False) == (p == False) && (∃ a : Num, ∃ l : List[Term], formsubst(i, p) == Atom(a, l)) == (∃ a : Num, ∃ l : List[Term], p == Atom(a, l)) && (∃ q : Form, ∃ r : Form, formsubst(i, p) == op_minus_minus_gt(q, r)) == (∃ q : Form, ∃ r : Form, p == op_minus_minus_gt(q, r)) && (∃ x : Num, ∃ q : Form, formsubst(i, p) == op_bang_bang(x, q)) == (∃ x : Num, ∃ q : Form, p == op_bang_bang(x, q))"), t29))
}

///|
let formsubst_structure_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_STRUCTURE_LEMMA")

///|
/// `FORMSUBST_STRUCTURE_LEMMA`
pub fn formsubst_structure_lemma() -> @kernel.Thm {
  formsubst_structure_lemma_c.get()
}

///|
/// FORMSUBST_STRUCTURE_NOT
fn step_10() -> Unit raise {
  let t61 = @meson.meson_tac(@list.List([]))
  let t62 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@fol.formsubst()])), t61)
  let t60 = @meson.meson_tac(@list.List([]))
  let t59 = @simp.rewrite_tac(@list.List([@fol.formsubst(), formsubst_structure_lemma(), @fol.form_inj()]))
  let t58 = @tactics.pop_assum(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s56 = @tactics.mp_tac(x55)
    fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s56(x57)
    }
  })
  let t54 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.choose_then)(fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s52 = @tactics.subst_all_tac(x51)
    fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s52(x53)
    }
  }))
  let t50 = @simp.asm_rewrite_tac(@list.List([]))
  let t45 = @term_syntax.parse_term("False")
  let t46 = @list.List([@term_syntax.parse_term("(q : Form)"), t45])
  let t49 = @tactics.disch_then(fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s43 = @tactics.mp_tac(x42)
      fn(x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s43(x44)
      }
    })(((x47 : @kernel.Thm) => @bool.specl(t46, x47))(x48))
  })
  let t41 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t40 = @tactics.disch_then(fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x38 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s35 = @tactics.mp_tac(x34)
        fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s35(x36)
        }
      })((fn(x37 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
        x37.0
      })(x38))
    })(@bool.eq_imp_rule(x39))
  })
  let t63 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@lib.el(2, @bool.conjuncts_rule(@bool.spec_all(formsubst_structure_lemma())))), t40), t41), t49), t50), t54), t58), t59), t60), t62])
  let t31 = @term_syntax.parse_term("(q : Form)")
  let t33 = @tactics.disch_then((x32 : @kernel.Thm) => @tactics.x_choose_tac(t31, x32))
  let t30 = @tactics.repeat_tac(@tactics.gen_tac)
  let t64 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.not_def(), formsubst_structure_lemma()])), t30), @tactics.eq_tac), t33), t63)
  formsubst_structure_not_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, (∃ q : Form, formsubst(i, p) == Not(q)) == (∃ q : Form, p == Not(q))"), t64))
}

///|
let formsubst_structure_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_STRUCTURE_NOT")

///|
/// `FORMSUBST_STRUCTURE_NOT`
pub fn formsubst_structure_not() -> @kernel.Thm {
  formsubst_structure_not_c.get()
}

///|
/// FORMSUBST_STRUCTURE_EXISTS
fn step_11() -> Unit raise {
  let t111 = @meson.meson_tac(@list.List([formsubst_structure_not()]))
  let t110 = @simp.rewrite_tac(@list.List([@equal.gsym(@fol.not_def())]))
  let t109 = @simp.asm_rewrite_tac(@list.List([]))
  let t108 = @simp.rewrite_tac(@list.List([@fol.formsubst(), @fol.not_def(), @fol.form_inj(), @pair.let_def(), @pair.let_end_def()]))
  let t107 = @tactics.pop_assum(fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s105 = @tactics.mp_tac(x104)
    fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s105(x106)
    }
  })
  let t102 = @tactics.x_choose_then(@term_syntax.parse_term("(s : Form)"))(fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s100 = @tactics.subst_all_tac(x99)
    fn(x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s100(x101)
    }
  })
  let t103 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(t102))
  let t98 = @simp.asm_rewrite_tac(@list.List([]))
  let t93 = @term_syntax.parse_term("Not((q : Form))")
  let t94 = @list.List([@term_syntax.parse_term("(x : Num)"), t93])
  let t97 = @tactics.disch_then(fn(x96 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s91 = @tactics.mp_tac(x90)
      fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s91(x92)
      }
    })(((x95 : @kernel.Thm) => @bool.specl(t94, x95))(x96))
  })
  let t89 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t88 = @tactics.mp_tac(@bool.eq_imp_rule(@lib.last(@bool.conjuncts_rule(@bool.spec_all(@bool.spec(@term_syntax.parse_term("(r : Form)"), formsubst_structure_lemma()))))).0)
  let t87 = @simp.rewrite_tac(@list.List([@equal.gsym(@fol.not_def())]))
  let t86 = @simp.rewrite_tac(@list.List([@fol.formsubst(), @fol.not_def(), @fol.form_inj(), @pair.let_def(), @pair.let_end_def()]))
  let t85 = @tactics.pop_assum(fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s83 = @tactics.mp_tac(x82)
    fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s83(x84)
    }
  })
  let t81 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Form)"))(fn(x78 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s79 = @tactics.subst_all_tac(x78)
    fn(x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s79(x80)
    }
  }))
  let t77 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @term_syntax.parse_term("op_bang_bang((x : Num), Not((q : Form)))")
  let t76 = @tactics.disch_then(fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s71 = @tactics.mp_tac(x70)
      fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s71(x72)
      }
    })(((x74 : @kernel.Thm) => @bool.spec(t73, x74))(x75))
  })
  let t69 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t68 = @tactics.mp_tac(@bool.eq_imp_rule(@bool.spec_all(formsubst_structure_not())).0)
  let t66 = @meson.meson_tac(@list.List([]))
  let t67 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@fol.not_def(), @fol.formsubst(), @pair.let_def(), @pair.let_end_def()])), t66)])
  let t65 = @simp.rewrite_tac(@list.List([@fol.exists_def()]))
  let t112 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t65), @tactics.eq_tac), @tactics.strip_tac), t67), t68), t69), t76), t77), t81), t85), t86), t87), @tactics.disch_tac), t88), t89), t97), t98), t103), t107), t108), @class.cond_cases_tac), t109), t110), t111)
  formsubst_structure_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, (∃ x : Num, ∃ q : Form, formsubst(i, p) == op_q_q(x, q)) == (∃ x : Num, ∃ q : Form, p == op_q_q(x, q))"), t112))
}

///|
let formsubst_structure_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_STRUCTURE_EXISTS")

///|
/// `FORMSUBST_STRUCTURE_EXISTS`
pub fn formsubst_structure_exists() -> @kernel.Thm {
  formsubst_structure_exists_c.get()
}

///|
/// PRENEX_FORMSUBST_LEMMA
fn step_12() -> Unit raise {
  let t172 = @meson.asm_meson_tac(@list.List([]))
  let t171 = @simp.rewrite_tac(@list.List([@fol.exists_def(), @fol.not_def(), @fol.formsubst(), @fol.form_inj(), @pair.let_def(), @pair.let_end_def()]))
  let t170 = @simp.rewrite_tac(@list.List([prenex()]))
  let t169 = @tactics.undisch_tac(@term_syntax.parse_term("op_q_q((x : Num), (p : Form)) == formsubst((i : (Num) -> Term), op_q_q((y : Num), (r : Form)))"))
  let t167 = @tactics.x_choose_then(@term_syntax.parse_term("(r : Form)"))(fn(x164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s165 = @tactics.subst_all_tac(x164)
    fn(x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s165(x166)
    }
  })
  let t168 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(t167))
  let t163 = @simp.asm_rewrite_tac(@list.List([]))
  let t158 = @term_syntax.parse_term("(p : Form)")
  let t159 = @list.List([@term_syntax.parse_term("(x : Num)"), t158])
  let t162 = @tactics.disch_then(fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s156 = @tactics.mp_tac(x155)
      fn(x157 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s156(x157)
      }
    })(((x160 : @kernel.Thm) => @bool.specl(t159, x160))(x161))
  })
  let t154 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t153 = @tactics.disch_then(fn(x152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x151 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x149 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s146 = @tactics.mp_tac(x145)
            fn(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s146(x147)
            }
          })((fn(x148 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
            x148.0
          })(x149))
        })(@bool.eq_imp_rule(x150))
      })(@lib.last(x151))
    })(@bool.conjuncts_rule(x152))
  })
  let t143 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t144 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : Form)"), t143]), formsubst_structure_exists()))
  let t173 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t144), t153), t154), t162), t163), t168), t169), t170), t171), t172)
  let t142 = @meson.asm_meson_tac(@list.List([]))
  let t141 = @simp.rewrite_tac(@list.List([@fol.formsubst(), @fol.form_inj(), prenex(), @pair.let_def(), @pair.let_end_def()]))
  let t140 = @tactics.undisch_tac(@term_syntax.parse_term("op_bang_bang((x : Num), (p : Form)) == formsubst((i : (Num) -> Term), op_bang_bang((y : Num), (r : Form)))"))
  let t138 = @tactics.x_choose_then(@term_syntax.parse_term("(r : Form)"))(fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s136 = @tactics.subst_all_tac(x135)
    fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s136(x137)
    }
  })
  let t139 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(t138))
  let t134 = @simp.asm_rewrite_tac(@list.List([]))
  let t129 = @term_syntax.parse_term("(p : Form)")
  let t130 = @list.List([@term_syntax.parse_term("(x : Num)"), t129])
  let t133 = @tactics.disch_then(fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s127 = @tactics.mp_tac(x126)
      fn(x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s127(x128)
      }
    })(((x131 : @kernel.Thm) => @bool.specl(t130, x131))(x132))
  })
  let t125 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t124 = @tactics.disch_then(fn(x123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x122 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x120 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s117 = @tactics.mp_tac(x116)
            fn(x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s117(x118)
            }
          })((fn(x119 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
            x119.0
          })(x120))
        })(@bool.eq_imp_rule(x121))
      })(@lib.last(x122))
    })(@bool.conjuncts_rule(x123))
  })
  let t114 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t115 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : Form)"), t114]), formsubst_structure_lemma()))
  let t174 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t115), t124), t125), t133), t134), t139), t140), t141), t142)
  let t175 = @list.List([@meson.meson_tac(@list.List([qfree_formsubst(), prenex_rules()])), t174, t173])
  let t113 = @tactics.repeat_tac(@tactics.conj_tac)
  let t176 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(prenex_induct()), t113), t175)
  prenex_formsubst_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, prenex(p) → (∀ i : (Num) -> Term, ∀ q : Form, p == formsubst(i, q) → prenex(q))"), t176))
}

///|
let prenex_formsubst_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_FORMSUBST_LEMMA")

///|
/// `PRENEX_FORMSUBST_LEMMA`
pub fn prenex_formsubst_lemma() -> @kernel.Thm {
  prenex_formsubst_lemma_c.get()
}

///|
/// PRENEX_FORMSUBST
fn step_13() -> Unit raise {
  let t186 = @simp.asm_rewrite_tac(@list.List([prenex()]))
  let t184 = @equal.gsym(@fol.exists_def())
  let t185 = @simp.rewrite_tac(@list.List([@equal.gsym(@fol.not_def()), t184]))
  let t187 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.formsubst(), @fol.not_def(), @fol.exists_def(), @pair.let_def(), @pair.let_end_def()])), t185), t186)
  let t188 = @simp.asm_rewrite_tac(@list.List([prenex()]))
  let t189 = @list.List([@meson.asm_meson_tac(@list.List([qfree_formsubst(), prenex_rules()])), t188, t187])
  let t183 = @simp.asm_rewrite_tac(@list.List([@fol.formsubst(), @pair.let_def(), @pair.let_end_def()]))
  let t182 = @tactics.repeat_tac(@tactics.strip_tac)
  let t181 = @tactics.match_mp_tac(prenex_induct())
  let t179 = @term_syntax.parse_term("(p : Form)")
  let t180 = @tactics.spec_tac(@term_syntax.parse_term("(p : Form)"), t179)
  let t178 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t177 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t190 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(i : (Num) -> Term)"), t177), t178), t180), t181), t182), t183), t189)
  let t191 = @list.List([@meson.meson_tac(@list.List([prenex_formsubst_lemma()])), t190])
  let t192 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t191)
  prenex_formsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, prenex(formsubst(i, p)) == prenex(p)"), t192))
}

///|
let prenex_formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_FORMSUBST")

///|
/// `PRENEX_FORMSUBST`
pub fn prenex_formsubst() -> @kernel.Thm {
  prenex_formsubst_c.get()
}

///|
/// size
fn step_14() -> Unit raise {
  let t193 = @term_syntax.parse_term("(size : (Form) -> Num)(False) == 1 && size(Atom((p : Num), (l : List[Term]))) == 1 && size(op_minus_minus_gt((q : Form), (r : Form))) == size(q) + size(r) && size(op_bang_bang((x : Num), q)) == 1 + size(q)")
  size_c.set(@recursion.new_recursive_definition(@fol.form_recursion())(t193))
}

///|
let size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("size")

///|
/// `size`
pub fn size() -> @kernel.Thm {
  size_c.get()
}

///|
/// SIZE
fn step_15() -> Unit raise {
  let t194 = @tactics.repeat_tac(@tactics.strip_tac)
  let t195 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.true_def(), @fol.not_def(), @fol.or_def(), @fol.and_def(), @fol.iff_def(), @fol.exists_def(), size()])), t194), @int.arith_tac)
  size_v1_c.set(@tactics.prove(@term_syntax.parse_term("size(False) == 1 && size(True) == 2 && (∀ a : Num, ∀ l : List[Term], size(Atom(a, l)) == 1) && (∀ p : Form, size(Not(p)) == 1 + size(p)) && (∀ p : Form, ∀ q : Form, size(op_bar_bar(p, q)) == size(p) + 2 * size(q)) && (∀ p : Form, ∀ q : Form, size(op_amp_amp(p, q)) == size(p) + (2 * size(q) + 4)) && (∀ p : Form, ∀ q : Form, size(op_minus_minus_gt(p, q)) == size(p) + size(q)) && (∀ p : Form, ∀ q : Form, size(op_lt_minus_gt(p, q)) == 3 * size(p) + (3 * size(q) + 4)) && (∀ x : Num, ∀ p : Form, size(op_bang_bang(x, p)) == 1 + size(p)) && (∀ x : Num, ∀ p : Form, size(op_q_q(x, p)) == 3 + size(p))"), t195))
}

///|
let size_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE")

///|
/// `SIZE`
pub fn size_v1() -> @kernel.Thm {
  size_v1_c.get()
}

///|
/// SIZE_FORMSUBST
fn step_16() -> Unit raise {
  let t198 = @simp.asm_rewrite_tac(@list.List([]))
  let t197 = @tactics.repeat_tac(@tactics.strip_tac)
  let t196 = @simp.asm_rewrite_tac(@list.List([@fol.formsubst(), size(), @pair.let_end_def(), @pair.let_def()]))
  let t199 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induction()), t196), t197), t198)
  size_formsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, size(formsubst(i, p)) == size(p)"), t199))
}

///|
let size_formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_FORMSUBST")

///|
/// `SIZE_FORMSUBST`
pub fn size_formsubst() -> @kernel.Thm {
  size_formsubst_c.get()
}

///|
/// PPAT_DEF
fn step_17() -> Unit raise {
  ppat_def_c.set(@pair.new_definition(@term_syntax.parse_term("(PPAT : ((Num, Form) -> _, (Num, Form) -> _, (Form) -> _, Form) -> _)((A : (Num, Form) -> _), (B : (Num, Form) -> _), (C : (Form) -> _), (r : Form)) == (if (∃ x : Num, ∃ p : Form, r == op_bang_bang(x, p)) { A(select((x : Num) => ∃ p : Form, r == op_bang_bang(x, p)), select((p : Form) => r == op_bang_bang(select((x : Num) => ∃ p : Form, r == op_bang_bang(x, p)), p))) } else { if (∃ x : Num, ∃ p : Form, r == op_q_q(x, p)) { B(select((x : Num) => ∃ p : Form, r == op_q_q(x, p)), select((p : Form) => r == op_q_q(select((x : Num) => ∃ p : Form, r == op_q_q(x, p)), p))) } else { C(r) } })")))
}

///|
let ppat_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PPAT_DEF")

///|
/// `PPAT_DEF`
pub fn ppat_def() -> @kernel.Thm {
  ppat_def_c.get()
}

///|
/// PRENEX_DISTINCT
fn step_18() -> Unit raise {
  let t200 = @simp.rewrite_tac(@list.List([@fol.exists_def(), @fol.not_def(), @fol.form_distinct(), @fol.form_inj()]))
  prenex_distinct_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ p : Form, ∀ q : Form, (op_bang_bang(x, p) == op_bang_bang(y, q)) == (x == y && p == q) && (op_q_q(x, p) == op_q_q(y, q)) == (x == y && p == q) && !(op_bang_bang(x, p) == op_q_q(y, q))"), t200))
}

///|
let prenex_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_DISTINCT")

///|
/// `PRENEX_DISTINCT`
pub fn prenex_distinct() -> @kernel.Thm {
  prenex_distinct_c.get()
}

///|
/// PPAT
fn step_19() -> Unit raise {
  let t205 = @bool.spec_all(@class.select_refl())
  let t206 = @equal.conv_rule(@equal.land_conv(@equal.once_depth_conv(@equal.sym_conv)), t205)
  let t207 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl(), @equal.gsym(@theorems.exists_refl()), @class.select_refl(), t206]))
  let t204 = @tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))]))
  let t203 = @simp.asm_rewrite_tac(@list.List([prenex_distinct()]))
  let t202 = @tactics.repeat_tac(@tactics.strip_tac)
  let t201 = @simp.rewrite_tac(@list.List([ppat_def()]))
  let t208 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t201), t202), t203), t204), t207)
  ppat_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Num, Form) -> A, ∀ B : (Num, Form) -> A, ∀ C : (Form) -> A, (∀ x : Num, ∀ p : Form, PPAT(A, B, C, op_bang_bang(x, p)) == A(x, p)) && (∀ x : Num, ∀ p : Form, PPAT(A, B, C, op_q_q(x, p)) == B(x, p)) && (∀ r : Form, !(∃ x : Num, ∃ p : Form, r == op_bang_bang(x, p)) && !(∃ x : Num, ∃ p : Form, r == op_q_q(x, p)) → PPAT(A, B, C, r) == C(r))"), t208))
}

///|
let ppat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PPAT")

///|
/// `PPAT`
pub fn ppat() -> @kernel.Thm {
  ppat_c.get()
}

///|
/// SIZE_REC
fn step_20() -> Unit raise {
  let t209 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@wf.measure()]))(@wf.wf_measure())]))
  let t210 = @tactics.then_tac(@tactics.match_mp_tac(@wf.wf_rec()), t209)
  size_rec_c.set(@tactics.prove(@term_syntax.parse_term("∀ H : ((Form) -> _, Form) -> _, (∀ f : (Form) -> _, ∀ g : (Form) -> _, ∀ x : Form, (∀ z : Form, size(z) < size(x) → f(z) == g(z)) → H(f, x) == H(g, x)) → (∃ f : (Form) -> _, ∀ x : Form, f(x) == H(f, x))"), t210))
}

///|
let size_rec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_REC")

///|
/// `SIZE_REC`
pub fn size_rec() -> @kernel.Thm {
  size_rec_c.get()
}

///|
/// PRENEX_RIGHT_EXISTENCE
fn step_21() -> Unit raise {
  let t271 = @simp.rewrite_tac(@list.List([]))
  let t269 = @simp.asm_rewrite_tac(@list.List([qfree_v1()]))
  let t270 = @list.List([@tactics.then_tac(@tactics.pop_assum(@tactics.strip_assume_tac), t269), @tactics.all_tac])
  let t267 = @simp.asm_rewrite_tac(@list.List([qfree_v1()]))
  let t268 = @list.List([@tactics.then_tac(@tactics.pop_assum(@tactics.strip_assume_tac), t267), @tactics.all_tac])
  let t266 = @tactics.pop_assum_list(fn(x265 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t264 = @simp.rewrite_tac(@list.List([ppat_def()]))
  let t263 = @tactics.undisch_tac(@term_syntax.parse_term("qfree((q : Form))"))
  let t262 = @simp.rewrite_tac(@list.List([ppat()]))
  let t261 = @tactics.first_assum(fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x256
    @simp.gen_rewrite_tac(fn(x258 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s259 = @equal.land_conv(x258)
      fn(x260 : @kernel.Term) -> @kernel.Thm raise {
        s259(x260)
      }
    }, @list.List([th]))
  })
  let t255 = @tactics.try_tac(@tactics.disch_tac)
  let t254 = @tactics.repeat_tac(@tactics.gen_tac)
  let t253 = @tactics.repeat_tac(@tactics.conj_tac)
  let t252 = @tactics.exists_tac(@term_syntax.parse_term("(Prenex_right : (Form, Form) -> Form)"))
  let t249 = @term_syntax.parse_term("(Prenex_right : (Form, Form) -> Form)")
  let t251 = @tactics.disch_then((x250 : @kernel.Thm) => @tactics.x_choose_tac(t249, x250))
  let t246 = @simp.gen_rewrite_rule(fn(x245 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x245
  }, @list.List([@class.skolem_thm()]))
  let t248 = @tactics.disch_then(fn(x247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s243 = @tactics.mp_tac(x242)
      fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s243(x244)
      }
    })(t246(x247))
  })
  let t240 = @simp.rewrite_tac(@list.List([size_formsubst(), size_v1()]))
  let t239 = @tactics.first_assum(@tactics.match_mp_tac)
  let t238 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t235 = @bool.spec_all(@class.select_refl())
  let t236 = @equal.conv_rule(@equal.land_conv(@equal.once_depth_conv(@equal.sym_conv)), t235)
  let t237 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl(), @equal.gsym(@theorems.exists_refl()), @class.select_refl(), t236]))
  let t234 = @simp.rewrite_tac(@list.List([prenex_distinct()]))
  let t233 = @tactics.first_x_assum(@tactics.choose_then(@tactics.choose_then(fn(x230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s231 = @tactics.subst_all_tac(x230)
    fn(x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s231(x232)
    }
  })))
  let t229 = @simp.asm_rewrite_tac(@list.List([]))
  let t227 = @simp.rewrite_tac(@list.List([size_formsubst(), size_v1()]))
  let t226 = @tactics.first_assum(@tactics.match_mp_tac)
  let t225 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t222 = @bool.spec_all(@class.select_refl())
  let t223 = @equal.conv_rule(@equal.land_conv(@equal.once_depth_conv(@equal.sym_conv)), t222)
  let t224 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl(), @equal.gsym(@theorems.exists_refl()), @class.select_refl(), t223]))
  let t221 = @simp.rewrite_tac(@list.List([@fol.form_distinct(), @fol.form_inj()]))
  let t228 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.choose_then(@tactics.choose_then(fn(x218 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s219 = @tactics.subst_all_tac(x218)
    fn(x220 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s219(x220)
    }
  }))), t221), t224), t225), @tactics.ap_term_tac), t226), t227), @int.arith_tac), @tactics.all_tac])
  let t217 = @simp.asm_rewrite_tac(@list.List([]))
  let t216 = @class.asm_cases_tac(@term_syntax.parse_term("∃ x : Num, ∃ p : Form, (r : Form) == op_bang_bang(x, p)"))
  let t215 = @simp.rewrite_tac(@list.List([ppat_def()]))
  let t214 = @tactics.repeat_tac(@tactics.strip_tac)
  let t241 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(size_rec())), t214), t215), t216), t217), t228), @class.cond_cases_tac), t229), t233), t234), t237), t238), @tactics.ap_term_tac), t239), t240), @int.arith_tac), @tactics.all_tac])
  let t272 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∃ Prenex_right : (Form) -> Form, ∀ r : Form, Prenex_right(r) == PPAT((x : Num) => (q : Form) => LET((y : Num) => LET_END(op_bang_bang(y, Prenex_right(formsubst(valmod((x, V(y)), V), q)))), VARIANT(UNION(FV(p), FV(op_bang_bang(x, q))))), (x : Num) => (q : Form) => LET((y : Num) => LET_END(op_q_q(y, Prenex_right(formsubst(valmod((x, V(y)), V), q)))), VARIANT(UNION(FV(p), FV(op_q_q(x, q))))), (q : Form) => op_minus_minus_gt(p, q), r)"), fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s212 = @tactics.mp_tac(x211)
    fn(x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s212(x213)
    }
  }), t241), t248), t251), t252), t253), t254), t255), t261), t262), t263), t264), t266), @class.cond_cases_tac), t268), @class.cond_cases_tac), t270), t271)
  prenex_right_existence_c.set(@tactics.prove(@term_syntax.parse_term("∃ Prenex_right : (Form, Form) -> Form, (∀ p : Form, ∀ x : Num, ∀ q : Form, Prenex_right(p, op_bang_bang(x, q)) == LET((y : Num) => LET_END(op_bang_bang(y, Prenex_right(p, formsubst(valmod((x, V(y)), V), q)))), VARIANT(UNION(FV(p), FV(op_bang_bang(x, q)))))) && (∀ p : Form, ∀ x : Num, ∀ q : Form, Prenex_right(p, op_q_q(x, q)) == LET((y : Num) => LET_END(op_q_q(y, Prenex_right(p, formsubst(valmod((x, V(y)), V), q)))), VARIANT(UNION(FV(p), FV(op_q_q(x, q)))))) && (∀ p : Form, ∀ q : Form, qfree(q) → Prenex_right(p, q) == op_minus_minus_gt(p, q))"), t272))
}

///|
let prenex_right_existence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_EXISTENCE")

///|
/// `PRENEX_RIGHT_EXISTENCE`
pub fn prenex_right_existence() -> @kernel.Thm {
  prenex_right_existence_c.get()
}

///|
/// PRENEX_RIGHT
fn step_22() -> Unit raise {
  prenex_right_c.set(@nums.new_specification(@list.List(["Prenex_right"]))(prenex_right_existence()))
}

///|
let prenex_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT")

///|
/// `PRENEX_RIGHT`
pub fn prenex_right() -> @kernel.Thm {
  prenex_right_c.get()
}

///|
/// PRENEX_LEFT_EXISTENCE
fn step_23() -> Unit raise {
  let t334 = @simp.rewrite_tac(@list.List([]))
  let t332 = @simp.asm_rewrite_tac(@list.List([qfree_v1()]))
  let t333 = @list.List([@tactics.then_tac(@tactics.pop_assum(@tactics.strip_assume_tac), t332), @tactics.all_tac])
  let t330 = @simp.asm_rewrite_tac(@list.List([qfree_v1()]))
  let t331 = @list.List([@tactics.then_tac(@tactics.pop_assum(@tactics.strip_assume_tac), t330), @tactics.all_tac])
  let t329 = @tactics.pop_assum_list(fn(x328 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t327 = @simp.rewrite_tac(@list.List([ppat_def()]))
  let t326 = @tactics.undisch_tac(@term_syntax.parse_term("qfree((q : Form))"))
  let t325 = @simp.rewrite_tac(@list.List([ppat()]))
  let t324 = @tactics.first_assum(fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x319
    @simp.gen_rewrite_tac(fn(x321 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s322 = @equal.land_conv(x321)
      fn(x323 : @kernel.Term) -> @kernel.Thm raise {
        s322(x323)
      }
    }, @list.List([th]))
  })
  let t318 = @tactics.try_tac(@tactics.disch_tac)
  let t317 = @tactics.repeat_tac(@tactics.gen_tac)
  let t316 = @tactics.repeat_tac(@tactics.conj_tac)
  let t315 = @simp.rewrite_tac(@list.List([]))
  let t314 = @tactics.exists_tac(@term_syntax.parse_term("(q : Form) => (p : Form) => (Prenex_left : (Form, Form) -> Form)(p, q)"))
  let t311 = @term_syntax.parse_term("(Prenex_left : (Form, Form) -> Form)")
  let t313 = @tactics.disch_then((x312 : @kernel.Thm) => @tactics.x_choose_tac(t311, x312))
  let t308 = @simp.gen_rewrite_rule(fn(x307 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x307
  }, @list.List([@class.skolem_thm()]))
  let t310 = @tactics.disch_then(fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s305 = @tactics.mp_tac(x304)
      fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s305(x306)
      }
    })(t308(x309))
  })
  let t302 = @simp.rewrite_tac(@list.List([size_formsubst(), size_v1()]))
  let t301 = @tactics.first_assum(@tactics.match_mp_tac)
  let t300 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t297 = @bool.spec_all(@class.select_refl())
  let t298 = @equal.conv_rule(@equal.land_conv(@equal.once_depth_conv(@equal.sym_conv)), t297)
  let t299 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl(), @equal.gsym(@theorems.exists_refl()), @class.select_refl(), t298]))
  let t296 = @simp.rewrite_tac(@list.List([prenex_distinct()]))
  let t295 = @tactics.first_x_assum(@tactics.choose_then(@tactics.choose_then(fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s293 = @tactics.subst_all_tac(x292)
    fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s293(x294)
    }
  })))
  let t291 = @simp.asm_rewrite_tac(@list.List([]))
  let t289 = @simp.rewrite_tac(@list.List([size_formsubst(), size_v1()]))
  let t288 = @tactics.first_assum(@tactics.match_mp_tac)
  let t287 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t284 = @bool.spec_all(@class.select_refl())
  let t285 = @equal.conv_rule(@equal.land_conv(@equal.once_depth_conv(@equal.sym_conv)), t284)
  let t286 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl(), @equal.gsym(@theorems.exists_refl()), @class.select_refl(), t285]))
  let t283 = @simp.rewrite_tac(@list.List([@fol.form_distinct(), @fol.form_inj()]))
  let t290 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.choose_then(@tactics.choose_then(fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s281 = @tactics.subst_all_tac(x280)
    fn(x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s281(x282)
    }
  }))), t283), t286), t287), @tactics.ap_term_tac), t288), t289), @int.arith_tac), @tactics.all_tac])
  let t279 = @simp.asm_rewrite_tac(@list.List([]))
  let t278 = @class.asm_cases_tac(@term_syntax.parse_term("∃ x : Num, ∃ p : Form, (r : Form) == op_bang_bang(x, p)"))
  let t277 = @simp.rewrite_tac(@list.List([ppat_def()]))
  let t276 = @tactics.repeat_tac(@tactics.strip_tac)
  let t303 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(size_rec())), t276), t277), t278), t279), t290), @class.cond_cases_tac), t291), t295), t296), t299), t300), @tactics.ap_term_tac), t301), t302), @int.arith_tac), @tactics.all_tac])
  let t335 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∃ Prenex_left : (Form) -> Form, ∀ r : Form, Prenex_left(r) == PPAT((x : Num) => (q : Form) => LET((y : Num) => LET_END(op_q_q(y, Prenex_left(formsubst(valmod((x, V(y)), V), q)))), VARIANT(UNION(FV(op_bang_bang(x, q)), FV(p)))), (x : Num) => (q : Form) => LET((y : Num) => LET_END(op_bang_bang(y, Prenex_left(formsubst(valmod((x, V(y)), V), q)))), VARIANT(UNION(FV(op_q_q(x, q)), FV(p)))), (q : Form) => Prenex_right(q, p), r)"), fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s274 = @tactics.mp_tac(x273)
    fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s274(x275)
    }
  }), t303), t310), t313), t314), t315), t316), t317), t318), t324), t325), t326), t327), t329), @class.cond_cases_tac), t331), @class.cond_cases_tac), t333), t334)
  prenex_left_existence_c.set(@tactics.prove(@term_syntax.parse_term("∃ Prenex_left : (Form, Form) -> Form, (∀ p : Form, ∀ x : Num, ∀ q : Form, Prenex_left(op_bang_bang(x, q), p) == LET((y : Num) => LET_END(op_q_q(y, Prenex_left(formsubst(valmod((x, V(y)), V), q), p))), VARIANT(UNION(FV(op_bang_bang(x, q)), FV(p))))) && (∀ p : Form, ∀ x : Num, ∀ q : Form, Prenex_left(op_q_q(x, q), p) == LET((y : Num) => LET_END(op_bang_bang(y, Prenex_left(formsubst(valmod((x, V(y)), V), q), p))), VARIANT(UNION(FV(op_q_q(x, q)), FV(p))))) && (∀ p : Form, ∀ q : Form, qfree(q) → Prenex_left(q, p) == Prenex_right(q, p))"), t335))
}

///|
let prenex_left_existence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_EXISTENCE")

///|
/// `PRENEX_LEFT_EXISTENCE`
pub fn prenex_left_existence() -> @kernel.Thm {
  prenex_left_existence_c.get()
}

///|
/// PRENEX_LEFT
fn step_24() -> Unit raise {
  prenex_left_c.set(@nums.new_specification(@list.List(["Prenex_left"]))(prenex_left_existence()))
}

///|
let prenex_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT")

///|
/// `PRENEX_LEFT`
pub fn prenex_left() -> @kernel.Thm {
  prenex_left_c.get()
}

///|
/// Prenex_DEF
fn step_25() -> Unit raise {
  let t336 = @term_syntax.parse_term("(Prenex : (Form) -> Form)(False) == False && Prenex(Atom((a : Num), (l : List[Term]))) == Atom(a, l) && Prenex(op_minus_minus_gt((p : Form), (q : Form))) == Prenex_left(Prenex(p), Prenex(q)) && Prenex(op_bang_bang((x : Num), p)) == op_bang_bang(x, Prenex(p))")
  prenex_def_c.set(@recursion.new_recursive_definition(@fol.form_recursion())(t336))
}

///|
let prenex_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Prenex_DEF")

///|
/// `Prenex_DEF`
pub fn prenex_def() -> @kernel.Thm {
  prenex_def_c.get()
}

///|
/// PRENEX_RIGHT_FORALL
fn step_26() -> Unit raise {
  let t363 = @simp.asm_rewrite_tac(@list.List([]))
  let t362 = @simp.rewrite_tac(@list.List([@fol.valmod()]))
  let t361 = @tactics.match_mp_tac(@fol.holds_valuation())
  let t360 = @tactics.repeat_tac(@tactics.gen_tac)
  let t358 = @simp.asm_rewrite_tac(@list.List([]))
  let t359 = @list.List([@tactics.all_tac, @tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), (p : Form))")), t358)])
  let t357 = @tactics.subgoal_then(@term_syntax.parse_term("∀ v : (Num) -> A, ∀ a : A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), valmod(((y : Num), a), v), (p : Form)) == holds(M, v, p)"), fn(x355 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x355
    @simp.rewrite_tac(@list.List([th]))
  })
  let t364 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.holds_v1()])), t357), t359), t360), t361), @tactics.gen_tac), t362), @class.cond_cases_tac), t363)
  let t354 = @meson.asm_meson_tac(@list.List([]))
  let t353 = @simp.asm_rewrite_tac(@list.List([@fol.fv(), @sets.in_delete()]))
  let t352 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((y : Num), FV(op_bang_bang((x : Num), (q : Form))))"))
  let t351 = @simp.rewrite_tac(@list.List([]))
  let t350 = @simp.rewrite_tac(@list.List([@fol.termval()]))
  let t349 = @simp.rewrite_tac(@list.List([@fol.valmod(), @trivia.o_thm()]))
  let t348 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t347 = @tactics.match_mp_tac(@fol.holds_valuation())
  let t346 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)")))
  let t345 = @simp.rewrite_tac(@list.List([@fol.holds_v1(), @fol.holds_formsubst()]))
  let t344 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)")))
  let t365 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@fol.holds()])), t344), @tactics.disch_tac), t345), @tactics.ap_term_tac), @tactics.abs_tac), t346), @tactics.disch_tac), t347), t348), @tactics.disch_tac), t349), @class.cond_cases_tac), t350), @class.cond_cases_tac), t351), t352), t353), t354), t364])
  let t342 = @simp.rewrite_tac(@list.List([@fol.variant_thm(), @equal.gsym(@fol.fv())]))
  let t341 = @fol.expand_tac("y")
  let t340 = @equal.gsym(@sets.in_union())
  let t343 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.de_morgan_thm()), t340])), t341), t342), @tactics.all_tac])
  let t339 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((y : Num), FV((p : Form))) && !IN(y, FV(op_bang_bang((x : Num), (q : Form))))"), @tactics.strip_assume_tac)
  let t338 = @tactics.exists_tac(@term_syntax.parse_term("holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), op_minus_minus_gt((p : Form), op_bang_bang((y : Num), formsubst(valmod(((x : Num), V(y)), V), (q : Form)))))"))
  let t337 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t366 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.abbrev_tac(@term_syntax.parse_term("(y : Num) == VARIANT(UNION(FV((p : Form)), FV(op_bang_bang((x : Num), (q : Form)))))"))), t337), t338), t339), t343), @tactics.conj_tac), t365)
  prenex_right_forall_c.set(@tactics.prove(@term_syntax.parse_term("!(Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {}) → holds(M, (v : (Num) -> A), op_minus_minus_gt((p : Form), op_bang_bang((x : Num), (q : Form)))) == holds(M, v, op_bang_bang(VARIANT(UNION(FV(p), FV(op_bang_bang(x, q)))), op_minus_minus_gt(p, formsubst(valmod((x, V(VARIANT(UNION(FV(p), FV(op_bang_bang(x, q)))))), V), q))))"), t366))
}

///|
let prenex_right_forall_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_FORALL")

///|
/// `PRENEX_RIGHT_FORALL`
pub fn prenex_right_forall() -> @kernel.Thm {
  prenex_right_forall_c.get()
}

///|
/// PRENEX_RIGHT_EXISTS
fn step_27() -> Unit raise {
  let t392 = @simp.asm_rewrite_tac(@list.List([@sets.member_not_empty()]))
  let t391 = @simp.asm_rewrite_tac(@list.List([]))
  let t393 = @tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), (p : Form))")), t391), t392)
  let t390 = @simp.asm_rewrite_tac(@list.List([]))
  let t389 = @simp.rewrite_tac(@list.List([@fol.valmod()]))
  let t388 = @tactics.match_mp_tac(@fol.holds_valuation())
  let t394 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t388), @tactics.gen_tac), t389), @class.cond_cases_tac), t390), t393])
  let t387 = @tactics.subgoal_then(@term_syntax.parse_term("∀ v : (Num) -> A, ∀ a : A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), valmod(((y : Num), a), v), (p : Form)) == holds(M, v, p)"), fn(x385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x385
    @simp.rewrite_tac(@list.List([th]))
  })
  let t395 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.holds_v1()])), t387), t394)
  let t384 = @meson.asm_meson_tac(@list.List([]))
  let t383 = @simp.asm_rewrite_tac(@list.List([@fol.fv(), @fol.not_def(), @fol.exists_def(), @sets.union_empty(), @sets.in_delete()]))
  let t382 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((y : Num), FV(op_q_q((x : Num), (q : Form))))"))
  let t381 = @simp.rewrite_tac(@list.List([]))
  let t380 = @simp.rewrite_tac(@list.List([@fol.termval()]))
  let t379 = @simp.rewrite_tac(@list.List([@fol.valmod(), @trivia.o_thm()]))
  let t378 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t377 = @tactics.match_mp_tac(@fol.holds_valuation())
  let t376 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t375 = @simp.rewrite_tac(@list.List([@fol.holds_v1(), @fol.holds_formsubst()]))
  let t374 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)")))
  let t396 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@fol.holds()])), t374), @tactics.disch_tac), t375), @tactics.ap_term_tac), @tactics.abs_tac), t376), @tactics.disch_tac), t377), t378), @tactics.disch_tac), t379), @class.cond_cases_tac), t380), @class.cond_cases_tac), t381), t382), t383), t384), t395])
  let t372 = @simp.rewrite_tac(@list.List([@fol.variant_thm(), @equal.gsym(@fol.fv())]))
  let t371 = @fol.expand_tac("y")
  let t370 = @equal.gsym(@sets.in_union())
  let t373 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.de_morgan_thm()), t370])), t371), t372), @tactics.all_tac])
  let t369 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((y : Num), FV((p : Form))) && !IN(y, FV(op_q_q((x : Num), (q : Form))))"), @tactics.strip_assume_tac)
  let t368 = @tactics.exists_tac(@term_syntax.parse_term("holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), op_minus_minus_gt((p : Form), op_q_q((y : Num), formsubst(valmod(((x : Num), V(y)), V), (q : Form)))))"))
  let t367 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t397 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.abbrev_tac(@term_syntax.parse_term("(y : Num) == VARIANT(UNION(FV((p : Form)), FV(op_q_q((x : Num), (q : Form)))))"))), t367), t368), t369), t373), @tactics.conj_tac), t396)
  prenex_right_exists_c.set(@tactics.prove(@term_syntax.parse_term("!(Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {}) → holds(M, (v : (Num) -> A), op_minus_minus_gt((p : Form), op_q_q((x : Num), (q : Form)))) == holds(M, v, op_q_q(VARIANT(UNION(FV(p), FV(op_q_q(x, q)))), op_minus_minus_gt(p, formsubst(valmod((x, V(VARIANT(UNION(FV(p), FV(op_q_q(x, q)))))), V), q))))"), t397))
}

///|
let prenex_right_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_EXISTS")

///|
/// `PRENEX_RIGHT_EXISTS`
pub fn prenex_right_exists() -> @kernel.Thm {
  prenex_right_exists_c.get()
}

///|
/// PRENEX_DUALITY_LEMMAS
fn step_28() -> Unit raise {
  let t398 = @meson.meson_tac(@list.List([]))
  let t399 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.holds_v1()])), t398)
  prenex_duality_lemmas_c.set(@tactics.prove(@term_syntax.parse_term("holds((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), op_minus_minus_gt(op_q_q((x : Num), (p : Form)), (q : Form))) == holds(M, v, op_minus_minus_gt(Not(q), op_bang_bang(x, Not(p)))) && holds(M, v, op_minus_minus_gt(op_bang_bang(x, p), q)) == holds(M, v, op_minus_minus_gt(Not(q), op_q_q(x, Not(p))))"), t399))
}

///|
let prenex_duality_lemmas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_DUALITY_LEMMAS")

///|
/// `PRENEX_DUALITY_LEMMAS`
pub fn prenex_duality_lemmas() -> @kernel.Thm {
  prenex_duality_lemmas_c.get()
}

///|
/// PRENEX_LEFT_FORALL
fn step_29() -> Unit raise {
  let t404 = @simp.rewrite_tac(@list.List([@fol.holds(), @fol.formsubst(), @class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))]))
  let t403 = @simp.rewrite_tac(@list.List([@fol.exists_def(), @fol.not_def(), @fol.fv(), @sets.union_empty(), @sets.union_comm()]))
  let t402 = @tactics.first_assum(fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x400
    @simp.rewrite_tac(@list.List([@drule.match_mp(prenex_right_exists())(th)]))
  })
  let t405 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([prenex_duality_lemmas()]))), t402), t403), t404)
  prenex_left_forall_c.set(@tactics.prove(@term_syntax.parse_term("!(Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {}) → holds(M, (v : (Num) -> A), op_minus_minus_gt(op_bang_bang((x : Num), (p : Form)), (q : Form))) == holds(M, v, op_q_q(VARIANT(UNION(FV(op_bang_bang(x, p)), FV(q))), op_minus_minus_gt(formsubst(valmod((x, V(VARIANT(UNION(FV(op_bang_bang(x, p)), FV(q))))), V), p), q)))"), t405))
}

///|
let prenex_left_forall_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_FORALL")

///|
/// `PRENEX_LEFT_FORALL`
pub fn prenex_left_forall() -> @kernel.Thm {
  prenex_left_forall_c.get()
}

///|
/// PRENEX_LEFT_EXISTS
fn step_30() -> Unit raise {
  let t410 = @simp.rewrite_tac(@list.List([@fol.holds(), @fol.formsubst(), @class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))]))
  let t409 = @simp.rewrite_tac(@list.List([@fol.exists_def(), @fol.not_def(), @fol.fv(), @sets.union_empty(), @sets.union_comm()]))
  let t408 = @tactics.first_assum(fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x406
    @simp.rewrite_tac(@list.List([@drule.match_mp(prenex_right_forall())(th)]))
  })
  let t411 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([prenex_duality_lemmas()]))), t408), t409), t410)
  prenex_left_exists_c.set(@tactics.prove(@term_syntax.parse_term("!(Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {}) → holds(M, (v : (Num) -> A), op_minus_minus_gt(op_q_q((x : Num), (p : Form)), (q : Form))) == holds(M, v, op_bang_bang(VARIANT(UNION(FV(op_q_q(x, p)), FV(q))), op_minus_minus_gt(formsubst(valmod((x, V(VARIANT(UNION(FV(op_q_q(x, p)), FV(q))))), V), p), q)))"), t411))
}

///|
let prenex_left_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_EXISTS")

///|
/// `PRENEX_LEFT_EXISTS`
pub fn prenex_left_exists() -> @kernel.Thm {
  prenex_left_exists_c.get()
}

///|
/// PRENEX_RIGHT_FORALL_FV
fn step_31() -> Unit raise {
  let t412 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("DELETE(UNION((s : (_) -> Bool), (t : (_) -> Bool)), (x : _)) == UNION(DELETE(s, x), DELETE(t, x))"), t412)
  let t415 = @meson.meson_tac(@list.List([]))
  let t414 = @simp.rewrite_tac(@list.List([@sets.extension(), @fol.fv(), @sets.in_union(), @sets.in_delete()]))
  let t413 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("op_minus_minus_gt((p : Form), op_bang_bang((x : Num), (q : Form)))"), @fol.variant_thm()))
  let t416 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fv(), @fol.formsubst_rename(), lemma])), t413), t414), t415)
  prenex_right_forall_fv_c.set(@tactics.prove(@term_syntax.parse_term("FV(op_minus_minus_gt((p : Form), op_bang_bang((x : Num), (q : Form)))) == FV(op_bang_bang(VARIANT(UNION(FV(p), FV(op_bang_bang(x, q)))), op_minus_minus_gt(p, formsubst(valmod((x, V(VARIANT(UNION(FV(p), FV(op_bang_bang(x, q)))))), V), q))))"), t416))
}

///|
let prenex_right_forall_fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_FORALL_FV")

///|
/// `PRENEX_RIGHT_FORALL_FV`
pub fn prenex_right_forall_fv() -> @kernel.Thm {
  prenex_right_forall_fv_c.get()
}

///|
/// PRENEX_RIGHT_EXISTS_FV
fn step_32() -> Unit raise {
  let t417 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("DELETE(UNION((s : (_) -> Bool), (t : (_) -> Bool)), (x : _)) == UNION(DELETE(s, x), DELETE(t, x))"), t417)
  let t420 = @meson.meson_tac(@list.List([]))
  let t419 = @simp.rewrite_tac(@list.List([@sets.extension(), @fol.fv(), @fol.fv_exists(), @sets.in_union(), @sets.in_delete()]))
  let t418 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("op_minus_minus_gt((p : Form), op_q_q((x : Num), (q : Form)))"), @fol.variant_thm()))
  let t421 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fv(), @fol.fv_exists(), @fol.formsubst_rename(), lemma])), t418), t419), t420)
  prenex_right_exists_fv_c.set(@tactics.prove(@term_syntax.parse_term("FV(op_minus_minus_gt((p : Form), op_q_q((x : Num), (q : Form)))) == FV(op_q_q(VARIANT(UNION(FV(p), FV(op_q_q(x, q)))), op_minus_minus_gt(p, formsubst(valmod((x, V(VARIANT(UNION(FV(p), FV(op_q_q(x, q)))))), V), q))))"), t421))
}

///|
let prenex_right_exists_fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_EXISTS_FV")

///|
/// `PRENEX_RIGHT_EXISTS_FV`
pub fn prenex_right_exists_fv() -> @kernel.Thm {
  prenex_right_exists_fv_c.get()
}

///|
/// PRENEX_LEFT_FORALL_FV
fn step_33() -> Unit raise {
  let t422 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("DELETE(UNION((s : (_) -> Bool), (t : (_) -> Bool)), (x : _)) == UNION(DELETE(s, x), DELETE(t, x))"), t422)
  let t425 = @meson.meson_tac(@list.List([]))
  let t424 = @simp.rewrite_tac(@list.List([@sets.extension(), @fol.fv(), @fol.fv_exists(), @sets.in_union(), @sets.in_delete()]))
  let t423 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("op_minus_minus_gt(op_bang_bang((x : Num), (p : Form)), (q : Form))"), @fol.variant_thm()))
  let t426 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fv(), @fol.fv_exists(), @fol.formsubst_rename(), lemma])), t423), t424), t425)
  prenex_left_forall_fv_c.set(@tactics.prove(@term_syntax.parse_term("FV(op_minus_minus_gt(op_bang_bang((x : Num), (p : Form)), (q : Form))) == FV(op_q_q(VARIANT(UNION(FV(op_bang_bang(x, p)), FV(q))), op_minus_minus_gt(formsubst(valmod((x, V(VARIANT(UNION(FV(op_bang_bang(x, p)), FV(q))))), V), p), q)))"), t426))
}

///|
let prenex_left_forall_fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_FORALL_FV")

///|
/// `PRENEX_LEFT_FORALL_FV`
pub fn prenex_left_forall_fv() -> @kernel.Thm {
  prenex_left_forall_fv_c.get()
}

///|
/// PRENEX_LEFT_EXISTS_FV
fn step_34() -> Unit raise {
  let t427 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("DELETE(UNION((s : (_) -> Bool), (t : (_) -> Bool)), (x : _)) == UNION(DELETE(s, x), DELETE(t, x))"), t427)
  let t430 = @meson.meson_tac(@list.List([]))
  let t429 = @simp.rewrite_tac(@list.List([@sets.extension(), @fol.fv(), @fol.fv_exists(), @sets.in_union(), @sets.in_delete()]))
  let t428 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("op_minus_minus_gt(op_q_q((x : Num), (p : Form)), (q : Form))"), @fol.variant_thm()))
  let t431 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fv(), @fol.fv_exists(), @fol.formsubst_rename(), lemma])), t428), t429), t430)
  prenex_left_exists_fv_c.set(@tactics.prove(@term_syntax.parse_term("FV(op_minus_minus_gt(op_q_q((x : Num), (p : Form)), (q : Form))) == FV(op_bang_bang(VARIANT(UNION(FV(op_q_q(x, p)), FV(q))), op_minus_minus_gt(formsubst(valmod((x, V(VARIANT(UNION(FV(op_q_q(x, p)), FV(q))))), V), p), q)))"), t431))
}

///|
let prenex_left_exists_fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_EXISTS_FV")

///|
/// `PRENEX_LEFT_EXISTS_FV`
pub fn prenex_left_exists_fv() -> @kernel.Thm {
  prenex_left_exists_fv_c.get()
}

///|
/// PRENEX_RIGHT_FORALL_LANGUAGE
fn step_35() -> Unit raise {
  let t432 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@pair.pair_eq(), @fol.language_1()]))(@fol.formsubst_language_rename())]))
  let t433 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.language_1(), @fol.functions_form(), @fol.predicates_form()])), t432)
  prenex_right_forall_language_c.set(@tactics.prove(@term_syntax.parse_term("language({op_minus_minus_gt((p : Form), op_bang_bang((x : Num), (q : Form)))}) == language({op_bang_bang(VARIANT(UNION(FV(p), FV(op_bang_bang(x, q)))), op_minus_minus_gt(p, formsubst(valmod((x, V(VARIANT(UNION(FV(p), FV(op_bang_bang(x, q)))))), V), q)))})"), t433))
}

///|
let prenex_right_forall_language_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_FORALL_LANGUAGE")

///|
/// `PRENEX_RIGHT_FORALL_LANGUAGE`
pub fn prenex_right_forall_language() -> @kernel.Thm {
  prenex_right_forall_language_c.get()
}

///|
/// PRENEX_RIGHT_EXISTS_LANGUAGE
fn step_36() -> Unit raise {
  let t434 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@pair.pair_eq(), @fol.language_1()]))(@fol.formsubst_language_rename())]))
  let t435 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.language_1(), @fol.functions_form(), @fol.predicates_form(), @fol.exists_def(), @fol.not_def(), @sets.union_empty()])), t434)
  prenex_right_exists_language_c.set(@tactics.prove(@term_syntax.parse_term("language({op_minus_minus_gt((p : Form), op_q_q((x : Num), (q : Form)))}) == language({op_q_q(VARIANT(UNION(FV(p), FV(op_q_q(x, q)))), op_minus_minus_gt(p, formsubst(valmod((x, V(VARIANT(UNION(FV(p), FV(op_q_q(x, q)))))), V), q)))})"), t435))
}

///|
let prenex_right_exists_language_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_EXISTS_LANGUAGE")

///|
/// `PRENEX_RIGHT_EXISTS_LANGUAGE`
pub fn prenex_right_exists_language() -> @kernel.Thm {
  prenex_right_exists_language_c.get()
}

///|
/// PRENEX_LEFT_FORALL_LANGUAGE
fn step_37() -> Unit raise {
  let t436 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@pair.pair_eq(), @fol.language_1()]))(@fol.formsubst_language_rename())]))
  let t437 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.language_1(), @fol.functions_form(), @fol.predicates_form(), @fol.exists_def(), @fol.not_def(), @sets.union_empty()])), t436)
  prenex_left_forall_language_c.set(@tactics.prove(@term_syntax.parse_term("language({op_minus_minus_gt(op_bang_bang((x : Num), (p : Form)), (q : Form))}) == language({op_q_q(VARIANT(UNION(FV(op_bang_bang(x, p)), FV(q))), op_minus_minus_gt(formsubst(valmod((x, V(VARIANT(UNION(FV(op_bang_bang(x, p)), FV(q))))), V), p), q))})"), t437))
}

///|
let prenex_left_forall_language_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_FORALL_LANGUAGE")

///|
/// `PRENEX_LEFT_FORALL_LANGUAGE`
pub fn prenex_left_forall_language() -> @kernel.Thm {
  prenex_left_forall_language_c.get()
}

///|
/// PRENEX_LEFT_EXISTS_LANGUAGE
fn step_38() -> Unit raise {
  let t438 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@pair.pair_eq(), @fol.language_1()]))(@fol.formsubst_language_rename())]))
  let t439 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.language_1(), @fol.functions_form(), @fol.predicates_form(), @fol.exists_def(), @fol.not_def(), @sets.union_empty()])), t438)
  prenex_left_exists_language_c.set(@tactics.prove(@term_syntax.parse_term("language({op_minus_minus_gt(op_q_q((x : Num), (p : Form)), (q : Form))}) == language({op_bang_bang(VARIANT(UNION(FV(op_q_q(x, p)), FV(q))), op_minus_minus_gt(formsubst(valmod((x, V(VARIANT(UNION(FV(op_q_q(x, p)), FV(q))))), V), p), q))})"), t439))
}

///|
let prenex_left_exists_language_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_EXISTS_LANGUAGE")

///|
/// `PRENEX_LEFT_EXISTS_LANGUAGE`
pub fn prenex_left_exists_language() -> @kernel.Thm {
  prenex_left_exists_language_c.get()
}

///|
/// PRENEX_LEMMA_FORALL
fn step_39() -> Unit raise {
  let t441 = @simp.asm_simp_tac(@list.List([@fol.holds_v1()]))
  let t440 = @simp.asm_rewrite_tac(@list.List([@fol.fv(), @fol.functions_form(), @fol.predicates_form()]))
  let t442 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.language_1(), @pair.pair_eq()])), @tactics.strip_tac), t440), t441)
  prenex_lemma_forall_c.set(@tactics.prove(@term_syntax.parse_term("(P : Bool) && FV((r1 : Form)) == FV((r2 : Form)) && language({r1}) == language({r2}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, (p : Form)) == holds(M, v, (q : Form))) → P && FV(op_bang_bang((z : Num), r1)) == FV(op_bang_bang(z, r2)) && language({op_bang_bang(z, r1)}) == language({op_bang_bang(z, r2)}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, op_bang_bang((x : Num), p)) == holds(M, v, op_bang_bang(x, q)))"), t442))
}

///|
let prenex_lemma_forall_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEMMA_FORALL")

///|
/// `PRENEX_LEMMA_FORALL`
pub fn prenex_lemma_forall() -> @kernel.Thm {
  prenex_lemma_forall_c.get()
}

///|
/// PRENEX_LEMMA_EXISTS
fn step_40() -> Unit raise {
  let t445 = @simp.asm_rewrite_tac(@list.List([@fol.exists_def(), @fol.not_def(), @fol.functions_form(), @fol.predicates_form()]))
  let t444 = @simp.asm_simp_tac(@list.List([@fol.holds_v1()]))
  let t443 = @simp.asm_rewrite_tac(@list.List([@fol.fv(), @fol.fv_exists()]))
  let t446 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.language_1(), @pair.pair_eq()])), @tactics.strip_tac), t443), t444), t445)
  prenex_lemma_exists_c.set(@tactics.prove(@term_syntax.parse_term("(P : Bool) && FV((r1 : Form)) == FV((r2 : Form)) && language({r1}) == language({r2}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, (p : Form)) == holds(M, v, (q : Form))) → P && FV(op_q_q((z : Num), r1)) == FV(op_q_q(z, r2)) && language({op_q_q(z, r1)}) == language({op_q_q(z, r2)}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, op_q_q((x : Num), p)) == holds(M, v, op_q_q(x, q)))"), t446))
}

///|
let prenex_lemma_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEMMA_EXISTS")

///|
/// `PRENEX_LEMMA_EXISTS`
pub fn prenex_lemma_exists() -> @kernel.Thm {
  prenex_lemma_exists_c.get()
}

///|
/// PRENEX_RIGHT_THM
fn step_41() -> Unit raise {
  let t472 = @simp.asm_rewrite_tac(@list.List([size_v1()]))
  let t471 = @tactics.disch_then(fn(x470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x467 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s468 = @tactics.subst_all_tac(x467)
      fn(x469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s468(x469)
      }
    })(@equal.sym(x470))
  })
  let t466 = @tactics.undisch_tac(@term_syntax.parse_term("size((q : Form)) == (n : Num)"))
  let t465 = @simp.rewrite_tac(@list.List([prenex_formsubst(), size_formsubst()]))
  let t464 = @tactics.exists_tac(@term_syntax.parse_term("size((p' : Form))"))
  let t463 = @tactics.first_assum(@tactics.match_mp_tac)
  let t462 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()])))
  let t460 = @tactics.match_mp_tac(prenex_lemma_exists())
  let t461 = @list.List([@tactics.match_mp_tac(prenex_lemma_forall()), t460])
  let t459 = @simp.rewrite_tac(@list.List([prenex_right_exists_fv(), prenex_right_exists_language()]))
  let t458 = @simp.rewrite_tac(@list.List([prenex_right_forall_fv(), prenex_right_forall_language()]))
  let t457 = @simp.simp_tac(@list.List([prenex_right_forall(), prenex_right_exists()]))
  let t456 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), prenex()]))
  let t455 = @simp.asm_rewrite_tac(@list.List([prenex_right()]))
  let t454 = @list.List([@simp.asm_simp_tac(@list.List([prenex_right(), prenex()])), @tactics.all_tac, @tactics.all_tac])
  let t451 = @simp.gen_rewrite_rule(fn(x450 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x450
  }, @list.List([prenex_cases()]))
  let t453 = @tactics.first_x_assum(fn(x452 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t451(x452))
  })
  let t449 = @tactics.match_mp_tac(@arith.num_wf())
  let t473 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, qfree(p) → (∀ n : Num, ∀ q : Form, prenex(q) && size(q) == n → prenex(Prenex_right(p, q)) && FV(Prenex_right(p, q)) == FV(op_minus_minus_gt(p, q)) && language({Prenex_right(p, q)}) == language({op_minus_minus_gt(p, q)}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, Prenex_right(p, q)) == holds(M, v, op_minus_minus_gt(p, q))))"), fn(x447 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x447
    @meson.meson_tac(@list.List([th]))
  }), @tactics.gen_tac), @tactics.disch_tac), t449), @tactics.gen_tac), @tactics.disch_tac), @tactics.gen_tac), @tactics.strip_tac), t453), t454), t455), t456), t457), t458), t459), t461), t462), t463), t464), t465), t466), t471), t472), @int.arith_tac)
  prenex_right_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, qfree(p) && prenex(q) → prenex(Prenex_right(p, q)) && FV(Prenex_right(p, q)) == FV(op_minus_minus_gt(p, q)) && language({Prenex_right(p, q)}) == language({op_minus_minus_gt(p, q)}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, Prenex_right(p, q)) == holds(M, v, op_minus_minus_gt(p, q)))"), t473))
}

///|
let prenex_right_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_RIGHT_THM")

///|
/// `PRENEX_RIGHT_THM`
pub fn prenex_right_thm() -> @kernel.Thm {
  prenex_right_thm_c.get()
}

///|
/// PRENEX_LEFT_THM
fn step_42() -> Unit raise {
  let t501 = @simp.asm_rewrite_tac(@list.List([size_v1()]))
  let t500 = @tactics.disch_then(fn(x499 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s497 = @tactics.subst_all_tac(x496)
      fn(x498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s497(x498)
      }
    })(@equal.sym(x499))
  })
  let t495 = @tactics.undisch_tac(@term_syntax.parse_term("size((p : Form)) == (n : Num)"))
  let t494 = @simp.rewrite_tac(@list.List([prenex_formsubst(), size_formsubst()]))
  let t493 = @tactics.exists_tac(@term_syntax.parse_term("size((p' : Form))"))
  let t492 = @tactics.first_assum(@tactics.match_mp_tac)
  let t491 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()])))
  let t489 = @tactics.match_mp_tac(prenex_lemma_forall())
  let t490 = @list.List([@tactics.match_mp_tac(prenex_lemma_exists()), t489])
  let t488 = @simp.rewrite_tac(@list.List([prenex_left_exists_fv(), prenex_left_exists_language()]))
  let t487 = @simp.rewrite_tac(@list.List([prenex_left_forall_fv(), prenex_left_forall_language()]))
  let t486 = @simp.simp_tac(@list.List([prenex_left_forall(), prenex_left_exists()]))
  let t485 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), prenex()]))
  let t484 = @simp.asm_rewrite_tac(@list.List([prenex_left()]))
  let t482 = @simp.asm_rewrite_tac(@list.List([]))
  let t481 = @tactics.match_mp_tac(prenex_right_thm())
  let t483 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([prenex_left(), prenex()])), t481), t482), @tactics.all_tac, @tactics.all_tac])
  let t478 = @simp.gen_rewrite_rule(fn(x477 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x477
  }, @list.List([prenex_cases()]))
  let t480 = @tactics.first_x_assum(fn(x479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t478(x479))
  })
  let t476 = @tactics.match_mp_tac(@arith.num_wf())
  let t502 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ q : Form, prenex(q) → (∀ n : Num, ∀ p : Form, prenex(p) && size(p) == n → prenex(Prenex_left(p, q)) && FV(Prenex_left(p, q)) == FV(op_minus_minus_gt(p, q)) && language({Prenex_left(p, q)}) == language({op_minus_minus_gt(p, q)}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, Prenex_left(p, q)) == holds(M, v, op_minus_minus_gt(p, q))))"), fn(x474 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x474
    @meson.meson_tac(@list.List([th]))
  }), @tactics.gen_tac), @tactics.disch_tac), t476), @tactics.gen_tac), @tactics.disch_tac), @tactics.gen_tac), @tactics.strip_tac), t480), t483), t484), t485), t486), t487), t488), t490), t491), t492), t493), t494), t495), t500), t501), @int.arith_tac)
  prenex_left_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, prenex(p) && prenex(q) → prenex(Prenex_left(p, q)) && FV(Prenex_left(p, q)) == FV(op_minus_minus_gt(p, q)) && language({Prenex_left(p, q)}) == language({op_minus_minus_gt(p, q)}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, Prenex_left(p, q)) == holds(M, v, op_minus_minus_gt(p, q)))"), t502))
}

///|
let prenex_left_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_LEFT_THM")

///|
/// `PRENEX_LEFT_THM`
pub fn prenex_left_thm() -> @kernel.Thm {
  prenex_left_thm_c.get()
}

///|
/// PRENEX_THM
fn step_43() -> Unit raise {
  let t508 = @meson.meson_tac(@list.List([]))
  let t507 = @simp.rewrite_tac(@list.List([@fol.functions_form(), @fol.predicates_form()]))
  let t506 = @simp.rewrite_tac(@list.List([@fol.holds_v1(), @fol.fv(), @fol.language_1(), @pair.pair_eq()]))
  let t505 = @tactics.mp_tac(prenex_left_thm())
  let t504 = @simp.rewrite_tac(@list.List([@fol.holds_v1()]))
  let t503 = @simp.rewrite_tac(@list.List([prenex(), prenex_def()]))
  let t509 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induction()), t503), t504), t505), t506), t507), t508)
  prenex_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, prenex(Prenex(p)) && FV(Prenex(p)) == FV(p) && language({Prenex(p)}) == language({p}) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, !(Dom(M) == {}) → holds(M, v, Prenex(p)) == holds(M, v, p))"), t509))
}

///|
let prenex_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRENEX_THM")

///|
/// `PRENEX_THM`
pub fn prenex_thm() -> @kernel.Thm {
  prenex_thm_c.get()
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
}
