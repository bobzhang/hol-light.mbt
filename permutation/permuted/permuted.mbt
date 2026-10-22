// Translated from upstream Permutation/permuted.ml; edit this file directly.

///|
/// Permutation/permuted.ml:13
fn step_1() -> Unit raise {
  @printer.parse_as_infix("PERMUTED", (12L, "right"))
}

///|
let permuted_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_RULES")

///|
/// `PERMUTED_RULES`
pub fn permuted_rules() -> @kernel.Thm {
  permuted_rules_c.get()
}

///|
let permuted_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_INDUCT")

///|
/// `PERMUTED_INDUCT`
pub fn permuted_induct() -> @kernel.Thm {
  permuted_induct_c.get()
}

///|
let permuted_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_CASES")

///|
/// `PERMUTED_CASES`
pub fn permuted_cases() -> @kernel.Thm {
  permuted_cases_c.get()
}

///|
/// PERMUTED_RULES, PERMUTED_INDUCT, PERMUTED_CASES
fn step_2() -> Unit raise {
  let (permuted_rules, permuted_induct, permuted_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(PERMUTED : (List[_], List[_]) -> Bool)(NIL, NIL) && (∀ h : _, ∀ t1 : List[_], ∀ t2 : List[_], PERMUTED(t1, t2) → PERMUTED(CONS(h, t1), CONS(h, t2))) && (∀ l1 : List[_], ∀ l2 : List[_], ∀ l3 : List[_], PERMUTED(l1, l2) && PERMUTED(l2, l3) → PERMUTED(l1, l3)) && (∀ x : _, ∀ y : _, ∀ t : List[_], PERMUTED(CONS(x, CONS(y, t)), CONS(y, CONS(x, t))))"))
  permuted_rules_c.set(permuted_rules)
  permuted_induct_c.set(permuted_induct)
  permuted_cases_c.set(permuted_cases)
}

///|
/// PERMUTED_INDUCT_STRONG
fn step_3() -> Unit raise {
  permuted_induct_strong_c.set(@ind_defs.derive_strong_induction((permuted_rules(), permuted_induct())))
}

///|
let permuted_induct_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_INDUCT_STRONG")

///|
/// `PERMUTED_INDUCT_STRONG`
pub fn permuted_induct_strong() -> @kernel.Thm {
  permuted_induct_strong_c.get()
}

///|
/// PERMUTED_RFL
fn step_4() -> Unit raise {
  let t1 = @tactics.then_tac(@lists.list_induct_tac, @simp.asm_simp_tac(@list.List([permuted_rules()])))
  permuted_rfl_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[_], PERMUTED(l, l)"), t1))
}

///|
let permuted_rfl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_RFL")

///|
/// `PERMUTED_RFL`
pub fn permuted_rfl() -> @kernel.Thm {
  permuted_rfl_c.get()
}

///|
/// PERMUTED_SYM
fn step_5() -> Unit raise {
  let t3 = @meson.asm_meson_tac(@list.List([permuted_rules()]))
  let t2 = @tactics.match_mp_tac(permuted_induct())
  let t4 = @tactics.then_tac(@tactics.then_tac(@morelist.suffice_tac(@list.List([]), @term_syntax.parse_term("∀ xs : List[A], ∀ l2 : List[A], PERMUTED(xs, l2) → PERMUTED(l2, xs)")), t2), t3)
  permuted_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ xs : List[A], ∀ l2 : List[A], PERMUTED(xs, l2) == PERMUTED(l2, xs)"), t4))
}

///|
let permuted_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_SYM")

///|
/// `PERMUTED_SYM`
pub fn permuted_sym() -> @kernel.Thm {
  permuted_sym_c.get()
}

///|
/// PERMUTED_TRS
fn step_6() -> Unit raise {
  let t5 = @meson.meson_tac(@list.List([permuted_rules()]))
  permuted_trs_c.set(@tactics.prove(@term_syntax.parse_term("∀ xs : List[_], ∀ l2 : List[_], ∀ l3 : List[_], PERMUTED(xs, l2) && PERMUTED(l2, l3) → PERMUTED(xs, l3)"), t5))
}

///|
let permuted_trs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_TRS")

///|
/// `PERMUTED_TRS`
pub fn permuted_trs() -> @kernel.Thm {
  permuted_trs_c.get()
}

///|
/// `PERMUTED_TRS_TAC`
pub fn permuted_trs_tac(x6 : @kernel.Term) -> @tactics.Tactic raise {
  let tm = x6
  let t8 = @tactics.exists_tac(tm)
  @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(permuted_trs()), t8), @tactics.conj_tac)
}

