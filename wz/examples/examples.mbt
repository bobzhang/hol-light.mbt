// Translated from upstream WZ/examples.ml; edit this file directly.

///|
/// WZ_EXAMPLE_1
fn step_1() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((n, k))) / spow(real_of_num(2), real_of_num(n)))")
  let atm = @list.List([])
  wz_example_1_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_1")

///|
/// `WZ_EXAMPLE_1`
pub fn wz_example_1() -> @kernel.Thm {
  wz_example_1_c.get()
}

///|
/// WZ_EXAMPLE_2
fn step_2() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(real_of_num(binom((n, k))), 2) / real_of_num(binom((2 * n, n))))")
  let atm = @list.List([])
  wz_example_2_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_2")

///|
/// `WZ_EXAMPLE_2`
pub fn wz_example_2() -> @kernel.Thm {
  wz_example_2_c.get()
}

///|
/// WZ_EXAMPLE_3
fn step_3() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((n, k))) * (real_of_num(binom(((m : Num), k + (p : Num)))) / real_of_num(binom((n + m, n + p)))))")
  let atm = @list.List([@term_syntax.parse_term("real_of_num((p : Num)) <= real_of_num((m : Num))")])
  wz_example_3_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_3")

///|
/// `WZ_EXAMPLE_3`
pub fn wz_example_3() -> @kernel.Thm {
  wz_example_3_c.get()
}

///|
/// WZ_EXAMPLE_4
fn step_4() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num) + 1), (k : Num) => real_of_num(binom((n + 1, k + 1))) * ((real_of_num(k) + real_of_num(1)) * ((real_of_num(k) + real_of_num(1)) * (real_of_num(FACT(k)) / spow(real_of_num(n) + real_of_num(1), real_of_num(k) + real_of_num(1))))))")
  let atm = @list.List([])
  wz_example_4_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_4")

///|
/// `WZ_EXAMPLE_4`
pub fn wz_example_4() -> @kernel.Thm {
  wz_example_4_c.get()
}

///|
/// WZ_EXAMPLE_5
fn step_5() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) * (real_of_num(binom((2 * k, k))) * (spow(real_of_num(4), real_of_num(n)) / spow(real_of_num(4), real_of_num(k))))) / real_of_num(binom((2 * n, n))))")
  let atm = @list.List([])
  wz_example_5_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_5")

///|
/// `WZ_EXAMPLE_5`
pub fn wz_example_5() -> @kernel.Thm {
  wz_example_5_c.get()
}

///|
/// WZ_EXAMPLE_6
fn step_6() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num) + 1), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * real_of_num(binom((n + 1, k))))")
  let atm = @list.List([])
  wz_example_6_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_6")

///|
/// `WZ_EXAMPLE_6`
pub fn wz_example_6() -> @kernel.Thm {
  wz_example_6_c.get()
}

///|
/// WZ_EXAMPLE_7
fn step_7() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(real_of_num(binom((n + k, k))), 2) * pow(real_of_num(binom((n, k))), 2))")
  let atm = @list.List([])
  wz_example_7_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_7")

///|
/// `WZ_EXAMPLE_7`
pub fn wz_example_7() -> @kernel.Thm {
  wz_example_7_c.get()
}

///|
/// WZ_EXAMPLE_8
fn step_8() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, 2 * (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * pow(real_of_num(binom((2 * n, k))), 3) / (spow(-real_of_num(1), real_of_num(n)) * (real_of_num(FACT(3 * n)) / pow(real_of_num(FACT(n)), 3))))")
  let atm = @list.List([])
  wz_example_8_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_8")

///|
/// `WZ_EXAMPLE_8`
pub fn wz_example_8() -> @kernel.Thm {
  wz_example_8_c.get()
}

///|
/// WZ_EXAMPLE_9
fn step_9() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(real_of_num(binom((n, k))), 3))")
  let atm = @list.List([])
  wz_example_9_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_9")

///|
/// `WZ_EXAMPLE_9`
pub fn wz_example_9() -> @kernel.Thm {
  wz_example_9_c.get()
}

///|
/// WZ_EXAMPLE_10
fn step_10() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => (real_of_num(1) - real_of_num(2) * real_of_num(n)) * (spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) * spow(real_of_num(4), real_of_num(k))) / real_of_num(binom((2 * k, k)))))")
  let atm = @list.List([])
  wz_example_10_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_10")

