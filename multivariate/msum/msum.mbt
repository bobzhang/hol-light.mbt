// Translated from upstream Multivariate/msum.ml; edit this file directly.

///|
/// 
fn step_1() -> Unit raise {
  let _ = @vectors.prioritize_vector(())
}

///|
/// Multivariate/msum.ml:10
fn step_2() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// Multivariate/msum.ml:16
fn step_3() -> Unit raise {
  @preterm.overload_interface("norm", @term_syntax.parse_term("(matrix_norm : (Cart[Cart[Real, M], N]) -> Real)"))
}

///|
/// matrix_norm
fn step_4() -> Unit raise {
  matrix_norm_c.set(@pair.new_definition(@term_syntax.parse_term("(matrix_norm : (Cart[Cart[Real, M], N]) -> Real)((m : Cart[Cart[Real, M], N])) == norm(vectorize(m))")))
}

///|
let matrix_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("matrix_norm")

///|
/// `matrix_norm`
pub fn matrix_norm() -> @kernel.Thm {
  matrix_norm_c.get()
}

///|
/// NEUTRAL_MATRIX_ADD
fn step_5() -> Unit raise {
  let t2 = @vectors.matrix_arith(@term_syntax.parse_term("((x : Cart[Cart[Real, M], N]) + (y : Cart[Cart[Real, M], N]) == x) == (y == mat(0))"))
  let t3 = @simp.rewrite_tac(@list.List([@vectors.matrix_arith(@term_syntax.parse_term("((x : Cart[Cart[Real, M], N]) + (y : Cart[Cart[Real, M], N]) == y) == (x == mat(0))")), t2]))
  let t1 = @tactics.match_mp_tac(@class.select_unique())
  let t4 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.neutral()])), t1), t3)
  neutral_matrix_add_c.set(@tactics.prove(@term_syntax.parse_term("(neutral : ((Cart[Cart[Real, M], N], Cart[Cart[Real, M], N]) -> Cart[Cart[Real, M], N]) -> Cart[Cart[Real, M], N])((op_plus : (Cart[Cart[Real, M], N], Cart[Cart[Real, M], N]) -> Cart[Cart[Real, M], N])) == (mat : (Num) -> Cart[Cart[Real, M], N])(0)"), t4))
}

///|
let neutral_matrix_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_MATRIX_ADD")

///|
/// `NEUTRAL_MATRIX_ADD`
pub fn neutral_matrix_add() -> @kernel.Thm {
  neutral_matrix_add_c.get()
}

///|
/// MONOIDAL_MATRIX_ADD
fn step_6() -> Unit raise {
  let t5 = @tactics.repeat_tac(@tactics.conj_tac)
  let t6 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.monoidal(), neutral_matrix_add()])), t5), @vectors.matrix_arith_tac)
  monoidal_matrix_add_c.set(@tactics.prove(@term_syntax.parse_term("(monoidal : ((Cart[Cart[Real, M], N], Cart[Cart[Real, M], N]) -> Cart[Cart[Real, M], N]) -> Bool)((op_plus : (Cart[Cart[Real, M], N], Cart[Cart[Real, M], N]) -> Cart[Cart[Real, M], N]))"), t6))
}

///|
let monoidal_matrix_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_MATRIX_ADD")

///|
/// `MONOIDAL_MATRIX_ADD`
pub fn monoidal_matrix_add() -> @kernel.Thm {
  monoidal_matrix_add_c.get()
}

///|
/// msum
fn step_7() -> Unit raise {
  msum_c.set(@pair.new_definition(@term_syntax.parse_term("(msum : ((A) -> Bool, (A) -> Cart[Cart[Real, M], N]) -> Cart[Cart[Real, M], N])((s : (A) -> Bool), (f : (A) -> Cart[Cart[Real, M], N])) == lambda((i : Num) => lambda((j : Num) => sum(s, (x : A) => op_dollar(op_dollar(f(x), i), j))))")))
}

///|
let msum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("msum")

///|
/// `msum`
pub fn msum() -> @kernel.Thm {
  msum_c.get()
}

///|
/// MSUM_COMPONENT
fn step_8() -> Unit raise {
  let t14 = @simp.asm_simp_tac(@list.List([msum(), @cart.lambda_beta()]))
  let t15 = @list.List([@simp.rewrite_tac(@list.List([@cart.finite_index_inrange()])), t14])
  let t11 = @term_syntax.parse_term("(∃ h : Num, 1 <= h && h <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (∀ z : Cart[Cart[Real, M], N], (op_dollar : (Cart[Cart[Real, M], N], Num) -> Cart[Real, M])(z, (i : Num)) == (op_dollar : (Cart[Cart[Real, M], N], Num) -> Cart[Real, M])(z, h))) && (∃ k : Num, 1 <= k && k <= (dimindex : ((M) -> Bool) -> Num)((UNIV : (M) -> Bool)) && (∀ z : Cart[Real, M], (op_dollar : (Cart[Real, M], Num) -> Real)(z, (j : Num)) == (op_dollar : (Cart[Real, M], Num) -> Real)(z, k)))")
  let t12 = @tactics.conjuncts_then(@tactics.choose_tac)
  let t13 = (fn(x7 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    fn(x8 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s9 = @tactics.subgoal_then(x7, x8)
      fn(x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s9(x10)
      }
    }
  })(t11)(t12)
  let t16 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t13), t15)
  msum_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ i : Num, ∀ j : Num, op_dollar(op_dollar(msum(s, f), i), j) == sum(s, (x : A) => op_dollar(op_dollar(f(x), i), j))"), t16))
}

///|
let msum_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_COMPONENT")

///|
/// `MSUM_COMPONENT`
pub fn msum_component() -> @kernel.Thm {
  msum_component_c.get()
}

///|
/// MSUM_ROW
fn step_9() -> Unit raise {
  let t17 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.vsum_component()]))
  msum_row_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ i : Num, op_dollar(msum(s, f), i) == vsum(s, (x : A) => op_dollar(f(x), i))"), t17))
}

///|
let msum_row_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_ROW")

///|
/// `MSUM_ROW`
pub fn msum_row() -> @kernel.Thm {
  msum_row_c.get()
}

///|
/// MSUM_CLAUSES
fn step_10() -> Unit raise {
  let t20 = @simp.asm_simp_tac(@list.List([@cart.lambda_beta(), @vectors.matrix_add_component()]))
  let t19 = @tactics.repeat_tac(@tactics.strip_tac)
  let t18 = @simp.simp_tac(@list.List([@vectors.mat_0_component()]))
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([msum(), @cart.cart_eq(), @cart.lambda_beta(), @vectors.matrix_add_component(), @iterate.sum_clauses()])), t18), t19), @class.cond_cases_tac), t20)
  msum_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ f : (A) -> Cart[Cart[Real, M], N], msum({}, f) == mat(0)) && (∀ x : A, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE(s) → msum(INSERT(x, s), f) == (if IN(x, s) { msum(s, f) } else { f(x) + msum(s, f) }))"), t21))
}

///|
let msum_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CLAUSES")

///|
/// `MSUM_CLAUSES`
pub fn msum_clauses() -> @kernel.Thm {
  msum_clauses_c.get()
}

///|
/// MSUM
fn step_11() -> Unit raise {
  let t23 = @simp.rewrite_tac(@list.List([neutral_matrix_add()]))
  let t22 = @simp.asm_simp_tac(@list.List([msum_clauses(), @iterate.iterate_clauses(), monoidal_matrix_add()]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t22), t23)
  msum_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE(s) → msum(s, f) == iterate(op_plus, s, f)"), t24))
}

///|
let msum_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM")

///|
/// `MSUM`
pub fn msum_v1() -> @kernel.Thm {
  msum_v1_c.get()
}

///|
/// MSUM_EQ_0
fn step_12() -> Unit raise {
  let t25 = @simp.simp_tac(@list.List([@iterate.sum_eq_0()]))
  let t26 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.mat_0_component()])), t25)
  msum_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == mat(0)) → msum(s, f) == mat(0)"), t26))
}

///|
let msum_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_EQ_0")

///|
/// `MSUM_EQ_0`
pub fn msum_eq_0() -> @kernel.Thm {
  msum_eq_0_c.get()
}

