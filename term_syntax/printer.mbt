// Print terms and types in the term syntax, so that parsing the result
// gives the term back. Constants are printed under their own names (or as
// the operator the grammar reads as that name), binders always carry their
// type, and a free variable carries its type where it first appears.

///|
/// A term or type that has no spelling in the syntax (a name that is not a
/// MoonBit identifier, a type variable the elaborator invented, ...).
pub(all) suberror Unprintable {
  Unprintable(String)
} derive(Debug)

///|
pub extend Unprintable with Debug::{to_repr}

///|
// precedence levels, loosest first, as in the grammar
const EXPR = 0

///|
const IMPL = 1

///|
const OR = 2

///|
const AND = 3

///|
const CMP = 4

///|
const ADD = 5

///|
const MUL = 6

///|
const PREFIX = 7

///|
const SIMPLE = 8

///|
fn is_ident_char(c : Char) -> Bool {
  c is ('a'..='z' | 'A'..='Z' | '0'..='9' | '_')
}

///|
/// Whether `name` lexes as one identifier (with optional trailing primes)
/// that is not a keyword.
fn is_ident(name : String) -> Bool {
  let cs = name.to_array()
  let mut n = cs.length()
  while n > 0 && cs[n - 1] == '\'' {
    n -= 1
  }
  if n == 0 || name == "_" || is_keyword(name) {
    return false
  }
  let c0 = cs[0]
  let start_ok = c0 is ('a'..='z' | 'A'..='Z') ||
    (c0 == '_' && n > 1)
  start_ok && cs[1:n].iter().all(is_ident_char)
}

///|
fn is_type_constant(name : String) -> Bool {
  (try @kernel.get_type_arity(name) catch { _ => -1L }) >= 0L
}

///|
fn capitalised(name : String) -> String {
  let cs = name.to_array()
  cs[0].to_string().to_upper() + String::from_array(cs[1:])
}

///|
fn lowered(name : String) -> String {
  let cs = name.to_array()
  cs[0].to_string().to_lower() + String::from_array(cs[1:])
}

///|
/// What the type name `s` reads as (the parser's rule, internal/grammar):
/// Some(type constant), or None for a type variable.
fn reads_as_type(s : String) -> String? {
  if s == "Unit" && !is_type_constant("unit") {
    Some("1")
  } else if is_type_constant(lowered(s)) {
    Some(lowered(s))
  } else if is_type_constant(s) {
    Some(s)
  } else {
    None
  }
}

///|
fn type_name(name : String) -> String raise Unprintable {
  let candidates = if name == "1" { ["Unit"] } else { [capitalised(name), name] }
  for s in candidates {
    if is_ident(s) && s.to_array()[0] is ('A'..='Z') && reads_as_type(s) == Some(name) {
      return s
    }
  }
  raise Unprintable("type constant " + name)
}

///|
fn flatten(ty : @kernel.HolType, op : String) -> Array[@kernel.HolType] {
  let out = []
  let mut t = ty
  while t is Tyapp(o, More(a, tail=More(b, tail=Empty))) && o == op {
    out.push(a)
    t = b
  }
  out.push(t)
  out
}

///|
fn print_type_at(ty : @kernel.HolType, simple : Bool) -> String raise Unprintable {
  match ty {
    // a type variable the elaborator invented is written as a hole, which
    // elaboration fills with a fresh one
    Tyvar(name) if name.has_prefix("?") => "_"
    Tyvar(name) =>
      if name.to_array() is [c, ..] &&
        c is ('A'..='Z') &&
        is_ident(name) &&
        reads_as_type(name) is None {
        name
      } else {
        raise Unprintable("type variable " + name)
      }
    Tyapp("fun", More(_, tail=More(_, tail=Empty))) => {
      let parts = flatten(ty, "fun")
      let res = parts.pop().unwrap()
      let args = parts.map(a => print_type_at(a, false)).join(", ")
      let s = "(" + args + ") -> " + print_type_at(res, false)
      if simple {
        "(" + s + ")"
      } else {
        s
      }
    }
    Tyapp("prod", More(_, tail=More(_, tail=Empty))) =>
      "(" + flatten(ty, "prod").map(a => print_type_at(a, false)).join(", ") + ")"
    Tyapp(name, Empty) => type_name(name)
    Tyapp(name, args) =>
      type_name(name) +
      "[" +
      args.map(a => print_type_at(a, false)).to_array().join(", ") +
      "]"
  }
}

