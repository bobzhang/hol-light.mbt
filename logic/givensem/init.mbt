// Logic/givensem.ml: the load steps are generated (givensem.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Logic/givensem.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @positive.load()
  @parser.begin_theory("Logic/givensem")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/givensem.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}

///|
/// Load Logic/givensem.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @parser.begin_theory("Logic/givensem")
  load_steps() catch {
    e => abort("HOL Light: loading Logic/givensem.ml failed: " + e.to_string())
  }
  @parser.end_theory()
}
