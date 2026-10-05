// GL/modal.ml: the load steps are generated (modal.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/modal.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc.load()
  @parser.begin_theory("GL/modal")
  load_steps() catch {
    e => abort("HOL Light: loading GL/modal.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load GL/modal.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("GL/modal")
  load_steps() catch {
    e => abort("HOL Light: loading GL/modal.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
