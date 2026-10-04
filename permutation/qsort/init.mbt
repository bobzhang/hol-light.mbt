// Permutation/qsort.ml: the load steps are generated (qsort.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Permutation/qsort.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @permutation.load()
  @permuted.load()
  @parser.begin_theory("Permutation/qsort")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Permutation/qsort.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
