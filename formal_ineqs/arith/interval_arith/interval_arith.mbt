// Translated from upstream Formal_ineqs/arith/interval_arith.hl; edit this file directly.

///|
/// Formal_ineqs/arith/interval_arith.hl:17
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// interval_arith
fn step_2() -> Unit raise {
  interval_arith_c.set(@pair.new_definition(@term_syntax.parse_term("(interval_arith : (Real, (Real, Real)) -> Bool)((x : Real), ((lo : Real), (hi : Real))) == (lo <= x && x <= hi)")))
}

///|
let interval_arith_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval_arith")

///|
/// `Interval_arith.interval_arith`
pub fn interval_arith() -> @kernel.Thm {
  interval_arith_c.get()
}

///|
/// bounded_on
fn step_3() -> Unit raise {
  bounded_on_c.set(@pair.new_definition(@term_syntax.parse_term("(bounded_on : ((_) -> Real, (_) -> Bool, (Real, Real)) -> Bool)((f : (_) -> Real), (s : (_) -> Bool), (f_bounds : (Real, Real))) == (∀ x : _, IN(x, s) → interval_arith(f(x), f_bounds))")))
}

///|
let bounded_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bounded_on")

///|
/// `Interval_arith.bounded_on`
pub fn bounded_on() -> @kernel.Thm {
  bounded_on_c.get()
}

///|
/// bounded_on_int
fn step_4() -> Unit raise {
  bounded_on_int_c.set(@pair.new_definition(@term_syntax.parse_term("(bounded_on_int : ((Real) -> Real, (Real, Real), (Real, Real)) -> Bool)((f : (Real) -> Real), (int : (Real, Real)), (f_bounds : (Real, Real))) == (∀ x : Real, interval_arith(x, int) → interval_arith(f(x), f_bounds))")))
}

///|
let bounded_on_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bounded_on_int")

///|
/// `Interval_arith.bounded_on_int`
pub fn bounded_on_int() -> @kernel.Thm {
  bounded_on_int_c.get()
}

///|
/// iabs
fn step_5() -> Unit raise {
  iabs_c.set(@pair.new_definition(@term_syntax.parse_term("(iabs : ((Real, Real)) -> Real)(((x_lo : Real), (x_hi : Real))) == max(x_hi, -x_lo)")))
}

///|
let iabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iabs")

///|
/// `Interval_arith.iabs`
pub fn iabs() -> @kernel.Thm {
  iabs_c.get()
}

///|
/// interval_not_zero
fn step_6() -> Unit raise {
  interval_not_zero_c.set(@pair.new_definition(@term_syntax.parse_term("(interval_not_zero : ((Real, Real)) -> Bool)(((lo : Real), (hi : Real))) == (real_of_num(0) < lo || hi < real_of_num(0))")))
}

///|
let interval_not_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval_not_zero")

///|
/// `Interval_arith.interval_not_zero`
pub fn interval_not_zero() -> @kernel.Thm {
  interval_not_zero_c.get()
}

///|
/// interval_pos
fn step_7() -> Unit raise {
  interval_pos_c.set(@pair.new_definition(@term_syntax.parse_term("(interval_pos : ((Real, _)) -> Bool)(((lo : Real), (hi : _))) == (real_of_num(0) < lo)")))
}

///|
let interval_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval_pos")

///|
/// `Interval_arith.interval_pos`
pub fn interval_pos() -> @kernel.Thm {
  interval_pos_c.get()
}

///|
/// interval_neg
fn step_8() -> Unit raise {
  interval_neg_c.set(@pair.new_definition(@term_syntax.parse_term("(interval_neg : ((_, Real)) -> Bool)(((lo : _), (hi : Real))) == (hi < real_of_num(0))")))
}

///|
let interval_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval_neg")

///|
/// `Interval_arith.interval_neg`
pub fn interval_neg() -> @kernel.Thm {
  interval_neg_c.get()
}

