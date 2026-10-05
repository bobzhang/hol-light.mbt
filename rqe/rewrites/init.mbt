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

///|
/// Load Rqe/rewrites.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Rqe/rewrites")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/rewrites.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