///|
/// `WZ_EXAMPLE_10`
pub fn wz_example_10() -> @kernel.Thm {
  wz_example_10_c.get()
}

///|
/// WZ_EXAMPLE_11
fn step_11() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) / real_of_num(FACT(k))))")
  let atm = @list.List([])
  wz_example_11_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_11")

///|
/// `WZ_EXAMPLE_11`
pub fn wz_example_11() -> @kernel.Thm {
  wz_example_11_c.get()
}

///|
/// WZ_EXAMPLE_12
fn step_12() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(UNIV, (k : Num) => spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom(((a : Num) + (n : Num), a + k))) * (real_of_num(binom((a + (c : Num), c + k))) * real_of_num(binom((n + c, n + k)))) / (real_of_num(FACT(a + (n + c))) / (real_of_num(FACT(a)) * (real_of_num(FACT(n)) * real_of_num(FACT(c)))))))")
  let atm = @list.List([])
  wz_example_12_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_12_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_12")

///|
/// `WZ_EXAMPLE_12`
pub fn wz_example_12() -> @kernel.Thm {
  wz_example_12_c.get()
}

///|
/// WZ_EXAMPLE_13
fn step_13() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(UNIV, (k : Num) => spow(-real_of_num(1), real_of_num(k)) * pow(real_of_num(binom((2 * (n : Num), k))), 2) / (spow(-real_of_num(1), real_of_num(n)) * real_of_num(binom((2 * n, n)))))")
  let atm = @list.List([])
  wz_example_13_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_13_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_13")

///|
/// `WZ_EXAMPLE_13`
pub fn wz_example_13() -> @kernel.Thm {
  wz_example_13_c.get()
}

///|
/// WZ_EXAMPLE_14
fn step_14() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num) + 1), (k : Num) => real_of_num(k) * (real_of_num(binom((n + 1, k))) / ((real_of_num(n) + real_of_num(1)) * spow(real_of_num(2), real_of_num(n)))))")
  let atm = @list.List([])
  wz_example_14_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_14_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_14")

///|
/// `WZ_EXAMPLE_14`
pub fn wz_example_14() -> @kernel.Thm {
  wz_example_14_c.get()
}

///|
/// WZ_EXAMPLE_15
fn step_15() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num) + 1), (k : Num) => real_of_num(binom((n + (1 + k), 2 * k))) * (real_of_num(binom((2 * k, k))) * (spow(-real_of_num(1), real_of_num(k)) / (real_of_num(k) + real_of_num(1)))))")
  let atm = @list.List([])
  wz_example_15_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_15_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_15")

///|
/// `WZ_EXAMPLE_15`
pub fn wz_example_15() -> @kernel.Thm {
  wz_example_15_c.get()
}

///|
/// WZ_EXAMPLE_16
fn step_16() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(UNIV, (k : Num) => (real_of_num((n : Num)) + real_of_num(2)) / (real_of_num(2) * real_of_num(k) + real_of_num(1)) * (real_of_num(binom((n, 2 * k))) * (spow(real_of_num(2), real_of_num(n) - real_of_num(2) * real_of_num(k) - real_of_num(1)) * (real_of_num(binom((2 * k + 1, k))) / real_of_num(binom((2 * n + 1, n)))))))")
  let atm = @list.List([])
  wz_example_16_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_16_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_16")

///|
/// `WZ_EXAMPLE_16`
pub fn wz_example_16() -> @kernel.Thm {
  wz_example_16_c.get()
}

///|
/// WZ_EXAMPLE_17
fn step_17() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(UNIV, (k : Num) => real_of_num(binom((2 * (n : Num) + 1, 2 * k))) * (spow(real_of_num(3), real_of_num(k)) / spow(real_of_num(2), real_of_num(n))))")
  let atm = @list.List([])
  wz_example_17_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_17_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_17")

///|
/// `WZ_EXAMPLE_17`
pub fn wz_example_17() -> @kernel.Thm {
  wz_example_17_c.get()
}

///|
/// WZ_EXAMPLE_18
fn step_18() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(real_of_num(binom((n, k))), 2) * real_of_num(binom((2 * k, n))))")
  let atm = @list.List([])
  wz_example_18_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_18_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_18")

