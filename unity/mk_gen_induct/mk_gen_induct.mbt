// Translated from upstream Unity/mk_gen_induct.ml; edit this file directly.

///|
/// GEN_INDUCT_thm
fn step_1() -> Unit raise {
  let t1 = @tactics.match_accept_tac(@arith.num_wf())
  gen_induct_thm_c.set(@aux_definitions.prove_thm("GEN_INDUCT_thm", @parser.parse_term("forall P. (forall(m:num). (forall n. n < m ==> (P n)) ==> (P m)) ==> (forall m. P m)"), t1))
}

///|
let gen_induct_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GEN_INDUCT_thm")

///|
/// `GEN_INDUCT_thm`
pub fn gen_induct_thm() -> @kernel.Thm {
  gen_induct_thm_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
