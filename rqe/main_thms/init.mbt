// Rqe/main_thms.ml: the load steps are generated (main_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/main_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @pdivides_thms.load()
  @parser.begin_theory("Rqe/main_thms")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/main_thms.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
