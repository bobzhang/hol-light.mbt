// Mizarlight/miz2a.ml: the load steps are generated (miz2a.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Mizarlight/miz2a.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @mizarlight_make.load()
  @parser.begin_theory("Mizarlight/miz2a")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Mizarlight/miz2a.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Mizarlight/miz2a.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Mizarlight/miz2a")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Mizarlight/miz2a.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
