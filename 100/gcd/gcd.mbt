// Translated from upstream 100/gcd.ml; edit this file directly.

///|
/// egcd
fn step_1() -> Unit raise {
  egcd_c.set(@define.define_(@term_syntax.parse_term("(egcd : ((Num, Num)) -> Num)(((m : Num), (n : Num))) == (if m == 0 { n } else { if n == 0 { m } else { if m <= n { egcd((m, n - m)) } else { egcd((m - n, n)) } } })")))
}

///|
let egcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("egcd")

///|
/// `egcd`
pub fn egcd() -> @kernel.Thm {
  egcd_c.get()
}

///|
/// EGCD_INVARIANT
fn step_2() -> Unit raise {
  let t18 = @meson.asm_meson_tac(@list.List([@prime.divides_sub(), @prime.divides_add(), @arith.sub_add(), @arith.le_cases()]))
  let t17 = @tactics.thenl(@tactics.then_tac(fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x7
      @tactics.first_x_assum(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let th = x9
        let t15 = @equal.lhand(w)
        @tactics.mp_tac(@drule.part_match(fn(x14 : @kernel.Term) -> @kernel.Term raise {
          (fn(x13 : @kernel.Term) -> @kernel.Term raise {
            (fn(x12 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              @equal.lhs((fn(x11 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                x11.1
              })(x12))
            })(@basics.dest_forall(x13))
          })(@kernel.rand(x14))
        }, th)(t15))
      })
    })(x16)(x16)
  }, @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac]))
  let t6 = @simp.asm_rewrite_tac(@list.List([@prime.divides_0()]))
  let t5 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t4 = @simp.asm_rewrite_tac(@list.List([@prime.divides_0()]))
  let t3 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t2 = @simp.once_rewrite_tac(@list.List([egcd()]))
  let t1 = @wf.wf_induct_tac(@term_syntax.parse_term("(m : Num) + (n : Num)"))
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t1), @tactics.gen_tac), t2), t3), t4), t5), t6), @class.cond_cases_tac), t17), t18)
  egcd_invariant_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ d : Num, divides(d, egcd((m, n))) == (divides(d, m) && divides(d, n))"), t19))
}

///|
let egcd_invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EGCD_INVARIANT")

///|
/// `EGCD_INVARIANT`
pub fn egcd_invariant() -> @kernel.Thm {
  egcd_invariant_c.get()
}

///|
/// EGCD_GCD
fn step_3() -> Unit raise {
  let t20 = @meson.meson_tac(@list.List([egcd_invariant(), @prime.divides_refl()]))
  let t21 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@prime.gcd_unique())])), t20)
  egcd_gcd_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, egcd((m, n)) == gcd((m, n))"), t21))
}

///|
let egcd_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EGCD_GCD")

///|
/// `EGCD_GCD`
pub fn egcd_gcd() -> @kernel.Thm {
  egcd_gcd_c.get()
}

///|
/// EGCD
fn step_4() -> Unit raise {
  let t22 = @simp.rewrite_tac(@list.List([egcd_gcd(), @int.gcd()]))
  egcd_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, (divides(egcd((a, b)), a) && divides(egcd((a, b)), b)) && (∀ e : Num, divides(e, a) && divides(e, b) → divides(e, egcd((a, b))))"), t22))
}

///|
let egcd_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EGCD")

///|
/// `EGCD`
pub fn egcd_v1() -> @kernel.Thm {
  egcd_v1_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
