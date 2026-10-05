// IsabelleLight/meta_rules.ml: the load steps are generated (meta_rules.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load IsabelleLight/meta_rules.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @new_tactics.load()
  @parser.begin_theory("IsabelleLight/meta_rules")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading IsabelleLight/meta_rules.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load IsabelleLight/meta_rules.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("IsabelleLight/meta_rules")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading IsabelleLight/meta_rules.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
