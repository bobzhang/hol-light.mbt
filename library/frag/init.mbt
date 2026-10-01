// Library/frag.ml: the load steps are generated (frag.mbt).

///|
fn init {
  @parser.begin_theory("Library/frag")
  load_steps() catch {
    e => abort("HOL Light: loading Library/frag.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
