// Logic/given.ml: the load steps are generated (given.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/given.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @resolution.load()
  @parser.begin_theory("Logic/given")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/given.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Logic/given.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Logic/given")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/given.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
