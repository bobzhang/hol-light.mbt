// Arithmetic/sigmacomplete.ml: the load steps are generated (sigmacomplete.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/sigmacomplete.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @derived.load()
  @parser.begin_theory("Arithmetic/sigmacomplete")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Arithmetic/sigmacomplete.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
