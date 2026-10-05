// Rqe/rqe_real.ml: the load steps are generated (rqe_real.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rqe_real.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rqe_num.load()
  @parser.begin_theory("Rqe/rqe_real")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rqe_real.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
