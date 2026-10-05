// Rqe/rewrites.ml: the load steps are generated (rewrites.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rewrites.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @util.load()
  @parser.begin_theory("Rqe/rewrites")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rewrites.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
