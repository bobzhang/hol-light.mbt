// Multivariate/homology.ml: the load steps are generated (homology.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/homology.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @metric.load()
  @frag.load()
  @grouptheory.load()
  @metric.load()
  if skipped.val {
    return
  }
  @parser.begin_theory("Multivariate/homology")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/homology.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
let skipped : Ref[Bool] = Ref::{ val: false, }

///|
/// Leave this file's own steps out of what is loaded after this call: a
/// file that upstream loads without it (tools/ocaml_ref/theory.py,
/// CHAIN_SKIP).
pub fn skip_load() -> Unit {
  skipped.val = true
}