///|
/// `ty` inside a term, where a hole stands for an invented type variable.
fn print_type_in_term(ty : @kernel.HolType) -> String raise Unprintable {
  print_type_at(ty, false)
}

///|
/// `ty` in the term syntax.
pub fn print_type(ty : @kernel.HolType) -> String raise Unprintable {
  // holes stand for invented type variables only inside a term, whose
  // elaboration recovers them; a type alone has nothing to recover them from
  for v in @kernel.tyvars(ty) {
    if v is Tyvar(name) && name.has_prefix("?") {
      raise Unprintable("invented type variable " + name)
    }
  }
  print_type_at(ty, false)
}

///|
priv struct Printer {
  // free variables printed with their type so far
  typed_free : Array[@kernel.Term]
  // type variables some variable's type fixes; a constant whose type has
  // another one is printed with its type
  fixed : @list.List[@kernel.HolType]
  // annotate every constant whose type has a type variable
  all_constants : Bool
  // write a constant under its overloaded name (+ for real_add, divides
  // for num_divides) where the interface has one
  overloads : Bool
  // names of every variable of the term, which a renamed binder avoids
  names : Array[String]
  // write sets as {a, b} and {e | p} (else as INSERT, GSPEC, ...)
  sets : Bool
  // bindings of a set comprehension's implicit binders ({e | p}), each the
  // variable and the depth of its binding in the scope: printed with their
  // type where they first occur
  untyped : Array[(@kernel.Term, Int)]
}

///|
fn wrap(s : String, level : Int, ctx : Int) -> String {
  if level < ctx {
    "(" + s + ")"
  } else {
    s
  }
}

///|
// operators of the grammar: HOL name -> (MoonBit operator, level, right-assoc)
fn binary_op(name : String) -> (String, Int, Bool)? {
  match name {
    "==>" => Some(("→", IMPL, true))
    "\\/" => Some(("||", OR, true))
    "/\\" => Some(("&&", AND, true))
    "=" => Some(("==", CMP, false))
    "<" | "<=" | ">" | ">=" => Some((name, CMP, false))
    "+" | "-" => Some((name, ADD, false))
    "*" | "/" => Some((name, MUL, false))
    _ => None
  }
}

///|
fn is_constant_name(name : String) -> Bool {
  names_constant(name)
}

///|
fn Printer::name(_self : Printer, name : String) -> String raise Unprintable {
  if is_ident(name) {
    name
  } else {
    raise Unprintable("name " + name)
  }
}

///|
/// A constant's name, spelt as an identifier if it is not one.
fn constant_name(name : String) -> String raise Unprintable {
  if is_ident(name) && @grammar.unescape(name) == name {
    name
  } else {
    match @grammar.escape(name) {
      Some(s) => s
      None => raise Unprintable("name " + name)
    }
  }
}

///|
/// The name a constant is written under: its overloaded name, when
/// overloads are on and the interface maps one the syntax can write (an
/// operator, ~, --, or an identifier) to this constant at an instance of its
/// type; its own name otherwise.
fn Printer::spelling(self : Printer, c : @kernel.Term) -> String {
  guard c is Const(name, ty) else { return "" }
  if !self.overloads {
    return name
  }
  for e in @printer.the_interface.val {
    let (iname, (cname, gty)) = e
    if cname == name &&
      iname != name &&
      (binary_op(iname) is Some(_) ||
      iname is ("~" | "--") ||
      is_ident(iname)) &&
      (try @basics.type_match(gty, ty, @list.List([])) is _ catch {
        _ => false
      } noraise {
        _ => true
      }) {
      return iname
    }
  }
  name
}

///|
fn Printer::constant(self : Printer, c : @kernel.Term) -> String raise Unprintable {
  guard c is Const(_, ty) else { raise Unprintable("not a constant") }
  self.annotated(constant_name(self.spelling(c)), c)
}

