// Jordan/lib_ext.ml: the load steps are generated (lib_ext.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/lib_ext.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @tactics_refine.load()
  @parser.begin_theory("Jordan/lib_ext")
  load_steps() catch {
    e => abort("HOL Light: loading Jordan/lib_ext.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Jordan/lib_ext.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Jordan/lib_ext")
  load_steps() catch {
    e => abort("HOL Light: loading Jordan/lib_ext.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