///|
/// MSUM_0
fn step_13() -> Unit raise {
  let t27 = @simp.simp_tac(@list.List([msum_eq_0()]))
  msum_0_c.set(@tactics.prove(@term_syntax.parse_term("(msum : ((A) -> Bool, (A) -> Cart[Cart[Real, M], N]) -> Cart[Cart[Real, M], N])((s : (A) -> Bool), (x : A) => (mat : (Num) -> Cart[Cart[Real, M], N])(0)) == (mat : (Num) -> Cart[Cart[Real, M], N])(0)"), t27))
}

///|
let msum_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_0")

///|
/// `MSUM_0`
pub fn msum_0() -> @kernel.Thm {
  msum_0_c.get()
}

///|
/// MSUM_LMUL
fn step_14() -> Unit raise {
  let t28 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_cmul_component(), @iterate.sum_lmul()]))
  msum_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ c : Real, ∀ s : (A) -> Bool, msum(s, (x : A) => op_pct_pct(c, f(x))) == op_pct_pct(c, msum(s, f))"), t28))
}

///|
let msum_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_LMUL")

///|
/// `MSUM_LMUL`
pub fn msum_lmul() -> @kernel.Thm {
  msum_lmul_c.get()
}

///|
/// MSUM_RMUL
fn step_15() -> Unit raise {
  let t29 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_cmul_component(), @iterate.sum_rmul()]))
  msum_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (A) -> Real, ∀ s : (A) -> Bool, ∀ v : Cart[Cart[Real, M], N], msum(s, (x : A) => op_pct_pct(c(x), v)) == op_pct_pct(sum(s, c), v)"), t29))
}

///|
let msum_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_RMUL")

///|
/// `MSUM_RMUL`
pub fn msum_rmul() -> @kernel.Thm {
  msum_rmul_c.get()
}

///|
/// MSUM_ADD
fn step_16() -> Unit raise {
  let t30 = @simp.simp_tac(@list.List([@iterate.sum_add()]))
  let t31 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component()])), t30)
  msum_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE(s) → msum(s, (x : A) => f(x) + g(x)) == msum(s, f) + msum(s, g)"), t31))
}

///|
let msum_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_ADD")

///|
/// `MSUM_ADD`
pub fn msum_add() -> @kernel.Thm {
  msum_add_c.get()
}

///|
/// MSUM_SUB
fn step_17() -> Unit raise {
  let t32 = @simp.simp_tac(@list.List([@iterate.sum_sub()]))
  let t33 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_sub_component()])), t32)
  msum_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE(s) → msum(s, (x : A) => f(x) - g(x)) == msum(s, f) - msum(s, g)"), t33))
}

///|
let msum_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SUB")

///|
/// `MSUM_SUB`
pub fn msum_sub() -> @kernel.Thm {
  msum_sub_c.get()
}

///|
/// MSUM_CONST
fn step_18() -> Unit raise {
  let t34 = @simp.simp_tac(@list.List([@iterate.sum_const()]))
  let t35 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_cmul_component()])), t34)
  msum_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE(s) → msum(s, (n : A) => c) == op_pct_pct(real_of_num(CARD(s)), c)"), t35))
}

///|
let msum_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CONST")

///|
/// `MSUM_CONST`
pub fn msum_const() -> @kernel.Thm {
  msum_const_c.get()
}

///|
/// MSUM_MATRIX_RMUL
fn step_19() -> Unit raise {
  let t37 = @simp.simp_tac(@list.List([msum_clauses(), @vectors.matrix_mul_lzero(), @vectors.matrix_add_rdistrib()]))
  let t36 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t38 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t36), t37)
  msum_matrix_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, N], M], ∀ A : Cart[Cart[Real, P], N], ∀ s : (A) -> Bool, FINITE(s) → msum(s, (i : A) => matrix_mul(f(i), A)) == matrix_mul(msum(s, f), A)"), t38))
}

///|
let msum_matrix_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_MATRIX_RMUL")

///|
/// `MSUM_MATRIX_RMUL`
pub fn msum_matrix_rmul() -> @kernel.Thm {
  msum_matrix_rmul_c.get()
}

///|
/// MSUM_MATRIX_LMUL
fn step_20() -> Unit raise {
  let t40 = @simp.simp_tac(@list.List([msum_clauses(), @vectors.matrix_mul_rzero(), @vectors.matrix_add_ldistrib()]))
  let t39 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t39), t40)
  msum_matrix_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, P], N], ∀ A : Cart[Cart[Real, N], M], ∀ s : (A) -> Bool, FINITE(s) → msum(s, (i : A) => matrix_mul(A, f(i))) == matrix_mul(A, msum(s, f))"), t41))
}

///|
let msum_matrix_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_MATRIX_LMUL")

///|
/// `MSUM_MATRIX_LMUL`
pub fn msum_matrix_lmul() -> @kernel.Thm {
  msum_matrix_lmul_c.get()
}

///|
/// MSUM_IMAGE
fn step_21() -> Unit raise {
  let t54 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def()]))
  let t48 = @drule.part_match(fn(x47 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x47))
  }, @iterate.sum_image())
  let t43 = @tactics.repeat_tac(@tactics.gen_tac)
  let t42 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()]))
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t42), t43), fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x50 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x49 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s45 = @tactics.mp_tac(x44)
            fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s45(x46)
            }
          })(t48(x49))
        })(@equal.lhand(x50))
      })((fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x51.1
      })(x52))
    })(x53)(x53)
  }), t54)
  msum_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → msum(IMAGE(f, s), g) == msum(s, o(g, f))"), t55))
}

///|
let msum_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_IMAGE")

///|
/// `MSUM_IMAGE`
pub fn msum_image() -> @kernel.Thm {
  msum_image_c.get()
}

///|
/// MSUM_UNION
fn step_22() -> Unit raise {
  let t56 = @simp.simp_tac(@list.List([@iterate.sum_union()]))
  let t57 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), @vectors.matrix_add_component(), msum_component()])), t56)
  msum_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && DISJOINT(s, t) → msum(UNION(s, t), f) == msum(s, f) + msum(t, f)"), t57))
}

///|
let msum_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_UNION")

///|
/// `MSUM_UNION`
pub fn msum_union() -> @kernel.Thm {
  msum_union_c.get()
}

///|
/// MSUM_DIFF
fn step_23() -> Unit raise {
  let t58 = @simp.simp_tac(@list.List([@iterate.sum_diff()]))
  let t59 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), @vectors.matrix_sub_component(), msum_component()])), t58)
  msum_diff_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && SUBSET(t, s) → msum(DIFF(s, t), f) == msum(s, f) - msum(t, f)"), t59))
}

///|
let msum_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_DIFF")

///|
/// `MSUM_DIFF`
pub fn msum_diff() -> @kernel.Thm {
  msum_diff_c.get()
}

///|
/// MSUM_DELETE
fn step_24() -> Unit raise {
  let t60 = @simp.simp_tac(@list.List([@iterate.sum_delete()]))
  let t61 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), @vectors.matrix_sub_component(), msum_component()])), t60)
  msum_delete_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ a : A, FINITE(s) && IN(a, s) → msum(DELETE(s, a), f) == msum(s, f) - f(a)"), t61))
}

///|
let msum_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_DELETE")

///|
/// `MSUM_DELETE`
pub fn msum_delete() -> @kernel.Thm {
  msum_delete_c.get()
}

///|
/// MSUM_INCL_EXCL
fn step_25() -> Unit raise {
  let t62 = @simp.simp_tac(@list.List([@iterate.sum_incl_excl()]))
  let t63 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component()])), t62)
  msum_incl_excl_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], FINITE(s) && FINITE(t) → msum(s, f) + msum(t, f) == msum(UNION(s, t), f) + msum(INTER(s, t), f)"), t63))
}

///|
let msum_incl_excl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_INCL_EXCL")

///|
/// `MSUM_INCL_EXCL`
pub fn msum_incl_excl() -> @kernel.Thm {
  msum_incl_excl_c.get()
}

///|
/// MSUM_NEG
fn step_26() -> Unit raise {
  let t64 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_neg_component(), @iterate.sum_neg()]))
  msum_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, msum(s, (x : A) => -f(x)) == -msum(s, f)"), t64))
}

///|
let msum_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_NEG")

///|
/// `MSUM_NEG`
pub fn msum_neg() -> @kernel.Thm {
  msum_neg_c.get()
}