///|
/// PERMUTED_TAIL_IMP
fn step_7() -> Unit raise {
  let t9 = @simp.simp_tac(@list.List([permuted_rules()]))
  permuted_tail_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ h : _, ∀ t1 : List[_], ∀ t2 : List[_], PERMUTED(t1, t2) → PERMUTED(CONS(h, t1), CONS(h, t2))"), t9))
}

///|
let permuted_tail_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_TAIL_IMP")

///|
/// `PERMUTED_TAIL_IMP`
pub fn permuted_tail_imp() -> @kernel.Thm {
  permuted_tail_imp_c.get()
}

///|
/// PERMUTED_MAP
fn step_8() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([@lists.map(), permuted_rules()]))
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(permuted_induct())), t10)
  permuted_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ l1 : List[_], ∀ l2 : List[_], PERMUTED(l1, l2) → PERMUTED(MAP(f, l1), MAP(f, l2))"), t11))
}

///|
let permuted_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_MAP")

///|
/// `PERMUTED_MAP`
pub fn permuted_map() -> @kernel.Thm {
  permuted_map_c.get()
}

///|
/// PERMUTED_LENGTH
fn step_9() -> Unit raise {
  let t13 = @simp.asm_rewrite_tac(@list.List([@lists.length()]))
  let t12 = @tactics.repeat_tac(@tactics.strip_tac)
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(permuted_induct()), t12), t13)
  permuted_length_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], PERMUTED(l1, l2) → LENGTH(l1) == LENGTH(l2)"), t14))
}

///|
let permuted_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_LENGTH")

///|
/// `PERMUTED_LENGTH`
pub fn permuted_length() -> @kernel.Thm {
  permuted_length_c.get()
}

///|
/// PERMUTED_SWAP_HEAD
fn step_10() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([permuted_rules()]))
  permuted_swap_head_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : _, ∀ b : _, ∀ l : List[_], PERMUTED(CONS(a, CONS(b, l)), CONS(b, CONS(a, l)))"), t15))
}

///|
let permuted_swap_head_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_SWAP_HEAD")

///|
/// `PERMUTED_SWAP_HEAD`
pub fn permuted_swap_head() -> @kernel.Thm {
  permuted_swap_head_c.get()
}

///|
/// PERMUTED_MEM
fn step_11() -> Unit raise {
  let t19 = @meson.meson_tac(@list.List([]))
  let t18 = @simp.asm_rewrite_tac(@list.List([]))
  let t17 = @tactics.repeat_tac(@tactics.strip_tac)
  let t16 = @simp.rewrite_tac(@list.List([@lists.mem()]))
  let t20 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(permuted_induct())), t16), t17), t18), t19)
  permuted_mem_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : A, ∀ l1 : List[A], ∀ l2 : List[A], PERMUTED(l1, l2) → MEM(a, l1) == MEM(a, l2)"), t20))
}

///|
let permuted_mem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_MEM")

///|
/// `PERMUTED_MEM`
pub fn permuted_mem() -> @kernel.Thm {
  permuted_mem_c.get()
}

///|
/// PERMUTED_ALL
fn step_12() -> Unit raise {
  let t24 = @meson.meson_tac(@list.List([]))
  let t23 = @simp.asm_simp_tac(@list.List([]))
  let t22 = @tactics.repeat_tac(@tactics.strip_tac)
  let t21 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(permuted_induct())), t21), t22), t23), t24)
  permuted_all_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ xs : List[_], ∀ ys : List[_], PERMUTED(xs, ys) → ALL(P, xs) == ALL(P, ys)"), t25))
}

///|
let permuted_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_ALL")

///|
/// `PERMUTED_ALL`
pub fn permuted_all() -> @kernel.Thm {
  permuted_all_c.get()
}

