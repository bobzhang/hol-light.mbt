// recursion.ml: the load steps are generated (recursion.mbt).

///|
fn init {
  @parser.begin_theory("recursion")
  load_steps() catch {
    e => abort("HOL Light: loading recursion.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