///|
/// `WZ_EXAMPLE_18`
pub fn wz_example_18() -> @kernel.Thm {
  wz_example_18_c.get()
}

///|
/// WZ_EXAMPLE_19
fn step_19() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) * (real_of_num(binom((n + (x : Num), n))) * (real_of_num(x) / (real_of_num(k) + real_of_num(x))))))")
  let atm = @list.List([@term_syntax.parse_term("!(real_of_num((x : Num)) == real_of_num(0))")])
  wz_example_19_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_19_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_19")

///|
/// `WZ_EXAMPLE_19`
pub fn wz_example_19() -> @kernel.Thm {
  wz_example_19_c.get()
}

///|
/// WZ_EXAMPLE_20
fn step_20() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((n, k))) * (real_of_num(FACT(k)) * real_of_num(FACT(k))))")
  let atm = @list.List([])
  wz_example_20_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_20_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_20")

///|
/// `WZ_EXAMPLE_20`
pub fn wz_example_20() -> @kernel.Thm {
  wz_example_20_c.get()
}

///|
/// WZ_EXAMPLE_21
fn step_21() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((n, k))) * (spow((x : Real), real_of_num(k)) / spow(x + real_of_num(1), real_of_num(n))))")
  let atm = @list.List([@term_syntax.parse_term("!((x : Real) + real_of_num(1) == real_of_num(0))")])
  wz_example_21_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_21_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_21")

///|
/// `WZ_EXAMPLE_21`
pub fn wz_example_21() -> @kernel.Thm {
  wz_example_21_c.get()
}

///|
/// WZ_EXAMPLE_22
fn step_22() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((n, 2 * k))) * (real_of_num(2) / spow(real_of_num(2), real_of_num(n))))")
  let atm = @list.List([@term_syntax.parse_term("!((n : Num) == 0)")])
  wz_example_22_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_22_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_22")

///|
/// `WZ_EXAMPLE_22`
pub fn wz_example_22() -> @kernel.Thm {
  wz_example_22_c.get()
}

///|
/// WZ_EXAMPLE_23
fn step_23() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((2 * n + 1, 2 * k + 1))) / spow(real_of_num(2), real_of_num(2) * real_of_num(n) + real_of_num(1)))")
  let atm = @list.List([])
  wz_example_23_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_23_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_23")

///|
/// `WZ_EXAMPLE_23`
pub fn wz_example_23() -> @kernel.Thm {
  wz_example_23_c.get()
}

///|
/// WZ_EXAMPLE_24
fn step_24() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((n, 2 * k))) * (real_of_num(binom((2 * k, k))) * spow(real_of_num(2), real_of_num(n))) / (spow(real_of_num(4), real_of_num(k)) * real_of_num(binom((2 * n, n)))))")
  let atm = @list.List([])
  wz_example_24_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_24_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_24")

///|
/// `WZ_EXAMPLE_24`
pub fn wz_example_24() -> @kernel.Thm {
  wz_example_24_c.get()
}

///|
/// WZ_EXAMPLE_25
fn step_25() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(real_of_num(binom((n, k))), 2) * (real_of_num(binom(((p : Num) + k, 2 * n))) / pow(real_of_num(binom((p, n))), 2)))")
  let atm = @list.List([@term_syntax.parse_term("(n : Num) < (p : Num)")])
  wz_example_25_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_25_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_25")

///|
/// `WZ_EXAMPLE_25`
pub fn wz_example_25() -> @kernel.Thm {
  wz_example_25_c.get()
}

///|
/// WZ_EXAMPLE_26
fn step_26() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(real_of_num(binom((n, k))), 4))")
  let atm = @list.List([])
  wz_example_26_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_26_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_26")

///|
/// `WZ_EXAMPLE_26`
pub fn wz_example_26() -> @kernel.Thm {
  wz_example_26_c.get()
}

///|
/// WZ_EXAMPLE_27
fn step_27() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => (real_of_num(2) * real_of_num(n) + real_of_num(1)) / spow(real_of_num(4), real_of_num(n)) * (real_of_num(binom((2 * n, n))) * (spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) * (spow(real_of_num(2), real_of_num(k)) / (real_of_num(2) * real_of_num(k) + real_of_num(1)))))))")
  let atm = @list.List([])
  wz_example_27_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_27_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_27")

///|
/// `WZ_EXAMPLE_27`
pub fn wz_example_27() -> @kernel.Thm {
  wz_example_27_c.get()
}

