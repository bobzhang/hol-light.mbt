// A first proof session: the binary-search midpoint.
//
//   mid = (lo + hi) / 2            -- overflows in 32 bits (the bug that sat in
//                                     java.util.Arrays.binarySearch until 2006)
//   mid = lo + (hi - lo) / 2       -- the fix
//
// Run:  moon run quickstart --target wasm-gc -j 4

///|
/// Print a theorem. A `@kernel.Thm` can only be made by the kernel's
/// inference rules, so whatever prints here has been proved.
fn show(name : String, th : @kernel.Thm) -> Unit raise {
  println(name + "\n  " + @printer.string_of_thm(th) + "\n")
}

///|
/// Print what is left to prove in the interactive proof.
fn goals() -> Unit raise {
  @tactics.print_goalstack(@tactics.p())
  @pp.std_formatter.print_flush()
  @pp.flush_stdout_partial()
}

///|
/// Run `f` without its progress reports (the theory files print thousands
/// of lines about their own proof searches while they load).
fn quietly(f : () -> Unit) -> Unit {
  let sink = @pp.stdout_sink.val
  @pp.stdout_sink.val = _ => ()
  f()
  @pp.flush_stdout_backlog()
  @pp.stdout_sink.val = sink
}

///|
/// The fixed midpoint, on 32-bit machine words.
const MID : String = "word_add lo (word_ushr (word_sub hi lo) 1)"

///|
fn run() -> Unit raise {
  // Terms are written in HOL Light's syntax and parsed from strings:
  //   !x. P   for all x, P        /\   and        ==>   implies
  let tm = @parser.parse_term

  println("=== 1. On natural numbers: one call to a decision procedure ===\n")
  // ARITH_RULE decides linear arithmetic over the naturals by itself.
  show(
    "MID_IN_RANGE",
    @int.arith_rule(
      tm(
        "lo <= hi ==> lo <= lo + (hi - lo) DIV 2 /\\ lo + (hi - lo) DIV 2 <= hi",
      ),
    ),
  )

  println("=== 2. The same kind of proof, one step at a time ===\n")
  // g sets a goal; e applies a tactic, which turns the goal into simpler ones.
  ignore(
    @tactics.g(
      tm("!lo hi. lo <= hi ==> lo + (hi - lo) DIV 2 = (lo + hi) DIV 2"),
    ),
  )
  goals()
  println("-- GEN_TAC, twice: \"take any lo and hi\"")
  ignore(@tactics.e(@tactics.repeat_tac(@tactics.gen_tac)))
  goals()
  println("-- DISCH_TAC: \"assume lo <= hi\"")
  ignore(@tactics.e(@tactics.disch_tac))
  goals()
  println("-- ASM_ARITH_TAC: arithmetic, using the assumption")
  ignore(@tactics.e(@int.asm_arith_tac))
  goals()
  show("\nMID_SAME", @tactics.top_thm())

  println("=== 3. On 32-bit machine words: where the bug is ===\n")
  quietly(@words.load) // Library/words.ml: the theory of machine words
  // Evaluation is proof too: the result is a theorem, not a printout.
  show(
    "BUGGY_MID_EXAMPLE   (lo = 0x80000000, hi = 0x80000002)",
    @words.word_reduce_conv(
      tm("word_ushr (word_add (word 0x80000000) (word 0x80000002):int32) 1"),
    ),
  )
  // The claim that the buggy midpoint stays in range cannot be proved.
  let buggy = tm(
    "!lo hi:int32. word_ule lo hi ==> word_ule lo (word_ushr (word_add lo hi) 1)",
  )
  try @words.bitblast_rule(buggy) catch {
    e => println("BUGGY_MID_IN_RANGE\n  no proof: " + e.to_string() + "\n")
  } noraise {
    th => show("BUGGY_MID_IN_RANGE", th)
  }
  // The fix, for all 2^64 pairs (lo, hi): BITBLAST_RULE turns the statement
  // into a formula over the 64 bits and checks it with BDDs.
  show(
    "FIXED_MID_IN_RANGE",
    @words.bitblast_rule(
      tm(
        "!lo hi:int32. word_ule lo hi ==> word_ule lo (\{MID}) /\\ word_ule (\{MID}) hi",
      ),
    ),
  )
  // And it is the true average: the one computed in 64 bits, where the
  // sum cannot overflow (word_zx widens a word with zeros).
  show(
    "FIXED_MID_IS_AVERAGE",
    @words.bitblast_rule(
      tm(
        "!lo hi:int32. word_ule lo hi ==> (word_zx (\{MID}):int64) = word_ushr (word_add (word_zx lo) (word_zx hi)) 1",
      ),
    ),
  )
}

///|
fn main {
  quietly(() => ()) // drop what the core theories reported while loading
  @lib.verbose.val = false
  @lib.report_timing.val = false
  run() catch {
    e => println("failed: " + e.to_string())
  }
}
