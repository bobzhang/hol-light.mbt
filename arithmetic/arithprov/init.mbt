// Arithmetic/arithprov.ml: the load steps are generated (arithprov.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Arithmetic/arithprov.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @tarski.load()
  @parser.begin_theory("Arithmetic/arithprov")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Arithmetic/arithprov.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load Arithmetic/arithprov.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Arithmetic/arithprov")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Arithmetic/arithprov.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
