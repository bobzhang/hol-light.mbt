// Rqe/testform_thms.ml: the load steps are generated (testform_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/testform_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @defs.load()
  @parser.begin_theory("Rqe/testform_thms")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Rqe/testform_thms.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
