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
//
// Patterns are written as MoonBit's: `match e { 0 => a; SUC(n) if n > 1 =>
// b }` (HOL's match e with 0 -> a | SUC n when n > 1 -> b), `fn { 0 => a;
// SUC(n) => b }` (function 0 -> a | SUC n -> b), and over one pattern
// `fn { (a, b) => e }` (\(a,b). e) and `∀ (a, b) : (A, B), e`. Arms are
// separated by `;`; a newline is only whitespace.

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
    Typing(x, _) => binder_name(x)
    _ => ""
  }
}

///|
fn rename_binder(v : @preterm.Preterm, n : String) -> @preterm.Preterm {
  match v {
    Varp(_, ty) => Varp(n, ty)
    Typing(x, pty) => Typing(rename_binder(x, n), pty)
    _ => v
  }
}

///|
/// Whether a binder is a variable (with any type annotations), not a
/// pattern.
fn is_variable_binder(v : @preterm.Preterm) -> Bool {
  match v {
    Varp(_, _) => true
    Typing(x, _) => is_variable_binder(x)
    _ => false
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
/// How many GEN%PVAR names HOL's parser takes reading the quotation `t`
/// stands for (a preterm with set marks). Reading `{e | p}`, it first tries
/// `{a, b, ...}`, which reads `e` and fails at `|`, so it reads `e` twice;
/// reading `{e | vs | p}`, it also tries `{e | p}` first, reading `e` three
/// times (and `vs`, binders here, twice). Its readings are not undone, so
/// each takes the names of the comprehensions in it; the last is kept.
/// The term syntax skips the names of the readings before the last, so
/// that the two syntaxes number GEN%PVAR alike.
fn pgen_cost(t : @preterm.Preterm) -> Int {
  match t {
    // a pattern-match arm takes two (pmk_pattern), after its parts
    Combp(Combp(Combp(Varp(m, _), pat), when_), body) if m ==
      @grammar.clause_mark => 2 + pgen_cost(pat) + pgen_cost(when_) + pgen_cost(body)
    Combp(Combp(Varp(m, _), e), p) if m == @grammar.set_abs_mark =>
      2 * pgen_cost(e) + pgen_cost(p) + 1
    Combp(Varp(m, _), binders) if m == @grammar.set_compr_mark => {
      let mut b = binders
      while b is Absp(_, body) {
        b = body
      }
      match b {
        Combp(Combp(Varp(_, _), e), p) => 3 * pgen_cost(e) + pgen_cost(p) + 1
        _ => 0
      }
    }
    Combp(f, x) => pgen_cost(f) + pgen_cost(x)
    Absp(v, b) => pgen_cost(v) + pgen_cost(b)
    Typing(x, _) => pgen_cost(x)
    Varp(_, _) | Constp(_, _) => 0
  }
}

///|
/// A pattern resolved, the variables it binds (as HOL's pfrees lists them)
/// and `bound` with them. Those are
/// the ones HOL's parser gives it: the free variables (pfrees) of the
/// pattern read with nothing in scope, which name no constant (a lambda
/// inside the pattern binds its own). Each is bound under every spelling
/// the pattern writes it with (op_dollar_dollar for $$). Any other name in
/// the pattern, such as a constant's, is read as HOL's elaboration reads
/// it: in a match's clause, in `bound` (an enclosing binder renamed from T
/// to T' binds T); in a lambda or quantifier over a pattern, with nothing
/// in scope (T is the constant).
fn resolve_pattern(
  pat : @preterm.Preterm,
  bound : @list.List[(String, String)],
  enclosing~ : Bool,
) -> (
  @preterm.Preterm,
  @list.List[@preterm.Preterm],
  @list.List[(String, String)],
) raise {
  // read once without taking GEN%PVAR names, to find what it binds
  let frees = @parser.with_pgen_counter_restored(() => {
    @parser.pfrees(resolve_names(pat, @list.List([])))
  })
  let names = frees.map(v => if v is Varp(n, _) { n } else { "" })
  let own = []
  fn go(t : @preterm.Preterm) {
    match t {
      Varp(n, _) =>
        if !n.has_prefix(@grammar.generated_mark) {
          let r = if @printer.the_interface.val.iter().any(e => e.0 == n) {
            n
          } else {
            @grammar.unescape(n)
          }
          if names.contains(r) && !own.contains((n, r)) {
            own.push((n, r))
          }
        }
      Constp(_, _) => ()
      Combp(f, x) => {
        go(f)
        go(x)
      }
      Absp(v, b) => {
        go(v)
        go(b)
      }
      Typing(x, _) => go(x)
    }
  }

  go(pat)
  fn with_own(b : @list.List[(String, String)]) {
    own.fold(init=b, (b, v) => b.prepend(v))
  }

  let scope = if enclosing { bound } else { @list.List([]) }
  (resolve_names(pat, with_own(scope)), frees, with_own(bound))
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
    Combp(Combp(Varp(m, _), e), p) if m == @grammar.set_abs_mark => {
      @parser.skip_pgenvars(pgen_cost(e))
      @parser.pmk_setabs(resolve_names(e, bound), resolve_names(p, bound))
    }
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
      @parser.skip_pgenvars(2 * pgen_cost(e))
      @parser.pmk_setcompr(
        resolve_names(e, bound),
        @list.List(vs),
        resolve_names(p, bound),
      )
    }
    // a pattern-match arm is HOL's clause (pmk_pattern), which needs the
    // names resolved: the pattern, its guard and its body, in the order
    // HOL's parser reads them, then the clause's GEN%PVAR names
    Combp(Combp(Combp(Varp(m, _), pat), when_), body) if m ==
      @grammar.clause_mark => {
      let (p, vs, inner) = resolve_pattern(pat, bound, enclosing=true)
      let tests = match when_ {
        Varp(g, _) if g == @grammar.no_guard_mark => @list.List([])
        _ => @list.singleton(resolve_names(when_, inner))
      }
      // the clause binds the variables HOL's parser finds in the pattern,
      // whatever names the resolution gave the rest (a binder renamed
      // because it is named like a constant)
      @parser.pmk_pattern_binding(((p, tests), resolve_names(body, inner)), () => vs)
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
    // a lambda or quantifier over a pattern: elaboration makes it HOL's
    // generalized abstraction (GABS)
    Absp(v, b) if !is_variable_binder(v) => {
      let (p, _, inner) = resolve_pattern(v, bound, enclosing=false)
      Absp(p, resolve_names(b, inner))
    }
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
