// arith.ml: the load steps are generated (arith.mbt).

///|
fn init {
  @parser.begin_theory("arith")
  load_steps() catch {
    e => abort("HOL Light: loading arith.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
