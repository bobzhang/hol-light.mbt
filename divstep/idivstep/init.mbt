// Divstep/idivstep.ml: the load steps are generated (idivstep.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Divstep/idivstep.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @divstep.load()
  @divstep.load()
  @parser.begin_theory("Divstep/idivstep")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Divstep/idivstep.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
