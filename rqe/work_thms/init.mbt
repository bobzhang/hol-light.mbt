// Rqe/work_thms.ml: the load steps are generated (work_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/work_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @main_thms.load()
  @parser.begin_theory("Rqe/work_thms")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/work_thms.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
