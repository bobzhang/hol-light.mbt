// Boyer_Moore/generalize.ml: the load steps are generated (generalize.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Boyer_Moore/generalize.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @counterexample.load()
  @parser.begin_theory("Boyer_Moore/generalize")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/generalize.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load Boyer_Moore/generalize.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Boyer_Moore/generalize")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Boyer_Moore/generalize.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
