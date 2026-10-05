// The part of OCaml's Str library that upstream's files use (Minisat/): a
// regular expression is a literal string or one bracketed set of
// characters. Anything else is refused when the expression is made.

///|
/// `Str.regexp`
pub enum StrRegexp {
  Literal(String)
  Set(String)
}

///|
/// `Str.regexp_string s`: matches `s` and nothing else.
pub fn str_regexp_string(s : String) -> StrRegexp {
  Literal(s)
}

///|
/// `Str.regexp s`, for `[...]` (a set of characters, without ranges or
/// negation) and for strings without special characters.
pub fn str_regexp(s : String) -> StrRegexp raise {
  let special = "$^.*+?[]\\"
  let n = s.length()
  if n >= 2 &&
    s[0].to_int() == '['.to_int() &&
    s[n - 1].to_int() == ']'.to_int() {
    let set = s.view(start_offset=1, end_offset=n - 1).to_string()
    if set.contains("-") || set.has_prefix("^") || set.contains("]") {
      raise Failure("Str.regexp: not supported: " + s)
    }
    return Set(set)
  }
  for c in s {
    if special.contains_char(c) {
      raise Failure("Str.regexp: not supported: " + s)
    }
  }
  Literal(s)
}

///|
/// The end of a match of `re` at `pos`, if there is one.
fn str_match_at(re : StrRegexp, s : String, pos : Int) -> Int? {
  match re {
    Literal(l) => {
      if pos + l.length() > s.length() {
        return None
      }
      for i in 0..<l.length() {
        if s[pos + i] != l[i] {
          return None
        }
      }
      Some(pos + l.length())
    }
    Set(set) =>
      if pos < s.length() && set.contains_char(s[pos].to_int().unsafe_to_char()) {
        Some(pos + 1)
      } else {
        None
      }
  }
}

///|
/// `Str.search_forward re s start`: the first position from `start` on
/// where `re` matches; `Not_found` without one.
pub fn str_search_forward(
  re : StrRegexp,
  s : String,
  start : Int64,
) -> Int64 raise {
  for pos in start.to_int()..<=s.length() {
    if str_match_at(re, s, pos) is Some(_) {
      return pos.to_int64()
    }
  }
  raise NotFound
}

///|
/// `Str.search_backward re s last`: the last position up to `last` where
/// `re` matches; `Not_found` without one.
pub fn str_search_backward(
  re : StrRegexp,
  s : String,
  last : Int64,
) -> Int64 raise {
  let mut pos = @cmp.minimum(last.to_int(), s.length())
  while pos >= 0 {
    if str_match_at(re, s, pos) is Some(_) {
      return pos.to_int64()
    }
    pos -= 1
  }
  raise NotFound
}

///|
/// `Str.string_before s n`
pub fn str_string_before(s : String, n : Int64) -> String {
  s.view(end_offset=n.to_int()).to_string()
}

///|
/// `Str.string_after s n`
pub fn str_string_after(s : String, n : Int64) -> String {
  s.view(start_offset=n.to_int()).to_string()
}

///|
/// `Str.split re s`: the pieces of `s` between matches of `re`. One match at
/// the very beginning is skipped and nothing follows a match at the end;
/// two matches in a row have an empty piece between them (as Str's).
pub fn str_split(re : StrRegexp, s : String) -> @list.List[String] {
  let parts : Array[String] = []
  let n = s.length()
  let mut start = match str_match_at(re, s, 0) {
    Some(e) => e
    None => 0
  }
  while start < n {
    let mut pos = start
    let mut found : (Int, Int)? = None
    while pos <= n {
      match str_match_at(re, s, pos) {
        // an empty match where the search starts does not count
        Some(e) if e > pos || pos > start => {
          found = Some((pos, e))
          break
        }
        _ => pos += 1
      }
    }
    match found {
      Some((p, e)) => {
        parts.push(s.view(start_offset=start, end_offset=p).to_string())
        start = e
      }
      None => {
        parts.push(s.view(start_offset=start).to_string())
        break
      }
    }
  }
  @list.from_array(parts)
}