///|
/// PERMUTED_NIL_EQ_NIL
fn step_13() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([permuted_length(), @lists.length(), @nums.not_suc()]))
  let t26 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil(), permuted_rfl()]))
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@morelist.suffice_tac(@list.List([permuted_sym()]), @term_syntax.parse_term("∀ l : List[A], PERMUTED(NIL, l) == (l == NIL)")), @morelist.list_cases_tac), t26), t27)
  permuted_nil_eq_nil_c.set(@tactics.prove(@term_syntax.parse_term("(∀ l : List[A], PERMUTED(NIL, l) == (l == NIL)) && (∀ l : List[A], PERMUTED(l, NIL) == (l == NIL))"), t28))
}

///|
let permuted_nil_eq_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_NIL_EQ_NIL")

///|
/// `PERMUTED_NIL_EQ_NIL`
pub fn permuted_nil_eq_nil() -> @kernel.Thm {
  permuted_nil_eq_nil_c.get()
}

///|
/// PERMUTED_SINGLETON
fn step_14() -> Unit raise {
  let t30 = @simp.simp_tac(@list.List([permuted_nil_eq_nil(), @lists.length(), @lists.not_cons_nil(), @lists.cons_11(), @nums.suc_inj(), @equal.gsym(@lists.length_eq_nil())]))
  let t29 = @tactics.match_mp_tac(permuted_induct())
  let t31 = @tactics.then_tac(@tactics.then_tac(@morelist.suffice_tac(@list.List([permuted_length(), permuted_rfl()]), @term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], PERMUTED(l1, l2) → LENGTH(l1) == LENGTH(l2) && (∀ x : A, (l1 == [x]) == (l2 == [x]))")), t29), t30)
  permuted_singleton_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : A, ∀ l : List[A], PERMUTED([x], l) == (l == [x])) && (∀ x : A, ∀ l : List[A], PERMUTED(l, [x]) == (l == [x]))"), t31))
}

///|
let permuted_singleton_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_SINGLETON")

///|
/// `PERMUTED_SINGLETON`
pub fn permuted_singleton() -> @kernel.Thm {
  permuted_singleton_c.get()
}

///|
/// PERMUTED_CONS_DELETE1
fn step_15() -> Unit raise {
  let t33 = @meson.asm_meson_tac(@list.List([permuted_rfl(), permuted_tail_imp(), permuted_swap_head(), permuted_trs()]))
  let t32 = @simp.rewrite_tac(@list.List([@lists.mem(), @morelist.delete1()]))
  let t34 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t32), @class.cond_cases_tac), t33)
  permuted_cons_delete1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : A, ∀ l : List[A], MEM(a, l) → PERMUTED(l, CONS(a, DELETE1(a, l)))"), t34))
}

///|
let permuted_cons_delete1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_CONS_DELETE1")

///|
/// `PERMUTED_CONS_DELETE1`
pub fn permuted_cons_delete1() -> @kernel.Thm {
  permuted_cons_delete1_c.get()
}

///|
/// PERMUTED_COUNT
fn step_16() -> Unit raise {
  let iff_expand = @meson.meson(@list.List([]), @term_syntax.parse_term("((p : Bool) == (q : Bool)) == ((p → q) && (q → p))"))
  let t61 = @meson.asm_meson_tac(@list.List([permuted_cons_delete1(), permuted_sym(), permuted_trs()]))
  let t57 = @term_syntax.parse_term("(x : A)")
  let t60 = @tactics.first_x_assum(fn(x59 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x54 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s55 = @tactics.mp_tac(x54)
      fn(x56 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s55(x56)
      }
    })(((x58 : @kernel.Thm) => @bool.spec(t57, x58))(x59))
  })
  let t53 = @simp.asm_rewrite_tac(@list.List([@morelist.count_delete1()]))
  let t52 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t62 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(permuted_tail_imp()), t52), t53), @tactics.gen_tac), t60), @int.arith_tac), t61])
  let t51 = @morelist.assert_tac(@term_syntax.parse_term("PERMUTED(CONS((h : A), (t : List[A])), CONS(h, DELETE1(h, (l2 : List[A]))))"))
  let t49 = @simp.rewrite_tac(@list.List([@morelist.mem_count()]))
  let t46 = @term_syntax.parse_term("(h : A)")
  let t50 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s44 = @tactics.mp_tac(x43)
      fn(x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s44(x45)
      }
    })(((x47 : @kernel.Thm) => @bool.spec(t46, x47))(x48))
  }), t49), @int.arith_tac), @tactics.all_tac])
  let t42 = @morelist.assert_tac(@term_syntax.parse_term("MEM((h : A), (l2 : List[A]))"))
  let t41 = @tactics.repeat_tac(@tactics.strip_tac)
  let t39 = @meson.meson_tac(@list.List([@nums.not_suc()]))
  let t40 = @list.List([@tactics.then_tac(@tactics.then_tac(@morelist.list_cases_tac, @simp.rewrite_tac(@list.List([@morelist.count(), @lists.not_cons_nil()]))), t39), @tactics.all_tac])
  let t38 = @simp.rewrite_tac(@list.List([@morelist.count(), permuted_nil_eq_nil()]))
  let t36 = @meson.asm_meson_tac(@list.List([]))
  let t35 = @simp.rewrite_tac(@list.List([@morelist.count()]))
  let t37 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(permuted_induct()), t35), t36), @tactics.all_tac])
  let t63 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([iff_expand, @theorems.forall_and_thm()])), @tactics.conj_tac), t37), @lists.list_induct_tac), t38), t40), t41), t42), t50), t51), t62)
  permuted_count_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], PERMUTED(l1, l2) == (∀ x : A, COUNT(x, l1) == COUNT(x, l2))"), t63))
}

