///|
test "MoonBit relation proof agrees with the original Miz3 sample" {
  let reserved = @printer.reserved_words()
  // Run the API proof before loading the DSL or its string-to-tactic registry.
  let theorem = @sample_api.relation_successors()
  assert_true(@kernel.hyp(theorem).is_empty())
  assert_eq(@printer.reserved_words(), reserved)
  let expected = @parser.parse_term(
    (
      #|forall R:num->num->bool.
      #|  (forall x. R x x) ==>
      #|  (forall x y z. R x y /\ R y z ==> R x z) ==>
      #|  ((forall m n. m <= n ==> R m n) <=> (forall n. R n (SUC n)))
    ),
  )
  assert_true(@basics.aconv(@kernel.concl(theorem), expected))

  // The unchanged original sample registers ADD_CLAUSES, INDUCT_TAC and
  // LE_EXISTS for the DSL. Replay its proof as the migration oracle.
  @sample.load()
  let original = @miz3.thm(
    @miz3.parse_qproof(
      (
        #|;
        #|let R be num->num->bool;
        #|assume forall x. R x x [1];
        #|assume forall x y z. R x y /\ R y z ==> R x z [2];
        #|thus (forall m n. m <= n ==> R m n) <=> (forall n. R n (SUC n))
        #|proof
        #| now [3] // back direction first
        #|  assume forall n. R n (SUC n);
        #|  let m n be num;
        #|  forall d. R m (m + d) ==> R m (m + SUC d) [4] by 2,ADD_CLAUSES;
        #|  R m (m + 0) by 1,ADD_CLAUSES;
        #|  forall d. R m (m + d) by 4,INDUCT_TAC;
        #|  thus m <= n ==> R m n by LE_EXISTS;
        #| end;
        #| forall n. n <= SUC n;
        #|qed by 3
      ),
    ),
  )
  assert_true(@kernel.hyp(original).is_empty())
  assert_true(@basics.aconv(@kernel.concl(theorem), @kernel.concl(original)))
}