///|
/// `s` for the constant `c`, with `c`'s type where the reading may not pin
/// it down: a type variable no variable fixes, or (annotating every
/// constant) any instance of a polymorphic constant.
fn Printer::annotated(self : Printer, s : String, c : @kernel.Term) -> String raise Unprintable {
  guard c is Const(name, ty) else { raise Unprintable("not a constant") }
  let tvs = @kernel.tyvars(ty)
  let polymorphic = (try @kernel.get_const_type(name) catch { _ => ty })
    |> @kernel.tyvars
    |> fn(l) { !l.is_empty() }
  if tvs.iter().any(v => !self.fixed.contains(v)) ||
    (self.all_constants && !tvs.is_empty()) {
    "(" + s + " : " + print_type_in_term(ty) + ")"
  } else if self.all_constants && polymorphic {
    // a concrete instance: annotated where its type can be written
    "(" + s + " : " + print_type_in_term(ty) + ")" catch {
      _ => s
    }
  } else {
    s
  }
}

///|
fn Printer::variable(
  self : Printer,
  v : @kernel.Term,
  bound : Bound,
) -> String raise Unprintable {
  guard v is Var(name, ty) else { raise Unprintable("not a variable") }
  match bound.iter().find_first(b => b.0 == v) {
    Some((_, printed)) => {
      // the binding the occurrence refers to: the innermost of v
      let mut i = 0
      for b in bound {
        if b.0 == v {
          break
        }
        i += 1
      }
      match self.untyped.search((v, bound.length() - i)) {
        Some(i) => {
          self.untyped.remove(i) |> ignore
          return "(" + printed + " : " + print_type_in_term(ty) + ")"
        }
        None => return printed
      }
    }
    None => ()
  }
  // a symbolic name (the --> a definition is about to make a constant) is
  // spelt as a constant's is
  let s = if is_ident(name) {
    name
  } else {
    match @grammar.escape(name) {
      Some(e) => e
      None => raise Unprintable("name " + name)
    }
  }
  // a bound variable of the same name would capture it
  if bound.iter().any(b => b.1 == name) {
    raise Unprintable("free variable " + name + " captured by a binder")
  }
  if is_constant_name(name) {
    raise Unprintable("free variable " + name + " named like a constant")
  }
  if self.typed_free.contains(v) {
    s
  } else {
    self.typed_free.push(v)
    "(" + s + " : " + print_type_in_term(ty) + ")"
  }
}

///|
type Bound = @list.List[(@kernel.Term, String)]

///|
/// The name `v` is printed under where it is bound over `body`: its own,
/// unless that would capture another variable of the same name, which a
/// fresh name with primes avoids.
fn Printer::bind(
  self : Printer,
  v : @kernel.Term,
  body : @kernel.Term,
  bound : Bound,
) -> (String, Bound) raise Unprintable {
  guard v is Var(name, ty) else { raise Unprintable("binder is not a variable") }
  let clash = @kernel.frees(body).iter().any(u => {
    u is Var(n, _) && n == name && u != v
  }) ||
    bound.iter().any(b => b.1 == name && b.0 != v)
  // a binder named like a constant would be read as that constant
  // (its occurrences are read as it, by name, whatever they spell)
  let plain = is_ident(name) && !is_constant_name(name)
  let mut printed = if plain || !is_ident(name) { if plain { name } else { "v" } } else { name + "'" }
  if clash || !plain {
    while self.names.contains(printed) || is_constant_name(printed) {
      printed = printed + "'"
    }
    self.names.push(printed)
  }
  let s = self.name(printed) + " : " + print_type_in_term(ty)
  (s, bound.prepend((v, printed)))
}

///|
fn Printer::term(
  self : Printer,
  t : @kernel.Term,
  ctx : Int,
  bound : Bound,
) -> String raise Unprintable {
  match t {
    Var(_, _) => self.variable(t, bound)
    Const("T", _) => "true"
    Const("F", _) => "false"
    Const("EMPTY", _) if self.sets => self.annotated("{}", t)
    // an operator or binder that is not applied as the syntax spells it is
    // named like any symbolic constant (op_plus, op_tilde, ...)
    Const(_, _) => self.constant(t)
    Abs(v, body) => {
      let (b, inner) = self.bind(v, body, bound)
      wrap("(" + b + ") => " + self.term(body, EXPR, inner), EXPR, ctx)
    }
    Comb(_, _) => self.comb(t, ctx, bound)
  }
}