///|
/// WZ_EXAMPLE_28
fn step_28() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => (real_of_num(n) + (real_of_num((m : Num)) + real_of_num(1))) * (real_of_num(binom((n + m, m))) * (spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) / (real_of_num(m) + (real_of_num(k) + real_of_num(1)))))))")
  let atm = @list.List([])
  wz_example_28_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_28_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_28")

///|
/// `WZ_EXAMPLE_28`
pub fn wz_example_28() -> @kernel.Thm {
  wz_example_28_c.get()
}

///|
/// WZ_EXAMPLE_29
fn step_29() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((2 * n + 1, 2 * k))) * (real_of_num(binom((2 * k, k))) / spow(real_of_num(4), real_of_num(k))) / (real_of_num(binom((4 * n + 1, 2 * n))) / spow(real_of_num(4), real_of_num(n))))")
  let atm = @list.List([])
  wz_example_29_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_29_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_29")

///|
/// `WZ_EXAMPLE_29`
pub fn wz_example_29() -> @kernel.Thm {
  wz_example_29_c.get()
}

///|
/// WZ_EXAMPLE_30
fn step_30() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((n, k))) * (real_of_num(binom((k, (j : Num)))) / (real_of_num(binom((n, j))) * spow(real_of_num(2), real_of_num(n) - real_of_num(j)))))")
  let atm = @list.List([@term_syntax.parse_term("(j : Num) <= (n : Num)")])
  wz_example_30_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_30_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_30")

///|
/// `WZ_EXAMPLE_30`
pub fn wz_example_30() -> @kernel.Thm {
  wz_example_30_c.get()
}

///|
/// WZ_EXAMPLE_31
fn step_31() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(n) - real_of_num(k)) * (spow(real_of_num(4), real_of_num(k)) * real_of_num(binom((n + (k + 1), 2 * k + 1)))) / (real_of_num(n) + real_of_num(1)))")
  let atm = @list.List([])
  wz_example_31_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_31_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_31")

///|
/// `WZ_EXAMPLE_31`
pub fn wz_example_31() -> @kernel.Thm {
  wz_example_31_c.get()
}

///|
/// WZ_EXAMPLE_32
fn step_32() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k) + real_of_num((d : Num))) * (real_of_num(binom((d, k))) * (real_of_num(binom((n + k, (p : Num) + k))) / real_of_num(binom((n, p + d))))))")
  let atm = @list.List([@term_syntax.parse_term("(p : Num) + (d : Num) <= (n : Num)")])
  wz_example_32_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_32_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_32")

///|
/// `WZ_EXAMPLE_32`
pub fn wz_example_32() -> @kernel.Thm {
  wz_example_32_c.get()
}

///|
/// WZ_EXAMPLE_33
fn step_33() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(UNIV, (k : Num) => real_of_num(binom(((p : Num), k))) * (real_of_num(binom(((q : Num), k))) * (real_of_num(binom(((n : Num) + k, p + q))) / (real_of_num(binom((n, p))) * real_of_num(binom((n, q)))))))")
  let t1 = @term_syntax.parse_term("(q : Num) <= (n : Num)")
  let atm = @list.List([@term_syntax.parse_term("(p : Num) <= (n : Num)"), t1])
  wz_example_33_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_33_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_33")

///|
/// `WZ_EXAMPLE_33`
pub fn wz_example_33() -> @kernel.Thm {
  wz_example_33_c.get()
}

///|
/// WZ_EXAMPLE_34
fn step_34() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((2 * n + 1, 2 * k))) * (real_of_num(binom(((m : Num) + k, 2 * n))) / real_of_num(binom((2 * m + 1, 2 * n)))))")
  let atm = @list.List([@term_syntax.parse_term("(n : Num) < (m : Num)")])
  wz_example_34_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_34_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_34")

///|
/// `WZ_EXAMPLE_34`
pub fn wz_example_34() -> @kernel.Thm {
  wz_example_34_c.get()
}

///|
/// WZ_EXAMPLE_35
fn step_35() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(UNIV, (k : Num) => spow(-real_of_num(1), real_of_num(k) + real_of_num(1)) * (real_of_num(binom(((n : Num), k + 1))) / (real_of_num(k) + real_of_num(1))))")
  let atm = @list.List([@term_syntax.parse_term("!(real_of_num((n : Num)) == real_of_num(0))")])
  wz_example_35_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_35_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_35")

