// Multivariate/convex.ml: the load steps are generated (convex.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/convex.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @topology.load()
  @topology.load()
  @parser.begin_theory("Multivariate/convex")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/convex.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
