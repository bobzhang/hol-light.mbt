// ===========================================================================
// Lexical analyzer (parser.ml's `lex`). Apart from some special bracket
// symbols, each identifier is the longest string of alphanumerics or the
// longest string of symbolics.
//
// Implemented as a loop over the input bytes (upstream's combinators
// recurse once per token), with the same tokens and errors.
// ===========================================================================

///|
pub(all) enum Lexcode {
  Ident(String)
  Resword(String)
} derive(Eq, Debug)

///|
pub extend Lexcode with Eq::{equal, not_equal}

///|
pub extend Lexcode with @debug.Debug::{to_repr}

///|
/// The token that starts a comment running to the end of the line.
pub let comment_token : Ref[Lexcode] = Ref::{ val: Resword("//"), }

///|
fn char_str(c : Char) -> String {
  c.to_string()
}

///|
fn is_class(f : (String) -> Bool, c : Char) -> Bool {
  f(char_str(c))
}

///|
/// The longest run starting at `i` of characters satisfying `f` (at least
/// one), as an end index; `None` if `chars[i]` does not satisfy `f`.
fn run_of(chars : Array[Char], i : Int, f : (Char) -> Bool) -> Int? {
  if i >= chars.length() || !f(chars[i]) {
    return None
  }
  let mut j = i + 1
  while j < chars.length() && f(chars[j]) {
    j += 1
  }
  Some(j)
}

///|
fn simple_ident(chars : Array[Char], i : Int) -> Int? {
  match run_of(chars, i, c => is_class(@printer.isalnum, c)) {
    Some(j) => Some(j)
    None => run_of(chars, i, c => is_class(@printer.issymb, c))
  }
}

///|
/// `undertail`: underscores, possibly followed by a simple identifier.
fn undertail(chars : Array[Char], i : Int) -> Int? {
  match run_of(chars, i, c => c == '_') {
    None => None
    Some(j) =>
      match simple_ident(chars, j) {
        Some(k) => Some(k)
        None => Some(j)
      }
  }
}

///|
fn ident(chars : Array[Char], i : Int) -> Int? {
  let first = match undertail(chars, i) {
    Some(j) => Some(j)
    None => simple_ident(chars, i)
  }
  match first {
    None => None
    Some(j) => {
      let mut j = j
      while undertail(chars, j) is Some(k) {
        j = k
      }
      Some(j)
    }
  }
}

///|
fn hex_digit(c : Char) -> Int? {
  match c {
    '0'..='9' => Some(c.to_int() - '0'.to_int())
    'a'..='f' => Some(c.to_int() - 'a'.to_int() + 10)
    'A'..='F' => Some(c.to_int() - 'A'.to_int() + 10)
    _ => None
  }
}

///|
/// OCaml's `int_of_string ("0x" ^ h ^ l)`: the first character must be a
/// hex digit, the second a hex digit or an underscore.
fn hex_value(h : Char, l : Char) -> Int raise {
  match (hex_digit(h), hex_digit(l)) {
    (Some(a), Some(b)) => a * 16 + b
    (Some(a), None) if l == '_' => a
    _ => raise Failure("int_of_string")
  }
}

///|
/// A string literal starting at the opening quote `chars[i]`: the token
/// text (with quotes) and the end index, or `None` if unterminated.
fn string_literal(chars : Array[Char], i : Int) -> (String, Int)? raise {
  let buf = StringBuilder()
  let n = chars.length()
  let mut j = i + 1
  while j < n {
    let c = chars[j]
    if c == '"' {
      return Some(("\"" + buf.to_string() + "\"", j + 1))
    } else if c == '\\' {
      let rest = chars[j + 1:]
      let (s, used) = match rest {
        ['\\', ..] => ("\\", 1)
        ['"', ..] => ("\"", 1)
        ['\'', ..] => ("'", 1)
        ['n', ..] => ("\n", 1)
        ['r', ..] => ("\r", 1)
        ['t', ..] => ("\t", 1)
        ['b', ..] => ("\u{8}", 1)
        [' ', ..] => (" ", 1)
        ['x', h, l, ..] => (byte_char(hex_value(h, l)), 3)
        [d1, d2, d3, ..] if is_class(@printer.isnum, d1) &&
          is_class(@printer.isnum, d2) &&
          is_class(@printer.isnum, d3) => {
          let v = @string.parse_int(char_str(d1) + char_str(d2) + char_str(d3))
          if v > 255 {
            raise @num.InvalidArgument("Char.chr")
          }
          (byte_char(v), 3)
        }
        _ => raise Failure("lex:unrecognized OCaml-style escape in string")
      }
      buf.write_string(s)
      j += 1 + used
    } else {
      buf.write_char(c)
      j += 1
    }
  }
  None
}

