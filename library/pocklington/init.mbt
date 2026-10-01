// Library/pocklington.ml: the load steps are generated (pocklington.mbt).

///|
fn init {
  @parser.begin_theory("Library/pocklington")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/pocklington.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