///|
let permuted_count_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_COUNT")

///|
/// `PERMUTED_COUNT`
pub fn permuted_count() -> @kernel.Thm {
  permuted_count_c.get()
}

///|
/// PERMUTED_TAIL
fn step_17() -> Unit raise {
  let t65 = @meson.meson_tac(@list.List([@nums.suc_inj()]))
  let t64 = @simp.rewrite_tac(@list.List([permuted_count(), @morelist.count()]))
  let t66 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t64), t65)
  permuted_tail_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ t1 : List[_], ∀ t2 : List[_], PERMUTED(CONS(x, t1), CONS(x, t2)) == PERMUTED(t1, t2)"), t66))
}

///|
let permuted_tail_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_TAIL")

///|
/// `PERMUTED_TAIL`
pub fn permuted_tail() -> @kernel.Thm {
  permuted_tail_c.get()
}

///|
/// PERMUTED_DELETE1_L
fn step_18() -> Unit raise {
  let t67 = @meson.meson_tac(@list.List([permuted_mem(), @lists.mem(), permuted_tail(), permuted_cons_delete1(), permuted_sym(), permuted_trs()]))
  permuted_delete1_l_c.set(@tactics.prove(@term_syntax.parse_term("∀ h : A, ∀ t : List[A], ∀ l : List[A], PERMUTED(CONS(h, t), l) == (MEM(h, l) && PERMUTED(t, DELETE1(h, l)))"), t67))
}

///|
let permuted_delete1_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_DELETE1_L")

///|
/// `PERMUTED_DELETE1_L`
pub fn permuted_delete1_l() -> @kernel.Thm {
  permuted_delete1_l_c.get()
}

///|
/// PERMUTED_DELETE1_R
fn step_19() -> Unit raise {
  let t68 = @meson.meson_tac(@list.List([permuted_sym(), permuted_delete1_l()]))
  permuted_delete1_r_c.set(@tactics.prove(@term_syntax.parse_term("∀ h : A, ∀ t : List[A], ∀ l : List[A], PERMUTED(l, CONS(h, t)) == (MEM(h, l) && PERMUTED(DELETE1(h, l), t))"), t68))
}

///|
let permuted_delete1_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_DELETE1_R")

///|
/// `PERMUTED_DELETE1_R`
pub fn permuted_delete1_r() -> @kernel.Thm {
  permuted_delete1_r_c.get()
}

///|
/// PERMUTED_LIST_UNIQ
fn step_20() -> Unit raise {
  let t69 = @simp.simp_tac(@list.List([permuted_count(), @morelist.list_uniq_count(), @morelist.mem_count()]))
  permuted_list_uniq_c.set(@tactics.prove(@term_syntax.parse_term("∀ xs : List[_], ∀ ys : List[_], PERMUTED(xs, ys) → LIST_UNIQ(xs) == LIST_UNIQ(ys)"), t69))
}

///|
let permuted_list_uniq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_LIST_UNIQ")

///|
/// `PERMUTED_LIST_UNIQ`
pub fn permuted_list_uniq() -> @kernel.Thm {
  permuted_list_uniq_c.get()
}

