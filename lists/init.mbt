// lists.ml: the load steps are generated (lists.mbt).

///|
fn init {
  @parser.begin_theory("lists")
  load_steps() catch {
    e => abort("HOL Light: loading lists.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
