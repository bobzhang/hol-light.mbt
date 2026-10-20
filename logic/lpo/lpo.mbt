// Translated from upstream Logic/lpo.ml; edit this file directly.

///|
/// ITLIST_ADD_1_POS
fn step_1() -> Unit raise {
  let t4 = @tactics.pop_assum(fn(x1 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2 = @tactics.mp_tac(x1)
    fn(x3 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2(x3)
    }
  })
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.itlist(), @calc_num.arith()]))), t4), @int.arith_tac)
  itlist_add_1_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[Num], 0 < ITLIST(op_plus, l, 1)"), t5))
}

///|
let itlist_add_1_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST_ADD_1_POS")

///|
/// `ITLIST_ADD_1_POS`
pub fn itlist_add_1_pos() -> @kernel.Thm {
  itlist_add_1_pos_c.get()
}

///|
/// FVT_FUN_EMPTY
fn step_2() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([]))
  let t7 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fvt(), @sets.extension(), @sets.not_in_empty(), @fol.in_list_union(), @lists.mem_map(), @equal.gsym(@lists.ex_mem()), @trivia.o_thm()])), t6)
  fvt_fun_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Num, ∀ a : Term, ∀ args : List[Term], MEM(a, args) && FVT(Fn(f, args)) == {} → FVT(a) == {}"), t7))
}

///|
let fvt_fun_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FVT_FUN_EMPTY")

///|
/// `FVT_FUN_EMPTY`
pub fn fvt_fun_empty() -> @kernel.Thm {
  fvt_fun_empty_c.get()
}

///|
/// NONWF
fn step_3() -> Unit raise {
  nonwf_c.set(@pair.new_definition(@term_syntax.parse_term("(NONWF : ((A, A) -> Bool, A) -> Bool)((R : (A, A) -> Bool), (a : A)) == (∃ s : (Num) -> A, s(0) == a && (∀ n : Num, R(s(SUC(n)), s(n))))")))
}

///|
let nonwf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NONWF")

///|
/// `NONWF`
pub fn nonwf() -> @kernel.Thm {
  nonwf_c.get()
}

///|
/// WF_NONWF
fn step_4() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([]))
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@wf.wf_dchain(), nonwf()])), t8)
  wf_nonwf_v1_c.set(@tactics.prove(@term_syntax.parse_term("WF((R : (_, _) -> Bool)) == (∀ a : _, !NONWF(R, a))"), t9))
}

///|
let wf_nonwf_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_NONWF")

///|
/// `WF_NONWF`
pub fn wf_nonwf_v1() -> @kernel.Thm {
  wf_nonwf_v1_c.get()
}

///|
/// NONWF_SUCCESSOR
fn step_5() -> Unit raise {
  let t22 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n) - 1 == SUC(n - 1)"))]))
  let t21 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t20 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t19 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => if n == 0 { (a : A) } else { (s : (Num) -> A)(n - 1) }"))
  let t18 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : (Num) -> A)"))(@tactics.strip_assume_tac))
  let t17 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s12 = @tactics.mp_tac(x11)
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s12(x13)
    }
  }, fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s15 = @tactics.assume_tac(x14)
    fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s15(x16)
    }
  }))
  let t10 = @simp.rewrite_tac(@list.List([nonwf()]))
  let t23 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t10), t17), t18), t19), t20), @tactics.gen_tac), @class.cond_cases_tac), t21), t22)
  nonwf_successor_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ a : A, ∀ b : A, NONWF(R, b) && R(b, a) → NONWF(R, a)"), t23))
}

///|
let nonwf_successor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NONWF_SUCCESSOR")

///|
/// `NONWF_SUCCESSOR`
pub fn nonwf_successor() -> @kernel.Thm {
  nonwf_successor_c.get()
}

///|
/// WF_NONWF
fn step_6() -> Unit raise {
  let t45 = @simp.asm_rewrite_tac(@list.List([]))
  let t44 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Num) -> A)"))
  let t43 = @simp.rewrite_tac(@list.List([]))
  let t39 = @term_syntax.parse_term("0")
  let t42 = @tactics.disch_then(fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s37 = @tactics.mp_tac(x36)
      fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s37(x38)
      }
    })(((x40 : @kernel.Thm) => @bool.spec(t39, x40))(x41))
  })
  let t35 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s30 = @tactics.assume_tac(x29)
    fn(x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s30(x31)
    }
  }, fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s33 = @tactics.mp_tac(x32)
    fn(x34 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s33(x34)
    }
  }))
  let t28 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t27 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : (Num) -> A)"))(fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s25 = @tactics.mp_tac(x24)
    fn(x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s25(x26)
    }
  }))
  let t46 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@wf.wf_dchain(), nonwf()])), t27), t28), t35), t42), t43), t44), t45)
  wf_nonwf_c.set(@tactics.prove(@term_syntax.parse_term("WF((x : A) => (y : A) => (R : (A, A) -> Bool)(x, y) && !NONWF(R, y))"), t46))
}

///|
let wf_nonwf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_NONWF")

///|
/// `WF_NONWF`
pub fn wf_nonwf() -> @kernel.Thm {
  wf_nonwf_c.get()
}

///|
/// NONWF_INDUCT
fn step_7() -> Unit raise {
  let t49 = @meson.asm_meson_tac(@list.List([nonwf_successor()]))
  let t48 = @simp.rewrite_tac(@list.List([]))
  let t47 = @tactics.match_mp_tac(@drule.match_mp(@bool.eq_imp_rule(@wf.wf_ind()).0)(wf_nonwf()))
  let t50 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t47), t48), t49)
  nonwf_induct_c.set(@tactics.prove(@term_syntax.parse_term("(∀ a : _, !NONWF((R : (_, _) -> Bool), a) && (∀ b : _, R(b, a) → (P : (_) -> Bool)(b)) → P(a)) → (∀ x : _, !NONWF(R, x) → P(x))"), t50))
}

///|
let nonwf_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NONWF_INDUCT")

///|
/// `NONWF_INDUCT`
pub fn nonwf_induct() -> @kernel.Thm {
  nonwf_induct_c.get()
}

///|
/// WF_MINIMAL_STEP
fn step_8() -> Unit raise {
  let t69 = @meson.asm_meson_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1"))]))
  let t68 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t67 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (s : (Num) -> A)(SUC(n))"))
  let t66 = @simp.asm_rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t64 = @term_syntax.parse_term("(s : (Num) -> A)(1)")
  let t65 = @tactics.map_every(fn(x61 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s62 = @tactics.exists_tac(x61)
    fn(x63 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s62(x63)
    }
  }, @list.List([@term_syntax.parse_term("(m : (A) -> Num)((s : (Num) -> A)(1))"), t64]))
  let t60 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : (Num) -> A)"))(@tactics.strip_assume_tac))
  let t59 = @simp.rewrite_tac(@list.List([nonwf()]))
  let t58 = @tactics.pop_assum(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s56 = @tactics.mp_tac(x55)
    fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s56(x57)
    }
  })
  let t54 = @list.List([@meson.meson_tac(@list.List([@arith.not_lt()])), @tactics.all_tac])
  let t53 = @simp.rewrite_tac(@list.List([]))
  let t52 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (c : Bool)) && (a : Bool) → a == b → c")))
  let t51 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) => ∃ c : A, NONWF((R : (A, A) -> Bool), c) && R(c, (a : A)) && (m : (A) -> Num)(c) == n"), @arith.num_wop()))
  let t70 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t51), t52), t53), @tactics.conj_tac), t54), t58), t59), t60), t65), t66), t67), t68), t69)
  wf_minimal_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : (A) -> Num, ∀ a : A, NONWF((R : (A, A) -> Bool), a) → (∃ b : A, NONWF(R, b) && R(b, a) && (∀ c : A, NONWF(R, c) && R(c, a) → m(b) <= m(c)))"), t70))
}

///|
let wf_minimal_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_MINIMAL_STEP")

///|
/// `WF_MINIMAL_STEP`
pub fn wf_minimal_step() -> @kernel.Thm {
  wf_minimal_step_c.get()
}

///|
/// WF_MINIMAL_DCHAIN
fn step_9() -> Unit raise {
  let t115 = @meson.asm_meson_tac(@list.List([]))
  let t114 = @tactics.match_mp_tac(wf_minimal_step())
  let t113 = @tactics.conv_tac(@class.select_conv)
  let t108 = @term_syntax.parse_term("SUC((n : Num))")
  let t111 = @tactics.first_assum(fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s106 = @tactics.subst1_tac(x105)
      fn(x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s106(x107)
      }
    })(((x109 : @kernel.Thm) => @bool.spec(t108, x109))(x110))
  })
  let t102 = @term_syntax.parse_term("0")
  let t112 = @list.List([@tactics.first_assum(fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s100 = @tactics.subst1_tac(x99)
      fn(x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s100(x101)
      }
    })(((x103 : @kernel.Thm) => @bool.spec(t102, x103))(x104))
  }), t111])
  let t98 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t97 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t96 = @tactics.exists_tac(@term_syntax.parse_term("∀ n : Num, NONWF((R : (A, A) -> Bool), (t : (Num) -> A)(SUC(n)))"))
  let t95 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ d : Bool, (b : Bool) && d && (a : Bool) && (c : Bool) → a && b && c")))
  let t94 = @simp.rewrite_tac(@list.List([]))
  let t93 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : (Num) -> A)"))
  let t92 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t90 = @term_syntax.parse_term("(b : A) => (n : Num) => select((c : A) => NONWF((R : (A, A) -> Bool), c) && R(c, b) && (∀ d : A, NONWF(R, d) && R(d, b) → (m : (A) -> Num)(c) <= m(d)))")
  let t91 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : A)"), t90]), @nums.num_recursion()))
  let t89 = @list.List([@meson.asm_meson_tac(@list.List([@arith.not_lt()])), @tactics.all_tac])
  let t88 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : A, NONWF((R : (A, A) -> Bool), s) → (m : (A) -> Num)((a : A)) <= m(s)"), fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s86 = @tactics.assume_tac(x85)
    fn(x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s86(x87)
    }
  })
  let t84 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac), fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s82 = @tactics.assume_tac(x81)
    fn(x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s82(x83)
    }
  }))
  let t80 = @simp.rewrite_tac(@list.List([]))
  let t79 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n_0 : Num)"))(fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s77 = @tactics.mp_tac(x76)
    fn(x78 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s77(x78)
    }
  }))
  let t74 = @meson.asm_meson_tac(@list.List([]))
  let t75 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([nonwf()])), t74), @tactics.all_tac])
  let t73 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && ((b : Bool) → (c : Bool)) → a == b → c")))
  let t72 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) => ∃ s : A, NONWF((R : (A, A) -> Bool), s) && (m : (A) -> Num)(s) == n"), @arith.num_wop()))
  let t71 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t116 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@wf.wf_dchain()]))), @tactics.ap_term_tac), @tactics.eq_tac), t71), @tactics.disch_tac), t72), t73), @tactics.conj_tac), t75), t79), t80), t84), t88), t89), t91), t92), t93), t94), @tactics.strip_tac), t95), t96), @tactics.conj_tac), t97), t98), @nums.induct_tac), t112), t113), t114), t115)
  wf_minimal_dchain_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : (A) -> Num, WF((R : (A, A) -> Bool)) == !(∃ t : (Num) -> A, (∀ n : Num, R(t(SUC(n)), t(n))) && (∀ s : A, NONWF(R, s) → m(t(0)) <= m(s)) && (∀ n : Num, ∀ s : A, NONWF(R, s) && R(s, t(n)) → m(t(SUC(n))) <= m(s)))"), t116))
}

///|
let wf_minimal_dchain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_MINIMAL_DCHAIN")

///|
/// `WF_MINIMAL_DCHAIN`
pub fn wf_minimal_dchain() -> @kernel.Thm {
  wf_minimal_dchain_c.get()
}

///|
/// SEQUENCE_SUBSEQUENCE
fn step_10() -> Unit raise {
  let t125 = @tactics.then_tac(@nums.induct_tac, @meson.asm_meson_tac(@list.List([])))
  let t124 = @meson.asm_meson_tac(@list.List([]))
  let t126 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@analysis.subseq_suc()])), t124), t125])
  let t123 = @simp.rewrite_tac(@list.List([]))
  let t122 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Num) -> Num)"))
  let t121 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t119 = @term_syntax.parse_term("(m : Num) => (p : Num) => (st : (Num) -> Num)(m)")
  let t120 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(st : (Num) -> Num)(0)"), t119]), @nums.num_recursion()))
  let t118 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(st : (Num) -> Num)"))(@tactics.strip_assume_tac))
  let t117 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.forall_and_thm()]))
  let t127 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t117), t118), t120), t121), t122), t123), @tactics.strip_tac), @tactics.conj_tac), t126)
  sequence_subsequence_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ x : (Num) -> A, (∀ n : Num, ∃ m : Num, n < m && P(x(m))) → (∃ f : (Num) -> Num, subseq(f) && (∀ n : Num, P(x(f(n)))))"), t127))
}