///|
/// PERMUTED_IMP_PAIRWISE
fn step_21() -> Unit raise {
  let t72 = @meson.meson_tac(@list.List([permuted_all()]))
  let t71 = @simp.asm_simp_tac(@list.List([@lists.pairwise(), @lists.all()]))
  let t70 = @tactics.match_mp_tac(permuted_induct_strong())
  let t73 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), t70), t71), t72)
  permuted_imp_pairwise_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (A, A) -> Bool, ∀ l : List[A], ∀ l' : List[A], (∀ x : A, ∀ y : A, P(x, y) → P(y, x)) && PERMUTED(l, l') && PAIRWISE(P, l) → PAIRWISE(P, l')"), t73))
}

///|
let permuted_imp_pairwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_IMP_PAIRWISE")

///|
/// `PERMUTED_IMP_PAIRWISE`
pub fn permuted_imp_pairwise() -> @kernel.Thm {
  permuted_imp_pairwise_c.get()
}

///|
/// PERMUTED_PAIRWISE
fn step_22() -> Unit raise {
  let t74 = @meson.meson_tac(@list.List([permuted_imp_pairwise(), permuted_sym()]))
  permuted_pairwise_c.set(@tactics.prove(@parser.parse_term("forall(P:A->A->bool) l l.\n        (forall x y. P x y ==> P y x) /\\ l PERMUTED l'\n        ==> (PAIRWISE P l <=> PAIRWISE P l')"), t74))
}

///|
let permuted_pairwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_PAIRWISE")

///|
/// `PERMUTED_PAIRWISE`
pub fn permuted_pairwise() -> @kernel.Thm {
  permuted_pairwise_c.get()
}

///|
/// PERMUTED_APPEND_SWAP
fn step_23() -> Unit raise {
  let t75 = @tactics.then_tac(@simp.rewrite_tac(@list.List([permuted_count(), @morelist.count_append()])), @int.arith_tac)
  permuted_append_swap_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], PERMUTED(APPEND(l1, l2), APPEND(l2, l1))"), t75))
}

///|
let permuted_append_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_APPEND_SWAP")

///|
/// `PERMUTED_APPEND_SWAP`
pub fn permuted_append_swap() -> @kernel.Thm {
  permuted_append_swap_c.get()
}

///|
/// PERMUTED_APPEND_LCANCEL
fn step_24() -> Unit raise {
  let t76 = @tactics.then_tac(@lists.list_induct_tac, @simp.asm_rewrite_tac(@list.List([@lists.append(), permuted_tail()])))
  permuted_append_lcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], ∀ l3 : List[A], PERMUTED(APPEND(l1, l2), APPEND(l1, l3)) == PERMUTED(l2, l3)"), t76))
}

///|
let permuted_append_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_APPEND_LCANCEL")

///|
/// `PERMUTED_APPEND_LCANCEL`
pub fn permuted_append_lcancel() -> @kernel.Thm {
  permuted_append_lcancel_c.get()
}

///|
/// PERMUTED_APPEND_RCANCEL
fn step_25() -> Unit raise {
  let t77 = @meson.meson_tac(@list.List([permuted_append_swap(), permuted_append_lcancel(), permuted_trs(), permuted_sym()]))
  permuted_append_rcancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], ∀ l3 : List[A], PERMUTED(APPEND(l1, l3), APPEND(l2, l3)) == PERMUTED(l1, l2)"), t77))
}

///|
let permuted_append_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_APPEND_RCANCEL")

///|
/// `PERMUTED_APPEND_RCANCEL`
pub fn permuted_append_rcancel() -> @kernel.Thm {
  permuted_append_rcancel_c.get()
}

///|
/// PERMUTED_APPEND_CONG
fn step_26() -> Unit raise {
  let t78 = @meson.meson_tac(@list.List([permuted_append_lcancel(), permuted_append_rcancel(), permuted_trs()]))
  permuted_append_cong_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l1' : List[_], ∀ l2 : List[_], ∀ l2' : List[_], PERMUTED(l1, l1') && PERMUTED(l2, l2') → PERMUTED(APPEND(l1, l2), APPEND(l1', l2'))"), t78))
}

///|
let permuted_append_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERMUTED_APPEND_CONG")

///|
/// `PERMUTED_APPEND_CONG`
pub fn permuted_append_cong() -> @kernel.Thm {
  permuted_append_cong_c.get()
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
}
