// Library/agm.ml: the load steps are generated (agm.mbt).

///|
fn init {
  @parser.begin_theory("Library/agm")
  load_steps() catch {
    e => abort("HOL Light: loading Library/agm.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
