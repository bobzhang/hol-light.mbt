///|
/// Build a bit pattern from Boolean or word-valued HOL terms, after `load()`.
/// Boolean fields are wrapped in `word1`; word fields keep their declared width.
/// Fields are ordered as in `CONSPAT (CONSPAT NILPAT first) second`.
pub fn mk_bitpat(fields : ArrayView[@kernel.Term]) -> @kernel.Term raise {
  let mut pattern = @kernel.mk_const("NILPAT", @list.List([]))
  for field in fields {
    let word = if @kernel.type_of(field) == @kernel.bool_ty {
      @basics.list_mk_icomb("word1", @list.List([field]))
    } else {
      field
    }
    pattern = @basics.list_mk_icomb("CONSPAT", @list.List([pattern, word]))
  }
  pattern
}

///|
/// Build a match from `(bit_pattern, result)` clauses, after `load()`.
/// Every free variable of a pattern is bound in that clause's pattern and result.
/// Other result variables remain free. Clauses are tried in order; `default`
/// is the wildcard result, or `ARB` when omitted. All results must have one type.
/// An empty clause array requires an explicit default. All construction goes
/// through checked kernel constructors; no parser or syntax registration is used.
pub fn mk_bitmatch(
  scrutinee : @kernel.Term,
  clauses : ArrayView[(@kernel.Term, @kernel.Term)],
  default? : @kernel.Term,
) -> @kernel.Term raise {
  let result_type = match (clauses, default) {
    ([(_, result), ..], _) => @kernel.type_of(result)
    ([], Some(result)) => @kernel.type_of(result)
    ([], None) => raise Failure("mk_bitmatch: empty match needs a default")
  }
  let fallback = match default {
    Some(result) => {
      guard @kernel.type_of(result) == result_type else {
        raise Failure("mk_bitmatch: default type differs from clause results")
      }
      result
    }
    None => @basics.mk_mconst("ARB", result_type)
  }
  let mut avoid = @kernel.frees(scrutinee).concat(@kernel.frees(fallback))
  for (pattern, result) in clauses {
    avoid = avoid.concat(@kernel.frees(pattern)).concat(@kernel.frees(result))
  }
  let num_type = @kernel.mk_type("num", @list.List([]))
  let input = @kernel.variant(avoid, @kernel.mk_var("bm_input", num_type))
  let output = @kernel.variant(
    avoid.prepend(input),
    @kernel.mk_var("bm_result", result_type),
  )
  let relation_type = @basics.mk_fun_ty(
    num_type,
    @basics.mk_fun_ty(result_type, @kernel.bool_ty),
  )
  let otherwise = @basics.mk_mconst(
    "_ELSEPATTERN",
    @basics.mk_fun_ty(result_type, relation_type),
  )
  let mut rest = @kernel.mk_comb(otherwise, fallback)
  for i = clauses.length() - 1; i >= 0; i = i - 1 {
    let (pattern, result) = clauses[i]
    let matches = @basics.list_mk_icomb("pat_set", @list.List([pattern, input]))
    let returns = @basics.mk_eq(result, output)
    let body = @basics.list_mk_icomb(
      "_UNGUARDED_PATTERN",
      @list.List([matches, returns]),
    )
    let body = @bool.list_mk_exists(@kernel.frees(pattern), body)
    let clause = @kernel.mk_abs(input, @kernel.mk_abs(output, body))
    rest = @basics.list_mk_icomb("_SEQPATTERN", @list.List([clause, rest]))
  }
  @basics.list_mk_icomb("_BITMATCH", @list.List([scrutinee, rest]))
}

///|
// Closed two-bit numeral used by the load-time disjointness examples.
fn example_word2(value : Int64) -> @kernel.Term raise {
  let width = @words.mk_word_ty(@num.num_of_int64(2L))
  let numeral = @nums.mk_small_numeral(value)
  let word = @basics.mk_mconst(
    "word",
    @basics.mk_fun_ty(@kernel.type_of(numeral), width),
  )
  @kernel.mk_comb(word, numeral)
}

///|
fn disjointness_example(
  patterns : ArrayView[@kernel.Term],
) -> @kernel.Term raise {
  let scrutinee = @kernel.mk_var("x", @words.mk_word_ty(@num.num_of_int64(2L)))
  let result = @kernel.mk_const("T", @list.List([]))
  mk_bitmatch(scrutinee, patterns.map(pattern => (pattern, result)))
}