///|
let sequence_subsequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQUENCE_SUBSEQUENCE")

///|
/// `SEQUENCE_SUBSEQUENCE`
pub fn sequence_subsequence() -> @kernel.Thm {
  sequence_subsequence_c.get()
}

///|
/// SEQUENCE_PARTITION_LEMMA
fn step_11() -> Unit raise {
  let t148 = @simp.asm_simp_tac(@list.List([]))
  let t147 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : A) => x == (a : A)"), sequence_subsequence()))
  let t146 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t145 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t143 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) + (n : Num) < (p : Num) → m < p && n < p"))]))
  let t142 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @class.not_exists_thm(), @class.not_forall_thm(), @class.not_imp()]))
  let t141 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(a : Bool) && (c : Bool) → (b : Bool)) → (a → b) → c → b")))
  let t139 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t140 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(b : A)"), t139]))
  let t138 = @list.List([@meson.meson_tac(@list.List([@arith.lt()])), @tactics.all_tac])
  let t137 = @simp.rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t136 = @tactics.match_mp_tac(@sets.finite_induct())
  let t135 = @tactics.pop_assum_list(fn(x134 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t144 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) → (∃ n : Num, ∀ m : Num, n < m → IN((x : (Num) -> A)(m), s)) → (∃ a : A, ∀ n : Num, ∃ m : Num, n < m && x(m) == a)"), fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x132
    @meson.asm_meson_tac(@list.List([th]))
  }), t135), t136), t137), @tactics.conj_tac), t138), t140), t141), t142), t143), @tactics.all_tac])
  let t131 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : A, ∀ n : Num, ∃ m : Num, n < m && (x : (Num) -> A)(m) == a"), fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s129 = @tactics.mp_tac(x128)
    fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s129(x130)
    }
  })
  let t149 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t131), t144), t145), t146), @tactics.disch_tac), t147), t148)
  sequence_partition_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> A, ∀ s : (A) -> Bool, FINITE(s) && (∀ n : Num, IN(x(n), s)) → (∃ a : A, ∃ f : (Num) -> Num, subseq(f) && (∀ n : Num, x(f(n)) == a))"), t149))
}

///|
let sequence_partition_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQUENCE_PARTITION_LEMMA")

///|
/// `SEQUENCE_PARTITION_LEMMA`
pub fn sequence_partition_lemma() -> @kernel.Thm {
  sequence_partition_lemma_c.get()
}

///|
/// termsize_EXISTS
fn step_12() -> Unit raise {
  let t157 = @simp.asm_rewrite_tac(@list.List([@lists.itlist(), @lists.map()]))
  let t156 = @simp.asm_rewrite_tac(@list.List([]))
  let t155 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t154 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t153 = @simp.rewrite_tac(@list.List([]))
  let t150 = @term_syntax.parse_term("(t : Term) => (ts : List[Term]) => (n : Num) => (ns : List[Num]) => CONS(n, ns)")
  let t151 = @term_syntax.parse_term("(NIL : List[Num])")
  let t152 = @term_syntax.parse_term("(f : Num) => (args : List[Term]) => (ns : List[Num]) => ITLIST(op_plus, ns, 1)")
  let t158 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Num) => 1"), t152, t151, t150]), @fol.term_raw_recursion())), t153), t154), t155), @tactics.gen_tac), @tactics.strip_tac), t156), @lists.list_induct_tac), t157)
  termsize_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ termsize : (Term) -> Num, (∀ x : Num, termsize(V(x)) == 1) && (∀ f : Num, ∀ args : List[Term], termsize(Fn(f, args)) == ITLIST(op_plus, MAP(termsize, args), 1))"), t158))
}

///|
let termsize_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("termsize_EXISTS")

///|
/// `termsize_EXISTS`
pub fn termsize_exists() -> @kernel.Thm {
  termsize_exists_c.get()
}

///|
/// termsize
fn step_13() -> Unit raise {
  termsize_c.set(@nums.new_specification(@list.List(["termsize"]))(termsize_exists()))
}

///|
let termsize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("termsize")

///|
/// `termsize`
pub fn termsize() -> @kernel.Thm {
  termsize_c.get()
}

///|
/// LEX_DEF
fn step_14() -> Unit raise {
  let t159 = @term_syntax.parse_term("(LEX : ((_, _) -> Bool, List[_], List[_]) -> Bool)((op_lt_lt : (_, _) -> Bool), NIL, (l : List[_])) == false && LEX(op_lt_lt, CONS((h : _), (t : List[_])), l) == (if l == NIL { false } else { if op_lt_lt(h, HD(l)) { LENGTH(t) == LENGTH(TL(l)) } else { h == HD(l) && LEX(op_lt_lt, t, TL(l)) } })")
  lex_def_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t159))
}

///|
let lex_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX_DEF")

///|
/// `LEX_DEF`
pub fn lex_def() -> @kernel.Thm {
  lex_def_c.get()
}

///|
/// LEX
fn step_15() -> Unit raise {
  let t160 = @simp.rewrite_tac(@list.List([lex_def(), @lists.not_cons_nil(), @lists.hd(), @lists.tl()]))
  lex_c.set(@tactics.prove(@term_syntax.parse_term("LEX((op_lt_lt : (_, _) -> Bool), NIL, (l : List[_])) == false && LEX(op_lt_lt, CONS((h1 : _), (t1 : List[_])), NIL) == false && LEX(op_lt_lt, CONS(h1, t1), CONS((h2 : _), (t2 : List[_]))) == (if op_lt_lt(h1, h2) { LENGTH(t1) == LENGTH(t2) } else { h1 == h2 && LEX(op_lt_lt, t1, t2) })"), t160))
}

///|
let lex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX")

///|
/// `LEX`
pub fn lex() -> @kernel.Thm {
  lex_c.get()
}

///|
/// LEX_LENGTH
fn step_16() -> Unit raise {
  let t163 = @meson.asm_meson_tac(@list.List([]))
  let t162 = @simp.asm_simp_tac(@list.List([@lists.length()]))
  let t161 = @simp.rewrite_tac(@list.List([lex()]))
  let t164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([lex()]))), @lists.list_induct_tac), t161), @tactics.gen_tac), @class.cond_cases_tac), t162), t163)
  lex_length_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], ∀ R : (_, _) -> Bool, LEX(R, l1, l2) → LENGTH(l1) == LENGTH(l2)"), t164))
}

///|
let lex_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX_LENGTH")

///|
/// `LEX_LENGTH`
pub fn lex_length() -> @kernel.Thm {
  lex_length_c.get()
}

///|
/// MONO_LEX
fn step_17() -> Unit raise {
  let t171 = @meson.asm_meson_tac(@list.List([lex_length()]))
  let t170 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t169 = @simp.rewrite_tac(@list.List([lex()]))
  let t168 = @simp.rewrite_tac(@list.List([lex()]))
  let t166 = @term_syntax.parse_term("(x : List[A])")
  let t167 = @tactics.spec_tac(@term_syntax.parse_term("(x : List[A])"), t166)
  let t165 = @term_syntax.parse_term("(y : List[A])")
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.spec_tac(@term_syntax.parse_term("(y : List[A])"), t165)), t167), @lists.list_induct_tac), t168), @lists.list_induct_tac), t169), t170), t171)
  mono_lex_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : A, ∀ y : A, (R : (A, A) -> Bool)(x, y) → (S : (A, A) -> Bool)(x, y)) → LEX(R, (x : List[A]), (y : List[A])) → LEX(S, x, y)"), t172))
}

///|
let mono_lex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_LEX")

///|
/// `MONO_LEX`
pub fn mono_lex() -> @kernel.Thm {
  mono_lex_c.get()
}

///|
/// Logic/lpo.ml:190
fn step_18() -> Unit raise {
  {
    @ind_defs.monotonicity_theorems().val = (@ind_defs.monotonicity_theorems().val).prepend(mono_lex())
    ()
  }
}

///|
/// LEX_MAP
fn step_19() -> Unit raise {
  let t175 = @simp.asm_simp_tac(@list.List([]))
  let t174 = @simp.asm_rewrite_tac(@list.List([@lists.length_map()]))
  let t173 = @simp.rewrite_tac(@list.List([lex(), @lists.map()]))
  let t176 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([lex(), @lists.map()]))), @lists.list_induct_tac), t173), @class.cond_cases_tac), t174), t175)
  lex_map_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], LEX((x : _) => (y : _) => (R : (_, _) -> Bool)((f : (_) -> _)(x), f(y)), l1, l2) → LEX(R, MAP(f, l1), MAP(f, l2))"), t176))
}

///|
let lex_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX_MAP")

///|
/// `LEX_MAP`
pub fn lex_map() -> @kernel.Thm {
  lex_map_c.get()
}

///|
/// LEX_REFL
fn step_20() -> Unit raise {
  let t179 = @meson.asm_meson_tac(@list.List([]))
  let t178 = @simp.rewrite_tac(@list.List([]))
  let t177 = @simp.asm_rewrite_tac(@list.List([lex(), @lists.mem()]))
  let t180 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t177), @class.cond_cases_tac), t178), t179)
  lex_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (_, _) -> Bool, ∀ l : List[_], (∀ x : _, MEM(x, l) → !R(x, x)) → !LEX(R, l, l)"), t180))
}

///|
let lex_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX_REFL")

///|
/// `LEX_REFL`
pub fn lex_refl() -> @kernel.Thm {
  lex_refl_c.get()
}

///|
/// LEX_LENGTH_CHAIN
fn step_21() -> Unit raise {
  let t182 = @meson.asm_meson_tac(@list.List([lex_length()]))
  let t181 = @simp.rewrite_tac(@list.List([]))
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), @nums.induct_tac), t181), t182)
  lex_length_chain_c.set(@tactics.prove(@term_syntax.parse_term("∀ lis : (Num) -> List[_], ∀ R : (_, _) -> Bool, (∀ n : Num, LEX(R, lis(SUC(n)), lis(n))) → (∀ n : Num, LENGTH(lis(n)) == LENGTH(lis(0)))"), t183))
}

///|
let lex_length_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX_LENGTH_CHAIN")

///|
/// `LEX_LENGTH_CHAIN`
pub fn lex_length_chain() -> @kernel.Thm {
  lex_length_chain_c.get()
}

