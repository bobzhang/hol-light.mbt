// Minisat/dimacs_tools.ml's readDimacs, written by hand (named in
// tools/translator/main.ml's manifest): upstream reads the file through
// OCaml's Stream and Genlex libraries (dropLine, stripPreamble,
// getIntClause, getTerms, readTerms), which this port does not have.

///|
/// `readDimacs filename`: the CNF term of a DIMACS file. The comment and
/// problem lines at its start are dropped; each clause is the numbers up
/// to a `0`; the term is the conjunction of the clauses, the last one
/// first (as upstream accumulates them). `Read_dimacs_error` for a file
/// without clauses, a preamble line that does not end, or anything that
/// is not a number.
pub fn read_dimacs(filename : String) -> @kernel.Term raise {
  let ic = @lib.open_in(filename)
  let chars : Array[Char] = []
  while true {
    let c = @lib.input_char(ic) catch { _ => break }
    chars.push(c)
  }
  @lib.close_in(ic)
  let n = chars.length()
  // stripPreamble: lines starting with `c` or `p`
  let mut i = 0
  while i < n && (chars[i] == 'c' || chars[i] == 'p') {
    while i < n && chars[i] != '\n' {
      i += 1
    }
    if i >= n {
      raise Read_dimacs_error
    }
    i += 1
  }
  if i >= n {
    raise Read_dimacs_error
  }
  // the numbers, clause by clause (each clause's numbers last first)
  let mut term : @kernel.Term? = None
  let mut clause : @list.List[Int64] = @list.empty()
  fn add(ns : @list.List[Int64]) -> Unit raise {
    let c = buildclause(ns)
    term = match term {
      None => Some(c)
      Some(t) => Some(@basics.mk_conj(c, t))
    }
  }

  while i < n {
    let c = chars[i]
    if c == ' ' || c == '\n' || c == '\t' || c == '\r' || c == '\u{0c}' {
      i += 1
      continue
    }
    let neg = c == '-'
    if neg {
      i += 1
    }
    let start = i
    let mut v = 0L
    while i < n && chars[i] >= '0' && chars[i] <= '9' {
      v = v * 10L + (chars[i].to_int() - '0'.to_int()).to_int64()
      i += 1
    }
    if i == start {
      raise Read_dimacs_error
    }
    if neg {
      v = -v
    }
    if v == 0L {
      add(clause)
      clause = @list.empty()
    } else {
      clause = clause.prepend(v)
    }
  }
  if !clause.is_empty() {
    add(clause)
  }
  match term {
    Some(t) => t
    None => raise Read_dimacs_error
  }
}
