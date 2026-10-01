// trivia.ml: the load steps are generated (trivia.mbt).

///|
fn init {
  @parser.begin_theory("trivia")
  load_steps() catch {
    e => abort("HOL Light: loading trivia.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
