// realax.ml: the load steps are generated (realax.mbt).

///|
fn init {
  @parser.begin_theory("realax")
  load_steps() catch {
    e => abort("HOL Light: loading realax.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
