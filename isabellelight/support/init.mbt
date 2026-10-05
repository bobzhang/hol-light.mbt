// IsabelleLight/support.ml: the load steps are generated (support.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load IsabelleLight/support.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("IsabelleLight/support")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading IsabelleLight/support.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load IsabelleLight/support.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("IsabelleLight/support")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading IsabelleLight/support.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
