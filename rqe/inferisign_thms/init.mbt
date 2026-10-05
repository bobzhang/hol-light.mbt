// Rqe/inferisign_thms.ml: the load steps are generated (inferisign_thms.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Rqe/inferisign_thms.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @condense_thms.load()
  @parser.begin_theory("Rqe/inferisign_thms")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Rqe/inferisign_thms.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}

///|
/// Load Rqe/inferisign_thms.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Rqe/inferisign_thms")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Rqe/inferisign_thms.ml failed: " + e.to_string(),
      )
  }
  @parser.end_theory()
}