///|
fn Printer::comb(
  self : Printer,
  t : @kernel.Term,
  ctx : Int,
  bound : Bound,
) -> String raise Unprintable {
  // only a numeral in canonical form is written in decimal
  if (try @basics.dest_numeral(t) catch { _ => None } noraise { n => Some(n) })
    is Some(n) &&
    (try @nums.mk_numeral(n) == t catch { _ => false }) {
    return @num.string_of_num(n)
  }
  let (head, args) = @basics.strip_comb(t)
  let args = args.to_array()
  let spelled = self.spelling(head)
  match (head, args) {
    (Const(q, _), [Abs(v, body)]) if q is ("forall" | "?") => {
      let sym = if q == "forall" { "∀" } else { "∃" }
      let (b, inner) = self.bind(v, body, bound)
      // the body is another quantifier or an infix expression
      let body_s = match body {
        Comb(Const(q2, _), Abs(_, _)) if q2 is ("forall" | "?") =>
          self.term(body, EXPR, inner)
        _ => self.term(body, IMPL, inner)
      }
      wrap(sym + " " + b + ", " + body_s, EXPR, ctx)
    }
    (Const(_, _), [x]) if spelled is ("~" | "--") => {
      let op = if spelled == "~" { "!" } else { "-" }
      wrap(op + self.term(x, PREFIX, bound), PREFIX, ctx)
    }
    (Const("COND", _), [c, a, b]) => {
      let s = "if " +
        self.term(c, IMPL, bound) +
        " { " +
        self.term(a, EXPR, bound) +
        " } else { " +
        self.term(b, EXPR, bound) +
        " }"
      wrap(s, EXPR, ctx)
    }
    (Const(",", _), [_, _]) => {
      let elems = []
      let mut r = t
      while r is Comb(Comb(Const(",", _), a), b) {
        elems.push(self.term(a, EXPR, bound))
        r = b
      }
      elems.push(self.term(r, EXPR, bound))
      "(" + elems.join(", ") + ")"
    }
    (Const("INSERT", _), [_, _]) if self.sets && set_elements(t) is Some(items) =>
      "{" + items.map(x => self.term(x, EXPR, bound)).join(", ") + "}"
    // with no binders to list, only the implicit form can write it
    (Const("GSPEC", _), [Abs(g, body)]) if self.sets &&
      comprehension(g, body) is Some((scoped, p, e)) &&
      (!scoped.is_empty() || implicit_binders(e, p, bound).is_empty()) =>
      self.comprehension(scoped, p, e, bound)
    (Const("CONS", _), [_, _]) if (try @basics.dest_list(t) catch { _ => None } noraise {
          l => Some(l)
        })
      is Some(items) =>
      "[" +
      items.to_array().map(x => self.term(x, EXPR, bound)).join(", ") +
      "]"
    (Const(_, _), [a, b]) if binary_op(spelled) is Some((op, level, right)) => {
      // comparisons associate to the left in MoonBit, but a chain such as
      // a == b == c (for (a = b) <=> c) misreads easily: parenthesize them
      let (lctx, rctx) = if level == CMP {
        (level + 1, level + 1)
      } else if right {
        (level + 1, level)
      } else {
        (level, level + 1)
      }
      let s = self.term(a, lctx, bound) + " " + op + " " + self.term(b, rctx, bound)
      wrap(s, level, ctx)
    }
    _ => {
      let h = self.term(head, SIMPLE, bound)
      let s = h + "(" + args.map(a => self.term(a, EXPR, bound)).join(", ") + ")"
      wrap(s, SIMPLE, ctx)
    }
  }
}

///|
/// The elements of `{a, b, ...}`: INSERT a (INSERT b ... EMPTY).
fn set_elements(t : @kernel.Term) -> Array[@kernel.Term]? {
  let items = []
  let mut r = t
  while r is Comb(Comb(Const("INSERT", _), a), rest) {
    items.push(a)
    r = rest
  }
  if r is Const("EMPTY", _) {
    Some(items)
  } else {
    None
  }
}

///|
/// A set comprehension GSPEC (\g. ?xs. SETSPEC g p e): (each x with the
/// body it scopes, p, e).
fn comprehension(
  g : @kernel.Term,
  body : @kernel.Term,
) -> (Array[(@kernel.Term, @kernel.Term)], @kernel.Term, @kernel.Term)? {
  let xs = []
  let mut b = body
  while b is Comb(Const("?", _), Abs(x, inner)) {
    xs.push((x, inner))
    b = inner
  }
  guard b is Comb(Comb(Comb(Const("SETSPEC", _), g2), p), e) && g2 == g else {
    return None
  }
  if xs.iter().any(x => x.0 == g) ||
    @kernel.frees(p).contains(g) ||
    @kernel.frees(e).contains(g) {
    return None
  }
  Some((xs, p, e))
}

