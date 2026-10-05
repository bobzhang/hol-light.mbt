// Divstep/hull_light.ml: the load steps are generated (hull_light.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Divstep/hull_light.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @idivstep.load()
  @parser.begin_theory("Divstep/hull_light")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Divstep/hull_light.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
