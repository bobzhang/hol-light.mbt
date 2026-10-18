///|
/// Derive a proposition from explicitly supplied facts using HOL_BY
/// (examples/holby). Facts are ordinary theorem values: name them with
/// MoonBit bindings and select them with an array literal or slice.
///
/// Optionally apply a tactic such as induction first, then automatically close
/// every remaining subgoal using the facts and that subgoal's assumptions.
/// The result can depend only on hypotheses already present in the supplied
/// facts. Discharge those hypotheses with `@bool.disch` to obtain an implication.
/// Loads HOL_BY once on first use.
pub fn by(
  goal : @kernel.Term,
  facts : ArrayView[@kernel.Thm],
  first? : @tactics.Tactic,
) -> @kernel.Thm raise {
  @holby.load()
  let selected = @list.List(facts)
  let result = match first {
    None => @holby.hol_by(selected)(goal)
    Some(tactic) => {
      let finish : @tactics.Tactic = g => {
        let available = selected.concat(g.0.map(fact => fact.1))
        let theorem = @holby.hol_by(available)(g.1)
        @tactics.accept_tac(theorem)(g)
      }
      @tactics.tac_proof(
        (@list.List([]), goal),
        @tactics.then_tac(tactic, finish),
      )
    }
  }
  for hypothesis in @kernel.hyp(result) {
    guard selected.any(fact => {
      @kernel.hyp(fact).any(allowed => @basics.aconv(hypothesis, allowed))
    }) else {
      raise Failure("proof.by: unexpected hypothesis in result")
    }
  }
  let conclusion = @kernel.concl(result)
  guard @basics.aconv(conclusion, goal) else {
    raise Failure("proof.by: justification proved a different proposition")
  }
  if conclusion == goal {
    result
  } else {
    @kernel.eq_mp(@equal.alpha_rule(conclusion, goal), result)
  }
}