///|
/// MSUM_EQ
fn step_27() -> Unit raise {
  let t65 = @simp.simp_tac(@list.List([@iterate.sum_eq()]))
  let t66 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()])), t65)
  msum_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == g(x)) → msum(s, f) == msum(s, g)"), t66))
}

///|
let msum_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_EQ")

///|
/// `MSUM_EQ`
pub fn msum_eq() -> @kernel.Thm {
  msum_eq_c.get()
}

///|
/// MSUM_SUPERSET
fn step_28() -> Unit raise {
  let t67 = @simp.simp_tac(@list.List([@iterate.sum_superset()]))
  let t68 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.mat_0_component()])), t67)
  msum_superset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, SUBSET(u, v) && (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == mat(0)) → msum(v, f) == msum(u, f)"), t68))
}

///|
let msum_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SUPERSET")

///|
/// `MSUM_SUPERSET`
pub fn msum_superset() -> @kernel.Thm {
  msum_superset_c.get()
}

///|
/// MSUM_SUPPORT_EXPLICIT
fn step_29() -> Unit raise {
  let t71 = @sets.set_tac(@list.List([]))
  let t70 = @tactics.match_mp_tac(msum_superset())
  let t69 = @tactics.conv_tac(@equal.sym_conv)
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t69), t70), t71)
  msum_support_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, msum({(x : A) | IN(x, s) && !(f(x) == mat(0))}, f) == msum(s, f)"), t72))
}

///|
let msum_support_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SUPPORT_EXPLICIT")

///|
/// `MSUM_SUPPORT_EXPLICIT`
pub fn msum_support_explicit() -> @kernel.Thm {
  msum_support_explicit_c.get()
}

///|
/// MSUM_SUPPORT
fn step_30() -> Unit raise {
  let t73 = @simp.simp_tac(@list.List([@iterate.support(), neutral_matrix_add(), msum_support_explicit()]))
  msum_support_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Cart[Real, _], _], ∀ s : (_) -> Bool, msum(support(op_plus, f, s), f) == msum(s, f)"), t73))
}

///|
let msum_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SUPPORT")

///|
/// `MSUM_SUPPORT`
pub fn msum_support() -> @kernel.Thm {
  msum_support_c.get()
}

///|
/// MSUM_UNIV
fn step_31() -> Unit raise {
  let t76 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t75 = @simp.once_rewrite_tac(@list.List([@equal.gsym(msum_support_explicit())]))
  let t74 = @tactics.repeat_tac(@tactics.strip_tac)
  let t77 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.support(), neutral_matrix_add()])), t74), t75), @tactics.ap_thm_tac), @tactics.ap_term_tac), t76)
  msum_univ_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, SUBSET(support(op_plus, f, UNIV), s) → msum(s, f) == msum(UNIV, f)"), t77))
}

///|
let msum_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_UNIV")

///|
/// `MSUM_UNIV`
pub fn msum_univ() -> @kernel.Thm {
  msum_univ_c.get()
}

///|
/// MSUM_EQ_SUPERSET
fn step_32() -> Unit raise {
  let t78 = @meson.meson_tac(@list.List([msum_superset(), msum_eq()]))
  msum_eq_superset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(t) && SUBSET(t, s) && (∀ x : A, IN(x, t) → f(x) == (g : (A) -> Cart[Cart[Real, M], N])(x)) && (∀ x : A, IN(x, s) && !IN(x, t) → f(x) == mat(0)) → msum(s, f) == msum(t, g)"), t78))
}

///|
let msum_eq_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_EQ_SUPERSET")

///|
/// `MSUM_EQ_SUPERSET`
pub fn msum_eq_superset() -> @kernel.Thm {
  msum_eq_superset_c.get()
}

///|
/// MSUM_UNION_RZERO
fn step_33() -> Unit raise {
  let t80 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t79 = @tactics.match_mp_tac(msum_superset())
  let t81 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t79), t80)
  msum_union_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, (∀ x : A, IN(x, v) && !IN(x, u) → f(x) == mat(0)) → msum(UNION(u, v), f) == msum(u, f)"), t81))
}

///|
let msum_union_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_UNION_RZERO")

///|
/// `MSUM_UNION_RZERO`
pub fn msum_union_rzero() -> @kernel.Thm {
  msum_union_rzero_c.get()
}

///|
/// MSUM_UNION_LZERO
fn step_34() -> Unit raise {
  let t83 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t82 = @tactics.match_mp_tac(msum_superset())
  let t84 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t82), t83)
  msum_union_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ u : (A) -> Bool, ∀ v : (A) -> Bool, (∀ x : A, IN(x, u) && !IN(x, v) → f(x) == mat(0)) → msum(UNION(u, v), f) == msum(v, f)"), t84))
}

///|
let msum_union_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_UNION_LZERO")

///|
/// `MSUM_UNION_LZERO`
pub fn msum_union_lzero() -> @kernel.Thm {
  msum_union_lzero_c.get()
}

///|
/// MSUM_RESTRICT
fn step_35() -> Unit raise {
  let t86 = @simp.simp_tac(@list.List([]))
  let t85 = @tactics.match_mp_tac(msum_eq())
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t85), t86)
  msum_restrict_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, msum(s, (x : A) => if IN(x, s) { f(x) } else { mat(0) }) == msum(s, f)"), t87))
}

///|
let msum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_RESTRICT")

///|
/// `MSUM_RESTRICT`
pub fn msum_restrict() -> @kernel.Thm {
  msum_restrict_c.get()
}

///|
/// MSUM_RESTRICT_SET
fn step_36() -> Unit raise {
  let t88 = @simp.simp_tac(@list.List([@iterate.sum_restrict_set(), @vectors.cond_component()]))
  let t89 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.mat_0_component(), @vectors.cond_component()])), t88)
  msum_restrict_set_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], msum({(x : A) | IN(x, s) && P(x)}, f) == msum(s, (x : A) => if P(x) { f(x) } else { mat(0) })"), t89))
}

///|
let msum_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_RESTRICT_SET")

///|
/// `MSUM_RESTRICT_SET`
pub fn msum_restrict_set() -> @kernel.Thm {
  msum_restrict_set_c.get()
}

///|
/// MSUM_CASES
fn step_37() -> Unit raise {
  let t90 = @simp.simp_tac(@list.List([@iterate.sum_cases()]))
  let t91 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component(), @vectors.cond_component()])), t90)
  msum_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ P : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (A) -> Cart[Cart[Real, M], N], FINITE(s) → msum(s, (x : A) => if P(x) { f(x) } else { g(x) }) == msum({(x : A) | IN(x, s) && P(x)}, f) + msum({(x : A) | IN(x, s) && !P(x)}, g)"), t91))
}

///|
let msum_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CASES")

///|
/// `MSUM_CASES`
pub fn msum_cases() -> @kernel.Thm {
  msum_cases_c.get()
}

///|
/// MSUM_SING
fn step_38() -> Unit raise {
  let t92 = @simp.simp_tac(@list.List([msum_clauses(), @sets.finite_rules(), @sets.not_in_empty(), @vectors.matrix_add_rid()]))
  msum_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ x : A, msum({x}, f) == f(x)"), t92))
}

///|
let msum_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SING")

///|
/// `MSUM_SING`
pub fn msum_sing() -> @kernel.Thm {
  msum_sing_c.get()
}

///|
/// VECTORIZE_MSUM
fn step_39() -> Unit raise {
  let t93 = @simp.simp_tac(@list.List([@cart.cart_eq(), @misc.vectorize_component(), @cart.dimindex_finite_prod(), @vectors.vsum_component(), msum_component()]))
  vectorize_msum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], vectorize(msum(s, f)) == vsum(s, (x : A) => vectorize(f(x)))"), t93))
}

///|
let vectorize_msum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTORIZE_MSUM")

///|
/// `VECTORIZE_MSUM`
pub fn vectorize_msum() -> @kernel.Thm {
  vectorize_msum_c.get()
}

///|
/// MSUM_NORM
fn step_40() -> Unit raise {
  let t94 = @simp.simp_tac(@list.List([@vectors.vsum_norm()]))
  let t95 = @tactics.then_tac(@simp.rewrite_tac(@list.List([matrix_norm(), vectorize_msum()])), t94)
  msum_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], FINITE(s) → norm(msum(s, f)) <= sum(s, (x : A) => norm(f(x)))"), t95))
}

///|
let msum_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_NORM")

