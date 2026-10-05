// IEEE/float.ml: the load steps are generated (float.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load IEEE/float.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fixed_thms.load()
  @parser.begin_theory("IEEE/float")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/float.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load IEEE/float.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("IEEE/float")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/float.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
