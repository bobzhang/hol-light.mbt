// A first proof session: the binary-search midpoint, on natural numbers.
//
//   mid = (lo + hi) / 2            -- overflows in 32 bits (the bug that sat in
//                                     java.util.Arrays.binarySearch until 2006)
//   mid = lo + (hi - lo) / 2       -- the fix
//
// Each `inspect` holds what the prover printed at that point. To explore,
// change a statement or a tactic, empty the `content=` that follows, and
// run `moon test quickstart --target wasm-gc -u`: the new state is written
// back here. quickstart/overflow has the second half, on machine words.

///|
/// Terms are written in HOL Light's syntax and parsed from strings:
///   !x. P   for all x, P        /\   and        ==>   implies
fn tm(s : String) -> @kernel.Term raise {
  @parser.parse_term(s)
}

///|
/// What is left to prove in the interactive proof.
fn goals() -> String raise {
  let print = @printer.print_to_string(fmt => {
    gs => @tactics.pp_print_goalstack(fmt, gs)
  })
  print(@tactics.p()).trim().to_owned()
}

///|
/// Start the interactive proof of `s` (HOL Light's `g`).
fn goal(s : String) -> String raise {
  ignore(@tactics.g(tm(s)))
  goals()
}

///|
/// Apply a tactic to the current goal (HOL Light's `e`): it replaces the
/// goal by simpler ones, or by none.
fn apply(tac : @tactics.Tactic) -> String raise {
  ignore(@tactics.e(tac))
  goals()
}

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
test "a statement is a term: a tree of constants, variables and applications" {
  let stmt =
    #|p /\ q
  debug_inspect(
    tm(stmt),
    content=(
      #|Comb(
      #|  Comb(
      #|    Const(
      #|      "/\\",
      #|      Tyapp(
      #|        "fun",
      #|        <List:
      #|          [
      #|            Tyapp("bool", <List: []>),
      #|            Tyapp(
      #|              "fun",
      #|              <List: [Tyapp("bool", <List: []>), Tyapp("bool", <List: []>)]>,
      #|            ),
      #|          ]>,
      #|      ),
      #|    ),
      #|    Var("p", Tyapp("bool", <List: []>)),
      #|  ),
      #|  Var("q", Tyapp("bool", <List: []>)),
      #|)
    ),
  )
}

///|
test "one call to a decision procedure" {
  // ARITH_RULE decides linear arithmetic over the naturals by itself. Its
  // result is a `@kernel.Thm`: only the kernel's inference rules make one,
  // so what prints after `|-` has been proved.
  let stmt =
    #|lo <= hi ==> lo <= lo + (hi - lo) DIV 2 /\ lo + (hi - lo) DIV 2 <= hi
  let th = @int.arith_rule(tm(stmt))
  inspect(
    @printer.string_of_thm(th),
    content=(
      #||- lo <= hi ==> lo <= lo + (hi - lo) DIV 2 /\ lo + (hi - lo) DIV 2 <= hi
    ),
  )
}

///|
test "the same kind of proof, one tactic at a time" {
  inspect(
    goal("!lo hi. lo <= hi ==> lo + (hi - lo) DIV 2 = (lo + hi) DIV 2"),
    content=(
      #|1 subgoal (1 total)
      #|
      #|`forall lo hi. lo <= hi ==> lo + (hi - lo) DIV 2 = (lo + hi) DIV 2`
    ),
  )
  // "take any lo and hi"
  inspect(
    apply(@tactics.repeat_tac(@tactics.gen_tac)),
    content=(
      #|1 subgoal (1 total)
      #|
      #|`lo <= hi ==> lo + (hi - lo) DIV 2 = (lo + hi) DIV 2`
    ),
  )
  // "assume lo <= hi": the hypothesis moves above the goal
  inspect(
    apply(@tactics.disch_tac),
    content=(
      #|1 subgoal (1 total)
      #|
      #|  0 [`lo <= hi`]
      #|
      #|`lo + (hi - lo) DIV 2 = (lo + hi) DIV 2`
    ),
  )
  // arithmetic, using the assumption
  inspect(
    apply(@int.asm_arith_tac),
    content=(
      #|No subgoals
    ),
  )
  // nothing is left, so the kernel has the theorem
  inspect(
    @printer.string_of_thm(@tactics.top_thm()),
    content=(
      #||- forall lo hi. lo <= hi ==> lo + (hi - lo) DIV 2 = (lo + hi) DIV 2
    ),
  )
}

///|
test "a false statement has no proof" {
  // without lo <= hi the subtraction is cut off at 0: lo = 1, hi = 0
  let stmt = "lo + (hi - lo) DIV 2 = (lo + hi) DIV 2"
  assert_false(proves(@int.arith_rule, tm(stmt)))
}
