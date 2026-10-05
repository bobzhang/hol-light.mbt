// Library/binary.ml: the load steps are generated (binary.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/binary.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  if skipped.val {
    return
  }
  @parser.begin_theory("Library/binary")
  load_steps() catch {
    e => abort("HOL Light: loading Library/binary.ml failed: " + e.to_string())
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
