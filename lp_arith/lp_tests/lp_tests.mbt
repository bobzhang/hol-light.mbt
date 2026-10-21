// Translated from upstream LP_arith/lp_tests.ml; edit this file directly.

///|
/// rec_seq
fn step_1() -> Unit raise {
  rec_seq_c.set(@term_syntax.parse_term("∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, ∀ x4 : Real, ∀ x5 : Real, ∀ x6 : Real, ∀ x7 : Real, ∀ x8 : Real, ∀ x9 : Real, ∀ x10 : Real, ∀ x11 : Real, x3 == abs(x2) - x1 && x4 == abs(x3) - x2 && x5 == abs(x4) - x3 && x6 == abs(x5) - x4 && x7 == abs(x6) - x5 && x8 == abs(x7) - x6 && x9 == abs(x8) - x7 && x10 == abs(x9) - x8 && x11 == abs(x10) - x9 → x1 == x10 && x2 == x11"))
}

///|
let rec_seq_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("rec_seq")

///|
/// `rec_seq`
pub fn rec_seq() -> @kernel.Term {
  rec_seq_c.get()
}

///|
/// test_std
fn step_2() -> Unit raise {
  test_std_c.set(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, real_of_num(0) + (real_of_num(1) * a + (real_of_num(0) * b + (real_of_num(0) * c + real_of_num(0) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(0) * a + (real_of_num(1) * b + (real_of_num(0) * c + real_of_num(0) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(0) * a + (real_of_num(0) * b + (real_of_num(1) * c + real_of_num(0) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(0) * a + (real_of_num(0) * b + (real_of_num(0) * c + real_of_num(1) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(3008) * a + (real_of_num(20980) * b + (-real_of_num(97775) * c + -real_of_num(101225) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(3985) * a + (real_of_num(25643) * b + (-real_of_num(135871) * c + -real_of_num(130580) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(4324) * a + (real_of_num(26978) * b + (-real_of_num(133655) * c + -real_of_num(168473) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(3534) * a + (real_of_num(25361) * b + (-real_of_num(46243) * c + -real_of_num(100407) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(8836) * a + (real_of_num(40796) * b + (-real_of_num(176661) * c + -real_of_num(215616) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(5376) * a + (real_of_num(37562) * b + (-real_of_num(182576) * c + -real_of_num(217615) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(4982) * a + (real_of_num(33088) * b + (-real_of_num(98880) * c + -real_of_num(167278) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(4775) * a + (real_of_num(39122) * b + (-real_of_num(136701) * c + -real_of_num(193393) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(8046) * a + (real_of_num(42958) * b + (-real_of_num(225138) * c + -real_of_num(256575) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(8554) * a + (real_of_num(48955) * b + (-real_of_num(257370) * c + -real_of_num(312877) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(6147) * a + (real_of_num(45514) * b + (-real_of_num(165274) * c + -real_of_num(227099) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(8366) * a + (real_of_num(55140) * b + (-real_of_num(203989) * c + -real_of_num(321623) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(13479) * a + (real_of_num(68037) * b + (-real_of_num(174270) * c + -real_of_num(341743) * d))) >= real_of_num(0) && real_of_num(0) + (real_of_num(21808) * a + (real_of_num(78302) * b + (-real_of_num(322990) * c + -real_of_num(487539) * d))) >= real_of_num(0) && real_of_num(1) + (-real_of_num(8554) / real_of_num(10000) * a + (-real_of_num(48955) / real_of_num(10000) * b + (real_of_num(0) * c + real_of_num(0) * d))) >= real_of_num(0) && real_of_num(1) + (real_of_num(0) * a + (real_of_num(0) * b + (-real_of_num(257370) / real_of_num(10000) * c + -real_of_num(312877) / real_of_num(10000) * d))) >= real_of_num(0) → real_of_num(1) * a + (real_of_num(1) / real_of_num(2) * b + (real_of_num(1) / real_of_num(3) * c + real_of_num(1) / real_of_num(4) * d)) <= real_of_num(2057990000) / real_of_num(1743360801)"))
}

///|
let test_std_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("test_std")

///|
/// `test_std`
pub fn test_std() -> @kernel.Term {
  test_std_c.get()
}

///|
/// gale
fn step_3() -> Unit raise {
  gale_c.set(@term_syntax.parse_term("!(∃ T14 : Real, ∃ T24 : Real, ∃ T25 : Real, ∃ T35 : Real, ∃ T46 : Real, ∃ T47 : Real, ∃ T57 : Real, ∃ T58 : Real, T14 < real_of_num(20) && T24 + T25 < real_of_num(20) && T35 < real_of_num(20) && T14 + (T24 - T46 - T47) == real_of_num(0) && T25 + (T35 - T57 - T58) == real_of_num(0) && T46 > real_of_num(10) && T47 + T57 > real_of_num(20) && T58 > real_of_num(30) && T14 < real_of_num(30) && T24 < real_of_num(20) && T25 < real_of_num(10) && T35 < real_of_num(10) && T46 < real_of_num(10) && T47 < real_of_num(2) && T57 < real_of_num(20) && T58 < real_of_num(30))"))
}

///|
let gale_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("gale")

///|
/// `gale`
pub fn gale() -> @kernel.Term {
  gale_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
