// metis.ml: the load steps are generated (metis.mbt).

///|
fn init {
  @parser.begin_theory("metis")
  load_steps() catch {
    e => abort("HOL Light: loading metis.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