///|
/// WF_LEX_STRONG_INDUCT
fn step_22() -> Unit raise {
  let t316 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t312 = @term_syntax.parse_term("SUC((p : Num) + (m : Num))")
  let t315 = @tactics.first_assum(fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s305 = @tactics.mp_tac(x304)
        fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s305(x306)
        }
      })(((x310 : @kernel.Thm) => @lib.check(fn(x309 : @kernel.Thm) -> Bool raise {
        (fn(x307 : @kernel.Term) -> Bool raise {
          @basics.is_disj(x307)
        })((fn(x308 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x308)
        })(x309))
      }, x310))(x311))
    })(((x313 : @kernel.Thm) => @bool.spec(t312, x313))(x314))
  })
  let t303 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t302 = @simp.asm_rewrite_tac(@list.List([]))
  let t298 = @term_syntax.parse_term("(n : Num) => (tl : (Num) -> List[A])(SUC((p : Num)) + n)")
  let t301 = @tactics.disch_then(fn(x300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s296 = @tactics.mp_tac(x295)
      fn(x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s296(x297)
      }
    })(((x299 : @kernel.Thm) => @bool.spec(t298, x299))(x300))
  })
  let t294 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @class.not_imp()]))
  let t290 = @term_syntax.parse_term("(n : Num) => (hd : (Num) -> A)(SUC((p : Num)) + n)")
  let t293 = @tactics.disch_then(fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s288 = @tactics.mp_tac(x287)
      fn(x289 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s288(x289)
      }
    })(((x291 : @kernel.Thm) => @bool.spec(t290, x291))(x292))
  })
  let t285 = @meson.asm_meson_tac(@list.List([@arith.lt_imp_le()]))
  let t284 = @simp.rewrite_tac(@list.List([@arith.le_suc_lt()]))
  let t283 = @simp.asm_rewrite_tac(@list.List([]))
  let t286 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, n <= (p : Num) → (hd : (Num) -> A)(n) == (h : A)"), fn(x281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x281
    @meson.asm_meson_tac(@list.List([th_2, @arith.le_refl()]))
  }), @nums.induct_tac), t283), t284), t285), @tactics.all_tac])
  let t277 = @term_syntax.parse_term("(hd : (Num) -> A)(SUC((p : Num)))")
  let t280 = @tactics.first_x_assum(fn(x279 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s275 = @tactics.mp_tac(x274)
      fn(x276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s275(x276)
      }
    })(((x278 : @kernel.Thm) => @bool.spec(t277, x278))(x279))
  })
  let t273 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t272 = @simp.gen_rewrite_tac(fn(x269 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s270 = @equal.land_conv(x269)
    fn(x271 : @kernel.Term) -> @kernel.Thm raise {
      s270(x271)
    }
  }, @list.List([@arith.num_wop()]))
  let t268 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t267 = @tactics.subgoal_then(@term_syntax.parse_term("∃ m : Num, (R : (A, A) -> Bool)((hd : (Num) -> A)(SUC(m)), hd(m))"), fn(x264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s265 = @tactics.mp_tac(x264)
    fn(x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s265(x266)
    }
  })
  let t263 = @tactics.repeat_tac(@tactics.strip_tac)
  let t262 = @tactics.x_gen_tac(@term_syntax.parse_term("(hd : (Num) -> A)"))
  let t261 = @tactics.pop_assum_list(fn(x260 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s257 = @tactics.mp_tac(x256)
      fn(x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s257(x258)
      }
    })(((x259 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x259))(x260))
  })
  let t255 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : A)"))
  let t254 = @tactics.match_mp_tac(nonwf_induct())
  let t253 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t251 = @term_syntax.parse_term("(h : A)")
  let t252 = @tactics.spec_tac(@term_syntax.parse_term("(h : A)"), t251)
  let t249 = @term_syntax.parse_term("(hd : (Num) -> A)")
  let t250 = @tactics.spec_tac(@term_syntax.parse_term("(hd : (Num) -> A)"), t249)
  let t248 = @tactics.disch_then(fn(x244 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x244
    let t247 = @tactics.mp_tac(th_1)
    let t246 = @tactics.undisch_tac(@term_syntax.parse_term("(hd : (Num) -> A)(0) == (h : A)"))
    @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, !NONWF((R : (A, A) -> Bool), (hd : (Num) -> A)(n))")), t246), t247)
  })
  let t243 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t242 = @tactics.subgoal_then(@term_syntax.parse_term("!NONWF((R : (A, A) -> Bool), (h : A))"), fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s240 = @tactics.mp_tac(x239)
    fn(x241 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s240(x241)
    }
  })
  let t238 = @simp.abbrev_tac(@term_syntax.parse_term("(h : A) == (hd : (Num) -> A)(0)"))
  let t236 = @term_syntax.parse_term("(tl : (Num) -> List[A])")
  let t237 = @tactics.spec_tac(@term_syntax.parse_term("(tl : (Num) -> List[A])"), t236)
  let t235 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t234 = @tactics.undisch_tac(@term_syntax.parse_term("∀ m : Num, LENGTH((tl : (Num) -> List[A])(m)) == (n : Num)"))
  let t233 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, ∀ a : A, MEM(a, (tl : (Num) -> List[A])(n)) → !NONWF((R : (A, A) -> Bool), a)"))
  let t232 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(if (p : Bool) { true } else { (r : Bool) }) == (p || !p && r)"))]))
  let t231 = @simp.asm_rewrite_tac(@list.List([]))
  let t230 = @simp.rewrite_tac(@list.List([@lists.length(), @nums.suc_inj()]))
  let t229 = @tactics.undisch_tac(@term_syntax.parse_term("∀ m : Num, LENGTH(CONS((hd : (Num) -> A)(m), (tl : (Num) -> List[A])(m))) == SUC((n : Num))"))
  let t228 = @simp.rewrite_tac(@list.List([lex()]))
  let t227 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, LEX((R : (A, A) -> Bool), CONS((hd : (Num) -> A)(SUC(n)), (tl : (Num) -> List[A])(SUC(n))), CONS(hd(n), tl(n)))"))
  let t226 = @simp.simp_tac(@list.List([@theorems.forall_and_thm(), @theorems.left_forall_imp_thm(), @theorems.exists_refl()]))
  let t225 = @simp.rewrite_tac(@list.List([@lists.mem(), @class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t224 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, ∀ a : A, MEM(a, CONS((hd : (Num) -> A)(n), (tl : (Num) -> List[A])(n))) → !NONWF((R : (A, A) -> Bool), a)"))
  let t223 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.choose_then)(fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x221
    @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(th)])))
  }))
  let t219 = @simp.rewrite_tac(@list.List([@lists.hd(), @lists.tl()]))
  let t217 = @term_syntax.parse_term("(l : List[A])")
  let t218 = @tactics.spec_tac(@term_syntax.parse_term("(lis : (Num) -> List[A])((m : Num))"), t217)
  let t216 = @simp.rewrite_tac(@list.List([]))
  let t215 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t214 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t213 = @list.List([@meson.asm_meson_tac(@list.List([lex_length_chain(), @lists.length(), @nums.not_suc()])), @tactics.all_tac])
  let t212 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, !((lis : (Num) -> List[A])(n) == NIL)"), fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s210 = @tactics.mp_tac(x209)
    fn(x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s210(x211)
    }
  })
  let t208 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => TL((lis : (Num) -> List[A])(n))"))
  let t220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Num) => HD((lis : (Num) -> List[A])(n))")), t208), t212), t213), t214), t215), t216), t218), @lists.list_induct_tac), t219), @tactics.all_tac])
  let t207 = @tactics.subgoal_then(@term_syntax.parse_term("∃ hd : (Num) -> A, ∃ tl : (Num) -> List[A], ∀ n : Num, CONS(hd(n), tl(n)) == (lis : (Num) -> List[A])(n)"), fn(x204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s205 = @tactics.mp_tac(x204)
    fn(x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s205(x206)
    }
  })
  let t203 = @tactics.first_x_assum(fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s201 = @tactics.subst1_tac(x200)
    fn(x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s201(x202)
    }
  })
  let t197 = @drule.match_mp(lex_length_chain())
  let t199 = @tactics.first_assum(fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x194 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s195 = @tactics.mp_tac(x194)
      fn(x196 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s195(x196)
      }
    })(t197(x198))
  })
  let t193 = @tactics.repeat_tac(@tactics.strip_tac)
  let t192 = @meson.asm_meson_tac(@list.List([lex()]))
  let t191 = @simp.asm_rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t190 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, LENGTH((lis : (Num) -> List[A])(n)) == LENGTH(lis(0))"))
  let t187 = @drule.match_mp(lex_length_chain())
  let t189 = @tactics.first_assum(fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s185 = @tactics.assume_tac(x184)
      fn(x186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s185(x186)
      }
    })(t187(x188))
  })
  let t317 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@nums.induct_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t189), t190), t191), t192), @tactics.all_tac])), t193), t199), t203), @tactics.disch_tac), t207), t220), t223), t224), t225), t226), @tactics.strip_tac), t227), t228), t229), t230), @tactics.disch_tac), t231), t232), t233), t234), t235), t237), t238), t242), t243), t248), t250), t252), t253), t254), t255), @tactics.strip_tac), t261), @tactics.strip_tac), t262), t263), t267), t268), t272), t273), t280), @tactics.ants_tac), t286), t293), t294), t301), t302), t303), t315), t316)
  wf_lex_strong_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ lis : (Num) -> List[A], LENGTH(lis(0)) == n → !((∀ n : Num, ∀ a : A, MEM(a, lis(n)) → !NONWF((R : (A, A) -> Bool), a)) && (∀ n : Num, LEX(R, lis(SUC(n)), lis(n))))"), t317))
}

///|
let wf_lex_strong_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_LEX_STRONG_INDUCT")

///|
/// `WF_LEX_STRONG_INDUCT`
pub fn wf_lex_strong_induct() -> @kernel.Thm {
  wf_lex_strong_induct_c.get()
}

///|
/// WF_LEX_STRONG
fn step_23() -> Unit raise {
  let t318 = @meson.meson_tac(@list.List([wf_lex_strong_induct()]))
  wf_lex_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ lis : (Num) -> List[A], !((∀ n : Num, ∀ a : A, MEM(a, lis(n)) → !NONWF(R, a)) && (∀ n : Num, LEX(R, lis(SUC(n)), lis(n))))"), t318))
}

///|
let wf_lex_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_LEX_STRONG")

///|
/// `WF_LEX_STRONG`
pub fn wf_lex_strong() -> @kernel.Thm {
  wf_lex_strong_c.get()
}

///|
/// LEX_RESTRICT
fn step_24() -> Unit raise {
  let t323 = @meson.asm_meson_tac(@list.List([]))
  let t322 = @simp.asm_simp_tac(@list.List([]))
  let t321 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t320 = @simp.rewrite_tac(@list.List([lex(), @lists.mem()]))
  let t319 = @tactics.repeat_tac(@lists.list_induct_tac)
  let t324 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t319), t320), t321), t322), t323)
  lex_restrict_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ R : (_, _) -> Bool, ∀ l1 : List[_], ∀ l2 : List[_], LEX(R, l1, l2) && (∀ a : _, MEM(a, l1) → P(a)) && (∀ a : _, MEM(a, l2) → P(a)) → LEX((x : _) => (y : _) => P(x) && P(y) && R(x, y), l1, l2)"), t324))
}

///|
let lex_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX_RESTRICT")

///|
/// `LEX_RESTRICT`
pub fn lex_restrict() -> @kernel.Thm {
  lex_restrict_c.get()
}

///|
/// Logic/lpo.ml:298
fn step_25() -> Unit raise {
  @printer.parse_as_infix("subterm", (12L, "right"))
}

///|
/// Logic/lpo.ml:299
fn step_26() -> Unit raise {
  @printer.parse_as_infix("psubterm", (12L, "right"))
}

///|
let subterm_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subterm_RULES")

///|
/// `subterm_RULES`
pub fn subterm_rules() -> @kernel.Thm {
  subterm_rules_c.get()
}

///|
let subterm_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subterm_INDUCT")

///|
/// `subterm_INDUCT`
pub fn subterm_induct() -> @kernel.Thm {
  subterm_induct_c.get()
}

///|
let subterm_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subterm_CASES")

///|
/// `subterm_CASES`
pub fn subterm_cases() -> @kernel.Thm {
  subterm_cases_c.get()
}

///|
/// subterm_RULES, subterm_INDUCT, subterm_CASES
fn step_27() -> Unit raise {
  let (subterm_rules, subterm_induct, subterm_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ t : Term, (subterm : (Term, Term) -> Bool)(t, t)) && (∀ s : Term, ∀ a : Term, ∀ f : Num, ∀ args : List[Term], subterm(s, a) && MEM(a, args) → subterm(s, Fn(f, args)))"))
  subterm_rules_c.set(subterm_rules)
  subterm_induct_c.set(subterm_induct)
  subterm_cases_c.set(subterm_cases)
}

///|
/// psubterm
fn step_28() -> Unit raise {
  psubterm_c.set(@pair.new_definition(@term_syntax.parse_term("(psubterm : (Term, Term) -> Bool)((s : Term), (t : Term)) == (subterm(s, t) && !(s == t))")))
}

///|
let psubterm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("psubterm")

///|
/// `psubterm`
pub fn psubterm() -> @kernel.Thm {
  psubterm_c.get()
}

///|
/// DESCENDANT_SMALLER
fn step_29() -> Unit raise {
  let t326 = @int.arith_rule(@term_syntax.parse_term("(a : Num) < (c : Num) → a < (b : Num) + c"))
  let t327 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (b : Num) → (a : Num) < a + b")), t326, itlist_add_1_pos()]))
  let t325 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.map(), @lists.itlist()]))
  let t328 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([termsize()]))), @lists.list_induct_tac), t325), t327)
  descendant_smaller_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Num, ∀ args : List[Term], ∀ s : Term, MEM(s, args) → termsize(s) < termsize(Fn(f, args))"), t328))
}

///|
let descendant_smaller_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DESCENDANT_SMALLER")

///|
/// `DESCENDANT_SMALLER`
pub fn descendant_smaller() -> @kernel.Thm {
  descendant_smaller_c.get()
}

///|
/// DESCENDANT_DISTINCT
fn step_30() -> Unit raise {
  let t329 = @meson.meson_tac(@list.List([descendant_smaller(), @arith.lt_refl()]))
  descendant_distinct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Num, ∀ args : List[Term], !MEM(Fn(f, args), args)"), t329))
}

///|
let descendant_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DESCENDANT_DISTINCT")

///|
/// `DESCENDANT_DISTINCT`
pub fn descendant_distinct() -> @kernel.Thm {
  descendant_distinct_c.get()
}

///|
/// SUBTERM_REFL
fn step_31() -> Unit raise {
  let t330 = @simp.rewrite_tac(@list.List([subterm_rules()]))
  subterm_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, subterm(t, t)"), t330))
}

///|
let subterm_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTERM_REFL")

///|
/// `SUBTERM_REFL`
pub fn subterm_refl() -> @kernel.Thm {
  subterm_refl_c.get()
}

