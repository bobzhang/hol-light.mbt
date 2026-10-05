// Rqe/rqe_lib.ml: the load steps are generated (rqe_lib.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rqe_lib.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @analysis.load()
  @poly.load()
  @parser.begin_theory("Rqe/rqe_lib")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rqe_lib.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
