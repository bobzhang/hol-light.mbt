// Token identities are independent of the dynamically registered syntax roles.

///|
/// Built-in symbolic spellings. A symbol can still be used as an ordinary
/// identifier when it has no registered binder, prefix or infix role.
pub(all) enum Symbol {
  Forall
  Exists
  ExistsUnique
  Choice
  Lambda
  And
  Or
  Not
  Implies
  Iff
  Equal
  Less
  LessEqual
  Greater
  GreaterEqual
} derive(Eq, Debug)

///|
pub extend Symbol with Eq::{equal, not_equal}

///|
pub extend Symbol with @debug.Debug::{to_repr}

///|
/// The HOL name used by syntax tables, interfaces and kernel terms.
pub fn Symbol::name(self : Symbol) -> String {
  match self {
    Forall => "!"
    Exists => "?"
    ExistsUnique => "?!"
    Choice => "@"
    Lambda => "\\"
    And => "/\\"
    Or => "\\/"
    Not => "~"
    Implies => "==>"
    Iff => "<=>"
    Equal => "="
    Less => "<"
    LessEqual => "<="
    Greater => ">"
    GreaterEqual => ">="
  }
}

///|
pub(all) enum Lexcode {
  Ident(String)
  Symbol(Symbol)
  Resword(String)
} derive(Eq, Debug)

///|
pub extend Lexcode with Eq::{equal, not_equal}

///|
pub extend Lexcode with @debug.Debug::{to_repr}

///|
/// Construct an unreserved identifier, recognizing complete built-in spellings.
/// Use this when constructing tokens for a parser; `Ident` is for other names.
/// Reservation is a separate lexer step, governed by the current syntax table.
pub fn Lexcode::ident(name : String) -> Lexcode {
  match name {
    "!" => Symbol(Forall)
    "?" => Symbol(Exists)
    "?!" => Symbol(ExistsUnique)
    "@" => Symbol(Choice)
    "\\" => Symbol(Lambda)
    "/\\" => Symbol(And)
    "\\/" => Symbol(Or)
    "~" => Symbol(Not)
    "==>" => Symbol(Implies)
    "<=>" => Symbol(Iff)
    "=" => Symbol(Equal)
    "<" => Symbol(Less)
    "<=" => Symbol(LessEqual)
    ">" => Symbol(Greater)
    ">=" => Symbol(GreaterEqual)
    _ => Ident(name)
  }
}

///|
/// The name of an unreserved identifier (including a built-in symbol).
/// Extension parsers that accept arbitrary identifiers should use this view.
pub fn Lexcode::identifier(self : Lexcode) -> String? {
  match self {
    Ident(name) => Some(name)
    Symbol(symbol) => Some(symbol.name())
    Resword(_) => None
  }
}

///|
/// Token text for syntax-table lookups and source reconstruction. String
/// literals retain the lexer's byte-string representation, including quotes.
pub fn Lexcode::text(self : Lexcode) -> String {
  match self {
    Ident(name) | Resword(name) => name
    Symbol(symbol) => symbol.name()
  }
}
