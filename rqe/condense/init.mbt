// Rqe/condense.ml: the load steps are generated (condense.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/condense.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @testform.load()
  @parser.begin_theory("Rqe/condense")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/condense.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Rqe/condense.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Rqe/condense")
  load_steps() catch {
    e => abort("HOL Light: loading Rqe/condense.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
