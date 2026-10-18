///|
fn check_bitmatch_terms() -> Unit raise {
  let tm = @parser.parse_term
  for word in ["BITPAT", "bitmatch"] {
    assert_false(@printer.is_reserved_word(word))
    assert_eq(tm(word + ":bool"), @kernel.mk_var(word, @kernel.bool_ty))
  }
  assert_eq(@bitmatch.mk_bitpat([]), tm("NILPAT"))
  let fields = [tm("T"), tm("F"), tm("T")]
  let pattern = @bitmatch.mk_bitpat(fields[0:2])
  assert_eq(pattern, tm("CONSPAT (CONSPAT NILPAT (word1 T)) (word1 F)"))
  assert_eq(tm(@printer.string_of_term(pattern)), pattern)
  let a = tm("a:bool")
  let clauses = [(@bitmatch.mk_bitpat([a]), a)]
  let built = @bitmatch.mk_bitmatch(tm("word1 T"), clauses)
  let ordinary = tm(
    "_BITMATCH (word1 T) (_SEQPATTERN (\\i r. ?a:bool. _UNGUARDED_PATTERN (pat_set (CONSPAT NILPAT (word1 a)) i) (a = r)) (_ELSEPATTERN (ARB:bool)))",
  )
  assert_true(@basics.aconv(built, ordinary))
  assert_true(@basics.aconv(tm(@printer.string_of_term(built)), built))
  assert_true(@kernel.frees(built).is_empty())
  // The existing evaluator accepts literal word numerals.
  let numeral_match = @bitmatch.mk_bitmatch(tm("word 1:1 word"), clauses)
  let proof = @bitmatch.bitmatch_conv(numeral_match)
  assert_true(@basics.aconv(@equal.lhs(@kernel.concl(proof)), numeral_match))
  assert_eq(@equal.rhs(@kernel.concl(proof)), tm("T"))
  assert_true(@kernel.hyp(proof).is_empty())
  // Overlapping clauses preserve first-match precedence; slices select clauses.
  let zero = @bitmatch.mk_bitpat([tm("F")])
  let alternatives = [(zero, tm("F")), (zero, tm("T")), (zero, tm("F"))]
  let ordered = @bitmatch.mk_bitmatch(tm("word 0:1 word"), alternatives[1:])
  let ordered_proof = @bitmatch.bitmatch_seq_conv(ordered)
  assert_eq(@equal.rhs(@kernel.concl(ordered_proof)), tm("T"))
  let unmatched = @bitmatch.mk_bitmatch(
    tm("word 1:1 word"),
    [(zero, tm("T"))],
    default=tm("F"),
  )
  let default_proof = @bitmatch.bitmatch_seq_conv(unmatched)
  assert_eq(@equal.rhs(@kernel.concl(default_proof)), tm("F"))
  // An explicit default also permits an empty match.
  let empty = @bitmatch.mk_bitmatch(tm("word 0:2 word"), [], default=tm("F"))
  assert_eq(empty, tm("_BITMATCH (word 0:2 word) (_ELSEPATTERN F)"))
  // Names resembling the builder's internal binders remain free in results.
  let result = tm("(bm_input:num) = 0 /\\ bm_result")
  let capture = @bitmatch.mk_bitmatch(
    tm("word 0:2 word"),
    [(@bitmatch.mk_bitpat([tm("word 0:2 word")]), result)],
    default=tm("F"),
  )
  assert_eq(@kernel.frees(capture).length(), 2)
  assert_true(@kernel.frees(capture).contains(tm("bm_input:num")))
  assert_true(@kernel.frees(capture).contains(tm("bm_result:bool")))
  try @bitmatch.mk_bitpat([tm("0")]) catch {
    _ => ()
  } noraise {
    _ => fail("expected non-word field rejection")
  }
  try @bitmatch.mk_bitmatch(tm("T"), clauses) catch {
    _ => ()
  } noraise {
    _ => fail("expected non-word scrutinee rejection")
  }
  try @bitmatch.mk_bitmatch(tm("word 0:2 word"), []) catch {
    _ => ()
  } noraise {
    _ => fail("expected empty match rejection")
  }
  try
    @bitmatch.mk_bitmatch(tm("word 0:2 word"), clauses, default=tm("0"))
  catch {
    _ => ()
  } noraise {
    _ => fail("expected default type rejection")
  }
}
