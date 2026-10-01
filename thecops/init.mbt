// thecops.ml: the load steps are generated (thecops.mbt).

///|
fn init {
  @parser.begin_theory("thecops")
  load_steps() catch {
    e => abort("HOL Light: loading thecops.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
