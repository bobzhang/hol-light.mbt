// Library/bitsize.ml: the load steps are generated (bitsize.mbt).

///|
fn init {
  @parser.begin_theory("Library/bitsize")
  load_steps() catch {
    e => abort("HOL Light: loading Library/bitsize.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
