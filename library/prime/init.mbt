// Library/prime.ml: the load steps are generated (prime.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false }

///|
/// Load Library/prime.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Library/prime")
  load_steps() catch {
    e => abort("HOL Light: loading Library/prime.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
