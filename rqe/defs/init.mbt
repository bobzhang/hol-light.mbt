// Rqe/defs.ml: the load steps are generated (defs.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/defs.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @lift_qelim.load()
  @parser.begin_theory("Rqe/defs")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/defs.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