///|
/// The variables HOL's `{e | p}` binds: those free in both, or all those of
/// `e` when it has at most one or `p` has none (@parser.pmk_setabs; a
/// variable named like a constant or a numeral reads as that).
fn implicit_binders(
  e : @kernel.Term,
  p : @kernel.Term,
  bound : Bound,
) -> Array[@kernel.Term] {
  // a variable reads as a constant or numeral by the name it is printed
  // under (a binder in scope may be renamed)
  fn printed(v : @kernel.Term) -> String {
    match bound.iter().find_first(b => b.0 == v) {
      Some((_, n)) => n
      None => if v is Var(n, _) { n } else { "" }
    }
  }
  fn vars(t : @kernel.Term) -> Array[@kernel.Term] {
    @kernel.frees(t)
    .to_array()
    .filter(v => {
      let n = printed(v)
      !is_constant_name(n) && !n.to_array().iter().all(c => c is ('0'..='9'))
    })
  }
  let fvs = vars(e)
  let bvs = vars(p)
  if fvs.length() <= 1 || bvs.is_empty() {
    fvs
  } else {
    fvs.filter(v => bvs.contains(v))
  }
}

///|
/// `{e | p}` when HOL's rule binds exactly `xs` (in order), else
/// `{e | x : A, y : B | p}`.
fn Printer::comprehension(
  self : Printer,
  scoped : Array[(@kernel.Term, @kernel.Term)],
  p : @kernel.Term,
  e : @kernel.Term,
  bound : Bound,
) -> String raise Unprintable {
  let xs = scoped.map(x => x.0)
  let mut inner = bound
  let binders = []
  let mut renamed = false
  for x in scoped {
    let (b, next) = self.bind(x.0, x.1, inner)
    if next.head() is Some((_, printed)) && x.0 is Var(n, _) && printed != n {
      renamed = true
    }
    binders.push(b)
    inner = next
  }
  if !renamed && implicit_binders(e, p, inner) == xs {
    // each binder is written with its type where it first occurs in e
    let marks = xs.mapi((i, x) => (x, bound.length() + i + 1))
    let typed_before = self.typed_free.length()
    self.untyped.append(marks)
    let e_s = self.term(e, EXPR, inner)
    let p_s = self.term(p, EXPR, inner)
    let unused = marks.filter(m => self.untyped.contains(m))
    for m in marks {
      match self.untyped.search(m) {
        Some(i) => self.untyped.remove(i) |> ignore
        None => ()
      }
    }
    // a binder that only an inner binding of the same variable shows would
    // read back with no type: write the binders out instead
    if !unused.is_empty() {
      // the free variables that attempt wrote with their type are written
      // with it again
      while self.typed_free.length() > typed_before {
        self.typed_free.pop() |> ignore
      }
      return "{" +
        self.term(e, EXPR, inner) +
        " | " +
        binders.join(", ") +
        " | " +
        self.term(p, EXPR, inner) +
        "}"
    }
    "{" + e_s + " | " + p_s + "}"
  } else {
    "{" +
    self.term(e, EXPR, inner) +
    " | " +
    binders.join(", ") +
    " | " +
    self.term(p, EXPR, inner) +
    "}"
  }
}

///|
/// `t` in the term syntax: `parse_term(print_term(t))` is `t` again, up to
/// the names of bound variables and invented type variables (`same_term`).
pub fn print_term(t : @kernel.Term) -> String raise Unprintable {
  print_term_with(t, sets=true)
}

///|
fn print_term_with(t : @kernel.Term, sets~ : Bool) -> String raise Unprintable {
  let vars = @basics.variables(t).to_array()
  let fixed = vars
    .map(v => @kernel.tyvars(@kernel.type_of(v)))
    .fold(init=@list.List([]), (acc, l) => acc.concat(l))
  fn print(overloads : Bool, all_constants : Bool) -> String raise Unprintable {
    let names = vars.map(v => if v is Var(n, _) { n } else { "" })
    { typed_free: [], fixed, all_constants, overloads, names, sets, untyped: [] }.term(
      t,
      EXPR,
      @list.List([]),
    )
  }
  // The most readable spelling that reads back as `t`: overloaded names
  // where they resolve to the same constants, and types only where the
  // variables' types do not pin a constant's type down (they do only where
  // they are connected to it, so the reading is checked).
  let mut first_error : Unprintable? = None
  let mut printed = false
  for overloads in [true, false] {
    for all_constants in [false, true] {
      let s = print(overloads, all_constants) catch {
        e => {
          if first_error is None {
            first_error = Some(e)
          }
          continue
        }
      }
      printed = true
      if reads_as(s, t) {
        return s
      }
    }
  }
  match first_error {
    Some(e) if !printed => raise e
    _ => raise Unprintable("term whose types the syntax cannot pin down")
  }
}