///|
/// `MSUM_NORM`
pub fn msum_norm() -> @kernel.Thm {
  msum_norm_c.get()
}

///|
/// MSUM_NORM_LE
fn step_41() -> Unit raise {
  let t98 = @simp.asm_simp_tac(@list.List([msum_norm(), @iterate.sum_le()]))
  let t97 = @tactics.exists_tac(@term_syntax.parse_term("sum((s : (A) -> Bool), (x : A) => norm((f : (A) -> Cart[Cart[Real, M], N])(x)))"))
  let t96 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t99 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t96), t97), t98)
  msum_norm_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (A) -> Real, FINITE(s) && (∀ x : A, IN(x, s) → norm(f(x)) <= g(x)) → norm(msum(s, f)) <= sum(s, g)"), t99))
}

///|
let msum_norm_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_NORM_LE")

///|
/// `MSUM_NORM_LE`
pub fn msum_norm_le() -> @kernel.Thm {
  msum_norm_le_c.get()
}

///|
/// MSUM_NORM_TRIANGLE
fn step_42() -> Unit raise {
  let t100 = @meson.meson_tac(@list.List([msum_norm(), @realax.real_le_trans()]))
  msum_norm_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ b : Real, FINITE(s) && sum(s, (a : A) => norm(f(a))) <= b → norm(msum(s, f)) <= b"), t100))
}

///|
let msum_norm_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_NORM_TRIANGLE")

///|
/// `MSUM_NORM_TRIANGLE`
pub fn msum_norm_triangle() -> @kernel.Thm {
  msum_norm_triangle_c.get()
}

///|
/// MSUM_NORM_BOUND
fn step_43() -> Unit raise {
  let t101 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.sum_const()), msum_norm_le()]))
  msum_norm_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ b : Real, FINITE(s) && (∀ x : A, IN(x, s) → norm(f(x)) <= b) → norm(msum(s, f)) <= real_of_num(CARD(s)) * b"), t101))
}

///|
let msum_norm_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_NORM_BOUND")

///|
/// `MSUM_NORM_BOUND`
pub fn msum_norm_bound() -> @kernel.Thm {
  msum_norm_bound_c.get()
}

///|
/// MSUM_CLAUSES_NUMSEG
fn step_44() -> Unit raise {
  let t104 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")), @vectors.matrix_add_ac()]))
  let t103 = @simp.asm_simp_tac(@list.List([msum_sing(), msum_clauses(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  let t102 = @tactics.repeat_tac(@tactics.strip_tac)
  let t105 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.numseg_clauses()])), t102), @class.cond_cases_tac), t103), t104)
  msum_clauses_numseg_c.set(@tactics.prove(@term_syntax.parse_term("(∀ m : Num, msum(op_dot_dot(m, 0), (f : (Num) -> Cart[Cart[Real, M], N])) == (if m == 0 { f(0) } else { mat(0) })) && (∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, SUC(n)), f) == (if m <= SUC(n) { msum(op_dot_dot(m, n), f) + f(SUC(n)) } else { msum(op_dot_dot(m, n), f) }))"), t105))
}

///|
let msum_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CLAUSES_NUMSEG")

///|
/// `MSUM_CLAUSES_NUMSEG`
pub fn msum_clauses_numseg() -> @kernel.Thm {
  msum_clauses_numseg_c.get()
}

///|
/// MSUM_CLAUSES_RIGHT
fn step_45() -> Unit raise {
  let t106 = @simp.simp_tac(@list.List([@arith.lt_refl(), msum_clauses_numseg(), @arith.suc_sub1()]))
  let t107 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t106)
  msum_clauses_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, 0 < n && m <= n → msum(op_dot_dot(m, n), f) == msum(op_dot_dot(m, n - 1), f) + f(n)"), t107))
}

///|
let msum_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CLAUSES_RIGHT")

///|
/// `MSUM_CLAUSES_RIGHT`
pub fn msum_clauses_right() -> @kernel.Thm {
  msum_clauses_right_c.get()
}

///|
/// MSUM_CMUL_NUMSEG
fn step_46() -> Unit raise {
  let t108 = @simp.simp_tac(@list.List([msum_lmul(), @iterate.finite_numseg()]))
  msum_cmul_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ c : Real, ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (x : Num) => op_pct_pct(c, f(x))) == op_pct_pct(c, msum(op_dot_dot(m, n), f))"), t108))
}

///|
let msum_cmul_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CMUL_NUMSEG")

///|
/// `MSUM_CMUL_NUMSEG`
pub fn msum_cmul_numseg() -> @kernel.Thm {
  msum_cmul_numseg_c.get()
}

///|
/// MSUM_EQ_NUMSEG
fn step_47() -> Unit raise {
  let t110 = @simp.asm_simp_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t109 = @tactics.match_mp_tac(msum_eq())
  let t111 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t109), t110)
  msum_eq_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ g : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, (∀ x : Num, m <= x && x <= n → f(x) == g(x)) → msum(op_dot_dot(m, n), f) == msum(op_dot_dot(m, n), g)"), t111))
}

///|
let msum_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_EQ_NUMSEG")

///|
/// `MSUM_EQ_NUMSEG`
pub fn msum_eq_numseg() -> @kernel.Thm {
  msum_eq_numseg_c.get()
}

///|
/// MSUM_IMAGE_GEN
fn step_48() -> Unit raise {
  let t112 = @simp.simp_tac(@list.List([@iterate.sum_image_gen()]))
  let t113 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()])), t112)
  msum_image_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE(s) → msum(s, g) == msum(IMAGE(f, s), (y : B) => msum({(x : A) | IN(x, s) && f(x) == y}, g))"), t113))
}

///|
let msum_image_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_IMAGE_GEN")

///|
/// `MSUM_IMAGE_GEN`
pub fn msum_image_gen() -> @kernel.Thm {
  msum_image_gen_c.get()
}

///|
/// MSUM_GROUP
fn step_49() -> Unit raise {
  let t114 = @simp.simp_tac(@list.List([@iterate.sum_group()]))
  let t115 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()])), t114)
  msum_group_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && SUBSET(IMAGE(f, s), t) → msum(t, (y : B) => msum({(x : A) | IN(x, s) && f(x) == y}, g)) == msum(s, g)"), t115))
}

///|
let msum_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_GROUP")

///|
/// `MSUM_GROUP`
pub fn msum_group() -> @kernel.Thm {
  msum_group_c.get()
}

///|
/// MSUM_GROUP_RELATION
fn step_50() -> Unit raise {
  let t116 = @simp.simp_tac(@list.List([@iterate.sum_group_relation()]))
  let t117 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()])), t116)
  msum_group_relation_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ g : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → existsunique((y : B) => IN(y, t) && R(x, y))) → msum(t, (y : B) => msum({(x : A) | IN(x, s) && R(x, y)}, g)) == msum(s, g)"), t117))
}

///|
let msum_group_relation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_GROUP_RELATION")

///|
/// `MSUM_GROUP_RELATION`
pub fn msum_group_relation() -> @kernel.Thm {
  msum_group_relation_c.get()
}

///|
/// MSUM_VMUL
fn step_51() -> Unit raise {
  let t118 = @simp.rewrite_tac(@list.List([msum_rmul()]))
  msum_vmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ v : Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, op_pct_pct(sum(s, f), v) == msum(s, (x : A) => op_pct_pct(f(x), v))"), t118))
}

///|
let msum_vmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_VMUL")

///|
/// `MSUM_VMUL`
pub fn msum_vmul() -> @kernel.Thm {
  msum_vmul_c.get()
}

///|
/// MSUM_DELTA
fn step_52() -> Unit raise {
  let t119 = @simp.simp_tac(@list.List([@vectors.mat_0_component(), @iterate.sum_delta()]))
  let t120 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.cond_component()])), t119)
  msum_delta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, msum(s, (x : A) => if x == a { (b : Cart[Cart[Real, M], N]) } else { mat(0) }) == (if IN(a, s) { b } else { mat(0) })"), t120))
}

///|
let msum_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_DELTA")

///|
/// `MSUM_DELTA`
pub fn msum_delta() -> @kernel.Thm {
  msum_delta_c.get()
}

///|
/// MSUM_ADD_NUMSEG
fn step_53() -> Unit raise {
  let t121 = @simp.simp_tac(@list.List([msum_add(), @iterate.finite_numseg()]))
  msum_add_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ g : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (i : Num) => f(i) + g(i)) == msum(op_dot_dot(m, n), f) + msum(op_dot_dot(m, n), g)"), t121))
}

