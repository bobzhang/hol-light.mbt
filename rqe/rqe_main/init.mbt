// Rqe/rqe_main.ml: the load steps are generated (rqe_main.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rqe_main.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @pdivides.load()
  @parser.begin_theory("Rqe/rqe_main")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rqe_main.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
