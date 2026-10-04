// Arithmetic/derived.ml: the load steps are generated (derived.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/derived.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @godel.load()
  @parser.begin_theory("Arithmetic/derived")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Arithmetic/derived.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
