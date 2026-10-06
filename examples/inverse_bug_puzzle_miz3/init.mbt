// Examples/inverse_bug_puzzle_miz3.ml: the load steps are generated (inverse_bug_puzzle_miz3.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/inverse_bug_puzzle_miz3.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @determinants.load()
  @miz3.load_alone()
  @parser.begin_theory("Examples/inverse_bug_puzzle_miz3")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/inverse_bug_puzzle_miz3.ml failed: " +
        e.to_string(),
      )
  }
  @parser.end_theory()
}