///|
/// interval_gt
fn step_9() -> Unit raise {
  interval_gt_c.set(@pair.new_definition(@term_syntax.parse_term("(interval_gt : (Real, (Real, _)) -> Bool)((f : Real), ((lo : Real), (hi : _))) == (f < lo)")))
}

///|
let interval_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval_gt")

///|
/// `Interval_arith.interval_gt`
pub fn interval_gt() -> @kernel.Thm {
  interval_gt_c.get()
}

///|
/// CONST_INTERVAL
fn step_10() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([interval_arith(), @realax.real_le_refl()]))
  const_interval_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, interval_arith(x, (x, x))"), t1))
}

///|
let const_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONST_INTERVAL")

///|
/// `Interval_arith.CONST_INTERVAL`
pub fn const_interval() -> @kernel.Thm {
  const_interval_c.get()
}

///|
/// APPROX_INTERVAL
fn step_11() -> Unit raise {
  let t3 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval_arith()])), @calc_rat.real_arith_tac)
  let t4 = (@term_syntax.parse_term("((a : Real) <= (lo : Real) && (hi : Real) <= (b : Real)) && interval_arith((x : Real), (lo, hi)) → interval_arith(x, (a, b))"), t3)
  approx_interval_c.set(@bool.gen_all((fn(x2 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x2.0, x2.1)
  })(t4)))
}

///|
let approx_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPROX_INTERVAL")

///|
/// `Interval_arith.APPROX_INTERVAL`
pub fn approx_interval() -> @kernel.Thm {
  approx_interval_c.get()
}

///|
/// INTERVAL_NEG
fn step_12() -> Unit raise {
  let t6 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval_arith()])), @calc_rat.real_arith_tac)
  let t7 = (@term_syntax.parse_term("interval_arith((x : Real), ((a : Real), (b : Real))) → interval_arith(-x, (-b, -a))"), t6)
  interval_neg_v1_c.set(@bool.gen_all((fn(x5 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x5.0, x5.1)
  })(t7)))
}

///|
let interval_neg_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_NEG")

///|
/// `Interval_arith.INTERVAL_NEG`
pub fn interval_neg_v1() -> @kernel.Thm {
  interval_neg_v1_c.get()
}

///|
/// INTERVAL_NEG_EQ
fn step_13() -> Unit raise {
  let t8 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval_arith()])), @calc_rat.real_arith_tac)
  interval_neg_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ a : Real, ∀ b : Real, interval_arith(-x, (-b, -a)) == interval_arith(x, (a, b))"), t8))
}

///|
let interval_neg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_NEG_EQ")

///|
/// `Interval_arith.INTERVAL_NEG_EQ`
pub fn interval_neg_eq() -> @kernel.Thm {
  interval_neg_eq_c.get()
}

///|
/// interval_tm
fn step_14() -> Unit raise {
  interval_tm_c.set(@term_syntax.parse_term("interval_arith"))
}

///|
let interval_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("interval_tm")

///|
/// `Interval_arith.interval_tm`
pub fn interval_tm() -> @kernel.Term {
  interval_tm_c.get()
}

///|
/// `dest_interval_arith`
pub fn dest_interval_arith(x9 : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  let tm = x9
  let (lhs, int_tm) = @kernel.dest_comb(tm)
  (@kernel.rand(lhs), int_tm)
}

///|
/// `mk_interval`
pub fn mk_interval(x10 : @kernel.Term, x11 : @kernel.Term) -> @kernel.Term raise {
  let tm = x10
  let bounds = x11
  @kernel.mk_comb(@kernel.mk_comb(interval_tm(), tm), bounds)
}

///|
/// mk_const_interval
fn step_15() -> Unit raise {
  let lemma = @bool.spec_all(const_interval())
  mk_const_interval_c.set(fn(x12 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x12
    @kernel.inst_rule(@list.List([(tm, @misc_vars.x_var_real())]), lemma)
  })
}

///|
let mk_const_interval_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("mk_const_interval")

///|
/// `mk_const_interval`
pub fn mk_const_interval(x : @kernel.Term) -> @kernel.Thm raise {
  (mk_const_interval_c.get())(x)
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
}
