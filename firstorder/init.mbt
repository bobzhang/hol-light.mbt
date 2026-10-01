// firstorder.ml: the load steps are generated (firstorder.mbt).

///|
fn init {
  @parser.begin_theory("firstorder")
  load_steps() catch {
    e => abort("HOL Light: loading firstorder.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