///|
/// SUBTERM_TRANS
fn step_32() -> Unit raise {
  let t335 = @meson.meson_tac(@list.List([subterm_rules()]))
  let t334 = @simp.rewrite_tac(@list.List([]))
  let t333 = @tactics.match_mp_tac(subterm_induct())
  let t336 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, ∀ u : Term, subterm(t, u) → (∀ s : Term, subterm(s, t) → subterm(s, u))"), fn(x331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x331
    @meson.meson_tac(@list.List([th]))
  }), t333), t334), t335)
  subterm_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, ∀ u : Term, subterm(s, t) && subterm(t, u) → subterm(s, u)"), t336))
}

///|
let subterm_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTERM_TRANS")

///|
/// `SUBTERM_TRANS`
pub fn subterm_trans() -> @kernel.Thm {
  subterm_trans_c.get()
}

///|
/// SUBTERM_ANTISYM
fn step_33() -> Unit raise {
  let t357 = @meson.asm_meson_tac(@list.List([subterm_rules(), subterm_trans()]))
  let t356 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s354 = @tactics.subst_all_tac(x353)
    fn(x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s354(x355)
    }
  }))
  let t352 = @simp.asm_rewrite_tac(@list.List([]))
  let t351 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t350 = @simp.rewrite_tac(@list.List([@fol.term_inj()]))
  let t349 = @simp.once_rewrite_tac(@list.List([subterm_cases()]))
  let t348 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s343 = @tactics.assume_tac(x342)
    fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s343(x344)
    }
  }, fn(x345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s346 = @tactics.mp_tac(x345)
    fn(x347 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s346(x347)
    }
  }))
  let t341 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t339 = @simp.simp_tac(@list.List([@fol.term_distinct()]))
  let t340 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([subterm_cases()])), t339), @tactics.all_tac])
  let t338 = @tactics.repeat_tac(@tactics.gen_tac)
  let t337 = @tactics.repeat_tac(@tactics.conj_tac)
  let t358 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.term_induct()), t337), t338), t340), t341), @tactics.strip_tac), @tactics.gen_tac), t348), t349), t350), t351), @tactics.strip_tac), t352), t356), t357)
  subterm_antisym_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, subterm(s, t) && subterm(t, s) → s == t"), t358))
}

///|
let subterm_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTERM_ANTISYM")

///|
/// `SUBTERM_ANTISYM`
pub fn subterm_antisym() -> @kernel.Thm {
  subterm_antisym_c.get()
}

///|
/// SUBTERM_FVT
fn step_34() -> Unit raise {
  let t362 = @meson.meson_tac(@list.List([subterm_rules()]))
  let t360 = @equal.gsym(@lists.all_mem())
  let t361 = @simp.rewrite_tac(@list.List([@lists.mem_map(), @equal.gsym(@lists.ex_mem()), t360]))
  let t359 = @simp.simp_tac(@list.List([@fol.fvt(), @sets.in_sing(), @fol.in_list_union(), subterm_refl()]))
  let t363 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@fol.term_induct())), t359), t361), t362)
  subterm_fvt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ t : Term, IN(x, FVT(t)) → subterm(V(x), t)"), t363))
}

///|
let subterm_fvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTERM_FVT")

///|
/// `SUBTERM_FVT`
pub fn subterm_fvt() -> @kernel.Thm {
  subterm_fvt_c.get()
}

///|
/// PSUBTERM_ANTISYM
fn step_35() -> Unit raise {
  let t364 = @meson.meson_tac(@list.List([subterm_antisym()]))
  let t365 = @tactics.then_tac(@simp.rewrite_tac(@list.List([psubterm()])), t364)
  psubterm_antisym_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, !(psubterm(s, t) && psubterm(t, s))"), t365))
}

///|
let psubterm_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSUBTERM_ANTISYM")

///|
/// `PSUBTERM_ANTISYM`
pub fn psubterm_antisym() -> @kernel.Thm {
  psubterm_antisym_c.get()
}

///|
/// SUBTERM_PSUBTERM_TRANS
fn step_36() -> Unit raise {
  let t366 = @meson.meson_tac(@list.List([subterm_trans(), subterm_antisym()]))
  let t367 = @tactics.then_tac(@simp.rewrite_tac(@list.List([psubterm()])), t366)
  subterm_psubterm_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, ∀ u : Term, subterm(s, t) && psubterm(t, u) → psubterm(s, u)"), t367))
}

///|
let subterm_psubterm_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTERM_PSUBTERM_TRANS")

///|
/// `SUBTERM_PSUBTERM_TRANS`
pub fn subterm_psubterm_trans() -> @kernel.Thm {
  subterm_psubterm_trans_c.get()
}

///|
/// PSUBTERM_CASES
fn step_37() -> Unit raise {
  let t387 = @meson.asm_meson_tac(@list.List([descendant_distinct(), subterm_rules()]))
  let t386 = @simp.asm_rewrite_tac(@list.List([psubterm()]))
  let t385 = @tactics.exists_tac(@term_syntax.parse_term("(a : Term)"))
  let t384 = @tactics.match_mp_tac(subterm_psubterm_trans())
  let t383 = @simp.asm_rewrite_tac(@list.List([]))
  let t380 = @term_syntax.parse_term("(a : Term)")
  let t381 = @term_syntax.parse_term("(args : List[Term])")
  let t382 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : Num)"), t381, t380]))
  let t388 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])), t382), @tactics.strip_tac), t383), t384), t385), t386), t387)
  let t379 = @meson.asm_meson_tac(@list.List([]))
  let t378 = @simp.gen_rewrite_tac(fn(x375 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s376 = @equal.land_conv(x375)
    fn(x377 : @kernel.Term) -> @kernel.Thm raise {
      s376(x377)
    }
  }, @list.List([subterm_cases()]))
  let t374 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x368 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s369 = @tactics.mp_tac(x368)
    fn(x370 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s369(x370)
    }
  }, fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s372 = @tactics.assume_tac(x371)
    fn(x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s372(x373)
    }
  }))
  let t389 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([psubterm()])), t374), t378), t379), t388])
  let t390 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t389)
  psubterm_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, psubterm(s, t) == (∃ f : Num, ∃ args : List[Term], ∃ u : Term, t == Fn(f, args) && MEM(u, args) && subterm(s, u))"), t390))
}

///|
let psubterm_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSUBTERM_CASES")

///|
/// `PSUBTERM_CASES`
pub fn psubterm_cases() -> @kernel.Thm {
  psubterm_cases_c.get()
}

///|
/// SUBTERM_INSTANTIATION
fn step_38() -> Unit raise {
  let t392 = @meson.asm_meson_tac(@list.List([@lists.mem_map(), subterm_rules()]))
  let t391 = @simp.rewrite_tac(@list.List([@fol.termsubst(), subterm_rules()]))
  let t393 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(subterm_induct())), t391), t392)
  subterm_instantiation_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : (Num) -> Term, ∀ s : Term, ∀ t : Term, subterm(s, t) → subterm(termsubst(i, s), termsubst(i, t))"), t393))
}

///|
let subterm_instantiation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBTERM_INSTANTIATION")

///|
/// `SUBTERM_INSTANTIATION`
pub fn subterm_instantiation() -> @kernel.Thm {
  subterm_instantiation_c.get()
}

///|
/// PSUBTERM_INSTANTIATION
fn step_39() -> Unit raise {
  let t406 = @meson.asm_meson_tac(@list.List([subterm_instantiation()]))
  let t405 = @simp.asm_rewrite_tac(@list.List([@lists.mem_map(), @fol.termsubst()]))
  let t403 = @term_syntax.parse_term("termsubst((i : (Num) -> Term), (u : Term))")
  let t404 = @tactics.map_every(fn(x400 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s401 = @tactics.exists_tac(x400)
    fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s401(x402)
    }
  }, @list.List([@term_syntax.parse_term("MAP(termsubst((i : (Num) -> Term)), (args : List[Term]))"), t403]))
  let t398 = @term_syntax.parse_term("(u : Term)")
  let t399 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(args : List[Term])"), t398]))
  let t397 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t396 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : Num)"))
  let t395 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t394 = @simp.once_rewrite_tac(@list.List([psubterm_cases()]))
  let t407 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t394), t395), t396), t397), t399), @tactics.strip_tac), t404), t405), t406)
  psubterm_instantiation_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : (Num) -> Term, ∀ s : Term, ∀ t : Term, psubterm(s, t) → psubterm(termsubst(i, s), termsubst(i, t))"), t407))
}

///|
let psubterm_instantiation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSUBTERM_INSTANTIATION")

///|
/// `PSUBTERM_INSTANTIATION`
pub fn psubterm_instantiation() -> @kernel.Thm {
  psubterm_instantiation_c.get()
}

///|
let lpo_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lpo_RULES")

///|
/// `lpo_RULES`
pub fn lpo_rules() -> @kernel.Thm {
  lpo_rules_c.get()
}

///|
let lpo_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lpo_INDUCT")

///|
/// `lpo_INDUCT`
pub fn lpo_induct() -> @kernel.Thm {
  lpo_induct_c.get()
}

///|
let lpo_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lpo_CASES")

///|
/// `lpo_CASES`
pub fn lpo_cases() -> @kernel.Thm {
  lpo_cases_c.get()
}

///|
/// lpo_RULES, lpo_INDUCT, lpo_CASES
fn step_40() -> Unit raise {
  let (lpo_rules, lpo_induct, lpo_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ x : Num, ∀ s : Term, IN(x, FVT(s)) && !(s == V(x)) → (op_lt_lt : (Term, Term) -> Bool)(V(x), s)) && (∀ fs : Num, ∀ sargs : List[Term], ∀ ft : Num, ∀ targs : List[Term], ∀ si : Term, MEM(si, sargs) && (op_lt_lt(Fn(ft, targs), si) || si == Fn(ft, targs)) → op_lt_lt(Fn(ft, targs), Fn(fs, sargs))) && (∀ fs : Num, ∀ ft : Num, ∀ sargs : List[Term], ∀ targs : List[Term], (fs > ft || fs == ft && LENGTH(sargs) > LENGTH(targs)) && ALL((ti : Term) => op_lt_lt(ti, Fn(fs, sargs)), targs) → op_lt_lt(Fn(ft, targs), Fn(fs, sargs))) && (∀ f : Num, ∀ sargs : List[Term], ∀ targs : List[Term], ALL((ti : Term) => op_lt_lt(ti, Fn(f, sargs)), targs) && LEX(op_lt_lt, targs, sargs) → op_lt_lt(Fn(f, targs), Fn(f, sargs)))"))
  lpo_rules_c.set(lpo_rules)
  lpo_induct_c.set(lpo_induct)
  lpo_cases_c.set(lpo_cases)
}

///|
/// LPO_CASES
fn step_41() -> Unit raise {
  let t419 = @meson.meson_tac(@list.List([]))
  let t418 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t417 = @simp.rewrite_tac(@list.List([@class.not_imp(), @class.de_morgan_thm()]))
  let t416 = @simp.simp_tac(@list.List([]))
  let t415 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && (c : Bool)) == !(a && b → !c)"))]))
  let t414 = @tactics.try_tac(@tactics.conv_tac(@equal.land_conv(@equal.once_depth_conv(@equal.sym_conv))))
  let t413 = @simp.rewrite_tac(@list.List([@fol.term_distinct(), @fol.term_inj(), @fol.fvt(), @sets.in_sing(), @equal.gsym(@lists.all_mem()), @arith.gt()]))
  let t412 = @simp.gen_rewrite_tac(fn(x409 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s410 = @equal.land_conv(x409)
    fn(x411 : @kernel.Term) -> @kernel.Thm raise {
      s410(x411)
    }
  }, @list.List([lpo_cases()]))
  let t408 = @tactics.repeat_tac(@tactics.gen_tac)
  let t420 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t408), t412), t413), t414), t415), t416), t417), t418), t419)
  lpo_cases_v1_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : Term, ∀ x : Num, op_lt_lt(s, V(x)) == false) && (∀ x : Num, ∀ t : Term, op_lt_lt(V(x), t) == (IN(x, FVT(t)) && !(t == V(x)))) && (∀ f : Num, ∀ fargs : List[Term], ∀ g : Num, ∀ gargs : List[Term], op_lt_lt(Fn(f, fargs), Fn(g, gargs)) == ((∃ gi : Term, MEM(gi, gargs) && (op_lt_lt(Fn(f, fargs), gi) || Fn(f, fargs) == gi)) || (∀ fi : Term, MEM(fi, fargs) → op_lt_lt(fi, Fn(g, gargs))) && ((f < g || f == g && LENGTH(fargs) < LENGTH(gargs)) || f == g && LEX(op_lt_lt, fargs, gargs))))"), t420))
}

///|
let lpo_cases_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_CASES")

///|
/// `LPO_CASES`
pub fn lpo_cases_v1() -> @kernel.Thm {
  lpo_cases_v1_c.get()
}

