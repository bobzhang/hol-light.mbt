// Library/components.ml: the load steps are generated (components.mbt).

///|
fn init {
  @parser.begin_theory("Library/components")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/components.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
