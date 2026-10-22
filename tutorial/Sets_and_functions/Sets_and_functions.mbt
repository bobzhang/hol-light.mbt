// Translated from upstream Tutorial/Sets_and_functions.ml; edit this file directly.

///|
/// SURJECTIVE_IFF_RIGHT_INVERSE
fn step_1() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def(), @trivia.i_def()])), t1)
  surjective_iff_right_inverse_c.set(@tactics.prove(@term_syntax.parse_term("(∀ y : _, ∃ x : _, (g : (_) -> _)(x) == y) == (∃ f : (_) -> _, o(g, f) == I)"), t2))
}

///|
let surjective_iff_right_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SURJECTIVE_IFF_RIGHT_INVERSE")

///|
/// `SURJECTIVE_IFF_RIGHT_INVERSE`
pub fn surjective_iff_right_inverse() -> @kernel.Thm {
  surjective_iff_right_inverse_c.get()
}

///|
/// INJECTIVE_IFF_LEFT_INVERSE
fn step_2() -> Unit raise {
  let lemma = @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : A, ∀ x' : A, (f : (A) -> B)(x) == f(x') → x == x') == (∀ y : B, ∃ u : A, ∀ x : A, f(x) == y → u == x)"))
  let t3 = @meson.meson_tac(@list.List([]))
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([lemma, @class.fun_eq_thm(), @trivia.o_def(), @trivia.i_def()])), t3)
  injective_iff_left_inverse_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : _, ∀ y : _, (f : (_) -> _)(x) == f(y) → x == y) == (∃ g : (_) -> _, o(g, f) == I)"), t4))
}

///|
let injective_iff_left_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJECTIVE_IFF_LEFT_INVERSE")

///|
/// `INJECTIVE_IFF_LEFT_INVERSE`
pub fn injective_iff_left_inverse() -> @kernel.Thm {
  injective_iff_left_inverse_c.get()
}

///|
/// cantor
fn step_3() -> Unit raise {
  cantor_c.set(@pair.new_definition(@term_syntax.parse_term("(cantor : ((Num, Num)) -> Num)(((x : Num), (y : Num))) == DIV(EXP(x + y, 2) + (3 * x + y), 2)")))
}

///|
let cantor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cantor")

///|
/// `cantor`
pub fn cantor() -> @kernel.Thm {
  cantor_c.get()
}

///|
/// CANTOR_LEMMA_LEMMA
fn step_4() -> Unit raise {
  let t10 = @simp.asm_simp_tac(@list.List([@arith.exp_2(), @arith.le_mult2()]))
  let t9 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) && (c : Num) <= (d : Num) → a + c <= b + (d + (e : Num))")))
  let t8 = @tactics.exists_tac(@term_syntax.parse_term("EXP((x : Num) + ((y : Num) + 1), 2) + (x + (y + 1))"))
  let t7 = @tactics.match_mp_tac(@arith.le_trans())
  let t6 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) + 2 <= (y : Num) → DIV(x, 2) < DIV(y, 2)")))
  let t5 = @simp.rewrite_tac(@list.List([cantor(), @int.arith_rule(@term_syntax.parse_term("3 * (x : Num) + (y : Num) == x + y + 2 * x"))]))
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((x : Num) + (y : Num) < (z : Num)) == (x + (y + 1) <= z)"))])), @tactics.disch_tac), t5), t6), t7), t8), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t9), t10)
  cantor_lemma_lemma_c.set(@tactics.prove(@term_syntax.parse_term("(x : Num) + (y : Num) < (x' : Num) + (y' : Num) → cantor((x, y)) < cantor((x', y'))"), t11))
}

///|
let cantor_lemma_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CANTOR_LEMMA_LEMMA")

///|
/// `CANTOR_LEMMA_LEMMA`
pub fn cantor_lemma_lemma() -> @kernel.Thm {
  cantor_lemma_lemma_c.get()
}

///|
/// CANTOR_LEMMA
fn step_5() -> Unit raise {
  let t12 = @meson.meson_tac(@list.List([@arith.lt_cases(), @arith.lt_refl(), cantor_lemma_lemma()]))
  cantor_lemma_c.set(@tactics.prove(@term_syntax.parse_term("cantor(((x : Num), (y : Num))) == cantor(((x' : Num), (y' : Num))) → x + y == x' + y'"), t12))
}

///|
let cantor_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CANTOR_LEMMA")

///|
/// `CANTOR_LEMMA`
pub fn cantor_lemma() -> @kernel.Thm {
  cantor_lemma_c.get()
}

///|
/// CANTOR_INJ
fn step_6() -> Unit raise {
  let t23 = @tactics.pop_assum(fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s21 = @tactics.mp_tac(x20)
    fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s21(x22)
    }
  })
  let t19 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV((a : Num) + ((b : Num) + 2 * (x : Num)), 2) == DIV(a + b, 2) + x"))]))
  let t18 = @simp.asm_rewrite_tac(@list.List([cantor(), @int.arith_rule(@term_syntax.parse_term("3 * (x : Num) + (y : Num) == x + y + 2 * x"))]))
  let t17 = @tactics.disch_then(fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x14
    let t16 = @tactics.assume_tac(@drule.match_mp(cantor_lemma())(th))
    @tactics.then_tac(@tactics.mp_tac(th), t16)
  })
  let t13 = @tactics.repeat_tac(@tactics.gen_tac)
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @pair.pair_eq()])), t13), t17), t18), t19), t23), @int.arith_tac)
  cantor_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : (Num, Num), ∀ z : (Num, Num), cantor(w) == cantor(z) → w == z"), t24))
}

///|
let cantor_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CANTOR_INJ")

///|
/// `CANTOR_INJ`
pub fn cantor_inj() -> @kernel.Thm {
  cantor_inj_c.get()
}

///|
/// CANTOR_THM
fn step_7() -> Unit raise {
  let t32 = @meson.meson_tac(@list.List([]))
  let t28 = @term_syntax.parse_term("(x : A) => !(g : (A, A) -> Bool)(x, x)")
  let t31 = @tactics.first_assum(fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s26 = @tactics.mp_tac(x25)
      fn(x27 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s26(x27)
      }
    })(((x29 : @kernel.Thm) => @bool.spec(t28, x29))(x30))
  })
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([injective_iff_left_inverse(), @class.fun_eq_thm(), @trivia.i_def(), @trivia.o_def()])), @tactics.strip_tac), t31), t32)
  cantor_thm_c.set(@tactics.prove(@term_syntax.parse_term("!(∃ f : ((A) -> Bool) -> A, ∀ x : (A) -> Bool, ∀ y : (A) -> Bool, f(x) == f(y) → x == y)"), t33))
}

///|
let cantor_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CANTOR_THM")

///|
/// `CANTOR_THM`
pub fn cantor_thm() -> @kernel.Thm {
  cantor_thm_c.get()
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
}
