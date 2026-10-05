// Rqe/matinsert_thms.ml: the load steps are generated (matinsert_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/matinsert_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @inferisign_thms.load()
  @parser.begin_theory("Rqe/matinsert_thms")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Rqe/matinsert_thms.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
