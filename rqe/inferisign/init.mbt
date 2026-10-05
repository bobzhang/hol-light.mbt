// Rqe/inferisign.ml: the load steps are generated (inferisign.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/inferisign.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @condense.load()
  @parser.begin_theory("Rqe/inferisign")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/inferisign.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
