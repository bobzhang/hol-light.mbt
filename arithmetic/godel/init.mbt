// Arithmetic/godel.ml: the load steps are generated (godel.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/godel.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @arithprov.load()
  @parser.begin_theory("Arithmetic/godel")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/godel.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
