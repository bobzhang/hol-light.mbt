// Library/isum.ml: the load steps are generated (isum.mbt).

///|
fn init {
  @parser.begin_theory("Library/isum")
  load_steps() catch {
    e => abort("HOL Light: loading Library/isum.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
