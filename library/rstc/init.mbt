// Library/rstc.ml: the load steps are generated (rstc.mbt).

///|
fn init {
  @parser.begin_theory("Library/rstc")
  load_steps() catch {
    e => abort("HOL Light: loading Library/rstc.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
