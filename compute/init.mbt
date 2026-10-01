// compute.ml: the load steps are generated (compute.mbt).

///|
fn init {
  @parser.begin_theory("compute")
  load_steps() catch {
    e => abort("HOL Light: loading compute.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
