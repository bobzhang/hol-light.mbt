// Tutorial/Linking_external_tools.ml: the load steps are generated (Linking_external_tools.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Linking_external_tools.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @transc.load()
  @parser.begin_theory("Tutorial/Linking_external_tools")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Linking_external_tools.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
