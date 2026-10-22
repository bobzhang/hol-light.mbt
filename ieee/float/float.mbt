// Translated from upstream IEEE/float.hl; edit this file directly.

///|
/// is_valid_flformat
fn step_1() -> Unit raise {
  is_valid_flformat_c.set(@define.define_(@term_syntax.parse_term("(is_valid_flformat : ((Num, Num)) -> Bool)(((r : Num), (p : Num))) == (1 < r && EVEN(r) && 1 < p)")))
}

///|
let is_valid_flformat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_valid_flformat")

///|
/// `is_valid_flformat`
pub fn is_valid_flformat() -> @kernel.Thm {
  is_valid_flformat_c.get()
}

///|
/// flformat_typbij
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([is_valid_flformat()]))
  let t2 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(2, 2)")), t1), @int.arith_tac)
  flformat_typbij_c.set(@class.new_type_definition("flformat", ("mk_flformat", "dest_flformat"), @tactics.prove(@term_syntax.parse_term("∃ fmt : (Num, Num), is_valid_flformat(fmt)"), t2)))
}

///|
let flformat_typbij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("flformat_typbij")

///|
/// `flformat_typbij`
pub fn flformat_typbij() -> @kernel.Thm {
  flformat_typbij_c.get()
}

///|
/// flr
fn step_3() -> Unit raise {
  flr_c.set(@define.define_(@term_syntax.parse_term("(flr : (Flformat) -> Num)((fmt : Flformat)) == FST(dest_flformat(fmt))")))
}

///|
let flr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("flr")

///|
/// `flr`
pub fn flr() -> @kernel.Thm {
  flr_c.get()
}

///|
/// flp
fn step_4() -> Unit raise {
  flp_c.set(@define.define_(@term_syntax.parse_term("(flp : (Flformat) -> Num)((fmt : Flformat)) == SND(dest_flformat(fmt))")))
}

///|
let flp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("flp")

///|
/// `flp`
pub fn flp() -> @kernel.Thm {
  flp_c.get()
}

///|
/// is_frac_and_exp
fn step_5() -> Unit raise {
  is_frac_and_exp_c.set(@define.define_(@term_syntax.parse_term("(is_frac_and_exp : (Flformat, Real, Num, Int) -> Bool)((fmt : Flformat), (x : Real), (f : Num), (e : Int)) == (0 < f && f < EXP(flr(fmt), flp(fmt)) && abs(x) == real_of_num(f) * ipow(real_of_num(flr(fmt)), e - int_of_num(flp(fmt)) + int_of_num(1)))")))
}

///|
let is_frac_and_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_frac_and_exp")

///|
/// `is_frac_and_exp`
pub fn is_frac_and_exp() -> @kernel.Thm {
  is_frac_and_exp_c.get()
}

///|
/// is_float
fn step_6() -> Unit raise {
  is_float_c.set(@define.define_(@term_syntax.parse_term("(is_float : (Flformat, Real) -> Bool)((fmt : Flformat), (x : Real)) == (∃ f : Num, ∃ e : Int, is_frac_and_exp(fmt, x, f, e))")))
}

///|
let is_float_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_float")

///|
/// `is_float`
pub fn is_float() -> @kernel.Thm {
  is_float_c.get()
}

///|
/// to_fformat
fn step_7() -> Unit raise {
  to_fformat_c.set(@define.define_(@term_syntax.parse_term("(to_fformat : (Flformat, Int) -> Fformat)((fmt : Flformat), (e : Int)) == mk_fformat((flr(fmt), flp(fmt), e))")))
}

///|
let to_fformat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("to_fformat")

///|
/// `to_fformat`
pub fn to_fformat() -> @kernel.Thm {
  to_fformat_c.get()
}

///|
/// greatest_e
fn step_8() -> Unit raise {
  greatest_e_c.set(@define.define_(@term_syntax.parse_term("(greatest_e : (Flformat, Real) -> Int)((fmt : Flformat), (x : Real)) == sup_int({(z : Int) | ipow(real_of_num(flr(fmt)), z) <= abs(x)})")))
}

///|
let greatest_e_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("greatest_e")

///|
/// `greatest_e`
pub fn greatest_e() -> @kernel.Thm {
  greatest_e_c.get()
}

///|
/// greatest_m
fn step_9() -> Unit raise {
  greatest_m_c.set(@define.define_(@term_syntax.parse_term("(greatest_m : (Flformat, Real) -> Num)((fmt : Flformat), (x : Real)) == sup_num({(m : Num) | real_of_num(m) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) <= abs(x)})")))
}

///|
let greatest_m_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("greatest_m")

///|
/// `greatest_m`
pub fn greatest_m() -> @kernel.Thm {
  greatest_m_c.get()
}

///|
/// greatest_r
fn step_10() -> Unit raise {
  greatest_r_c.set(@define.define_(@term_syntax.parse_term("(greatest_r : (Flformat, Real) -> Real)((fmt : Flformat), (x : Real)) == (if real_of_num(0) <= x { x - real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) } else { x + real_of_num(greatest_m(fmt, x)) * ipow(real_of_num(flr(fmt)), greatest_e(fmt, x)) })")))
}

///|
let greatest_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("greatest_r")

///|
/// `greatest_r`
pub fn greatest_r() -> @kernel.Thm {
  greatest_r_c.get()
}

///|
/// flround
fn step_11() -> Unit raise {
  flround_c.set(@define.define_(@term_syntax.parse_term("(flround : (Flformat, Roundmode, Real) -> Real)((fmt : Flformat), (mode : Roundmode), (x : Real)) == LET((m : Num) => (e : Int) => (y : Real) => LET_END(if real_of_num(0) <= x { real_of_num(m) * ipow(real_of_num(flr(fmt)), e) + fround(to_fformat(fmt, e), mode, y) } else { -(real_of_num(m) * ipow(real_of_num(flr(fmt)), e)) + fround(to_fformat(fmt, e), mode, y) }), greatest_m(fmt, x), greatest_e(fmt, x), greatest_r(fmt, x))")))
}

///|
let flround_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("flround")

///|
/// `flround`
pub fn flround() -> @kernel.Thm {
  flround_c.get()
}

///|
/// fl_eps
fn step_12() -> Unit raise {
  fl_eps_c.set(@define.define_(@term_syntax.parse_term("(fl_eps : (Flformat) -> Real)((fmt : Flformat)) == ipow(real_of_num(flr(fmt)), int_of_num(1) - int_of_num(flp(fmt))) / real_of_num(2)")))
}

///|
let fl_eps_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fl_eps")

///|
/// `fl_eps`
pub fn fl_eps() -> @kernel.Thm {
  fl_eps_c.get()
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
}
