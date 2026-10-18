///|
test "MoonBit relation proof proves the relation-successor statement" {
  let theorem = @proof_api.relation_successors()
  assert_true(@kernel.hyp(theorem).is_empty())
  let expected = @parser.parse_term(
    (
      #|forall R:num->num->bool.
      #|  (forall x. R x x) ==>
      #|  (forall x y z. R x y /\ R y z ==> R x z) ==>
      #|  ((forall m n. m <= n ==> R m n) <=> (forall n. R n (SUC n)))
    ),
  )
  assert_true(@basics.aconv(@kernel.concl(theorem), expected))
}
