// IsabelleLight/new_tactics.ml: the load steps are generated (new_tactics.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load IsabelleLight/new_tactics.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @support.load()
  @parser.begin_theory("IsabelleLight/new_tactics")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading IsabelleLight/new_tactics.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load IsabelleLight/new_tactics.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("IsabelleLight/new_tactics")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading IsabelleLight/new_tactics.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
