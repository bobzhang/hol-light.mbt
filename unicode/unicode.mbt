// ===========================================================================
// Unicode symbols for terms: `∀x. p x ⇒ q x` beside `!x. p x ==> q x`.
//
// Not in upstream. A symbol is an alias in HOL Light's own tables (the
// interface map, the binder, prefix and infix lists), as `forall` is for
// `!` (bool.ml's `set_verbose_symbols`): the parser takes both spellings
// and the printer gives the alias. Only the tokens are new, in the lexer
// (`@printer.unicode_symbols`). Nothing changes until `set_symbols` is
// called.
// ===========================================================================

///|
using @kernel {type HolType}

///|
/// The aliases `set_symbols` makes: the symbol and what it stands for.
pub let symbols : Array[(String, String)] = [
  ("∀", "!"),
  ("∃", "?"),
  ("∧", "/\\"),
  ("∨", "\\/"),
  ("¬", "~"),
  ("⇒", "==>"),
  ("⇔", "<=>"),
  ("≤", "<="),
  ("≥", ">="),
]

///|
fn forget(sym : String) -> Unit {
  @printer.unparse_as_binder(sym)
  @printer.unparse_as_prefix(sym)
  @printer.unparse_as_infix(sym)
  let other = (s : String) => s != sym
  @printer.prebroken_binops.val = @lib.filter(
    other,
    @printer.prebroken_binops.val,
  )
  @printer.unspaced_binops.val = @lib.filter(
    other,
    @printer.unspaced_binops.val,
  )
  @preterm.remove_interface(sym)
  @printer.the_overload_skeletons.val = @lib.filter(
    (e : (String, HolType)) => e.0 != sym,
    @printer.the_overload_skeletons.val,
  )
}

///|
/// Make `sym` parse and print as `name` does now: with its status as a
/// binder, prefix or infix, and for every constant `name` stands for. The
/// printer gives `sym` for them from now on.
pub fn add_symbol(sym : String, name : String) -> Unit raise {
  forget(sym)
  if @printer.parses_as_binder(name) {
    @printer.parse_as_binder(sym)
  }
  if @printer.is_prefix(name) {
    @printer.parse_as_prefix(sym)
  }
  if @lib.can(@printer.get_infix_status, name) {
    @printer.parse_as_infix(sym, @printer.get_infix_status(name))
  }
  // laid out as `name` is: `==>` starts a line, where others end one
  if @lib.mem(name, @printer.prebroken_binops.val) {
    @printer.prebroken_binops.val = @printer.prebroken_binops.val.concat(
      @list.singleton(sym),
    )
  }
  if @lib.mem(name, @printer.unspaced_binops.val) {
    @printer.unspaced_binops.val = @printer.unspaced_binops.val.concat(
      @list.singleton(sym),
    )
  }
  let meanings = @lib.filter(
    (e : (String, (String, HolType))) => e.0 == name,
    @printer.the_interface.val,
  )
  // a name with no entry is a constant's own, if it is defined yet
  let meanings = if meanings.is_empty() {
    try @kernel.get_const_type(name) catch {
      _ => @list.empty()
    } noraise {
      ty => @list.singleton((name, (name, ty)))
    }
  } else {
    meanings
  }
  for e in @printer.the_overload_skeletons.val {
    if e.0 == name {
      @preterm.make_overloadable(sym, e.1)
    }
  }
  // in front, in their order: the printer takes the first entry for a
  // constant, the parser the first that typechecks
  @printer.the_interface.val = meanings
    .map(e => (sym, e.1))
    .concat(@printer.the_interface.val)
}

///|
/// Turn the Unicode symbols on. Call it again after loading a theory that
/// overloads `<=` or `>=` at a new type.
pub fn set_symbols() -> Unit raise {
  @printer.unicode_symbols.val = true
  @pp.width_in_chars.val = true
  for s in symbols {
    add_symbol(s.0, s.1)
  }
}

///|
/// Back to upstream's syntax.
pub fn unset_symbols() -> Unit {
  @printer.unicode_symbols.val = false
  @pp.width_in_chars.val = false
  for s in symbols {
    forget(s.0)
  }
}
