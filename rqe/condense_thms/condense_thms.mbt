// Translated from upstream Rqe/condense_thms.ml; edit this file directly.

///|
/// real_cases
fn step_1() -> Unit raise {
  real_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x < y || x == y || y < x"), @calc_rat.real_arith_tac))
}

///|
let real_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_cases")

///|
/// `real_cases`
pub fn real_cases() -> @kernel.Thm {
  real_cases_c.get()
}

///|
/// gt_aux
fn step_2() -> Unit raise {
  gt_aux_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ((x1 : Real) < (x2 : Real) && x2 < (x3 : Real)) && (x1 < x && x < x2 || x == x2 || x2 < x && x < x3) → x1 < x && x < x3"), @calc_rat.real_arith_tac))
}

///|
let gt_aux_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gt_aux")

///|
/// `gt_aux`
pub fn gt_aux() -> @kernel.Thm {
  gt_aux_c.get()
}

///|
/// gen_thm
fn step_3() -> Unit raise {
  let t1 = @list.List([@meson.meson_tac(@list.List([real_cases(), gt_aux(), @class.de_morgan_thm(), @analysis.real_not_lt(), @analysis.real_le_lt()]))])
  gen_thm_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ x1 : Real, ∀ x2 : Real, ∀ x3 : Real, x1 < x3 → (∀ x : Real, x1 < x && x < x2 → P(x)) → (∀ x : Real, x == x2 → P(x)) → (∀ x : Real, x2 < x && x < x3 → P(x)) → (∀ x : Real, x1 < x && x < x3 → P(x))"), t1))
}

///|
let gen_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gen_thm")

///|
/// `gen_thm`
pub fn gen_thm() -> @kernel.Thm {
  gen_thm_c.get()
}

///|
/// gen_thm_noleft
fn step_4() -> Unit raise {
  let t2 = @meson.meson_tac(@list.List([real_cases(), gt_aux()]))
  gen_thm_noleft_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ x2 : Real, ∀ x3 : Real, x2 < x3 → (∀ x : Real, x < x2 → P(x)) → (∀ x : Real, x == x2 → P(x)) → (∀ x : Real, x2 < x && x < x3 → P(x)) → (∀ x : Real, x < x3 → P(x))"), t2))
}

///|
let gen_thm_noleft_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gen_thm_noleft")

///|
/// `gen_thm_noleft`
pub fn gen_thm_noleft() -> @kernel.Thm {
  gen_thm_noleft_c.get()
}

///|
/// gen_thm_noright
fn step_5() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([real_cases(), gt_aux()]))
  gen_thm_noright_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ x1 : Real, ∀ x2 : Real, x1 < x2 → (∀ x : Real, x1 < x && x < x2 → P(x)) → (∀ x : Real, x == x2 → P(x)) → (∀ x : Real, x2 < x → P(x)) → (∀ x : Real, x1 < x → P(x))"), t3))
}

///|
let gen_thm_noright_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gen_thm_noright")

///|
/// `gen_thm_noright`
pub fn gen_thm_noright() -> @kernel.Thm {
  gen_thm_noright_c.get()
}

///|
/// gen_thm_noboth
fn step_6() -> Unit raise {
  let t4 = @meson.meson_tac(@list.List([real_cases(), gt_aux()]))
  gen_thm_noboth_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ Q : Bool, ∀ x2 : Real, Q → (∀ x : Real, x < x2 → P(x)) → (∀ x : Real, x == x2 → P(x)) → (∀ x : Real, x2 < x → P(x)) → (∀ x : Real, true → P(x))"), t4))
}

///|
let gen_thm_noboth_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gen_thm_noboth")

///|
/// `gen_thm_noboth`
pub fn gen_thm_noboth() -> @kernel.Thm {
  gen_thm_noboth_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
}