///|
let msum_add_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_ADD_NUMSEG")

///|
/// `MSUM_ADD_NUMSEG`
pub fn msum_add_numseg() -> @kernel.Thm {
  msum_add_numseg_c.get()
}

///|
/// MSUM_SUB_NUMSEG
fn step_54() -> Unit raise {
  let t122 = @simp.simp_tac(@list.List([msum_sub(), @iterate.finite_numseg()]))
  msum_sub_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ g : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (i : Num) => f(i) - g(i)) == msum(op_dot_dot(m, n), f) - msum(op_dot_dot(m, n), g)"), t122))
}

///|
let msum_sub_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SUB_NUMSEG")

///|
/// `MSUM_SUB_NUMSEG`
pub fn msum_sub_numseg() -> @kernel.Thm {
  msum_sub_numseg_c.get()
}

///|
/// MSUM_ADD_SPLIT
fn step_55() -> Unit raise {
  let t123 = @simp.simp_tac(@list.List([@iterate.sum_add_split()]))
  let t124 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component()])), t123)
  msum_add_split_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 → msum(op_dot_dot(m, n + p), f) == msum(op_dot_dot(m, n), f) + msum(op_dot_dot(n + 1, n + p), f)"), t124))
}

///|
let msum_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_ADD_SPLIT")

///|
/// `MSUM_ADD_SPLIT`
pub fn msum_add_split() -> @kernel.Thm {
  msum_add_split_c.get()
}

///|
/// MSUM_MSUM_PRODUCT
fn step_56() -> Unit raise {
  let t127 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]))
  let t126 = @tactics.repeat_tac(@tactics.strip_tac)
  let t125 = @simp.simp_tac(@list.List([@iterate.sum_sum_product()]))
  let t128 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.cond_component()])), t125), t126), @tactics.ap_term_tac), t127)
  msum_msum_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A, B) -> Bool, ∀ x : (A, B) -> Cart[Cart[Real, M], N], FINITE(s) && (∀ i : A, IN(i, s) → FINITE(t(i))) → msum(s, (i : A) => msum(t(i), x(i))) == msum({((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, GABS((f : ((A, B)) -> Cart[Cart[Real, M], N]) => ∀ i : A, ∀ j : B, GEQ(f((i, j)), x(i, j))))"), t128))
}

///|
let msum_msum_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_MSUM_PRODUCT")

///|
/// `MSUM_MSUM_PRODUCT`
pub fn msum_msum_product() -> @kernel.Thm {
  msum_msum_product_c.get()
}

///|
/// MSUM_IMAGE_NONZERO
fn step_57() -> Unit raise {
  let t143 = @meson.asm_meson_tac(@list.List([@sets.in_image()]))
  let t142 = @simp.rewrite_tac(@list.List([@vectors.matrix_arith(@term_syntax.parse_term("((a : Cart[Cart[Real, M], N]) == (x : Cart[Cart[Real, M], N]) + a) == (x == mat(0))"))]))
  let t141 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t140 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t139 = @tactics.subgoal_then(@term_syntax.parse_term("msum((s : (A) -> Bool), o((d : (B) -> Cart[Cart[Real, M], N]), (i : (A) -> B))) == msum(IMAGE(i, s), d)"), fn(x136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s137 = @tactics.subst1_tac(x136)
    fn(x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s137(x138)
    }
  })
  let t135 = @tactics.repeat_tac(@tactics.strip_tac)
  let t134 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t132 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t133 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : A)"), t132]))
  let t131 = @simp.simp_tac(@list.List([@sets.image_clauses(), msum_clauses(), @sets.finite_image()]))
  let t130 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t129 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t144 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t129), t130), t131), t133), t134), t135), t139), t140), @class.cond_cases_tac), t141), t142), t143)
  msum_image_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : (B) -> Cart[Cart[Real, M], N], ∀ i : (A) -> B, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && !(x == y) && i(x) == i(y) → d(i(x)) == mat(0)) → msum(IMAGE(i, s), d) == msum(s, o(d, i))"), t144))
}

///|
let msum_image_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_IMAGE_NONZERO")

///|
/// `MSUM_IMAGE_NONZERO`
pub fn msum_image_nonzero() -> @kernel.Thm {
  msum_image_nonzero_c.get()
}

///|
/// MSUM_UNION_NONZERO
fn step_58() -> Unit raise {
  let t145 = @simp.simp_tac(@list.List([@iterate.sum_union_nonzero()]))
  let t146 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component(), @vectors.mat_0_component()])), t145)
  msum_union_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ t : (A) -> Bool, FINITE(s) && FINITE(t) && (∀ x : A, IN(x, INTER(s, t)) → f(x) == mat(0)) → msum(UNION(s, t), f) == msum(s, f) + msum(t, f)"), t146))
}

///|
let msum_union_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_UNION_NONZERO")

///|
/// `MSUM_UNION_NONZERO`
pub fn msum_union_nonzero() -> @kernel.Thm {
  msum_union_nonzero_c.get()
}

///|
/// MSUM_UNIONS_NONZERO
fn step_59() -> Unit raise {
  let t164 = @meson.asm_meson_tac(@list.List([]))
  let t163 = @simp.asm_simp_tac(@list.List([@sets.finite_unions(), @sets.in_inter(), @sets.in_unions()]))
  let t162 = @tactics.match_mp_tac(msum_union_nonzero())
  let t160 = @tactics.disch_then(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s157 = @tactics.subst_all_tac(x156)
      fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s157(x158)
      }
    })(@equal.sym(x159))
  })
  let t161 = @list.List([@meson.asm_meson_tac(@list.List([])), t160])
  let t155 = @simp.asm_simp_tac(@list.List([msum_clauses()]))
  let t154 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t153 = @tactics.disch_then(fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x151
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t149 = @term_syntax.parse_term("(s : ((A) -> Bool) -> Bool)")
  let t150 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(t : (A) -> Bool)"), t149]))
  let t148 = @simp.rewrite_tac(@list.List([@sets.unions_0(), @sets.unions_insert(), msum_clauses(), @sets.in_insert()]))
  let t147 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))), t147), t148), t150), t153), t154), t155), @tactics.ants_tac), t161), @tactics.strip_tac), t162), t163), t164)
  msum_unions_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : ((A) -> Bool) -> Bool, FINITE(s) && (∀ t : (A) -> Bool, IN(t, s) → FINITE(t)) && (∀ t1 : (A) -> Bool, ∀ t2 : (A) -> Bool, ∀ x : A, IN(t1, s) && IN(t2, s) && !(t1 == t2) && IN(x, t1) && IN(x, t2) → f(x) == mat(0)) → msum(UNIONS(s), f) == msum(s, (t : (A) -> Bool) => msum(t, f))"), t165))
}

///|
let msum_unions_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_UNIONS_NONZERO")

///|
/// `MSUM_UNIONS_NONZERO`
pub fn msum_unions_nonzero() -> @kernel.Thm {
  msum_unions_nonzero_c.get()
}

///|
/// MSUM_CLAUSES_LEFT
fn step_60() -> Unit raise {
  let t166 = @simp.simp_tac(@list.List([@vectors.vec_component(), @iterate.sum_clauses_left()]))
  let t167 = @tactics.then_tac(@simp.simp_tac(@list.List([msum(), @cart.cart_eq(), @cart.lambda_beta(), @vectors.matrix_add_component()])), t166)
  msum_clauses_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, m <= n → msum(op_dot_dot(m, n), f) == f(m) + msum(op_dot_dot(m + 1, n), f)"), t167))
}

///|
let msum_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CLAUSES_LEFT")

///|
/// `MSUM_CLAUSES_LEFT`
pub fn msum_clauses_left() -> @kernel.Thm {
  msum_clauses_left_c.get()
}

///|
/// MSUM_DIFFS
fn step_61() -> Unit raise {
  let t172 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t171 = @simp.asm_rewrite_tac(@list.List([]))
  let t170 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= n)")), @vectors.matrix_add_lid()]))
  let t169 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == SUC((n : Num))"))
  let t168 = @simp.asm_simp_tac(@list.List([msum_clauses_numseg(), @arith.le()]))
  let t173 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t168), t169), t170), @class.cond_cases_tac), t171), t172), @vectors.matrix_arith_tac)
  msum_diffs_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (k : Num) => (f : (Num) -> Cart[Cart[Real, M], N])(k) - f(k + 1)) == (if m <= n { f(m) - f(n + 1) } else { mat(0) })"), t173))
}

