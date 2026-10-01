// Library/grouptheory.ml: the load steps are generated (grouptheory.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/grouptheory.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @frag.load()
  @card.load()
  @prime.load()
  @parser.begin_theory("Library/grouptheory")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/grouptheory.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
