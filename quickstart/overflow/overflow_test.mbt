// The binary-search midpoint on 32-bit machine words, where the bug is
// (quickstart/quickstart_test.mbt has the first half, on natural numbers).
//
// Run: moon test quickstart/overflow --target wasm-gc -j 4
// (30 s, most of it loading Library/words.ml, the theory of machine words)

///|
fn tm(s : String) -> @kernel.Term raise {
  @words.load()
  @lib.verbose.val = false // no progress reports from the proof search
  @lib.report_timing.val = false
  @parser.parse_term(s)
}

///|
/// The fixed midpoint: wrapping add and subtract, unsigned shift right.
const MID : String = "word_add lo (word_ushr (word_sub hi lo) 1)"

///|
/// Whether `rule` proves `t`.
fn proves(rule : (@kernel.Term) -> @kernel.Thm raise, t : @kernel.Term) -> Bool {
  try rule(t) catch {
    _ => false
  } noraise {
    _ => true
  }
}

///|
test "the bug at one input: evaluation is proof too" {
  // lo = 0x80000000, hi = 0x80000002; the answer is a theorem
  let expr = "word_ushr (word_add (word 0x80000000) (word 0x80000002):int32) 1"
  let th = @words.word_reduce_conv(tm(expr))
  inspect(
    @printer.string_of_thm(th),
    content=(
      #||- word_ushr (word_add (word 2147483648) (word 2147483650)) 1 = word 1
    ),
  )
}

///|
test "the buggy midpoint in range: no proof" {
  let stmt =
    #|!lo hi:int32.
    #|  word_ule lo hi ==> word_ule lo (word_ushr (word_add lo hi) 1)
  // A failure is not a disproof: the theorem above is what refutes this.
  assert_false(proves(@words.bitblast_rule, tm(stmt)))
}

///|
test "the fixed midpoint is in range, for all 2^64 pairs" {
  // BITBLAST_RULE turns the statement into a formula over the 64 bits and
  // checks it with BDDs (word_ule is unsigned <=).
  let stmt =
    #|!lo hi:int32.
    #|  word_ule lo hi ==>
    $|    word_ule lo (\{MID})
    #|    /\
    $|    word_ule (\{MID}) hi
  let th = @words.bitblast_rule(tm(stmt))
  inspect(
    @printer.string_of_thm(th),
    content=(
      #||- forall lo hi.
      #|       word_ule lo hi
      #|       ==> word_ule lo (word_add lo (word_ushr (word_sub hi lo) 1)) /\
      #|           word_ule (word_add lo (word_ushr (word_sub hi lo) 1)) hi
    ),
  )
}

///|
test "the fixed midpoint is the average" {
  // the one computed in 64 bits, where the sum cannot overflow (word_zx
  // widens a word with zeros)
  let stmt =
    $|!lo hi:int32.
    $|  word_ule lo hi ==>
    $|    (word_zx (\{MID}):int64)
    $|    = word_ushr (word_add (word_zx lo) (word_zx hi)) 1
  let th = @words.bitblast_rule(tm(stmt))
  inspect(
    @printer.string_of_thm(th),
    content=(
      #||- forall lo hi.
      #|       word_ule lo hi
      #|       ==> word_zx (word_add lo (word_ushr (word_sub hi lo) 1)) =
      #|           word_ushr (word_add (word_zx lo) (word_zx hi)) 1
    ),
  )
}
