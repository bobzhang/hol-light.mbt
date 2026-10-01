// Library/binomial.ml: the load steps are generated (binomial.mbt).

///|
fn init {
  @parser.begin_theory("Library/binomial")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/binomial.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
