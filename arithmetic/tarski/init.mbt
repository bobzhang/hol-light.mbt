// Arithmetic/tarski.ml: the load steps are generated (tarski.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/tarski.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @definability.load()
  @parser.begin_theory("Arithmetic/tarski")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/tarski.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
