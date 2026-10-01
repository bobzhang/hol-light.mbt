// Library/iter.ml: the load steps are generated (iter.mbt).

///|
fn init {
  @parser.begin_theory("Library/iter")
  load_steps() catch {
    e => abort("HOL Light: loading Library/iter.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
