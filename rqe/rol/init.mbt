// Rqe/rol.ml: the load steps are generated (rol.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rol.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @asym.load()
  @parser.begin_theory("Rqe/rol")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rol.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