///|
/// A byte as a character of the lexer's byte string.
fn byte_char(v : Int) -> String {
  v.unsafe_to_char().to_string()
}

///|
/// A raw token at `i`: string literal, bracket, separator run or
/// identifier.
fn raw_token(chars : Array[Char], i : Int) -> (Lexcode, Int)? raise {
  if i >= chars.length() {
    return None
  }
  if chars[i] == '"' {
    match string_literal(chars, i) {
      Some((s, j)) => return Some((Ident(s), j))
      None => ()
    }
  }
  if @printer.unicode_symbols.val {
    match unicode_symbol(chars, i) {
      Some(r) => return Some(r)
      None => ()
    }
  }
  if is_class(@printer.isbra, chars[i]) {
    return Some((Ident(char_str(chars[i])), i + 1))
  }
  match run_of(chars, i, c => is_class(@printer.issep, c)) {
    Some(j) => return Some((Ident(String::from_array(chars[i:j])), j))
    None => ()
  }
  match ident(chars, i) {
    Some(j) => Some((Ident(String::from_array(chars[i:j])), j))
    None => None
  }
}

///|
/// Not in upstream (`@printer.unicode_symbols`): the non-ASCII character
/// whose UTF-8 encoding starts at `chars[i]`, as a token by itself, and the
/// end index. `λ` is the `\` of an abstraction.
fn unicode_symbol(chars : Array[Char], i : Int) -> (Lexcode, Int)? {
  let b0 = chars[i].to_int()
  let (n, lead) = if b0 >= 0xF0 {
    (4, b0 & 0x07)
  } else if b0 >= 0xE0 {
    (3, b0 & 0x0F)
  } else if b0 >= 0xC0 {
    (2, b0 & 0x1F)
  } else {
    return None
  }
  if i + n > chars.length() {
    return None
  }
  let mut cp = lead
  for k in 1..<n {
    let b = chars[i + k].to_int()
    if (b & 0xC0) != 0x80 {
      return None
    }
    cp = (cp << 6) | (b & 0x3F)
  }
  let c = cp.unsafe_to_char()
  Some((Ident(if c == 'λ' { "\\" } else { c.to_string() }), i + n))
}

///|
fn reserve(tok : Lexcode) -> Lexcode {
  match tok {
    Ident(n) if @printer.is_reserved_word(n) => Resword(n)
    t => t
  }
}

///|
fn skip_spaces(chars : Array[Char], i : Int) -> Int {
  let mut j = i
  while j < chars.length() && is_class(@printer.isspace, chars[j]) {
    j += 1
  }
  j
}

///|
/// Split a string into HOL tokens. As upstream, the input is processed as
/// bytes (its UTF-8 encoding), one character per byte, so string literals
/// carry exactly OCaml's bytes; non-ASCII bytes never form identifiers.
pub fn lex(s : String) -> List[Lexcode] raise {
  let chars : Array[Char] = [
    for b in @utf8.encode(s) => b.to_int().unsafe_to_char()
  ]
  let toks = []
  let mut i = 0
  while true {
    let j = skip_spaces(chars, i)
    let (tok, k) = match raw_token(chars, j) {
      Some((tok, k)) => (reserve(tok), k)
      None => break
    }
    if tok == comment_token.val {
      let mut m = k
      while m < chars.length() && chars[m] != '\n' {
        m += 1
      }
      i = m
    } else {
      toks.push(tok)
      i = k
    }
  }
  if skip_spaces(chars, i) < chars.length() {
    raise Failure("Unparsed input")
  }
  @list.List(toks)
}

///|
/// parser.ml's `lex` on a character list (`lex (explode s)`), as
/// translated code calls it.
pub fn lex_list(cs : List[String]) -> List[Lexcode] raise {
  let sb = StringBuilder()
  for c in cs {
    sb.write_string(c)
  }
  lex(sb.to_string())
}
