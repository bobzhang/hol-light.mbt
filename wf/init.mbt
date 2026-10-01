// wf.ml: the load steps are generated (wf.mbt).

///|
fn init {
  @parser.begin_theory("wf")
  load_steps() catch {
    e => abort("HOL Light: loading wf.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