///|
/// LPO_FVT
fn step_42() -> Unit raise {
  let t427 = @meson.meson_tac(@list.List([]))
  let t425 = @equal.gsym(@lists.all_mem())
  let t426 = @simp.simp_tac(@list.List([@fol.fvt(), @sets.subset(), @sets.in_sing(), @fol.in_list_union(), @equal.gsym(@lists.ex_mem()), t425, @lists.mem_map()]))
  let t423 = @term_syntax.parse_term("(t : Term)")
  let t424 = @list.List([@tactics.all_tac, @tactics.spec_tac(@term_syntax.parse_term("Fn((ft : Num), (targs : List[Term]))"), t423), @tactics.all_tac, @tactics.all_tac])
  let t422 = @tactics.repeat_tac(@tactics.gen_tac)
  let t421 = @tactics.repeat_tac(@tactics.conj_tac)
  let t428 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lpo_induct()), t421), t422), t424), t426), t427)
  lpo_fvt_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, op_lt_lt(s, t) → SUBSET(FVT(s), FVT(t))"), t428))
}

///|
let lpo_fvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_FVT")

///|
/// `LPO_FVT`
pub fn lpo_fvt() -> @kernel.Thm {
  lpo_fvt_c.get()
}

///|
/// LPO_TRANS_INDUCT
fn step_43() -> Unit raise {
  let t600 = @meson.asm_meson_tac(@list.List([]))
  let t599 = @tactics.first_assum(@tactics.match_mp_tac)
  let t598 = @simp.simp_tac(@list.List([]))
  let t597 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a1 : Bool) && (a2 : Bool) → (a3 : Bool)) && ((b1 : Bool) → (b2 : Bool) → (b3 : Bool)) → a1 && b1 → a2 && b2 → a3 && b3")))
  let t596 = @tactics.try_tac(@tactics.asm_tac((x595 : @list.List[@kernel.Thm]) => @meson.gen_meson_tac(0L, 15L, 1L, x595))(@list.List([lex_length()])))
  let t594 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t593 = @simp.rewrite_tac(@list.List([lex(), @lists.mem()]))
  let t592 = @tactics.repeat_tac(@lists.list_induct_tac)
  let t591 = @tactics.pop_assum_list(fn(x590 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t587 = @term_syntax.parse_term("(ts : List[Term])")
  let t588 = @term_syntax.parse_term("(ss : List[Term])")
  let t589 = @tactics.map_every(fn(x585 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s = x585
    @tactics.spec_tac(s, s)
  }, @list.List([@term_syntax.parse_term("(rs : List[Term])"), t588, t587]))
  let t583 = @simp.asm_simp_tac(@list.List([descendant_smaller()]))
  let t582 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.lt_add2()), @tactics.conj_tac))
  let t581 = @simp.asm_rewrite_tac(@list.List([]))
  let t580 = @tactics.exists_tac(@term_syntax.parse_term("(b : Term)"))
  let t579 = @tactics.first_assum(fn(x576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x576
    let t578 = @tactics.exists_tac(@term_syntax.parse_term("termsize((a : Term)) + (termsize((b : Term)) + termsize((c : Term)))"))
    @tactics.then_tac(@tactics.match_mp_tac(th_2), t578)
  })
  let t574 = @term_syntax.parse_term("(c : Term)")
  let t575 = @term_syntax.parse_term("(b : Term)")
  let t584 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Term)"), t575, t574])), @tactics.strip_tac), t579), t580), t581), t582), t583), @tactics.all_tac])
  let t573 = @tactics.subgoal_then(@term_syntax.parse_term("∀ r : Term, ∀ s : Term, ∀ t : Term, MEM(r, (rs : List[Term])) && MEM(s, (ss : List[Term])) && MEM(t, (ts : List[Term])) && op_lt_lt(t, s) && op_lt_lt(s, r) → op_lt_lt(t, r)"), fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s571 = @tactics.mp_tac(x570)
    fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s571(x572)
    }
  })
  let t569 = @tactics.first_x_assum(fn(x568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s566 = @tactics.mp_tac(x565)
      fn(x567 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s566(x567)
      }
    })(@bool.conjunct2(x568))
  })
  let t564 = @tactics.first_x_assum(fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x560 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s561 = @tactics.mp_tac(x560)
      fn(x562 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s561(x562)
      }
    })(@bool.conjunct2(x563))
  })
  let t559 = @simp.asm_rewrite_tac(@list.List([]))
  let t558 = @list.List([@meson.asm_meson_tac(@list.List([@arith.lt_trans(), lex_length()])), @tactics.all_tac])
  let t557 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t556 = @list.List([@meson.asm_meson_tac(@list.List([@arith.lt_trans(), lex_length()])), @tactics.all_tac])
  let t555 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t554 = @simp.asm_rewrite_tac(@list.List([]))
  let t553 = @simp.once_rewrite_tac(@list.List([lpo_cases_v1()]))
  let t552 = @tactics.undisch_tac(@term_syntax.parse_term("op_lt_lt(Fn((g : Num), (ss : List[Term])), Fn((f : Num), (rs : List[Term])))"))
  let t551 = @tactics.undisch_tac(@term_syntax.parse_term("op_lt_lt(Fn((h : Num), (ts : List[Term])), Fn((g : Num), (ss : List[Term])))"))
  let t549 = @simp.asm_simp_tac(@list.List([@arith.lt_add_lcancel(), descendant_smaller()]))
  let t548 = @tactics.exists_tac(@term_syntax.parse_term("Fn((g : Num), (ss : List[Term]))"))
  let t547 = @tactics.first_assum(fn(x544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x544
    let t546 = @tactics.exists_tac(@term_syntax.parse_term("termsize(Fn((f : Num), (rs : List[Term]))) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize((ti : Term)))"))
    @tactics.then_tac(@tactics.match_mp_tac(th_1), t546)
  })
  let t550 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t547), t548), t549), @tactics.all_tac])
  let t543 = @tactics.subgoal_then(@term_syntax.parse_term("∀ ti : Term, MEM(ti, (ts : List[Term])) → op_lt_lt(ti, Fn((f : Num), (rs : List[Term])))"), fn(x540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s541 = @tactics.assume_tac(x540)
    fn(x542 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s541(x542)
    }
  })
  let t538 = @meson.asm_meson_tac(@list.List([]))
  let t537 = @simp.rewrite_tac(@list.List([@fol.term_distinct(), @fol.term_inj(), @equal.gsym(@lists.all_mem())]))
  let t536 = @simp.gen_rewrite_tac(fn(x533 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s534 = @equal.land_conv(x533)
    fn(x535 : @kernel.Term) -> @kernel.Thm raise {
      s534(x535)
    }
  }, @list.List([lpo_cases()]))
  let t539 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_lt_lt(Fn((h : Num), (ts : List[Term])), Fn((g : Num), (ss : List[Term])))")), t536), t537), t538), @tactics.all_tac])
  let t532 = @tactics.subgoal_then(@term_syntax.parse_term("∀ ti : Term, MEM(ti, (ts : List[Term])) → op_lt_lt(ti, Fn((g : Num), (ss : List[Term])))"), fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s530 = @tactics.assume_tac(x529)
    fn(x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s530(x531)
    }
  })
  let t527 = @simp.asm_rewrite_tac(@list.List([]))
  let t526 = @tactics.match_mp_tac(descendant_smaller())
  let t525 = @simp.asm_simp_tac(@list.List([@arith.lt_add_lcancel(), @arith.lt_add_rcancel()]))
  let t524 = @tactics.exists_tac(@term_syntax.parse_term("(si : Term)"))
  let t523 = @tactics.first_assum(fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x520
    let t522 = @tactics.exists_tac(@term_syntax.parse_term("termsize(Fn((f : Num), (rs : List[Term]))) + (termsize((si : Term)) + termsize(Fn((h : Num), (ts : List[Term]))))"))
    @tactics.then_tac(@tactics.match_mp_tac(th), t522)
  })
  let t519 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t518 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t517 = @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s515 = @tactics.assume_tac(x514)
    fn(x516 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s515(x516)
    }
  })
  let t528 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(si : Term)"))(t517)), t518), t519), t523), t524), t525), t526), t527), @tactics.all_tac])
  let t513 = @class.asm_cases_tac(@term_syntax.parse_term("∃ si : Term, MEM(si, (ss : List[Term])) && (op_lt_lt(Fn((h : Num), (ts : List[Term])), si) || Fn(h, ts) == si)"))
  let t511 = @meson.asm_meson_tac(@list.List([]))
  let t510 = @simp.rewrite_tac(@list.List([@fol.term_distinct(), @fol.term_inj(), @equal.gsym(@lists.all_mem())]))
  let t509 = @simp.gen_rewrite_tac(fn(x506 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s507 = @equal.land_conv(x506)
    fn(x508 : @kernel.Term) -> @kernel.Thm raise {
      s507(x508)
    }
  }, @list.List([lpo_cases()]))
  let t512 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_lt_lt(Fn((g : Num), (ss : List[Term])), Fn((f : Num), (rs : List[Term])))")), t509), t510), t511), @tactics.all_tac])
  let t505 = @tactics.subgoal_then(@term_syntax.parse_term("∀ si : Term, MEM(si, (ss : List[Term])) → op_lt_lt(si, Fn((f : Num), (rs : List[Term])))"), fn(x502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s503 = @tactics.assume_tac(x502)
    fn(x504 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s503(x504)
    }
  })
  let t500 = @simp.asm_rewrite_tac(@list.List([]))
  let t499 = @tactics.match_mp_tac(descendant_smaller())
  let t498 = @simp.asm_rewrite_tac(@list.List([@arith.lt_add_rcancel()]))
  let t497 = @tactics.exists_tac(@term_syntax.parse_term("Fn((g : Num), (ss : List[Term]))"))
  let t496 = @tactics.exists_tac(@term_syntax.parse_term("termsize((ri : Term)) + (termsize(Fn((g : Num), (ss : List[Term]))) + termsize(Fn((h : Num), (ts : List[Term]))))"))
  let t495 = @tactics.first_assum(@tactics.match_mp_tac)
  let t494 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t493 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t492 = @simp.asm_rewrite_tac(@list.List([]))
  let t491 = @tactics.exists_tac(@term_syntax.parse_term("(ri : Term)"))
  let t490 = @tactics.match_mp_tac(@lib.el(1, @bool.conjuncts_rule(lpo_rules())))
  let t489 = @tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s487 = @tactics.assume_tac(x486)
    fn(x488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s487(x488)
    }
  })
  let t501 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(ri : Term)"))(t489)), t490), t491), t492), t493), t494), @tactics.disj1_tac), t495), t496), t497), t498), t499), t500), @tactics.all_tac])
  let t485 = @class.asm_cases_tac(@term_syntax.parse_term("∃ ri : Term, MEM(ri, (rs : List[Term])) && (op_lt_lt(Fn((g : Num), (ss : List[Term])), ri) || Fn(g, ss) == ri)"))
  let t484 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()])))
  let t483 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm()])))
  let t481 = @tactics.x_choose_then(@term_syntax.parse_term("(ss : List[Term])"))(fn(x478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s479 = @tactics.subst_all_tac(x478)
    fn(x480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s479(x480)
    }
  })
  let t482 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : Num)"))(t481))
  let t477 = @list.List([@meson.asm_meson_tac(@list.List([lpo_cases_v1()])), @tactics.all_tac])
  let t475 = @bool.spec(@term_syntax.parse_term("(s : Term)"), @fol.term_cases())
  let t476 = @tactics.disj_cases_then(fn(x472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s473 = @tactics.mp_tac(x472)
    fn(x474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s473(x474)
    }
  })(t475)
  let t470 = @tactics.x_choose_then(@term_syntax.parse_term("(rs : List[Term])"))(fn(x467 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s468 = @tactics.subst_all_tac(x467)
    fn(x469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s468(x469)
    }
  })
  let t471 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : Num)"))(t470))
  let t466 = @list.List([@meson.asm_meson_tac(@list.List([lpo_cases_v1()])), @tactics.all_tac])
  let t464 = @bool.spec(@term_syntax.parse_term("(r : Term)"), @fol.term_cases())
  let t465 = @tactics.disj_cases_then(fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s462 = @tactics.mp_tac(x461)
    fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s462(x463)
    }
  })(t464)
  let t460 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x456 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s454 = @tactics.subst_all_tac(x453)
      fn(x455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s454(x455)
      }
    })(@equal.sym(x456))
  }, fn(x457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s458 = @tactics.mp_tac(x457)
    fn(x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s458(x459)
    }
  }))
  let t451 = @tactics.x_choose_then(@term_syntax.parse_term("(ts : List[Term])"))(fn(x448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s449 = @tactics.subst_all_tac(x448)
    fn(x450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s449(x450)
    }
  })
  let t452 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(h : Num)"))(t451))
  let t445 = @meson.asm_meson_tac(@list.List([lpo_cases_v1()]))
  let t444 = @meson.meson_tac(@list.List([]))
  let t443 = @simp.rewrite_tac(@list.List([@fol.fvt(), @sets.subset(), @sets.in_sing()]))
  let t441 = @kernel.assume_rule(@term_syntax.parse_term("op_lt_lt((s : Term), (r : Term))"))
  let t442 = @tactics.mp_tac(@drule.match_mp(lpo_fvt())(t441))
  let t440 = @kernel.assume_rule(@term_syntax.parse_term("op_lt_lt(V((x : Num)), (s : Term))"))
  let t446 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@drule.match_mp(lpo_fvt())(t440)), t442), t443), t444), t445])
  let t439 = @tactics.match_mp_tac(@lib.el(0, @bool.conjuncts_rule(lpo_rules())))
  let t447 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(fn(x436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s437 = @tactics.subst_all_tac(x436)
    fn(x438 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s437(x438)
    }
  })), @tactics.strip_tac), t439), @tactics.conj_tac), t446), @tactics.all_tac])
  let t434 = @bool.spec(@term_syntax.parse_term("(t : Term)"), @fol.term_cases())
  let t435 = @tactics.disj_cases_then(fn(x431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s432 = @tactics.mp_tac(x431)
    fn(x433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s432(x433)
    }
  })(t434)
  let t430 = @tactics.repeat_tac(@tactics.gen_tac)
  let t429 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t601 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.num_wf()), t429), @tactics.disch_tac), t430), t435), t447), t452), t460), t465), t466), t471), t476), t477), t482), @tactics.strip_tac), t483), t484), t485), t501), t505), t512), t513), t528), t532), t539), t543), t550), t551), t552), t553), t554), t555), t556), t557), t558), @tactics.disj2_tac), @tactics.disj2_tac), t559), t564), t569), t573), t584), t589), t591), t592), t593), t594), t596), @tactics.disch_tac), t597), t598), t599), t600)
  lpo_trans_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ r : Term, ∀ s : Term, ∀ t : Term, termsize(r) + (termsize(s) + termsize(t)) == n && op_lt_lt(t, s) && op_lt_lt(s, r) → op_lt_lt(t, r)"), t601))
}

