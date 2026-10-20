// HOL terms and types in a subset of MoonBit's syntax:
//
//   ∀ n : Num, n + 0 == n                    ∃ x : _, p(x) && q(x)
//   (x : Num) => x * 2                        if c { a } else { b }
//   f(x, y)   s.subset(t)   (a, b)   [a, b]   !p || q   p → q
//
// Binders take a type (`_` lets it be inferred). Names are HOL's: constants
// and variables by their own name, operators by their usual reading (`==`
// is `=`, `&&` is `/\`, `→` is `==>`, ...), so overloading works as in the
// quotation syntax. Types: `Bool`, `Num`, `List[A]`, `(A, B) -> C`, `(A, B)`;
// a name that is not a type constant is a type variable.
//
// Sets are written as in HOL's quotations (a deviation from MoonBit):
// `{a, b}`, `{}`, `{e | p}` (binding the variables free in both e and p,
// HOL's rule) and `{e | x : A, y : B | p}` (binding those listed). Unlike
// HOL, which drops the types in that list, the listed types are checked.

///|
fn describe(e : @grammar.ParseError) -> String {
  match e {
    UnexpectedToken(tok, (start, _), _) =>
      "unexpected \{@debug.to_string(tok)} at offset \{start}"
    UnexpectedEndOfInput(pos, _) => "unexpected end of input at offset \{pos}"
  }
}

///|
fn binder_name(v : @preterm.Preterm) -> String {
  match v {
    Varp(n, _) => n
    Typing(Varp(n, _), _) => n
    _ => ""
  }
}

///|
fn rename_binder(v : @preterm.Preterm, n : String) -> @preterm.Preterm {
  match v {
    Varp(_, ty) => Varp(n, ty)
    Typing(Varp(_, ty), pty) => Typing(Varp(n, ty), pty)
    _ => v
  }
}

///|
/// Whether a variable named `n` would be read as a constant: the name of
/// one, or an interface name (`exists`, `+`, ...).
fn names_constant(n : String) -> Bool {
  (try @kernel.get_const_type(n) catch { _ => None } noraise { _ => Some(()) })
  is Some(_) ||
  @printer.the_interface.val.iter().any(e => e.0 == n)
}

///|
/// Whether an identifier `n` occurs in `t` (before names are resolved).
fn mentions(t : @preterm.Preterm, n : String) -> Bool {
  match t {
    Varp(m, _) => m == n
    Constp(_, _) => false
    Combp(f, x) => mentions(f, n) || mentions(x, n)
    Absp(v, b) => mentions(v, n) || mentions(b, n)
    Typing(x, _) => mentions(x, n)
  }
}

///|
/// The name a binder `n` over `scope` is given: its own, or, if that is
/// read as a constant, the first one with primes that is not, that `scope`
/// does not mention and that no binder in scope (`bound`) was renamed to
/// (either would be captured).
fn binder_rename(
  n : String,
  scope : @preterm.Preterm,
  bound : @list.List[(String, String)],
) -> String {
  if !names_constant(n) {
    return n
  }
  let mut renamed = n + "'"
  while names_constant(renamed) ||
        mentions(scope, renamed) ||
        bound.iter().any(b => b.1 == renamed) {
    renamed = renamed + "'"
  }
  renamed
}

///|
/// Resolve names: a constant the syntax stands for (`true`, `&&`, ...)
/// drops its mark; an identifier a binder in scope binds is that variable;
/// any other identifier is read through the spellings of symbolic constants
/// (`select`, `op_plus`, ...). A binder named like a constant is renamed with primes, with the
/// identifiers it binds, so that the elaboration can neither read it as the
/// constant nor capture a constant with it.
fn resolve_names(
  t : @preterm.Preterm,
  bound : @list.List[(String, String)],
) -> @preterm.Preterm raise {
  match t {
    // a set comprehension is elaborated as HOL's parser does (GEN%PVAR
    // binder, the variables it binds), which needs the names resolved
    Combp(Combp(Varp(m, _), e), p) if m == @grammar.set_abs_mark =>
      @parser.pmk_setabs(resolve_names(e, bound), resolve_names(p, bound))
    Combp(Varp(m, _), binders) if m == @grammar.set_compr_mark => {
      let vs = []
      let mut b = binders
      let mut bound = bound
      while b is Absp(v, body) {
        let n = binder_name(v)
        let renamed = binder_rename(n, binders, bound)
        vs.push(rename_binder(v, renamed))
        bound = bound.prepend((n, renamed))
        b = body
      }
      guard b is Combp(Combp(Varp(_, _), e), p) else {
        raise Failure("term syntax: malformed set comprehension")
      }
      @parser.pmk_setcompr(
        resolve_names(e, bound),
        @list.List(vs),
        resolve_names(p, bound),
      )
    }
    Varp(n, ty) if n.has_prefix(@grammar.generated_mark) =>
      Varp(n[@grammar.generated_mark.length():].to_owned(), ty)
    Varp(n, ty) =>
      match bound.iter().find_first(b => b.0 == n) {
        Some((_, renamed)) => Varp(renamed, ty)
        // the spellings of symbolic constants: select, op_plus, ...; an
        // interface name means what the interface says
        None =>
          Varp(
            if @printer.the_interface.val.iter().any(e => e.0 == n) {
              n
            } else {
              @grammar.unescape(n)
            },
            ty,
          )
      }
    Constp(_, _) => t
    Combp(f, x) => Combp(resolve_names(f, bound), resolve_names(x, bound))
    Absp(v, b) => {
      let n = binder_name(v)
      let renamed = binder_rename(n, b, bound)
      Absp(
        rename_binder(v, renamed),
        resolve_names(b, bound.prepend((n, renamed))),
      )
    }
    Typing(x, ty) => Typing(resolve_names(x, bound), ty)
  }
}

///|
fn check_semantics() -> Unit raise {
  match @grammar.take_error() {
    Some(msg) => raise Failure("term syntax: " + msg)
    None => ()
  }
}

///|
/// The preterm of `s`, before elaboration.
pub fn parse_preterm(s : String) -> @preterm.Preterm raise {
  let toks = tokens(s)
  ignore(@grammar.take_error())
  let ptm = @grammar.term(toks) catch {
    e => raise Failure("term syntax: " + describe(e))
  }
  check_semantics()
  resolve_names(ptm, @list.List([]))
}

///|
/// The HOL term `s` denotes.
pub fn parse_term(s : String) -> @kernel.Term raise {
  @parser.record_quotation(s)
  elaborate(s)
}

///|
/// The term `s` denotes, without recording it as a quotation.
fn elaborate(s : String) -> @kernel.Term raise {
  // names are read through the fixed view of the interface when it is on
  // (resolution.mbt)
  fn go() -> @kernel.Term raise {
    @preterm.term_of_preterm(
      @preterm.retypecheck(@list.List([]), parse_preterm(s)),
    )
  }
  if fixed_resolution.val {
    with_fixed_interface(go)
  } else {
    go()
  }
}

///|
/// The HOL type `s` denotes.
pub fn parse_type(s : String) -> @kernel.HolType raise {
  let toks = tokens(s)
  ignore(@grammar.take_error())
  let pty = @grammar.pretype(toks) catch {
    e => raise Failure("term syntax: " + describe(e))
  }
  check_semantics()
  if pty == @preterm.dpty {
    raise Failure("term syntax: _ alone is not a type")
  }
  @preterm.type_of_pretype(pty)
}
