// Rqe/inferpsign.ml: the load steps are generated (inferpsign.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/inferpsign.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @signs.load()
  @parser.begin_theory("Rqe/inferpsign")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/inferpsign.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
