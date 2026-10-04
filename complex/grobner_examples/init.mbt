// Complex/grobner_examples.ml: the load steps are generated (grobner_examples.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Complex/grobner_examples.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @quelim_examples.load()
  @parser.begin_theory("Complex/grobner_examples")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Complex/grobner_examples.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
