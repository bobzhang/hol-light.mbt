// Mizarlight/duality_holby.ml: the load steps are generated (duality_holby.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Mizarlight/duality_holby.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @duality.load()
  @holby.load()
  @parser.begin_theory("Mizarlight/duality_holby")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Mizarlight/duality_holby.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load Mizarlight/duality_holby.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Mizarlight/duality_holby")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Mizarlight/duality_holby.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
