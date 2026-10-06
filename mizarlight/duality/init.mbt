// Mizarlight/duality.ml: the load steps are generated (duality.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Mizarlight/duality.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @miz2a.load()
  @parser.begin_theory("Mizarlight/duality")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Mizarlight/duality.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Mizarlight/duality.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Mizarlight/duality")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Mizarlight/duality.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
