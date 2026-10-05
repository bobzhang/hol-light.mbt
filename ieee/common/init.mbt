// IEEE/common.ml: the load steps are generated (common.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load IEEE/common.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("IEEE/common")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/common.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load IEEE/common.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("IEEE/common")
  load_steps() catch {
    e => abort("HOL Light: loading IEEE/common.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
