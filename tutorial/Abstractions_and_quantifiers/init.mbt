// Tutorial/Abstractions_and_quantifiers.ml: the load steps are generated (Abstractions_and_quantifiers.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Abstractions_and_quantifiers.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Tutorial/Abstractions_and_quantifiers")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Abstractions_and_quantifiers.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