///|
let lpo_trans_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_TRANS_INDUCT")

///|
/// `LPO_TRANS_INDUCT`
pub fn lpo_trans_induct() -> @kernel.Thm {
  lpo_trans_induct_c.get()
}

///|
/// LPO_TRANS
fn step_44() -> Unit raise {
  let t602 = @meson.meson_tac(@list.List([lpo_trans_induct()]))
  lpo_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, ∀ u : Term, op_lt_lt(s, t) && op_lt_lt(t, u) → op_lt_lt(s, u)"), t602))
}

///|
let lpo_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_TRANS")

///|
/// `LPO_TRANS`
pub fn lpo_trans() -> @kernel.Thm {
  lpo_trans_c.get()
}

///|
/// LPO_SUBTERM_LEMMA
fn step_45() -> Unit raise {
  let t613 = @simp.asm_rewrite_tac(@list.List([@fol.fvt()]))
  let t612 = @tactics.exists_tac(@term_syntax.parse_term("V((x : Num))"))
  let t611 = @simp.rewrite_tac(@list.List([@fol.fvt(), @sets.in_sing()]))
  let t610 = @tactics.exists_tac(@term_syntax.parse_term("FVT(V((x : Num)))"))
  let t609 = @simp.rewrite_tac(@list.List([@fol.term_distinct()]))
  let t608 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t606 = @equal.gsym(@lists.all_mem())
  let t607 = @simp.rewrite_tac(@list.List([@fol.fvt(), @fol.in_list_union(), @equal.gsym(@lists.ex_mem()), t606, @lists.mem_map()]))
  let t605 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t604 = @simp.once_rewrite_tac(@list.List([lpo_cases_v1()]))
  let t603 = @tactics.match_mp_tac(@fol.term_induct())
  let t614 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t603), t604), @tactics.conj_tac), t605), t607), t608), @tactics.disch_tac), t609), t610), t611), t612), t613)
  lpo_subterm_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Num, ∀ args : List[Term], ∀ a : Term, MEM(a, args) → op_lt_lt(a, Fn(f, args))"), t614))
}

///|
let lpo_subterm_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_SUBTERM_LEMMA")

///|
/// `LPO_SUBTERM_LEMMA`
pub fn lpo_subterm_lemma() -> @kernel.Thm {
  lpo_subterm_lemma_c.get()
}

///|
/// LPO_SUBTERM
fn step_46() -> Unit raise {
  let t618 = @simp.asm_simp_tac(@list.List([lpo_subterm_lemma()]))
  let t617 = @tactics.exists_tac(@term_syntax.parse_term("(a : Term)"))
  let t619 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.match_mp_tac(lpo_trans())), t617), t618)
  let t620 = @list.List([@meson.asm_meson_tac(@list.List([lpo_subterm_lemma()])), t619])
  let t616 = @tactics.repeat_tac(@tactics.strip_tac)
  let t615 = @simp.rewrite_tac(@list.List([]))
  let t621 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(subterm_induct()), t615), t616), t620)
  lpo_subterm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, subterm(s, t) → s == t || op_lt_lt(s, t)"), t621))
}

///|
let lpo_subterm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_SUBTERM")

///|
/// `LPO_SUBTERM`
pub fn lpo_subterm() -> @kernel.Thm {
  lpo_subterm_c.get()
}

///|
/// LPO_PSUBTERM
fn step_47() -> Unit raise {
  let t622 = @meson.meson_tac(@list.List([lpo_subterm()]))
  let t623 = @tactics.then_tac(@simp.rewrite_tac(@list.List([psubterm()])), t622)
  lpo_psubterm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, psubterm(s, t) → op_lt_lt(s, t)"), t623))
}

///|
let lpo_psubterm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_PSUBTERM")

///|
/// `LPO_PSUBTERM`
pub fn lpo_psubterm() -> @kernel.Thm {
  lpo_psubterm_c.get()
}

///|
/// LPO_INSTANTIATION
fn step_48() -> Unit raise {
  let t651 = @simp.asm_simp_tac(@list.List([lex_map()]))
  let t650 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@fol.termsubst()])))
  let t649 = @simp.rewrite_tac(@list.List([@lists.all_map(), @trivia.o_def()]))
  let t648 = @simp.asm_rewrite_tac(@list.List([]))
  let t647 = @tactics.match_mp_tac(@lib.el(3, @bool.conjuncts_rule(lpo_rules())))
  let t652 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.termsubst()])), t647), t648), t649), t650), t651)
  let t646 = @meson.asm_meson_tac(@list.List([]))
  let t645 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem()), @lists.mem_map(), @fol.termsubst(), @lists.length_map()]))
  let t642 = @simp.gen_rewrite_rule(fn(x641 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x641
  }, @list.List([@equal.gsym(@lists.all_mem())]))
  let t644 = @tactics.first_x_assum(fn(x643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s639 = @tactics.mp_tac(x638)
      fn(x640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s639(x640)
      }
    })(t642(x643))
  })
  let t637 = @simp.asm_rewrite_tac(@list.List([]))
  let t636 = @tactics.match_mp_tac(@lib.el(2, @bool.conjuncts_rule(lpo_rules())))
  let t653 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.termsubst()])), t636), t637), t644), t645), t646)
  let t635 = @meson.asm_meson_tac(@list.List([@fol.termsubst()]))
  let t634 = @simp.rewrite_tac(@list.List([@lists.mem_map()]))
  let t633 = @tactics.match_mp_tac(@lib.el(1, @bool.conjuncts_rule(lpo_rules())))
  let t654 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.termsubst()])), t633), t634), t635)
  let t632 = @simp.asm_simp_tac(@list.List([subterm_fvt()]))
  let t631 = @simp.asm_rewrite_tac(@list.List([psubterm()]))
  let t630 = @tactics.match_mp_tac(psubterm_instantiation())
  let t655 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lpo_psubterm()), t630), t631), t632), t654, t653, t652])
  let t629 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s627 = @tactics.assume_tac(x626)
    fn(x628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s627(x628)
    }
  }))
  let t625 = @tactics.repeat_tac(@tactics.gen_tac)
  let t624 = @tactics.repeat_tac(@tactics.conj_tac)
  let t656 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(lpo_induct())), t624), t625), t629), t655)
  lpo_instantiation_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : (Num) -> Term, ∀ s : Term, ∀ t : Term, op_lt_lt(s, t) → op_lt_lt(termsubst(i, s), termsubst(i, t))"), t656))
}

///|
let lpo_instantiation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_INSTANTIATION")

///|
/// `LPO_INSTANTIATION`
pub fn lpo_instantiation() -> @kernel.Thm {
  lpo_instantiation_c.get()
}

///|
/// LPO_CONGRUENCE
fn step_49() -> Unit raise {
  let t684 = @simp.rewrite_tac(@list.List([@lists.length(), @lists.length_append()]))
  let t683 = @simp.asm_rewrite_tac(@list.List([lex(), @lists.append()]))
  let t682 = @term_syntax.parse_term("(largs : List[Term])")
  let t685 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(largs : List[Term])"), t682), @lists.list_induct_tac), t683), @class.cond_cases_tac), t684)
  let t679 = @meson.asm_meson_tac(@list.List([@lists.mem(), @lists.mem_append()]))
  let t678 = @simp.rewrite_tac(@list.List([subterm_refl()]))
  let t675 = @term_syntax.parse_term("(u : Term)")
  let t676 = @term_syntax.parse_term("APPEND((largs : List[Term]), CONS((t : Term), (rargs : List[Term])))")
  let t677 = @tactics.map_every(fn(x672 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s673 = @tactics.exists_tac(x672)
    fn(x674 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s673(x674)
    }
  }, @list.List([@term_syntax.parse_term("(f : Num)"), t676, t675]))
  let t671 = @simp.once_rewrite_tac(@list.List([psubterm_cases()]))
  let t680 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lpo_psubterm()), t671), t677), t678), t679)
  let t670 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), subterm_refl(), @lists.mem_append()]))
  let t667 = @term_syntax.parse_term("(t : Term)")
  let t668 = @term_syntax.parse_term("APPEND((largs : List[Term]), CONS((t : Term), (rargs : List[Term])))")
  let t669 = @tactics.map_every(fn(x664 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s665 = @tactics.exists_tac(x664)
    fn(x666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s665(x666)
    }
  }, @list.List([@term_syntax.parse_term("(f : Num)"), t668, t667]))
  let t663 = @simp.once_rewrite_tac(@list.List([psubterm_cases()]))
  let t662 = @tactics.match_mp_tac(lpo_psubterm())
  let t661 = @simp.asm_rewrite_tac(@list.List([]))
  let t660 = @tactics.exists_tac(@term_syntax.parse_term("(t : Term)"))
  let t681 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lpo_trans()), t660), t661), t662), t663), t669), t670), t680])
  let t659 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Term) == (s : Term)"))
  let t658 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Term)"))
  let t686 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())])), t658), @tactics.disch_tac), t659), t681), t685])
  let t657 = @tactics.match_mp_tac(@lib.last(@bool.conjuncts_rule(lpo_rules())))
  let t687 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t657), @tactics.conj_tac), t686)
  lpo_congruence_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, op_lt_lt(s, t) → op_lt_lt(Fn((f : Num), APPEND((largs : List[Term]), CONS(s, (rargs : List[Term])))), Fn(f, APPEND(largs, CONS(t, rargs))))"), t687))
}

///|
let lpo_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_CONGRUENCE")

///|
/// `LPO_CONGRUENCE`
pub fn lpo_congruence() -> @kernel.Thm {
  lpo_congruence_c.get()
}

///|
/// LPO_REFL
fn step_50() -> Unit raise {
  let t693 = @meson.asm_meson_tac(@list.List([lpo_psubterm(), lpo_trans(), psubterm_cases(), subterm_refl(), descendant_smaller(), @arith.lt_refl()]))
  let t692 = @simp.asm_simp_tac(@list.List([lex_refl()]))
  let t691 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem()), @arith.lt_refl()]))
  let t690 = @simp.rewrite_tac(@list.List([]))
  let t689 = @simp.once_rewrite_tac(@list.List([lpo_cases_v1()]))
  let t688 = @tactics.repeat_tac(@tactics.gen_tac)
  let t694 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.term_induct()), @tactics.conj_tac), t688), t689), t690), t691), t692), t693)
  lpo_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, !op_lt_lt(t, t)"), t694))
}

///|
let lpo_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_REFL")

///|
/// `LPO_REFL`
pub fn lpo_refl() -> @kernel.Thm {
  lpo_refl_c.get()
}

