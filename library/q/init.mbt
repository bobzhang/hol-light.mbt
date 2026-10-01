// Library/q.ml: the load steps are generated (q.mbt).

///|
fn init {
  @parser.begin_theory("Library/q")
  load_steps() catch {
    e => abort("HOL Light: loading Library/q.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
