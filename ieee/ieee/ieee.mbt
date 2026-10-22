// Translated from upstream IEEE/ieee.hl; edit this file directly.

///|
/// is_valid_ieee_format
fn step_1() -> Unit raise {
  is_valid_ieee_format_c.set(@define.define_(@term_syntax.parse_term("(is_valid_ieee_format : ((Num, Num, Int, Int)) -> Bool)(((r : Num), (p : Num), (emin : Int), (emax : Int))) == (1 < r && EVEN(r) && 1 < p && emin <= emax)")))
}

///|
let is_valid_ieee_format_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_valid_ieee_format")

///|
/// `is_valid_ieee_format`
pub fn is_valid_ieee_format() -> @kernel.Thm {
  is_valid_ieee_format_c.get()
}

///|
/// ieee_format_typbij
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([is_valid_ieee_format()]))
  let t2 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(2, 2, int_of_num(0), int_of_num(0))")), t1), @int.arith_tac)
  ieee_format_typbij_c.set(@class.new_type_definition("ieee_format", ("mk_ieee_format", "dest_ieee_format"), @tactics.prove(@term_syntax.parse_term("∃ fmt : (Num, Num, Int, Int), is_valid_ieee_format(fmt)"), t2)))
}

///|
let ieee_format_typbij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_format_typbij")

///|
/// `ieee_format_typbij`
pub fn ieee_format_typbij() -> @kernel.Thm {
  ieee_format_typbij_c.get()
}

///|
/// ieee_r
fn step_3() -> Unit raise {
  ieee_r_c.set(@define.define_(@term_syntax.parse_term("(ieee_r : (Ieee_format) -> Num)((fmt : Ieee_format)) == FST(dest_ieee_format(fmt))")))
}

///|
let ieee_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_r")

///|
/// `ieee_r`
pub fn ieee_r() -> @kernel.Thm {
  ieee_r_c.get()
}

///|
/// ieee_p
fn step_4() -> Unit raise {
  ieee_p_c.set(@define.define_(@term_syntax.parse_term("(ieee_p : (Ieee_format) -> Num)((fmt : Ieee_format)) == FST(SND(dest_ieee_format(fmt)))")))
}

///|
let ieee_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_p")

///|
/// `ieee_p`
pub fn ieee_p() -> @kernel.Thm {
  ieee_p_c.get()
}

///|
/// ieee_emin
fn step_5() -> Unit raise {
  ieee_emin_c.set(@define.define_(@term_syntax.parse_term("(ieee_emin : (Ieee_format) -> Int)((fmt : Ieee_format)) == FST(SND(SND(dest_ieee_format(fmt))))")))
}

///|
let ieee_emin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_emin")

///|
/// `ieee_emin`
pub fn ieee_emin() -> @kernel.Thm {
  ieee_emin_c.get()
}

///|
/// ieee_emax
fn step_6() -> Unit raise {
  ieee_emax_c.set(@define.define_(@term_syntax.parse_term("(ieee_emax : (Ieee_format) -> Int)((fmt : Ieee_format)) == SND(SND(SND(dest_ieee_format(fmt))))")))
}

///|
let ieee_emax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_emax")

///|
/// `ieee_emax`
pub fn ieee_emax() -> @kernel.Thm {
  ieee_emax_c.get()
}

///|
/// ieee_to_fformat
fn step_7() -> Unit raise {
  ieee_to_fformat_c.set(@define.define_(@term_syntax.parse_term("(ieee_to_fformat : (Ieee_format) -> Fformat)((fmt : Ieee_format)) == mk_fformat((ieee_r(fmt), ieee_p(fmt), ieee_emin(fmt)))")))
}

///|
let ieee_to_fformat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_to_fformat")

///|
/// `ieee_to_fformat`
pub fn ieee_to_fformat() -> @kernel.Thm {
  ieee_to_fformat_c.get()
}

///|
/// ieee_to_flformat
fn step_8() -> Unit raise {
  ieee_to_flformat_c.set(@define.define_(@term_syntax.parse_term("(ieee_to_flformat : (Ieee_format) -> Flformat)((fmt : Ieee_format)) == mk_flformat((ieee_r(fmt), ieee_p(fmt)))")))
}

///|
let ieee_to_flformat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_to_flformat")

///|
/// `ieee_to_flformat`
pub fn ieee_to_flformat() -> @kernel.Thm {
  ieee_to_flformat_c.get()
}

///|
/// max_ieee
fn step_9() -> Unit raise {
  max_ieee_c.set(@define.define_(@term_syntax.parse_term("(max_ieee : (Ieee_format) -> Real)((fmt : Ieee_format)) == real_of_num(EXP(ieee_r(fmt), ieee_p(fmt)) - 1) * ipow(real_of_num(ieee_r(fmt)), ieee_emax(fmt) - int_of_num(ieee_p(fmt)) + int_of_num(1))")))
}

///|
let max_ieee_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("max_ieee")

///|
/// `max_ieee`
pub fn max_ieee() -> @kernel.Thm {
  max_ieee_c.get()
}

