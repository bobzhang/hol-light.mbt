// iterate.ml: the load steps are generated (iterate.mbt).

///|
fn init {
  @parser.begin_theory("iterate")
  load_steps() catch {
    e => abort("HOL Light: loading iterate.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
