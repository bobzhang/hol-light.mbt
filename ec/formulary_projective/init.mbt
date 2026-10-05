// EC/formulary_projective.ml: the load steps are generated (formulary_projective.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/formulary_projective.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @projective.load()
  @parser.begin_theory("EC/formulary_projective")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading EC/formulary_projective.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
