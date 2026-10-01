// cart.ml: the load steps are generated (cart.mbt).

///|
fn init {
  @parser.begin_theory("cart")
  load_steps() catch {
    e => abort("HOL Light: loading cart.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
