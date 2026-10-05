// GL/decid.ml: the load steps are generated (decid.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load GL/decid.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @k4lr.load()
  @parser.begin_theory("GL/decid")
  load_steps() catch {
    e => abort("HOL Light: loading GL/decid.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load GL/decid.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("GL/decid")
  load_steps() catch {
    e => abort("HOL Light: loading GL/decid.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
