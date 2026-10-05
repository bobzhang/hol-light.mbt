// Logic/resolution.ml: the load steps are generated (resolution.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/resolution.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @unif.load()
  @parser.begin_theory("Logic/resolution")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Logic/resolution.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Logic/resolution.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Logic/resolution")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Logic/resolution.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