///|
let msum_diffs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_DIFFS")

///|
/// `MSUM_DIFFS`
pub fn msum_diffs() -> @kernel.Thm {
  msum_diffs_c.get()
}

///|
/// MSUM_DIFFS_ALT
fn step_62() -> Unit raise {
  let t176 = @simp.asm_rewrite_tac(@list.List([@vectors.matrix_neg_sub(), @vectors.matrix_neg_0()]))
  let t175 = @simp.simp_tac(@list.List([msum_neg(), msum_diffs()]))
  let t174 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.matrix_neg_sub())]))
  let t177 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t174), t175), @class.cond_cases_tac), t176)
  msum_diffs_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (k : Num) => (f : (Num) -> Cart[Cart[Real, M], N])(k + 1) - f(k)) == (if m <= n { f(n + 1) - f(m) } else { mat(0) })"), t177))
}

///|
let msum_diffs_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_DIFFS_ALT")

///|
/// `MSUM_DIFFS_ALT`
pub fn msum_diffs_alt() -> @kernel.Thm {
  msum_diffs_alt_c.get()
}

///|
/// MSUM_DELETE_CASES
fn step_63() -> Unit raise {
  let t189 = @simp.asm_simp_tac(@list.List([msum_clauses(), @sets.finite_delete(), @sets.in_delete()]))
  let t188 = @tactics.first_assum(fn(x179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x179
    @simp.gen_rewrite_tac(fn(x187 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x181 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s182 = @equal.rand_conv(x181)
        fn(x183 : @kernel.Term) -> @kernel.Thm raise {
          s182(x183)
        }
      })((fn(x184 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s185 = @equal.once_depth_conv(x184)
        fn(x186 : @kernel.Term) -> @kernel.Thm raise {
          s185(x186)
        }
      })(x187))
    }, @list.List([@drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : A), (s : (A) -> Bool)) → s == INSERT(x, DELETE(s, x))")))(th)]))
  })
  let t178 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("!IN((x : A), (s : (A) -> Bool)) → DELETE(s, x) == s"))]))
  let t190 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t178), t188), t189), @vectors.matrix_arith_tac)
  msum_delete_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE(s) → msum(DELETE(s, x), f) == (if IN(x, s) { msum(s, f) - f(x) } else { msum(s, f) })"), t190))
}

///|
let msum_delete_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_DELETE_CASES")

///|
/// `MSUM_DELETE_CASES`
pub fn msum_delete_cases() -> @kernel.Thm {
  msum_delete_cases_c.get()
}

///|
/// MSUM_EQ_GENERAL
fn step_64() -> Unit raise {
  let t194 = @meson.asm_meson_tac(@list.List([]))
  let t193 = @tactics.exists_tac(@term_syntax.parse_term("(h : (A) -> B)"))
  let t192 = @tactics.match_mp_tac(@iterate.sum_eq_general())
  let t191 = @tactics.repeat_tac(@tactics.strip_tac)
  let t195 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([msum(), @cart.cart_eq(), @cart.lambda_beta()])), t191), t192), t193), t194)
  msum_eq_general_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (B) -> Cart[Cart[Real, M], N], ∀ h : (A) -> B, (∀ y : B, IN(y, t) → existsunique((x : A) => IN(x, s) && h(x) == y)) && (∀ x : A, IN(x, s) → IN(h(x), t) && g(h(x)) == f(x)) → msum(s, f) == msum(t, g)"), t195))
}

///|
let msum_eq_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_EQ_GENERAL")

///|
/// `MSUM_EQ_GENERAL`
pub fn msum_eq_general() -> @kernel.Thm {
  msum_eq_general_c.get()
}

///|
/// MSUM_EQ_GENERAL_INVERSES
fn step_65() -> Unit raise {
  let t203 = @meson.asm_meson_tac(@list.List([]))
  let t201 = @term_syntax.parse_term("(k : (B) -> A)")
  let t202 = @tactics.map_every(fn(x198 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s199 = @tactics.exists_tac(x198)
    fn(x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s199(x200)
    }
  }, @list.List([@term_syntax.parse_term("(h : (A) -> B)"), t201]))
  let t197 = @tactics.match_mp_tac(@iterate.sum_eq_general_inverses())
  let t196 = @tactics.repeat_tac(@tactics.strip_tac)
  let t204 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([msum(), @cart.cart_eq(), @cart.lambda_beta()])), t196), t197), t202), t203)
  msum_eq_general_inverses_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (B) -> Cart[Cart[Real, M], N], ∀ h : (A) -> B, ∀ k : (B) -> A, (∀ y : B, IN(y, t) → IN(k(y), s) && h(k(y)) == y) && (∀ x : A, IN(x, s) → IN(h(x), t) && k(h(x)) == x && g(h(x)) == f(x)) → msum(s, f) == msum(t, g)"), t204))
}

///|
let msum_eq_general_inverses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_EQ_GENERAL_INVERSES")

///|
/// `MSUM_EQ_GENERAL_INVERSES`
pub fn msum_eq_general_inverses() -> @kernel.Thm {
  msum_eq_general_inverses_c.get()
}

///|
/// MSUM_OFFSET
fn step_66() -> Unit raise {
  let t205 = @simp.simp_tac(@list.List([@iterate.sum_offset()]))
  let t206 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()])), t205)
  msum_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m + p, n + p), f) == msum(op_dot_dot(m, n), (i : Num) => f(i + p))"), t206))
}

///|
let msum_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_OFFSET")

///|
/// `MSUM_OFFSET`
pub fn msum_offset() -> @kernel.Thm {
  msum_offset_c.get()
}

///|
/// MSUM_OFFSET_0
fn step_67() -> Unit raise {
  let t207 = @simp.simp_tac(@list.List([@iterate.sum_offset_0()]))
  let t208 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()])), t207)
  msum_offset_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, m <= n → msum(op_dot_dot(m, n), f) == msum(op_dot_dot(0, n - m), (i : Num) => f(i + m))"), t208))
}

///|
let msum_offset_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_OFFSET_0")

///|
/// `MSUM_OFFSET_0`
pub fn msum_offset_0() -> @kernel.Thm {
  msum_offset_0_c.get()
}

///|
/// MSUM_TRIV_NUMSEG
fn step_68() -> Unit raise {
  let t209 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_empty()), msum_clauses()]))
  msum_triv_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, n < m → msum(op_dot_dot(m, n), f) == mat(0)"), t209))
}

///|
let msum_triv_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_TRIV_NUMSEG")

///|
/// `MSUM_TRIV_NUMSEG`
pub fn msum_triv_numseg() -> @kernel.Thm {
  msum_triv_numseg_c.get()
}

///|
/// MSUM_CONST_NUMSEG
fn step_69() -> Unit raise {
  let t210 = @simp.simp_tac(@list.List([msum_const(), @iterate.finite_numseg(), @iterate.card_numseg()]))
  msum_const_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (n : Num) => c) == op_pct_pct(real_of_num(n + 1 - m), c)"), t210))
}

///|
let msum_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CONST_NUMSEG")

///|
/// `MSUM_CONST_NUMSEG`
pub fn msum_const_numseg() -> @kernel.Thm {
  msum_const_numseg_c.get()
}

///|
/// MSUM_SUC
fn step_70() -> Unit raise {
  let t216 = @simp.simp_tac(@list.List([msum_image(), @iterate.finite_numseg(), @nums.suc_inj()]))
  let t215 = @simp.rewrite_tac(@list.List([@arith.one(), @arith.add_suc(), @arith.add_0(), @class.eta_ax()]))
  let t217 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add1(), @iterate.numseg_offset_image()])), t215), t216])
  let t214 = @tactics.subgoal_then(@term_syntax.parse_term("op_dot_dot(SUC((n : Num)), SUC((m : Num))) == IMAGE(SUC, op_dot_dot(n, m))"), fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s212 = @tactics.subst1_tac(x211)
    fn(x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s212(x213)
    }
  })
  let t218 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t214), t217)
  msum_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(SUC(n), SUC(m)), f) == msum(op_dot_dot(n, m), o(f, SUC))"), t218))
}

///|
let msum_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SUC")

