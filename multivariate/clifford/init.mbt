// Multivariate/clifford.ml: the load steps are generated (clifford.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Multivariate/clifford.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @derivatives.load()
  @vectors.load()
  @binary.load()
  @parser.begin_theory("Multivariate/clifford")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Multivariate/clifford.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Leave this file out of what is loaded after this call: a file that
/// upstream loads without it (tools/ocaml_ref/theory.py, CHAIN_SKIP).
pub fn skip_load() -> Unit {
  loaded.val = true
}
