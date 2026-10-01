// Library/permutations.ml: the load steps are generated (permutations.mbt).

///|
fn init {
  @parser.begin_theory("Library/permutations")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/permutations.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
