// Rqe/rqe_list.ml: the load steps are generated (rqe_list.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/rqe_list.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @list_rewrites.load()
  @parser.begin_theory("Rqe/rqe_list")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rqe_list.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