///|
/// `MSUM_SUC`
pub fn msum_suc() -> @kernel.Thm {
  msum_suc_c.get()
}

///|
/// MSUM_BIJECTION
fn step_71() -> Unit raise {
  let t222 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t221 = @tactics.exists_tac(@term_syntax.parse_term("(p : (A) -> A)"))
  let t220 = @tactics.match_mp_tac(msum_eq_general())
  let t219 = @tactics.conv_tac(@equal.sym_conv)
  let t223 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t219), t220), t221), t222)
  msum_bijection_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ p : (A) -> A, ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ y : A, IN(y, s) → existsunique((x : A) => IN(x, s) && p(x) == y)) → msum(s, f) == msum(s, o(f, p))"), t223))
}

///|
let msum_bijection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_BIJECTION")

///|
/// `MSUM_BIJECTION`
pub fn msum_bijection() -> @kernel.Thm {
  msum_bijection_c.get()
}

///|
/// MSUM_PARTIAL_SUC
fn step_72() -> Unit raise {
  let t243 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.add1()), @arith.add_clauses()]))
  let t241 = @int.arith_rule(@term_syntax.parse_term("(n : Num) < SUC(n)"))
  let t242 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.not_lt()), msum_triv_numseg(), t241]))
  let t240 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s235 = @tactics.subst_all_tac(x234)
    fn(x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s235(x236)
    }
  }, fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s238 = @tactics.assume_tac(x237)
    fn(x239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s238(x239)
    }
  }))
  let t231 = @simp.gen_rewrite_rule(fn(x230 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x230
  }, @list.List([@arith.le()]))
  let t233 = @tactics.first_x_assum(fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s228 = @tactics.mp_tac(x227)
      fn(x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s228(x229)
      }
    })(t231(x232))
  })
  let t226 = @list.List([@tactics.thenl(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_simp_tac(@list.List([@calc_num.arith()]))), @list.List([@vectors.matrix_arith_tac, @int.asm_arith_tac])), @tactics.all_tac])
  let t225 = @simp.asm_rewrite_tac(@list.List([msum_clauses_numseg()]))
  let t224 = @simp.asm_simp_tac(@list.List([msum_triv_numseg(), @equal.gsym(@arith.not_le())]))
  let t244 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), @class.cond_cases_tac), t224), t225), t226), t233), t240), t242), t243), @vectors.matrix_arith_tac)
  msum_partial_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (k : Num) => op_pct_pct(f(k), g(k + 1) - g(k))) == (if m <= n { op_pct_pct(f(n + 1), g(n + 1)) - op_pct_pct(f(m), g(m)) - msum(op_dot_dot(m, n), (k : Num) => op_pct_pct(f(k + 1) - f(k), g(k + 1))) } else { mat(0) })"), t244))
}

///|
let msum_partial_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_PARTIAL_SUC")

///|
/// `MSUM_PARTIAL_SUC`
pub fn msum_partial_suc() -> @kernel.Thm {
  msum_partial_suc_c.get()
}

///|
/// MSUM_PARTIAL_PRE
fn step_73() -> Unit raise {
  let t254 = @simp.rewrite_tac(@list.List([]))
  let t253 = @tactics.disch_then(fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s251 = @tactics.subst1_tac(x250)
    fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s251(x252)
    }
  })
  let t249 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t245 = @term_syntax.parse_term("(n : Num)")
  let t246 = @term_syntax.parse_term("(m : Num)")
  let t247 = @term_syntax.parse_term("(k : Num) => (g : (Num) -> Cart[Cart[Real, M], N])(k - 1)")
  let t248 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Real)"), t247, t246, t245]), msum_partial_suc()))
  let t255 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t248), t249), t253), @class.cond_cases_tac), t254)
  msum_partial_pre_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), (k : Num) => op_pct_pct(f(k), g(k) - g(k - 1))) == (if m <= n { op_pct_pct(f(n + 1), g(n)) - op_pct_pct(f(m), g(m - 1)) - msum(op_dot_dot(m, n), (k : Num) => op_pct_pct(f(k + 1) - f(k), g(k))) } else { mat(0) })"), t255))
}

///|
let msum_partial_pre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_PARTIAL_PRE")

///|
/// `MSUM_PARTIAL_PRE`
pub fn msum_partial_pre() -> @kernel.Thm {
  msum_partial_pre_c.get()
}

///|
/// MSUM_COMBINE_L
fn step_74() -> Unit raise {
  let t256 = @simp.simp_tac(@list.List([@iterate.sum_combine_l()]))
  let t257 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component()])), t256)
  msum_combine_l_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, ∀ p : Num, 0 < n && m <= n && n <= p + 1 → msum(op_dot_dot(m, n - 1), f) + msum(op_dot_dot(n, p), f) == msum(op_dot_dot(m, p), f)"), t257))
}

///|
let msum_combine_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_COMBINE_L")

///|
/// `MSUM_COMBINE_L`
pub fn msum_combine_l() -> @kernel.Thm {
  msum_combine_l_c.get()
}

///|
/// MSUM_COMBINE_R
fn step_75() -> Unit raise {
  let t258 = @simp.simp_tac(@list.List([@iterate.sum_combine_r()]))
  let t259 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component()])), t258)
  msum_combine_r_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, ∀ p : Num, m <= n + 1 && n <= p → msum(op_dot_dot(m, n), f) + msum(op_dot_dot(n + 1, p), f) == msum(op_dot_dot(m, p), f)"), t259))
}

///|
let msum_combine_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_COMBINE_R")

///|
/// `MSUM_COMBINE_R`
pub fn msum_combine_r() -> @kernel.Thm {
  msum_combine_r_c.get()
}

///|
/// MSUM_INJECTION
fn step_76() -> Unit raise {
  let t267 = @simp.simp_tac(@list.List([]))
  let t266 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @trivia.o_def()]))
  let t263 = @drule.match_mp(@iterate.sum_injection())
  let t265 = @tactics.disch_then(fn(x264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s261 = @tactics.mp_tac(x260)
      fn(x262 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s261(x262)
      }
    })(t263(x264))
  })
  let t268 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t265), t266), t267)
  msum_injection_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ p : (A) -> A, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, IN(x, s) → IN(p(x), s)) && (∀ x : A, ∀ y : A, IN(x, s) && IN(y, s) && p(x) == p(y) → x == y) → msum(s, o(f, p)) == msum(s, f)"), t268))
}

///|
let msum_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_INJECTION")

///|
/// `MSUM_INJECTION`
pub fn msum_injection() -> @kernel.Thm {
  msum_injection_c.get()
}

///|
/// MSUM_SWAP
fn step_77() -> Unit raise {
  let t280 = @simp.asm_rewrite_tac(@list.List([]))
  let t274 = @drule.part_match(fn(x273 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x273))
  }, @iterate.sum_swap())
  let t269 = @tactics.repeat_tac(@tactics.strip_tac)
  let t281 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component()])), t269), fn(x279 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x276 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x275 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s271 = @tactics.mp_tac(x270)
            fn(x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s271(x272)
            }
          })(t274(x275))
        })(@equal.lhs(x276))
      })((fn(x277 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x277.1
      })(x278))
    })(x279)(x279)
  }), t280)
  msum_swap_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) → msum(s, (i : A) => msum(t, f(i))) == msum(t, (j : B) => msum(s, (i : A) => f(i, j)))"), t281))
}

///|
let msum_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SWAP")

///|
/// `MSUM_SWAP`
pub fn msum_swap() -> @kernel.Thm {
  msum_swap_c.get()
}

///|
/// MSUM_SWAP_NUMSEG
fn step_78() -> Unit raise {
  let t283 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t282 = @tactics.match_mp_tac(msum_swap())
  let t284 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t282), t283)
  msum_swap_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ d : Num, ∀ f : (Num, Num) -> Cart[Cart[Real, M], N], msum(op_dot_dot(a, b), (i : Num) => msum(op_dot_dot(c, d), f(i))) == msum(op_dot_dot(c, d), (j : Num) => msum(op_dot_dot(a, b), (i : Num) => f(i, j)))"), t284))
}

///|
let msum_swap_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SWAP_NUMSEG")

///|
/// `MSUM_SWAP_NUMSEG`
pub fn msum_swap_numseg() -> @kernel.Thm {
  msum_swap_numseg_c.get()
}

