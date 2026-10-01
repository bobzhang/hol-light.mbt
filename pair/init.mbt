// pair.ml: the load steps are generated (pair.mbt).

///|
fn init {
  @parser.begin_theory("pair")
  load_steps() catch {
    e => abort("HOL Light: loading pair.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
