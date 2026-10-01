// Library/integer.ml: the load steps are generated (integer.mbt).

///|
fn init {
  @parser.begin_theory("Library/integer")
  load_steps() catch {
    e => abort("HOL Light: loading Library/integer.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
