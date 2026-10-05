// Rqe/signs_thms.ml: the load steps are generated (signs_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/signs_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @matinsert_thms.load()
  @parser.begin_theory("Rqe/signs_thms")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/signs_thms.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