///|
/// LPO_WF
fn step_51() -> Unit raise {
  let t922 = @meson.asm_meson_tac(@list.List([@arith.lt_refl()]))
  let t921 = @simp.asm_rewrite_tac(@list.List([]))
  let t920 = @tactics.match_mp_tac(lex_restrict())
  let t919 = @simp.asm_rewrite_tac(@list.List([]))
  let t917 = @term_syntax.parse_term("(n : Num) => (args : (Num) -> List[Term])((k : (Num) -> Num)(n))")
  let t918 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : Term) => (t : Term) => SUBSET(functions_term(s), (A : ((Num, Num)) -> Bool)) && SUBSET(functions_term(t), A) && op_lt_lt(s, t)"), t917]), wf_lex_strong()))
  let t916 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t914 = @meson.asm_meson_tac(@list.List([@arith.add_clauses()]))
  let t912 = @meson.meson_tac(@list.List([lpo_trans()]))
  let t911 = @simp.asm_rewrite_tac(@list.List([]))
  let t910 = @tactics.first_x_assum(fn(x909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s903 = @tactics.mp_tac(x902)
      fn(x904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s903(x904)
      }
    })(((x908 : @kernel.Thm) => @lib.check(fn(x907 : @kernel.Thm) -> Bool raise {
      (fn(x905 : @kernel.Term) -> Bool raise {
        @basics.is_disj(x905)
      })((fn(x906 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x906)
      })(x907))
    }, x908))(x909))
  })
  let t901 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t897 = @term_syntax.parse_term("(k : (Num) -> Num)(SUC((n : Num))) + (m : Num)")
  let t900 = @tactics.disch_then(fn(x899 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x894 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s895 = @tactics.mp_tac(x894)
      fn(x896 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s895(x896)
      }
    })(((x898 : @kernel.Thm) => @bool.spec(t897, x898))(x899))
  })
  let t893 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, op_lt_lt((t : (Num) -> Term)(SUC(n)), t(n))"))
  let t892 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t887 = @term_syntax.parse_term("(k : (Num) -> Num)(SUC((n : Num))) + (m : Num)")
  let t888 = @list.List([@term_syntax.parse_term("(k : (Num) -> Num)(SUC((n : Num)))"), t887])
  let t891 = @tactics.first_assum(fn(x890 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s885 = @tactics.mp_tac(x884)
      fn(x886 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s885(x886)
      }
    })(((x889 : @kernel.Thm) => @bool.specl(t888, x889))(x890))
  })
  let t883 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t913 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])), @tactics.conj_tac), t883), t891), t892), t893), t900), t901), t910), t911), t912), @tactics.all_tac])
  let t882 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t881 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t880 = @tactics.exists_tac(@term_syntax.parse_term("(r : Num) => if r == 0 { (a : Term) } else { (t : (Num) -> Term)((k : (Num) -> Num)(SUC((n : Num))) + r) }"))
  let t879 = @simp.rewrite_tac(@list.List([nonwf(), @class.taut(@term_syntax.parse_term("(!(p : Bool) → !(q : Bool) && !(r : Bool)) == (q || r → p)"))]))
  let t875 = @kernel.assume_rule(@term_syntax.parse_term("MEM((a : Term), (args : (Num) -> List[Term])((k : (Num) -> Num)((n : Num))))"))
  let t873 = @simp.gen_rewrite_rule(fn(x870 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s871 = @equal.rand_conv(x870)
    fn(x872 : @kernel.Term) -> @kernel.Thm raise {
      s871(x872)
    }
  }, @list.List([nonwf()]))
  let t878 = @tactics.first_assum(fn(x877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x867 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s868 = @tactics.mp_tac(x867)
        fn(x869 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s868(x869)
        }
      })(t873(x874))
    })((fn(x876 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x876)(t875)
    })(x877))
  })
  let t866 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) → !a || b")))
  let t865 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t915 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t865), t866), @tactics.disch_tac), t878), t879), @tactics.disch_tac), t880), t881), t882), @class.cond_cases_tac), t913), t914), @tactics.all_tac])
  let t864 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ a : Term, !(MEM(a, (args : (Num) -> List[Term])((k : (Num) -> Num)(n))) && (op_lt_lt(Fn((f : Num), args(k(SUC(n)))), a) || Fn(f, args(k(SUC(n)))) == a))"), fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x862
    @simp.rewrite_tac(@list.List([th_2]))
  })
  let t860 = @meson.asm_meson_tac(@list.List([]))
  let t859 = @simp.asm_rewrite_tac(@list.List([@fol.functions_term(), @sets.subset(), @fol.in_list_union(), @sets.in_insert(), @lists.mem_map(), @equal.gsym(@lists.ex_mem())]))
  let t855 = @term_syntax.parse_term("(n : Num)")
  let t858 = @tactics.undisch_then(@term_syntax.parse_term("∀ n : Num, SUBSET(functions_term((t : (Num) -> Term)(n)), (A : ((Num, Num)) -> Bool))"), fn(x857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s853 = @tactics.mp_tac(x852)
      fn(x854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s853(x854)
      }
    })(((x856 : @kernel.Thm) => @bool.spec(t855, x856))(x857))
  })
  let t861 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t858), t859), t860), @tactics.all_tac])
  let t851 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : Term, ∀ n : Num, MEM(a, (args : (Num) -> List[Term])(n)) → SUBSET(functions_term(a), (A : ((Num, Num)) -> Bool))"), fn(x848 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s849 = @tactics.assume_tac(x848)
    fn(x850 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s849(x850)
    }
  })
  let t847 = @simp.rewrite_tac(@list.List([@arith.lt_refl()]))
  let t846 = @simp.once_rewrite_tac(@list.List([lpo_cases_v1()]))
  let t845 = @simp.asm_rewrite_tac(@list.List([]))
  let t842 = @simp.gen_rewrite_rule(fn(x841 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x841
  }, @list.List([@analysis.subseq_suc()]))
  let t844 = @tactics.first_assum(fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x838 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s839 = @tactics.assume_tac(x838)
      fn(x840 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s839(x840)
      }
    })(t842(x843))
  })
  let t833 = @term_syntax.parse_term("(k : (Num) -> Num)(SUC((n : Num)))")
  let t834 = @list.List([@term_syntax.parse_term("(k : (Num) -> Num)((n : Num))"), t833])
  let t830 = @term_syntax.parse_term("(n : Num)")
  let t837 = @tactics.disch_then(fn(x836 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x832 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s828 = @tactics.mp_tac(x827)
        fn(x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s828(x829)
        }
      })(((x831 : @kernel.Thm) => @bool.gen(t830, x831))(x832))
    })(((x835 : @kernel.Thm) => @bool.specl(t834, x835))(x836))
  })
  let t825 = @meson.asm_meson_tac(@list.List([lpo_trans()]))
  let t826 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_suc_lt())])), t825), @tactics.all_tac])
  let t824 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → op_lt_lt((t : (Num) -> Term)(n), t(m))"), fn(x821 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s822 = @tactics.mp_tac(x821)
    fn(x823 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s822(x823)
    }
  })
  let t819 = @meson.asm_meson_tac(@list.List([lpo_trans()]))
  let t818 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t820 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ d : Num, op_lt_lt((t : (Num) -> Term)(n + d), t(n)) || t(n + d) == t(n)"), fn(x816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x816
    @meson.meson_tac(@list.List([th_1, @arith.le_exists()]))
  }), @tactics.gen_tac), @nums.induct_tac), t818), t819), @tactics.all_tac])
  let t815 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m <= n → op_lt_lt((t : (Num) -> Term)(n), t(m)) || t(n) == t(m)"), fn(x812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s813 = @tactics.assume_tac(x812)
    fn(x814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s813(x814)
    }
  })
  let t809 = @tactics.x_choose_then(@term_syntax.parse_term("(k : (Num) -> Num)"))(@tactics.strip_assume_tac)
  let t810 = @tactics.x_choose_then(@term_syntax.parse_term("(ar : Num)"))(t809)
  let t811 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : Num)"))(t810))
  let t808 = @simp.rewrite_tac(@list.List([@pair.pair_eq(), @theorems.forall_and_thm()]))
  let t807 = @simp.gen_rewrite_tac(fn(x804 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s805 = @equal.land_conv(x804)
    fn(x806 : @kernel.Term) -> @kernel.Thm raise {
      s805(x806)
    }
  }, @list.List([@pair.exists_pair_thm()]))
  let t802 = @simp.asm_rewrite_tac(@list.List([@fol.functions_term(), @sets.in_insert()]))
  let t801 = @tactics.disch_then(@tactics.match_mp_tac)
  let t797 = @term_syntax.parse_term("(n : Num)")
  let t795 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let t800 = @tactics.disch_then(fn(x799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x792 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s793 = @tactics.mp_tac(x792)
        fn(x794 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s793(x794)
        }
      })(t795(x796))
    })(((x798 : @kernel.Thm) => @bool.spec(t797, x798))(x799))
  })
  let t791 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, SUBSET(functions_term((t : (Num) -> Term)(n)), (A : ((Num, Num)) -> Bool))"))
  let t790 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t789 = @simp.asm_rewrite_tac(@list.List([]))
  let t788 = @tactics.exists_tac(@term_syntax.parse_term("(A : ((Num, Num)) -> Bool)"))
  let t803 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(sequence_partition_lemma()), t788), t789), t790), t791), t800), t801), t802), @tactics.all_tac])
  let t787 = @tactics.subgoal_then(@parser.parse_term("?far:num#num s. subseq s /\\\n                    (forall n:num. fn(s n),LENGTH(args(s n):term list) = far)"), fn(x784 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s785 = @tactics.mp_tac(x784)
    fn(x786 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s785(x786)
    }
  })
  let t782 = @tactics.x_choose_then(@term_syntax.parse_term("(args : (Num) -> List[Term])"))(@tactics.strip_assume_tac)
  let t783 = @tactics.disch_then(@tactics.x_choose_then(@parser.parse_term("fn:num->num"))(t782))
  let t781 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.forall_and_thm(), @equal.gsym(@lists.all_mem())]))
  let t776 = @simp.asm_rewrite_tac(@list.List([]))
  let t777 = @tactics.then_tac(@tactics.match_mp_tac(descendant_smaller()), t776)
  let t773 = @simp.asm_rewrite_tac(@list.List([]))
  let t774 = @tactics.then_tac(@tactics.first_assum(fn(x764 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x764
    @simp.gen_rewrite_tac(fn(x772 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x766 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s767 = @equal.land_conv(x766)
        fn(x768 : @kernel.Term) -> @kernel.Thm raise {
          s767(x768)
        }
      })((fn(x769 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s770 = @equal.rand_conv(x769)
        fn(x771 : @kernel.Term) -> @kernel.Thm raise {
          s770(x771)
        }
      })(x772))
    }, @list.List([@drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n == SUC(n - 1)")))(th)]))
  }), t773)
  let t763 = @simp.asm_rewrite_tac(@list.List([subterm_refl()]))
  let t760 = @term_syntax.parse_term("(u : Term)")
  let t761 = @term_syntax.parse_term("(args : List[Term])")
  let t762 = @tactics.map_every(fn(x757 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s758 = @tactics.exists_tac(x757)
    fn(x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s758(x759)
    }
  }, @list.List([@term_syntax.parse_term("(f : Num)"), t761, t760]))
  let t756 = @simp.once_rewrite_tac(@list.List([psubterm_cases()]))
  let t755 = @tactics.match_mp_tac(lpo_psubterm())
  let t775 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t755), t756), t762), t763), t774])
  let t754 = @tactics.exists_tac(@term_syntax.parse_term("(t : (Num) -> Term)((n : Num))"))
  let t778 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lpo_trans()), t754), @tactics.conj_tac), t775)
  let t753 = @meson.asm_meson_tac(@list.List([]))
  let t752 = @simp.asm_rewrite_tac(@list.List([@fol.functions_term(), @sets.subset(), @fol.in_list_union(), @sets.in_insert(), @lists.mem_map(), @equal.gsym(@lists.ex_mem())]))
  let t749 = @term_syntax.parse_term("(n : Num)")
  let t779 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("∀ n : Num, SUBSET(functions_term((t : (Num) -> Term)(n)), (A : ((Num, Num)) -> Bool))"), fn(x751 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s747 = @tactics.mp_tac(x746)
      fn(x748 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s747(x748)
      }
    })(((x750 : @kernel.Thm) => @bool.spec(t749, x750))(x751))
  }), t752), t753), t778, t777])
  let t745 = @tactics.repeat_tac(@tactics.conj_tac)
  let t744 = @simp.rewrite_tac(@list.List([@class.not_imp(), @equal.gsym(@theorems.conj_assoc()), @arith.not_le()]))
  let t743 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n - 1) == n"))]))
  let t738 = @term_syntax.parse_term("(u : Term)")
  let t739 = @list.List([@term_syntax.parse_term("(n : Num) - 1"), t738])
  let t742 = @tactics.first_x_assum(fn(x741 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s736 = @tactics.mp_tac(x735)
      fn(x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s736(x737)
      }
    })(((x740 : @kernel.Thm) => @bool.specl(t739, x740))(x741))
  })
  let t733 = @simp.asm_simp_tac(@list.List([@arith.not_le(), descendant_smaller()]))
  let t732 = @tactics.undisch_then(@term_syntax.parse_term("(n : Num) == 0"), fn(x729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s730 = @tactics.subst_all_tac(x729)
    fn(x731 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s730(x731)
    }
  })
  let t728 = @simp.asm_rewrite_tac(@list.List([]))
  let t725 = @term_syntax.parse_term("(u : Term)")
  let t734 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s723 = @tactics.mp_tac(x722)
      fn(x724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s723(x724)
      }
    })(((x726 : @kernel.Thm) => @bool.spec(t725, x726))(x727))
  }), t728), t732), t733), @tactics.all_tac])
  let t721 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t720 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Term)"))
  let t719 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t718 = @tactics.x_gen_tac(@term_syntax.parse_term("(args : List[Term])"))
  let t717 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t716 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : Num)"))
  let t715 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t714 = @list.List([@meson.asm_meson_tac(@list.List([lpo_cases_v1()])), @tactics.all_tac])
  let t713 = @tactics.disch_then(@tactics.disj_cases_then(fn(x710 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s711 = @tactics.mp_tac(x710)
    fn(x712 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s711(x712)
    }
  }))
  let t780 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : (Num) -> Term)((n : Num))"), @fol.term_cases()))), t713), t714), t715), t716), t717), t718), @tactics.disch_tac), t719), t720), @tactics.disch_tac), @tactics.disch_tac), t721), t734), t742), t743), t744), t745), t779), @tactics.all_tac])
  let t709 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∃ f : Num, ∃ args : List[Term], (t : (Num) -> Term)(n) == Fn(f, args) && ALL((t : Term) => !NONWF((s : Term) => (t : Term) => SUBSET(functions_term(s), (A : ((Num, Num)) -> Bool)) && SUBSET(functions_term(t), A) && op_lt_lt(s, t), t), args)"), fn(x706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s707 = @tactics.mp_tac(x706)
    fn(x708 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s707(x708)
    }
  })
  let t705 = @tactics.disch_then(fn(x704 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@bool.conjunct2(x704))
  })
  let t703 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t701 = @tactics.conjuncts_then2(fn(x698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s699 = @tactics.mp_tac(x698)
    fn(x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s699(x700)
    }
  }, @tactics.strip_assume_tac)
  let t702 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (Num) -> Term)"))(t701))
  let t697 = @simp.rewrite_tac(@list.List([]))
  let t696 = @tactics.exists_tac(@term_syntax.parse_term("termsize"))
  let t695 = @tactics.match_mp_tac(@bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(wf_minimal_dchain())).1))
  let t923 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t695), t696), t697), t702), t703), t705), t709), t780), t781), t783), t787), t803), t807), t808), t811), t815), t820), t824), t826), t837), t844), t845), t846), t847), t851), t861), t864), t915), t916), @tactics.strip_tac), t918), t919), @tactics.gen_tac), t920), t921), t922)
  lpo_wf_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Num, Num)) -> Bool, FINITE(A) → WF((s : Term) => (t : Term) => SUBSET(functions_term(s), A) && SUBSET(functions_term(t), A) && op_lt_lt(s, t))"), t923))
}

