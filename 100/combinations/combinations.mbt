// Translated from upstream 100/combinations.ml; edit this file directly.

///|
/// NUMBER_OF_COMBINATIONS
fn step_1() -> Unit raise {
  let t1 = @tactics.match_accept_tac(@binomial.has_size_restricted_powerset())
  number_of_combinations_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ s : (A) -> Bool, HAS_SIZE(s, n) → HAS_SIZE({(t : (A) -> Bool) | SUBSET(t, s) && HAS_SIZE(t, m)}, binom((n, m)))"), t1))
}

///|
let number_of_combinations_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMBER_OF_COMBINATIONS")

///|
/// `NUMBER_OF_COMBINATIONS`
pub fn number_of_combinations() -> @kernel.Thm {
  number_of_combinations_c.get()
}

///|
/// NUMBER_OF_COMBINATIONS_EXPLICIT
fn step_2() -> Unit raise {
  let t11 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_le()), @class.cond_swap(), @binomial.binom_v1(), @arith.mult_ac()]))
  let t8 = @drule.match_mp(number_of_combinations())
  let t5 = @term_syntax.parse_term("(m : Num)")
  let t10 = @tactics.disch_then(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x7 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3 = @tactics.mp_tac(x2)
        fn(x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3(x4)
        }
      })(((x6 : @kernel.Thm) => @bool.spec(t5, x6))(x7))
    })(t8(x9))
  })
  let t12 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t10), t11)
  number_of_combinations_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ s : (A) -> Bool, HAS_SIZE(s, n) → HAS_SIZE({(t : (A) -> Bool) | SUBSET(t, s) && HAS_SIZE(t, m)}, if n < m { 0 } else { DIV(FACT(n), FACT(m) * FACT(n - m)) })"), t12))
}

///|
let number_of_combinations_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMBER_OF_COMBINATIONS_EXPLICIT")

///|
/// `NUMBER_OF_COMBINATIONS_EXPLICIT`
pub fn number_of_combinations_explicit() -> @kernel.Thm {
  number_of_combinations_explicit_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
