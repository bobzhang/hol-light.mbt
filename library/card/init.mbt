// Library/card.ml: the load steps are generated (card.mbt).

///|
fn init {
  @parser.begin_theory("Library/card")
  load_steps() catch {
    e => abort("HOL Light: loading Library/card.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
