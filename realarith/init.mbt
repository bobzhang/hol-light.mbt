// realarith.ml: the load steps are generated (realarith.mbt).

///|
fn init {
  @parser.begin_theory("realarith")
  load_steps() catch {
    e => abort("HOL Light: loading realarith.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