///|
/// n for an invented type variable `?n`.
fn invented_number(name : String) -> Int64 {
  let mut n = 0L
  for c in name[1:] {
    guard c is ('0'..='9') else { return -1L }
    n = n * 10L + (c.to_int() - '0'.to_int()).to_int64()
  }
  n
}

///|
/// `t` with its invented type variables (`?n`) renamed in the order
/// `type_vars_in_term` lists them (those numbered `from` or more): holes in
/// the text read back as fresh ones.
fn canonical_invented(t : @kernel.Term, from? : Int64 = 0L) -> @kernel.Term {
  let theta = []
  for ty in @kernel.type_vars_in_term(t) {
    if ty is Tyvar(name) &&
      name.has_prefix("?") &&
      invented_number(name) >= from {
      // not of the form ?k, which a type variable kept as it is may have
      theta.push((@kernel.mk_vartype("?\u{0}\{theta.length()}"), ty))
    }
  }
  @kernel.inst(@list.List(theta), t)
}

///|
/// Whether `a` and `b` are the same term up to the names of bound variables
/// and of invented type variables (the round trip of `print_term`).
pub fn same_term(a : @kernel.Term, b : @kernel.Term) -> Bool {
  @basics.aconv(canonical_invented(a), canonical_invented(b))
}

///|
/// The spelling of the quotation `old`, which denotes `t`, in the term
/// syntax: `print_term(t)`, when it reads back as `old` does with nothing
/// renamed, bound variables included (theorems show them), and takes as
/// many GEN%PVAR names (both readings start from the same counter), so
/// that later generated names do not move. Invented type variables may
/// differ in name. tools/migrate.mbtx migrates only such quotations, so the
/// theorems of a migrated package print as before.
pub fn spell_quotation(old : String, t : @kernel.Term) -> String raise Unprintable {
  // set notation, else the sets as written (GSPEC(...)), which an old
  // quotation may spell out
  let mut error = Unprintable("term")
  for sets in [true, false] {
    let s = print_term_with(t, sets~) catch {
      e => {
        error = e
        continue
      }
    }
    check_spelling(old, s) catch {
      e => {
        error = e
        continue
      }
    }
    return s
  }
  raise error
}

///|
/// Check that the term syntax `s` reads now exactly as the quotation `old`
/// does: the same term with nothing renamed, bound variables included, and
/// as many GEN%PVAR names taken (both readings start from the same
/// counter). Only type variables the readings themselves invent may
/// differ in name; one invented before (which the environment may share)
/// must be the same.
pub fn check_spelling(old : String, s : String) -> Unit raise Unprintable {
  let from = @preterm.type_var_counter()
  let (a, na) = @parser.reread_term(old) catch {
    _ => raise Unprintable("quotation that does not read back")
  }
  let (b, nb) = reread(s) catch {
    _ => raise Unprintable("term that does not read back")
  }
  if canonical_invented(b, from~) != canonical_invented(a, from~) {
    raise Unprintable("term whose bound variables the syntax renames")
  }
  if na != nb {
    raise Unprintable(
      "term that takes \{nb} GEN%PVAR names where the quotation takes \{na}",
    )
  }
}

///|
/// `s` read now, without advancing the GEN%PVAR counter, and how many
/// GEN%PVAR names it took.
fn reread(s : String) -> (@kernel.Term, Int) raise {
  @parser.with_pgen_counter_restored(() => {
    let start = @parser.pgen_count()
    let t = elaborate(s)
    (t, @parser.pgen_count() - start)
  })
}

///|
fn reads_as(s : String, t : @kernel.Term) -> Bool {
  try same_term(reread(s).0, t) catch {
    _ => false
  }
}