///|
/// `WZ_EXAMPLE_35`
pub fn wz_example_35() -> @kernel.Thm {
  wz_example_35_c.get()
}

///|
/// WZ_EXAMPLE_36
fn step_36() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * real_of_num(binom((2 * n + 1, 2 * k))))")
  let atm = @list.List([])
  wz_example_36_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_36_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_36")

///|
/// `WZ_EXAMPLE_36`
pub fn wz_example_36() -> @kernel.Thm {
  wz_example_36_c.get()
}

///|
/// WZ_EXAMPLE_37
fn step_37() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(binom((2 * n + 1, 2 * k + 1))) * (real_of_num(k) / ((real_of_num(2) * real_of_num(n) - real_of_num(1)) * spow(real_of_num(4), real_of_num(n) - real_of_num(1)))))")
  let atm = @list.List([])
  wz_example_37_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_37_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_37")

///|
/// `WZ_EXAMPLE_37`
pub fn wz_example_37() -> @kernel.Thm {
  wz_example_37_c.get()
}

///|
/// WZ_EXAMPLE_38
fn step_38() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(UNIV, (k : Num) => spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom(((x : Num), k))) * rbinom((real_of_num(x), real_of_num(2) * real_of_num((n : Num)) - real_of_num(k)))) / (spow(-real_of_num(1), real_of_num(n)) * real_of_num(binom((x, n)))))")
  let atm = @list.List([@term_syntax.parse_term("(n : Num) < (x : Num)")])
  wz_example_38_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_38_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_38")

///|
/// `WZ_EXAMPLE_38`
pub fn wz_example_38() -> @kernel.Thm {
  wz_example_38_c.get()
}

///|
/// WZ_EXAMPLE_39
fn step_39() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => real_of_num(n) * (spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) * (real_of_num(binom((n + k, k))) * spow(real_of_num(4), real_of_num(k))))) / (spow(-real_of_num(1), real_of_num(n)) * (real_of_num(binom((2 * k, k))) * (real_of_num(n) + real_of_num(k)))))")
  let atm = @list.List([@term_syntax.parse_term("0 < (n : Num)")])
  wz_example_39_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_39_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_39")

///|
/// `WZ_EXAMPLE_39`
pub fn wz_example_39() -> @kernel.Thm {
  wz_example_39_c.get()
}

///|
/// WZ_EXAMPLE_40
fn step_40() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, 2 * (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((2 * n, k))) * (real_of_num(binom((2 * n + 2 * k, n + k))) * spow(real_of_num(2), real_of_num(2) * real_of_num(n) - real_of_num(k)))) / real_of_num(binom((2 * n, n))))")
  let atm = @list.List([])
  wz_example_40_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_40_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_40")

///|
/// `WZ_EXAMPLE_40`
pub fn wz_example_40() -> @kernel.Thm {
  wz_example_40_c.get()
}

///|
/// WZ_EXAMPLE_41
fn step_41() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => spow(-real_of_num(1), real_of_num(k)) * (real_of_num(binom((n, k))) * real_of_num(binom(((x : Num) + k, (r : Num) + k)))) / (spow(-real_of_num(1), real_of_num(n)) * real_of_num(binom((x, n + r)))))")
  let atm = @list.List([@term_syntax.parse_term("(n : Num) + (r : Num) < (x : Num)")])
  wz_example_41_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_41_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_41")

///|
/// `WZ_EXAMPLE_41`
pub fn wz_example_41() -> @kernel.Thm {
  wz_example_41_c.get()
}

///|
/// WZ_EXAMPLE_42
fn step_42() -> Unit raise {
  let ntm = @term_syntax.parse_term("(n : Num)")
  let stm = @term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(real_of_num(binom((n, k))), 2) * real_of_num(binom((3 * n + k, 2 * n))) / pow(real_of_num(binom((3 * n, n))), 2))")
  let atm = @list.List([])
  wz_example_42_c.set(@maxima.wz_maxima_prove(ntm, stm, atm))
}

///|
let wz_example_42_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WZ_EXAMPLE_42")

///|
/// `WZ_EXAMPLE_42`
pub fn wz_example_42() -> @kernel.Thm {
  wz_example_42_c.get()
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
}
