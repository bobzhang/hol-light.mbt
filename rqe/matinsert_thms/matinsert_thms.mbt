// Translated from upstream Rqe/matinsert_thms.ml; edit this file directly.

///|
/// matinsert_lem0
fn step_1() -> Unit raise {
  let t1 = @list.List([@meson.meson_tac(@list.List([]))])
  matinsert_lem0_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ S : (_) -> Bool, (∀ x : _, (P : (_) -> Bool)(x)) → (∀ x : _, S(x) → P(x))"), t1))
}

///|
let matinsert_lem0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matinsert_lem0")

///|
/// `matinsert_lem0`
pub fn matinsert_lem0() -> @kernel.Thm {
  matinsert_lem0_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
