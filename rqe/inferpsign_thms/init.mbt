// Rqe/inferpsign_thms.ml: the load steps are generated (inferpsign_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/inferpsign_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @signs_thms.load()
  @parser.begin_theory("Rqe/inferpsign_thms")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Rqe/inferpsign_thms.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
