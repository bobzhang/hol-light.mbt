// Arithmetic/definability.ml: the load steps are generated (definability.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/definability.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fol.load()
  @parser.begin_theory("Arithmetic/definability")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Arithmetic/definability.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
