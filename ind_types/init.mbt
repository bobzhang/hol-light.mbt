// ind_types.ml: the load steps are generated (ind_types.mbt).

///|
fn init {
  @parser.begin_theory("ind_types")
  load_steps() catch {
    e => abort("HOL Light: loading ind_types.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
