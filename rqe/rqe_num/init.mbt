// Rqe/rqe_num.ml: the load steps are generated (rqe_num.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rqe_num.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @basic.load()
  @parser.begin_theory("Rqe/rqe_num")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rqe_num.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