///|
/// MSUM_ADD_GEN
fn step_79() -> Unit raise {
  let t298 = @simp.asm_rewrite_tac(@list.List([@vectors.mat_0_component()]))
  let t297 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t296 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t295 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t294 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t293 = @tactics.match_mp_tac(@theorems.mono_and())
  let t292 = @tactics.pop_assum(fn(x289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s290 = @tactics.mp_tac(x289)
    fn(x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s290(x291)
    }
  })
  let t288 = @tactics.match_mp_tac(@iterate.sum_add_gen())
  let t287 = @tactics.repeat_tac(@tactics.gen_tac)
  let t286 = @simp.simp_tac(@list.List([@cart.cart_eq(), msum(), @cart.lambda_beta(), @vectors.matrix_add_component()]))
  let t285 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component()]))
  let t299 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t285), t286), t287), t288), t292), t293), @tactics.conj_tac), t294), t295), @tactics.gen_tac), t296), t297), @tactics.strip_tac), t298)
  msum_add_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Cart[Real, M], N], ∀ g : (A) -> Cart[Cart[Real, M], N], ∀ s : (A) -> Bool, FINITE({(x : A) | IN(x, s) && !(f(x) == mat(0))}) && FINITE({(x : A) | IN(x, s) && !(g(x) == mat(0))}) → msum(s, (x : A) => f(x) + g(x)) == msum(s, f) + msum(s, g)"), t299))
}

///|
let msum_add_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_ADD_GEN")

///|
/// `MSUM_ADD_GEN`
pub fn msum_add_gen() -> @kernel.Thm {
  msum_add_gen_c.get()
}

///|
/// MSUM_CASES_1
fn step_80() -> Unit raise {
  let t303 = @simp.rewrite_tac(@list.List([msum_sing()]))
  let t302 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("IN((a : A), (s : (A) -> Bool)) → {(x : A) | IN(x, s) && x == a} == {a}"))]))
  let t301 = @simp.asm_simp_tac(@list.List([@equal.gsym(@sets.delete()), msum_delete()]))
  let t300 = @simp.asm_simp_tac(@list.List([msum_cases()]))
  let t304 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t300), t301), t302), t303), @vectors.matrix_arith_tac)
  msum_cases_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ a : A, FINITE(s) && IN(a, s) → msum(s, (x : A) => if x == a { (y : Cart[Cart[Real, M], N]) } else { (f : (A) -> Cart[Cart[Real, M], N])(x) }) == msum(s, f) + (y - f(a))"), t304))
}

///|
let msum_cases_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_CASES_1")

///|
/// `MSUM_CASES_1`
pub fn msum_cases_1() -> @kernel.Thm {
  msum_cases_1_c.get()
}

///|
/// MSUM_SING_NUMSEG
fn step_81() -> Unit raise {
  let t305 = @simp.rewrite_tac(@list.List([@iterate.numseg_sing(), msum_sing()]))
  msum_sing_numseg_c.set(@tactics.prove(@term_syntax.parse_term("msum(op_dot_dot((n : Num), n), (f : (Num) -> Cart[Cart[Real, M], N])) == f(n)"), t305))
}

///|
let msum_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_SING_NUMSEG")

///|
/// `MSUM_SING_NUMSEG`
pub fn msum_sing_numseg() -> @kernel.Thm {
  msum_sing_numseg_c.get()
}

///|
/// MSUM_1
fn step_82() -> Unit raise {
  let t306 = @simp.rewrite_tac(@list.List([msum_sing_numseg()]))
  msum_1_c.set(@tactics.prove(@term_syntax.parse_term("msum(op_dot_dot(1, 1), (f : (Num) -> Cart[Cart[Real, M], N])) == f(1)"), t306))
}

///|
let msum_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_1")

///|
/// `MSUM_1`
pub fn msum_1() -> @kernel.Thm {
  msum_1_c.get()
}

///|
/// MSUM_2
fn step_83() -> Unit raise {
  let t307 = @simp.rewrite_tac(@list.List([msum_sing_numseg(), @calc_num.arith(), @realax.real_add_assoc()]))
  let t308 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), msum_clauses_numseg()])), t307)
  msum_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (Num) -> Cart[Cart[Real, M], N], msum(op_dot_dot(1, 2), t) == t(1) + t(2)"), t308))
}

///|
let msum_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_2")

///|
/// `MSUM_2`
pub fn msum_2() -> @kernel.Thm {
  msum_2_c.get()
}

///|
/// MSUM_3
fn step_84() -> Unit raise {
  let t310 = @simp.rewrite_tac(@list.List([msum_sing_numseg(), @calc_num.arith(), @vectors.matrix_add_assoc()]))
  let t309 = @calc_num.num_conv(@term_syntax.parse_term("2"))
  let t311 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("3")), t309, msum_clauses_numseg()])), t310)
  msum_3_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (Num) -> Cart[Cart[Real, M], N], msum(op_dot_dot(1, 3), t) == t(1) + (t(2) + t(3))"), t311))
}

///|
let msum_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_3")

///|
/// `MSUM_3`
pub fn msum_3() -> @kernel.Thm {
  msum_3_c.get()
}

///|
/// MSUM_4
fn step_85() -> Unit raise {
  let t314 = @simp.rewrite_tac(@list.List([msum_sing_numseg(), @calc_num.arith(), @vectors.matrix_add_assoc()]))
  let t312 = @calc_num.num_conv(@term_syntax.parse_term("2"))
  let t313 = @calc_num.num_conv(@term_syntax.parse_term("3"))
  let t315 = @tactics.then_tac(@simp.simp_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("4")), t313, t312, msum_clauses_numseg()])), t314)
  msum_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (Num) -> Cart[Cart[Real, M], N], msum(op_dot_dot(1, 4), t) == t(1) + (t(2) + (t(3) + t(4)))"), t315))
}

///|
let msum_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_4")

///|
/// `MSUM_4`
pub fn msum_4() -> @kernel.Thm {
  msum_4_c.get()
}

///|
/// MSUM_PAIR
fn step_86() -> Unit raise {
  let t316 = @simp.rewrite_tac(@list.List([@cart.cart_eq_full(), msum_component(), @vectors.matrix_add_component(), @iterate.sum_pair()]))
  msum_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(2 * m, 2 * n + 1), f) == msum(op_dot_dot(m, n), (i : Num) => f(2 * i) + f(2 * i + 1))"), t316))
}

///|
let msum_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_PAIR")

///|
/// `MSUM_PAIR`
pub fn msum_pair() -> @kernel.Thm {
  msum_pair_c.get()
}

///|
/// MSUM_PAIR_0
fn step_87() -> Unit raise {
  let t320 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t317 = @term_syntax.parse_term("(n : Num)")
  let t318 = @term_syntax.parse_term("0")
  let t319 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Cart[Real, M], N])"), t318, t317]), msum_pair()))
  let t321 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t319), t320)
  msum_pair_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Cart[Real, M], N], ∀ n : Num, msum(op_dot_dot(0, 2 * n + 1), f) == msum(op_dot_dot(0, n), (i : Num) => f(2 * i) + f(2 * i + 1))"), t321))
}

///|
let msum_pair_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_PAIR_0")

///|
/// `MSUM_PAIR_0`
pub fn msum_pair_0() -> @kernel.Thm {
  msum_pair_0_c.get()
}

///|
/// MSUM_REFLECT
fn step_88() -> Unit raise {
  let t327 = @simp.rewrite_tac(@list.List([neutral_matrix_add()]))
  let t326 = @simp.gen_rewrite_tac(fn(x323 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s324 = @equal.land_conv(x323)
    fn(x325 : @kernel.Term) -> @kernel.Thm raise {
      s324(x325)
    }
  }, @list.List([@drule.match_mp(@iterate.iterate_reflect())(monoidal_matrix_add())]))
  let t322 = @simp.simp_tac(@list.List([msum_v1(), @iterate.finite_numseg()]))
  let t328 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t322), t326), t327)
  msum_reflect_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Cart[Real, M], N], ∀ m : Num, ∀ n : Num, msum(op_dot_dot(m, n), x) == (if n < m { mat(0) } else { msum(op_dot_dot(0, n - m), (i : Num) => x(n - i)) })"), t328))
}

///|
let msum_reflect_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSUM_REFLECT")

///|
/// `MSUM_REFLECT`
pub fn msum_reflect() -> @kernel.Thm {
  msum_reflect_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
}