///|
/// ieee_threshold
fn step_10() -> Unit raise {
  ieee_threshold_c.set(@define.define_(@term_syntax.parse_term("(ieee_threshold : (Ieee_format) -> Real)((fmt : Ieee_format)) == max_ieee(fmt) + ipow(real_of_num(ieee_r(fmt)), ieee_emax(fmt) - int_of_num(ieee_p(fmt)) + int_of_num(1))")))
}

///|
let ieee_threshold_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_threshold")

///|
/// `ieee_threshold`
pub fn ieee_threshold() -> @kernel.Thm {
  ieee_threshold_c.get()
}

///|
/// is_ieee_pinf
fn step_11() -> Unit raise {
  is_ieee_pinf_c.set(@define.define_(@term_syntax.parse_term("(is_ieee_pinf : (Ieee_format, Real) -> Bool)((fmt : Ieee_format), (x : Real)) == (ieee_threshold(fmt) <= x)")))
}

///|
let is_ieee_pinf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_ieee_pinf")

///|
/// `is_ieee_pinf`
pub fn is_ieee_pinf() -> @kernel.Thm {
  is_ieee_pinf_c.get()
}

///|
/// is_ieee_ninf
fn step_12() -> Unit raise {
  is_ieee_ninf_c.set(@define.define_(@term_syntax.parse_term("(is_ieee_ninf : (Ieee_format, Real) -> Bool)((fmt : Ieee_format), (x : Real)) == (x <= -ieee_threshold(fmt))")))
}

///|
let is_ieee_ninf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_ieee_ninf")

///|
/// `is_ieee_ninf`
pub fn is_ieee_ninf() -> @kernel.Thm {
  is_ieee_ninf_c.get()
}

///|
/// is_ieee
fn step_13() -> Unit raise {
  is_ieee_c.set(@define.define_(@term_syntax.parse_term("(is_ieee : (Ieee_format, Real) -> Bool)((fmt : Ieee_format), (x : Real)) == (is_fixed(ieee_to_fformat(fmt), x) || is_float(ieee_to_flformat(fmt), x) && ieee_emin(fmt) <= greatest_e(ieee_to_flformat(fmt), x) && greatest_e(ieee_to_flformat(fmt), x) <= ieee_emax(fmt) || is_ieee_pinf(fmt, x) || is_ieee_ninf(fmt, x))")))
}

///|
let is_ieee_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_ieee")

///|
/// `is_ieee`
pub fn is_ieee() -> @kernel.Thm {
  is_ieee_c.get()
}

///|
/// ieee_exp
fn step_14() -> Unit raise {
  ieee_exp_c.set(@define.define_(@term_syntax.parse_term("(ieee_exp : (Ieee_format, Real) -> Int)((fmt : Ieee_format), (x : Real)) == (if abs(x) <= finf(ieee_to_fformat(fmt)) { ieee_emin(fmt) } else { greatest_e(ieee_to_flformat(fmt), x) })")))
}

///|
let ieee_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_exp")

///|
/// `ieee_exp`
pub fn ieee_exp() -> @kernel.Thm {
  ieee_exp_c.get()
}

///|
/// ieee_round
fn step_15() -> Unit raise {
  ieee_round_c.set(@define.define_(@term_syntax.parse_term("(ieee_round : (Ieee_format, Roundmode, Real) -> Real)((fmt : Ieee_format), To_near, (x : Real)) == (if abs(x) <= finf(ieee_to_fformat(fmt)) { fround(ieee_to_fformat(fmt), To_near, x) } else { if abs(x) <= ieee_threshold(fmt) { flround(ieee_to_flformat(fmt), To_near, x) } else { x } }) && ieee_round(fmt, To_zero, x) == (if abs(x) <= finf(ieee_to_fformat(fmt)) { fround(ieee_to_fformat(fmt), To_zero, x) } else { if abs(x) <= ieee_threshold(fmt) { flround(ieee_to_flformat(fmt), To_zero, x) } else { if x > ieee_threshold(fmt) { max_ieee(fmt) } else { -max_ieee(fmt) } } }) && ieee_round(fmt, To_pinf, x) == (if abs(x) <= finf(ieee_to_fformat(fmt)) { fround(ieee_to_fformat(fmt), To_pinf, x) } else { if x <= -max_ieee(fmt) { -max_ieee(fmt) } else { flround(ieee_to_flformat(fmt), To_pinf, x) } }) && ieee_round(fmt, To_ninf, x) == (if abs(x) <= finf(ieee_to_fformat(fmt)) { fround(ieee_to_fformat(fmt), To_ninf, x) } else { if max_ieee(fmt) <= x { max_ieee(fmt) } else { flround(ieee_to_flformat(fmt), To_ninf, x) } })")))
}

///|
let ieee_round_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_round")

///|
/// `ieee_round`
pub fn ieee_round() -> @kernel.Thm {
  ieee_round_c.get()
}

///|
/// ieee_eps
fn step_16() -> Unit raise {
  ieee_eps_c.set(@define.define_(@term_syntax.parse_term("(ieee_eps : (Ieee_format) -> Real)((fmt : Ieee_format)) == fl_eps(ieee_to_flformat(fmt))")))
}

///|
let ieee_eps_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ieee_eps")

///|
/// `ieee_eps`
pub fn ieee_eps() -> @kernel.Thm {
  ieee_eps_c.get()
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
}