///|
let lpo_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_WF")

///|
/// `LPO_WF`
pub fn lpo_wf() -> @kernel.Thm {
  lpo_wf_c.get()
}

///|
/// LPO_SUBTERM_NOT
fn step_52() -> Unit raise {
  let t924 = @meson.meson_tac(@list.List([lpo_subterm(), lpo_trans(), lpo_refl()]))
  lpo_subterm_not_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ s : Term, subterm(s, t) → !op_lt_lt(t, s)"), t924))
}

///|
let lpo_subterm_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_SUBTERM_NOT")

///|
/// `LPO_SUBTERM_NOT`
pub fn lpo_subterm_not() -> @kernel.Thm {
  lpo_subterm_not_c.get()
}

///|
/// LEX_TOTAL
fn step_53() -> Unit raise {
  let t945 = @meson.asm_meson_tac(@list.List([]))
  let t944 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t943 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t939 = @term_syntax.parse_term("(ts : List[Term])")
  let t942 = @tactics.first_x_assum(fn(x941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s937 = @tactics.mp_tac(x936)
      fn(x938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s937(x938)
      }
    })(((x940 : @kernel.Thm) => @bool.spec(t939, x940))(x941))
  })
  let t935 = @simp.simp_tac(@list.List([@nums.suc_inj()]))
  let t934 = @tactics.disch_then(fn(x933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t931 = @term_syntax.parse_term("(ts : List[Term])")
  let t932 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(t : Term)"), t931]))
  let t930 = @simp.rewrite_tac(@list.List([lex(), @lists.mem(), @lists.length(), @nums.not_suc()]))
  let t929 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t927 = @term_syntax.parse_term("(ss : List[Term])")
  let t928 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t927]))
  let t926 = @list.List([@meson.meson_tac(@list.List([@lists.length_eq_nil()])), @tactics.all_tac])
  let t925 = @simp.rewrite_tac(@list.List([lex(), @lists.mem(), @lists.length(), @nums.not_suc()]))
  let t946 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t925), @tactics.conj_tac), t926), t928), @tactics.disch_tac), t929), t930), t932), t934), t935), @tactics.strip_tac), t942), @tactics.ants_tac), t943), t944), t945)
  lex_total_c.set(@tactics.prove(@term_syntax.parse_term("∀ fargs : List[Term], ∀ gargs : List[Term], LENGTH(fargs) == LENGTH(gargs) && (∀ fi : Term, ∀ gi : Term, MEM(fi, fargs) && MEM(gi, gargs) → op_lt_lt(fi, gi) || op_lt_lt(gi, fi) || fi == gi) → LEX(op_lt_lt, fargs, gargs) || LEX(op_lt_lt, gargs, fargs) || fargs == gargs"), t946))
}

///|
let lex_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEX_TOTAL")

///|
/// `LEX_TOTAL`
pub fn lex_total() -> @kernel.Thm {
  lex_total_c.get()
}

///|
/// LPO_GROUND_COMPLETE
fn step_54() -> Unit raise {
  let t1001 = @simp.asm_simp_tac(@list.List([]))
  let t1000 = @tactics.match_mp_tac(lex_total())
  let t999 = @simp.asm_rewrite_tac(@list.List([@arith.lt_refl()]))
  let t996 = @term_syntax.parse_term("LENGTH((gargs : List[Term]))")
  let t997 = @bool.specl(@list.List([@term_syntax.parse_term("LENGTH((fargs : List[Term]))"), t996]), @arith.lt_cases())
  let t998 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x993 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s994 = @tactics.assume_tac(x993)
    fn(x995 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s994(x995)
    }
  })(t997)
  let t992 = @simp.asm_rewrite_tac(@list.List([@arith.lt_refl()]))
  let t989 = @term_syntax.parse_term("(g : Num)")
  let t990 = @bool.specl(@list.List([@term_syntax.parse_term("(f : Num)"), t989]), @arith.lt_cases())
  let t991 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x986 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s987 = @tactics.assume_tac(x986)
    fn(x988 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s987(x988)
    }
  })(t990)
  let t985 = @simp.asm_rewrite_tac(@list.List([@fol.term_inj()]))
  let t983 = @simp.asm_rewrite_tac(@list.List([]))
  let t984 = @list.List([@meson.asm_meson_tac(@list.List([])), t983, @tactics.all_tac])
  let t982 = @tactics.subgoal_then(@term_syntax.parse_term("(∃ a : Term, MEM(a, (fargs : List[Term])) && (op_lt_lt(Fn((g : Num), (gargs : List[Term])), a) || Fn(g, gargs) == a)) || !(∃ a : Term, MEM(a, fargs) && (op_lt_lt(Fn(g, gargs), a) || Fn(g, gargs) == a)) && (∀ a : Term, MEM(a, fargs) → op_lt_lt(a, Fn(g, gargs)))"), @tactics.disj_cases_tac)
  let t980 = @simp.asm_rewrite_tac(@list.List([]))
  let t981 = @list.List([@meson.asm_meson_tac(@list.List([])), t980, @tactics.all_tac])
  let t979 = @tactics.subgoal_then(@term_syntax.parse_term("(∃ a : Term, MEM(a, (gargs : List[Term])) && (op_lt_lt(Fn((f : Num), (fargs : List[Term])), a) || Fn(f, fargs) == a)) || !(∃ a : Term, MEM(a, gargs) && (op_lt_lt(Fn(f, fargs), a) || Fn(f, fargs) == a)) && (∀ a : Term, MEM(a, gargs) → op_lt_lt(a, Fn(f, fargs)))"), @tactics.disj_cases_tac)
  let t978 = @simp.once_rewrite_tac(@list.List([lpo_cases_v1()]))
  let t976 = @meson.asm_meson_tac(@list.List([fvt_fun_empty()]))
  let t975 = @simp.asm_simp_tac(@list.List([@arith.lt_add_lcancel(), @arith.lt_add_rcancel(), descendant_smaller(), @int.arith_rule(@term_syntax.parse_term("((a : Num) + (b : Num) < b + (c : Num)) == (a < c)")), @arith.lt_add2()]))
  let t974 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t973 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) == (b && a && c && d)"))]))
  let t972 = @tactics.first_assum(@tactics.match_mp_tac)
  let t971 = @tactics.repeat_tac(@tactics.strip_tac)
  let t970 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()])))
  let t977 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("termsize(Fn((f : Num), (fargs : List[Term]))) + termsize(Fn((g : Num), (gargs : List[Term]))) == (n : Num)"), fn(x969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s967 = @tactics.subst_all_tac(x966)
      fn(x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s967(x968)
      }
    })(@equal.sym(x969))
  }), t970), t971), t972), t973), t974), t975), t976), @tactics.all_tac])
  let t965 = @tactics.subgoal_then(@term_syntax.parse_term("(∀ fi : Term, MEM(fi, (fargs : List[Term])) → op_lt_lt(fi, Fn((g : Num), (gargs : List[Term]))) || op_lt_lt(Fn(g, gargs), fi) || fi == Fn(g, gargs)) && (∀ gi : Term, MEM(gi, gargs) → op_lt_lt(gi, Fn((f : Num), fargs)) || op_lt_lt(Fn(f, fargs), gi) || gi == Fn(f, fargs)) && (∀ fi : Term, ∀ gi : Term, MEM(fi, fargs) && MEM(gi, gargs) → op_lt_lt(fi, gi) || op_lt_lt(gi, fi) || fi == gi)"), @tactics.strip_assume_tac)
  let t964 = @tactics.disch_then(fn(x963 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t961 = @term_syntax.parse_term("(gargs : List[Term])")
  let t962 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(g : Num)"), t961]))
  let t959 = @meson.meson_tac(@list.List([]))
  let t960 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fvt(), @sets.extension(), @sets.in_sing(), @sets.not_in_empty()])), t959), @tactics.all_tac])
  let t958 = @tactics.match_mp_tac(@fol.term_induct())
  let t957 = @tactics.disch_then(fn(x956 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t954 = @term_syntax.parse_term("(fargs : List[Term])")
  let t955 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : Num)"), t954]))
  let t952 = @meson.meson_tac(@list.List([]))
  let t953 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fvt(), @sets.extension(), @sets.in_sing(), @sets.not_in_empty()])), t952), @tactics.all_tac])
  let t951 = @tactics.match_mp_tac(@fol.term_induct())
  let t950 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t949 = @tactics.match_mp_tac(@arith.num_wf())
  let t1002 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ s : Term, ∀ t : Term, termsize(s) + termsize(t) == n && FVT(s) == {} && FVT(t) == {} → op_lt_lt(s, t) || op_lt_lt(t, s) || s == t"), fn(x947 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x947
    @meson.meson_tac(@list.List([th]))
  }), t949), t950), @tactics.disch_tac), t951), @tactics.conj_tac), t953), t955), t957), t958), @tactics.conj_tac), t960), t962), t964), @tactics.strip_tac), t965), t977), t978), t979), t981), t982), t984), t985), t991), t992), t998), t999), t1000), t1001)
  lpo_ground_complete_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, FVT(s) == {} && FVT(t) == {} → op_lt_lt(s, t) || op_lt_lt(t, s) || s == t"), t1002))
}

///|
let lpo_ground_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPO_GROUND_COMPLETE")

///|
/// `LPO_GROUND_COMPLETE`
pub fn lpo_ground_complete() -> @kernel.Thm {
  lpo_ground_complete_c.get()
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
}
