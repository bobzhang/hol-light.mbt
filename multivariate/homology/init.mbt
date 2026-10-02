// Multivariate/homology.ml: the load steps are generated (homology.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/homology.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @metric.load()
  @frag.load()
  @grouptheory.load()
  @metric.load()
  @parser.begin_theory("Multivariate/homology")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/homology.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
