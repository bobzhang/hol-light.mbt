// Multivariate/tarski.ml: the load steps are generated (tarski.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/tarski.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @convex.load()
  @convex.load()
  @parser.begin_theory("Multivariate/tarski")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/tarski.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
