// miz3/miz3.ml: the load steps are generated (miz3.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load miz3/miz3.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @holby.load()
  @parser.begin_theory("miz3/miz3")
  load_steps() catch {
    e => abort("HOL Light: loading miz3/miz3.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load miz3/miz3.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @holby.load()
  @parser.begin_theory("miz3/miz3")
  load_steps() catch {
    e => abort("HOL Light: loading miz3/miz3.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
