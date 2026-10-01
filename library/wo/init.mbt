// Library/wo.ml: the load steps are generated (wo.mbt).

///|
fn init {
  @parser.begin_theory("Library/wo")
  load_steps() catch {
    e => abort("HOL Light: loading Library/wo.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
