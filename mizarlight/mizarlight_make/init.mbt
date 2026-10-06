// Mizarlight/make.ml: the load steps are generated (mizarlight_make.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Mizarlight/make.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Mizarlight/make")
  load_steps() catch {
    e => abort("HOL Light: loading Mizarlight/make.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
