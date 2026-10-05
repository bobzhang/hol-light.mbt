// Rqe/util.ml: the load steps are generated (util.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/util.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @rqe_tactics_ext.load()
  @parser.begin_theory("Rqe/util")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/util.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
