// Formal_ineqs/trig/series.hl in its directory's load order: the test block of
// formal_ineqs/trig/series/series_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_trig_series_ref.expected).

///|
test "Formal_ineqs/trig/series matches Formal_ineqs/trig/series.ml" {
  @testkit.release_output()
  @series.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/trig/series"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/trig/series")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Series.real_infsum_offset", () => {
    sthm(@series.real_infsum_offset())
  })
  log.attempt("Series.real_infsum_offset_alt", () => {
    sthm(@series.real_infsum_offset_alt())
  })
  log.attempt("Series.power_series_simple_bound", () => {
    sthm(@series.power_series_simple_bound())
  })
  log.attempt("Series.power_series_simple_bound2", () => {
    sthm(@series.power_series_simple_bound2())
  })
  log.attempt("Series.real_sums_simple_bound", () => {
    sthm(@series.real_sums_simple_bound())
  })
  log.attempt("Series.real_sums_simple_bound2", () => {
    sthm(@series.real_sums_simple_bound2())
  })
  log.attempt("Series.abs_sum_lemma_pos", () => {
    sthm(@series.abs_sum_lemma_pos())
  })
  log.attempt("Series.abs_sum_lemma_neg", () => {
    sthm(@series.abs_sum_lemma_neg())
  })
  log.attempt("Series.sign_mul_lemma", () => sthm(@series.sign_mul_lemma()))
  log.attempt("Series.sum_bound_lemma", () => sthm(@series.sum_bound_lemma()))
  log.attempt("Series.alt_sign_converges", () => {
    sthm(@series.alt_sign_converges())
  })
  log.attempt("Series.alt_sign_summable", () => {
    sthm(@series.alt_sign_summable())
  })
  log.attempt("Series.alt_sign_converges2", () => {
    sthm(@series.alt_sign_converges2())
  })
  log.attempt("Series.alt_sign_bound", () => sthm(@series.alt_sign_bound()))
  log.attempt("Series.alt_sign_abs_bound", () => {
    sthm(@series.alt_sign_abs_bound())
  })
  log.attempt("Series.alt_sign_upper_bound", () => {
    sthm(@series.alt_sign_upper_bound())
  })
  log.attempt("Series.alt_sign_lower_bound", () => {
    sthm(@series.alt_sign_lower_bound())
  })
  log.attempt("Series.abs_neg_pow", () => sthm(@series.abs_neg_pow_v1()))
  log.attempt("Series.abs_neg_one_pow", () => sthm(@series.abs_neg_one_pow_v1()))
  log.attempt("Series.integral_uniform_limit", () => {
    sthm(@series.integral_uniform_limit())
  })
  log.attempt("Series.integral_series", () => sthm(@series.integral_series()))
  log.attempt("Series.power_series_uniform", () => {
    sthm(@series.power_series_uniform())
  })
  log.attempt("Series.has_real_integral_pow_pos", () => {
    sthm(@series.has_real_integral_pow_pos())
  })
  log.attempt("Series.has_real_integral_pow_neg", () => {
    sthm(@series.has_real_integral_pow_neg())
  })
  log.attempt("Series.power_series_integral", () => {
    sthm(@series.power_series_integral())
  })
  log.attempt("Series.power_series_integral2", () => {
    sthm(@series.power_series_integral2())
  })
  log.attempt("Series.strict_increasing_num_le", () => {
    sthm(@series.strict_increasing_num_le())
  })
  log.attempt("Series.strict_increasing_num_lt", () => {
    sthm(@series.strict_increasing_num_lt())
  })
  log.attempt("Series.strict_increasing_num_inj", () => {
    sthm(@series.strict_increasing_num_inj())
  })
  log.attempt("Series.strict_increasing_num_le_eq", () => {
    sthm(@series.strict_increasing_num_le_eq())
  })
  log.attempt("Series.strict_increasing_num_lt_eq", () => {
    sthm(@series.strict_increasing_num_lt_eq())
  })
  log.attempt("Series.strict_increasing_num_le2", () => {
    sthm(@series.strict_increasing_num_le2())
  })
  log.attempt("Series.real_sums_image", () => sthm(@series.real_sums_image()))
  log.attempt("Series.real_summable_image", () => {
    sthm(@series.real_summable_image())
  })
  log.attempt("Series.real_sums_image_odd", () => {
    sthm(@series.real_sums_image_odd())
  })
  log.attempt("Series.real_sums_image_even", () => {
    sthm(@series.real_sums_image_even())
  })
  log.attempt("Series.n_le_pow_lemma", () => sthm(@series.n_le_pow_lemma()))
  log.attempt("Series.real_summable_lmul_eq", () => {
    sthm(@series.real_summable_lmul_eq())
  })
  log.attempt("Series.summable_power_series_shift", () => {
    sthm(@series.summable_power_series_shift())
  })
  log.attempt("Series.power_sum_derivative_shift_lemma", () => {
    sthm(@series.power_sum_derivative_shift_lemma())
  })
  log.attempt("Series.power_sum_derivative_shift_lemma2", () => {
    sthm(@series.power_sum_derivative_shift_lemma2())
  })
  log.attempt("Series.power_sum_derivative_shift_lemma3", () => {
    sthm(@series.power_sum_derivative_shift_lemma3())
  })
  log.attempt("Series.power_series_derivative_shift_lemma", () => {
    sthm(@series.power_series_derivative_shift_lemma())
  })
  log.attempt("Series.power_series_derivative_shift", () => {
    sthm(@series.power_series_derivative_shift())
  })
  log.attempt("Series.summable_power_series_derivative", () => {
    sthm(@series.summable_power_series_derivative())
  })
  log.attempt("Series.power_series_has_derivative", () => {
    sthm(@series.power_series_has_derivative())
  })
  log.attempt("Series.power_series_has_derivative2", () => {
    sthm(@series.power_series_has_derivative2())
  })
  log.attempt("Series.real_sums_i_xi", () => sthm(@series.real_sums_i_xi()))
  log.attempt("Series.real_sums_neg_i_xi", () => {
    sthm(@series.real_sums_neg_i_xi())
  })
  log.attempt("Series.real_sums_neg_xi", () => sthm(@series.real_sums_neg_xi()))
  log.attempt("Series.exp_series", () => sthm(@series.exp_series()))
  log.attempt("Series.exp_infsum", () => sthm(@series.exp_infsum()))
  log.attempt("Series.log_derivative_series", () => {
    sthm(@series.log_derivative_series())
  })
  log.attempt("Series.log_series", () => sthm(@series.log_series()))
  log.attempt("Series.log_infsum", () => sthm(@series.log_infsum()))
  log.attempt("Series.atn_derivative_series", () => {
    sthm(@series.atn_derivative_series())
  })
  log.attempt("Series.atn_series", () => sthm(@series.atn_series()))
  log.attempt("Series.atn_infsum", () => sthm(@series.atn_infsum()))
  log.attempt("Series.sin_series", () => sthm(@series.sin_series()))
  log.attempt("Series.sin_infsum", () => sthm(@series.sin_infsum()))
  log.attempt("Series.cos_series", () => sthm(@series.cos_series()))
  log.attempt("Series.cos_infsum", () => sthm(@series.cos_infsum()))
  // END generated theorem list
  let tm = @parser.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.probe_counters()
  @testkit.check_axioms()
  inspect(
    @testkit.normalize_times(log.contents()),
    content=(
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|0..0..1..7..20..46..solved at 65
      #|0..0..1..7..20..48..126..273..543..1165..solved at 1197
      #|0..0..1..9..24..62..148..319..650..1490..3122..6136..solved at 6441
      #|0..0..1..9..solved at 15
      #|0..0..1..2..6..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Formal_ineqs/trig/series quotations (464):
      #|  !x n. abs (--x pow n) = abs x pow n
      #|  abs (&1) = &1
      #|  !n. abs (-- &1 pow n) = &1
      #|  (k + 1) - 1 = k
      #|  m < k + 1 <=> m <= k
      #|  k + 1
      #|  m:num
      #|  l:real
      #|  f:num->real
      #|  real_summable (from m) f
      #|  k + 1
      #|  !m k f. real_summable (from m) f /\\ m <= k \n   ==> real_infsum (from m) f = sum (m..k) f + real_infsum (from (k + 1)) f
      #|  (t + 1) - 1 = t
      #|  k - 1
      #|  ?t. k = t + 1 /\\ m <= t
      #|  !m k f. real_summable (from m) f /\\ m < k \n   ==> real_infsum (from m) f = sum (m..k - 1) f + real_infsum (from k) f
      #|  from m
      #|  \\i. u * abs x pow i
      #|  \\i. a i * x pow i
      #|  !a u x m. real_summable (from m) (\\i. a i * x pow i)\n   /\\ (!i. m <= i ==> abs (a i) <= u)\n   /\\ abs x < &1\n   ==> abs (real_infsum (from m) (\\i. a i * x pow i)) \n          <= u * abs x pow m / (&1 - abs x)
      #|  abs (a (i:num))
      #|  !a x m. real_summable (from m) (\\i. a i * x pow i)\n   /\\ (!i. m <= i ==> abs (a (SUC i)) <= abs (a i))\n   /\\ abs x < &1\n   ==> abs (real_infsum (from m) (\\i. a i * x pow i)) \n           <= abs (a m) * abs x pow m / (&1 - abs x)
      #|  n:num
      #|  a = s + r <=> a - s = r:real
      #|  \\i. a i * x pow i
      #|  m:num
      #|  n:num
      #|  !a u t x n m. ((\\i. a i * x pow i) real_sums t) (from n)\n   /\\ n < m\n   /\\ (!i. m <= i ==> abs (a i) <= u)\n   /\\ abs x < &1\n   ==> abs (t - sum (n..m - 1) (\\i. a i * x pow i)) \n         <= u * abs x pow m / (&1 - abs x)
      #|  n:num
      #|  a = s + r <=> a - s = r:real
      #|  \\i. a i * x pow i
      #|  m:num
      #|  n:num
      #|  !a t x n m. ((\\i. a i * x pow i) real_sums t) (from n)\n   /\\ n < m\n   /\\ (!i. m <= i ==> abs (a (SUC i)) <= abs (a i))\n   /\\ abs x < &1\n   ==> abs (t - sum (n..m - 1) (\\i. a i * x pow i)) \n            <= abs (a m) * abs x pow m / (&1 - abs x)
      #|  !a b. &0 <= a * b ==> abs (a + b) = abs a + abs b
      #|  a * b <= &0 <=> &0 <= (--a) * b
      #|  !a b. a * b <= &0 ==> abs (a + b) = abs (abs a - abs b)
      #|  (b * b) * x <= &0 <=> &0 <= (--(b * b) * x)
      #|  (b * c) * a * b = (b * b) * (a * c):real
      #|  &0
      #|  a * b:real
      #|  b * c:real
      #|  !a b c. a * b <= &0 /\\ &0 <= b * c /\\ ~(b = &0) ==> a * c <= &0
      #|  abs (a * a) = a * a
      #|  (a + c) * a = a * a + c * a:real
      #|  abs b <= abs a
      #|  abs c <= abs b
      #|  abs (a * c) <= abs (a * a)
      #|  abs b <= abs a
      #|  abs c <= abs b
      #|  a * b = b * a:real
      #|  b:real
      #|  a * c <= &0
      #|  c = sum (m + 1..n) f
      #|  b = (f:num->real) (m + 1)
      #|  a = (f:num->real) m
      #|  abs (sum (m + 1..n) f) <= abs (f (m + 1))
      #|  sum (m + 1..n) f = &0
      #|  f (m + 1) = &0
      #|  m:num
      #|  f:num->real
      #|  m + 1
      #|  n:num
      #|  n - m = SUC t
      #|  m <= n:num /\\ n - (m + 1) = t
      #|  n - m = 0
      #|  n < m \\/ n = m:num
      #|  t:num
      #|  n:num
      #|  m:num
      #|  t:num = n - m
      #|  !m n f. \n     (!k. abs (f (k + 1)) <= abs (f k) /\\ f (k + 1) * f k <= &0) ==>\n     abs (sum (m..n) f) <= abs (f m) /\\ &0 <= sum (m..n) f * f m
      #|  m:num
      #|  n:num
      #|  m:num
      #|  k:num
      #|  n:num
      #|  k:num
      #|  N:num
      #|  e:real
      #|  !f k. (!n. abs (f (n + 1)) <= abs (f n) /\\ f (n + 1) * f n <= &0) /\\\n     ((f ---> &0) sequentially) \n      ==> ?l. (f real_sums l) (from k)
      #|  !f k. (!n. abs (f (n + 1)) <= abs (f n) /\\ f (n + 1) * f n <= &0) /\\\n     ((f ---> &0) sequentially) \n      ==> real_summable (from k) f
      #|  n:num
      #|  k:num
      #|  0
      #|  n:num
      #|  k:num
      #|  0
      #|  0
      #|  abs (f (k:num))
      #|  --abs (f (k:num))
      #|  &0
      #|  (f:num->real) k
      #|  l:real
      #|  !f k. (!n. abs (f (n + 1)) <= abs (f n) /\\ f (n + 1) * f n <= &0) /\\\n     ((f ---> &0) sequentially) \n      ==> ?l. (f real_sums l) (from k)\n             /\\ abs l <= abs (f k) /\\ &0 <= l * f k
      #|  !f k. (!n. abs (f (n + 1)) <= abs (f n) /\\ f (n + 1) * f n <= &0) /\\\n     ((f ---> &0) sequentially) \n      ==> abs (real_infsum (from k) f) <= abs (f k)
      #|  !f m k. (!n. abs (f (n + 1)) <= abs (f n) /\\ f (n + 1) * f n <= &0) /\\\n     ((f ---> &0) sequentially)  /\\ m < k\n      ==> abs (real_infsum (from m) f - sum (m..k - 1) f) <= abs (f k)
      #|  !f m k. (!n. abs (f (n + 1)) <= abs (f n) /\\ f (n + 1) * f n <= &0) /\\\n     (f ---> &0) sequentially /\\ m < k\n      ==> real_infsum (from m) f <= sum (m..k - 1) f + abs (f k)
      #|  !f m k. (!n. abs (f (n + 1)) <= abs (f n) /\\ f (n + 1) * f n <= &0) /\\\n     (f ---> &0) sequentially /\\ m < k\n      ==> sum (m..k - 1) f - abs (f k) <= real_infsum (from m) f
      #|  !x n. abs (--x pow n) = abs x pow n
      #|  !n. abs (-- &1 pow n) = &1
      #|  ~(b <= a:real)
      #|  ~(b <= a:real)
      #|  &0 < e
      #|  \\x:real. f (n:num) x - (g x):real
      #|  ~(b <= a:real)
      #|  e / &2 = ((e / &2) / (b - a)) * (b - a)
      #|  &0 < e
      #|  e / &2
      #|  N:num
      #|  (e / &2) / (b - a)
      #|  &0 < e
      #|  (g has_real_integral y) (real_interval[a,b])
      #|  n:num
      #|  0
      #|  b <= a:real
      #|  y:real
      #|  (s:num->real) N
      #|  abs (a - b) = abs (b - a)
      #|  N:num
      #|  (f:num->real->real) N
      #|  b:real
      #|  a:real
      #|  g:real->real
      #|  !f g s a b.\n     (!e. &0 < e ==> ?N. !n x. N <= n /\\ x IN real_interval[a,b] ==> abs (f n x - g x) < e) /\\\n     (!n. ((f n) has_real_integral (s n)) (real_interval[a,b]))\n   ==> (?r. (g has_real_integral r) (real_interval[a,b]) /\\\n\t    (s ---> r) sequentially)
      #|  \\n x:real. sum (s INTER (0..n)) (\\i. f i x)
      #|  !f g s r a b.\n     (!e. &0 < e ==> ?N. !n x. N <= n /\\ x IN real_interval[a,b] \n                    ==> abs (sum (s INTER (0..n)) (\\i. f i x) - g x) < e) /\\\n     (!n. ((f n) has_real_integral (r n)) (real_interval[a,b]))\n   ==> (?v. (g has_real_integral v) (real_interval[a,b]) /\\ (r real_sums v) s)
      #|  (\\i. Cx (a i * x pow i)) = Cx o (\\i. a i * x pow i)
      #|  x <= abs t:real
      #|  --abs t <= x:real
      #|  abs t < abs y
      #|  y:real
      #|  real_summable s (\\i. a i * x pow i)
      #|  infsum s (\\i. Cx (a i * x pow i)) = Cx (real_infsum s (\\i. a i * x pow i))
      #|  (\\i. (Cx o a) i * Cx x pow i) = (\\i. Cx (a i * x pow i))
      #|  M * (abs y - abs t)
      #|  Cx x
      #|  n:num
      #|  N:num
      #|  Cx o (\\i. a i * y pow i) = \\i. Cx (a i) * Cx y pow i
      #|  real_summable s (\\i. a i * y pow i)
      #|  e:real
      #|  s:num->bool
      #|  Cx y
      #|  Cx o (a:num->real)
      #|  M:real
      #|  abs t < abs y
      #|  abs t < abs y
      #|  &0 < M /\\ M * (abs y - abs t) = abs y + abs t
      #|  M = (abs y + abs t) / (abs y - abs t)
      #|  !a s t y. real_summable s (\\i. a i * y pow i) /\\ abs t < abs y\n   ==> (!e. &0 < e ==> ?N. !n x. N <= n /\\ x IN real_interval[--abs t, abs t]\n\t\t\t\t      ==> abs (sum (s INTER (0..n)) (\\i. a i * x pow i) \n\t\t\t\t\t       - real_infsum s (\\i. a i * x pow i)) < e)
      #|  ~(n + 1 = 0)
      #|  ~(&(n + 1) = &0)
      #|  (a * b) * c = (a * c) * b:real
      #|  a:real
      #|  &0
      #|  \\t:real. t pow n
      #|  \\t:real. t pow (n + 1) / &(n + 1)
      #|  !n a. &0 <= a ==>\n     ((\\x. x pow n) has_real_integral a pow (n + 1) / &(n + 1))\n     (real_interval[&0, a])
      #|  ~(n + 1 = 0)
      #|  ~(&(n + 1) = &0)
      #|  (a * b) * c = (a * c) * b:real
      #|  &0
      #|  a:real
      #|  \\t:real. t pow n
      #|  \\t:real. t pow (n + 1) / &(n + 1)
      #|  !n a. a <= &0 ==>\n     ((\\x. x pow n) has_real_integral --(a pow (n + 1) / &(n + 1)))\n     (real_interval[a, &0])
      #|  --(a * (-- &1) * b) = a * b:real
      #|  ~(x < &0) ==> min x (&0) = &0 /\\ max x (&0) = x
      #|  x < &0 ==> min x (&0) = x /\\ max x (&0) = &0
      #|  v:real = if x < &0 then --v' else v'
      #|  ~(x < &0) ==> min x (&0) = &0 /\\ max x (&0) = x
      #|  -- &1 * t = --t
      #|  x < &0 ==> min x (&0) = x /\\ max x (&0) = &0
      #|  abs x < r
      #|  real_infsum s (\\i. a i * x' pow i) = f x'
      #|  x':real
      #|  n:num
      #|  N:num
      #|  abs x < r
      #|  (f:real->real) y
      #|  abs x < r
      #|  y:real
      #|  x:real
      #|  s:num->bool
      #|  a:num->real
      #|  y = abs x + (r - abs x) / &2
      #|  max x (&0)
      #|  min x (&0)
      #|  \\i. a i * (if x < &0 then (-- &1) else &1) * x pow (i + 1) / &(i + 1)
      #|  s:num->bool
      #|  f:real->real
      #|  \\i x:real. a i * x pow i
      #|  !f a s r. (!x. abs x < r ==> ((\\i. a i * x pow i) real_sums f x) s)\n   ==> (!x. abs x < r ==>\n\t  let v = if x < &0 then --real_integral (real_interval[x, &0]) f \n\t            else real_integral (real_interval[&0, x]) f in\n\t    ((\\i. a i * x pow (i + 1) / &(i + 1)) real_sums v) s)
      #|  x:real
      #|  &0
      #|  f':real->real
      #|  f:real->real
      #|  &0
      #|  x:real
      #|  f':real->real
      #|  f:real->real
      #|  v = (f:real->real) x - f (&0)
      #|  !f f' a s r. \n     (!x. abs x < r ==> (f has_real_derivative f' x) (atreal x)) /\\\n     (!x. abs x < r ==> ((\\i. a i * x pow i) real_sums f' x) s)\n   ==> (!x. abs x < r \n\t==> ((\\i. a i * x pow (i + 1) / &(i + 1)) real_sums f x - f (&0)) s)
      #|  n:num
      #|  !h:num->num. (!n. h n < h (n + 1)) ==> (!n. n <= h n)
      #|  m:num
      #|  SUC n = m
      #|  m = 0
      #|  m:num
      #|  !h:num->num. (!n. h n < h (n + 1)) ==> (!n m. n < m ==> h n < h m)
      #|  n = m:num \\/ n < m \\/ m < n
      #|  !h:num->num. (!n. h n < h (n + 1)) ==> (!n m. h n = h m ==> n = m)
      #|  !h:num->num. (!n. h n < h (n + 1)) ==> (!n m. h n <= h m <=> n <= m)
      #|  !h:num->num. (!n. h n < h (n + 1)) ==> (!n m. h n < h m <=> n < m)
      #|  !h:num->num. (!n. h n < h (n + 1)) ==> (!n m. h n <= m ==> n <= m)
      #|  !x y. x IN (s INTER (0..k)) /\\ y IN (s INTER (0..k)) /\\ h x = (h:num->num) y ==> x = y
      #|  k:num
      #|  k:num
      #|  x':num
      #|  x':num
      #|  x = (h:num->num) x'
      #|  x':num
      #|  IMAGE (h:num->num) s INTER (0..n) = IMAGE h (s INTER (0..k))
      #|  N:num
      #|  N <= k:num
      #|  n:num
      #|  N:num
      #|  h k <= n /\\ !i. (h:num->num) i <= n ==> i <= k
      #|  k = @t. (h:num->num) t <= n /\\ (!i. h i <= n ==> i <= t)
      #|  (h:num->num) N
      #|  !x y. x IN (s INTER (0..n)) /\\ y IN (s INTER (0..n)) /\\ h x = (h:num->num) y ==> x = y
      #|  m:num
      #|  x':num
      #|  x':num
      #|  n:num
      #|  N <= n:num
      #|  (h:num->num) n
      #|  ?m. N <= m /\\ IMAGE (h:num->num) s INTER (0..m) = IMAGE h (s INTER (0..n))
      #|  N:num
      #|  !f h s l. (!n. h n < h (n + 1)) \n   ==> ((f real_sums l) (IMAGE h s) <=> ((f o h) real_sums l) s)
      #|  l:real
      #|  l:real
      #|  !f h s. (!n. h n < h (n + 1)) \n   ==> (real_summable (IMAGE h s) f <=> real_summable s (f o h))
      #|  f o h = \\i. (f:num->real) (2 * i + 1)
      #|  !n. h n < (h:num->num) (n + 1)
      #|  ODD = IMAGE h (:num)
      #|  h = \\i. 2 * i + 1
      #|  ODD
      #|  !f l. ((\\i. if ODD i then f i else &0) real_sums l) (:num)\n           <=> ((\\i. f (2 * i + 1)) real_sums l) (:num)
      #|  f o h = \\i. (f:num->real) (2 * i)
      #|  !n. h n < (h:num->num) (n + 1)
      #|  EVEN = IMAGE h (:num)
      #|  h = \\i. 2 * i
      #|  EVEN
      #|  !f l. ((\\i. if EVEN i then f i else &0) real_sums l) (:num)\n           <=> ((\\i. f (2 * i)) real_sums l) (:num)
      #|  &0 < e ==> &0 <= e
      #|  r = sum {2} (\\i. r)
      #|  r = sum (0..i) (\\k. if k IN {2} then r else &0)
      #|  r = &(binom (i,2)) * e pow 2
      #|  &1 + e = e + &1
      #|  n <= i:num
      #|  &2 <= &2 * &1 + x <=> &0 <= x
      #|  &0 < e ==> ~(e = &0)
      #|  (a / b + &1) * b = (a * inv b * b) + b
      #|  (&2 / e pow 2 + &1) * e pow 2
      #|  (&n - &1) * e pow 2
      #|  x <= (x * b / &2) * c <=> x * &2 <= x * b * c
      #|  &(binom(i,2)) = &i * (&i - &1) / &2
      #|  a <= b + a <=> &0 <= b
      #|  &2 / e pow 2 + &2
      #|  n:num
      #|  2 <= i
      #|  &(binom(i, 2)) * e pow 2
      #|  i:num
      #|  n:num
      #|  &2 / e pow 2 + &2
      #|  !e. &0 < e ==> ?N. !n. N <= n ==> &n <= (&1 + e) pow n
      #|  f = (\\i:num. inv c * c * f i)
      #|  !c f s. ~(c = &0) \n   ==> (real_summable s (\\i. c * f i) <=> real_summable s f)
      #|  x * a * x2 / x = (x / x) * a * x2
      #|  k:num
      #|  s:num->bool
      #|  \\i. x pow k * a i * x pow (i - k)
      #|  \\i. a i * x pow i
      #|  x pow k
      #|  n >= k + 2 ==> ~(n - k = 0)
      #|  k + 2
      #|  \\n:num. &0
      #|  x = &0
      #|  !k s a x. real_summable s (\\i. a i * x pow i)\n   ==> real_summable s (\\i. a i * x pow (i - k))
      #|  ((A /\\ B) /\\ ((~A \\/ C) \\/ ~B)) <=> A /\\ B /\\ C
      #|  !a s n.\n     sum ((s DIFF {0}) INTER (0..n)) (\\i. &i * a i)\n       = sum (s INTER (0..n)) (\\i. &i * a i)
      #|  ~(x = 0) ==> SUC (PRE x) = x
      #|  t:num->bool
      #|  \\i. &(SUC i) * a (SUC i)
      #|  PRE
      #|  t = (s DIFF {0}) INTER (0..n)
      #|  x':num
      #|  x':num
      #|  IMAGE PRE (s DIFF {0}) INTER (0..PRE n) = IMAGE PRE ((s DIFF {0}) INTER (0..n))
      #|  !a s n. 0 < n\n   ==> sum ((IMAGE PRE (s DIFF {0})) INTER (0..PRE n)) (\\i. &(SUC i) * a (SUC i))\n          = sum (s INTER (0..n)) (\\i. &i * a i)
      #|  SUC i - 1 = i
      #|  n:num
      #|  s:num->bool
      #|  \\i. a i * x pow (i - 1)
      #|  !a s n x. 0 < n\n   ==> sum ((IMAGE PRE (s DIFF {0})) INTER (0..PRE n)) (\\i. (&(SUC i) * a (SUC i)) * x pow i)\n\t= sum (s INTER (0..n)) (\\i. (&i * a i) * x pow (i - 1))
      #|  !a s l.\n     ((\\i. &i * a i) real_sums l) s <=> ((\\i. &i * a i) real_sums l) (s DIFF {0})
      #|  ~(a = 0) ==> SUC (PRE a) = a
      #|  x:num
      #|  PRE x
      #|  SUC n < SUC (n + 1)
      #|  t:num->bool
      #|  SUC
      #|  \\i. (&i * a i) * x pow (i - 1)
      #|  SUC n - 1 = n
      #|  (\\i. (&(SUC i) * a (SUC i)) * x pow i) = (\\i. (&i * a i) * x pow (i - 1)) o SUC
      #|  t = IMAGE PRE (s DIFF {0})
      #|  !a s x l.\n     ((\\i. (&i * a i) * x pow (i - 1)) real_sums l) s\n       <=> ((\\i. (&(SUC i) * a (SUC i)) * x pow i) real_sums l) (IMAGE PRE (s DIFF {0}))
      #|  abs (&n) = &n
      #|  &0 < e ==> abs (&1 + e) = &1 + e
      #|  abs ((a:num->real) n) * t pow n * y = (y * abs (a n)) * t pow n
      #|  N:num
      #|  e:real
      #|  abs x < y ==> abs y = y
      #|  y:real
      #|  \\i. abs (a i * (x * (&1 + e)) pow i)
      #|  abs x < y
      #|  !x. ~(x = &0) ==> x * (y / x - &1) / &2 = (y - x) / &2
      #|  x * (&1 + e) = x + x * e
      #|  &0 < e ==> abs (&1 + e) = &1 + e
      #|  abs (x * (&1 + e)) < y
      #|  &0 < a - b <=> b < a
      #|  &0 < e
      #|  e = (y / (abs x) - &1) / &2
      #|  ~(y = &0) /\\ &0 < y /\\ &0 < abs x /\\ ~(abs x = &0)
      #|  n >= 2 ==> ~(n = 0)
      #|  2
      #|  \\n:num. &0
      #|  x = &0
      #|  !a s y. real_summable s (\\i. a i * y pow i)\n   ==> (!x. abs x < y ==> real_summable s (\\i. (&i * a i) * x pow (i - 1)))
      #|  (f:real->real) w
      #|  w:real
      #|  s:num->bool
      #|  a:num->real
      #|  abs x < w
      #|  x IN real_interval (--w, w) /\\ real_open (real_interval (--w, w))
      #|  abs x < w
      #|  (w - abs x) / &2
      #|  g:real->real
      #|  x:real
      #|  y:real
      #|  s:num->bool
      #|  \\n. a n * y pow n
      #|  y:real
      #|  !y. abs y < w ==> (g:real->real) y = f y
      #|  \\x. real_infsum s (\\i. (&i * a i) * x pow (i - 1))
      #|  n >= 1 ==> ~(n = 0)
      #|  1
      #|  &0
      #|  \\n:num. &0
      #|  &0
      #|  t:real
      #|  PRE n
      #|  0 < n
      #|  t:real
      #|  N + 1
      #|  e:real
      #|  y:real
      #|  w:real
      #|  IMAGE PRE (s DIFF {0})
      #|  \\i. &(SUC i) * a (SUC i)
      #|  (f:real->real) y2
      #|  y2:real
      #|  s:num->bool
      #|  a:num->real
      #|  &0 < y /\\ abs y < r /\\ w < y /\\ abs w < y /\\ abs w < abs y /\\ &0 < y2 /\\ abs y2 < r /\\ y < y2 /\\ abs y < abs y2 /\\ abs y < y2
      #|  y2 = (y + r) / &2
      #|  y = (r + w) / &2
      #|  s:num->bool
      #|  \\x. real_infsum s (\\i. (&i * a i) * x pow (i - 1))
      #|  \\i x. (&i * a i) * x pow (i - 1)
      #|  \\i x. a i * x pow i
      #|  real_interval (--w, w)
      #|  (abs x + r) / &2
      #|  \\x. (p:real->real->real) ((abs x + r) / &2) x
      #|  p:real->real->real
      #|  (!w. &0 < w /\\ abs w < r /\\ w < r /\\ abs w < abs r ==> \n\t\t      ?f'. (!x. abs x < w ==> (f has_real_derivative f' x) (atreal x) /\\\n\t\t\t\t  ((\\i. (&i * a i) * x pow (i - 1)) real_sums f' x) s))\n     ==> ?f'. (!x. abs x < r ==> (f has_real_derivative f' x) (atreal x) /\\\n\t\t\t\t  ((\\i. (&i * a i) * x pow (i - 1)) real_sums f' x) s)
      #|  !f a s r.\n     (!x. abs x < r ==> ((\\i. a i * x pow i) real_sums f x) s)\n      ==> ?f'. (!x. abs x < r ==> (f has_real_derivative f' x) (atreal x) /\\\n\t\t  ((\\i. (&i * a i) * x pow (i - 1)) real_sums f' x) s)
      #|  SUC x
      #|  IMAGE PRE ((:num) DIFF {0}) = (:num)
      #|  !f a r. \n     (!x. abs x < r ==> ((\\i. a i * x pow i) real_sums f x) (:num))\n       ==> ?f'. (!x. abs x < r ==>\n\t\t   (f has_real_derivative f' x) (atreal x) /\\\n\t\t   ((\\i. (&(SUC i) * a (SUC i)) * x pow i) real_sums f' x) (:num))
      #|  ~(n = 0) ==> SUC (n - 1) = n
      #|  (x * &n) * t = &n * (x * t)
      #|  n = 0
      #|  !n. (x * &n) * x pow (n - 1) = &n * x pow n
      #|  x:real
      #|  abs x < &1 ==> ~(&1 - x = &0)
      #|  x:real
      #|  \\x. &1 / (&1 - x)
      #|  (f':real->real) x = &1 / (&1 - x) pow 2
      #|  x:real
      #|  0
      #|  &1
      #|  (:num)
      #|  \\i:num. &1
      #|  \\x. &1 / (&1 - x)
      #|  !x. abs x < &1\n   ==> ((\\i. &i * x pow i) real_sums (x / (&1 - x) pow 2)) (:num)
      #|  --x / a = --(x / a) /\\ &1 - --x = &1 + x
      #|  &i * a * b = (a * &i) * b
      #|  -- &1 * x = --x
      #|  --x = -- &1 * x
      #|  --x
      #|  !x. abs x < &1\n   ==> ((\\i. ((-- &1) pow i * &i) * x pow i) real_sums \n\t--(x / (&1 + x) pow 2)) (:num)
      #|  a - --b = a + b
      #|  -- &1 * x = --x
      #|  --x = -- &1 * x
      #|  --x
      #|  0
      #|  !x. abs x < &1\n   ==> ((\\i. (-- &1) pow i * x pow i) real_sums &1 / (&1 + x)) (:num)
      #|  lift o (\\k. &1 / &(FACT k) * x pow k) = \\k. lift (&1 / &(FACT k) * x pow k)
      #|  &1 / a * b = b / a
      #|  !n. Cx x pow n / Cx (&(FACT n)) = Cx (&1 / &(FACT n) * x pow n)
      #|  Cx x
      #|  !x. ((\\k. &1 / &(FACT k) * x pow k) real_sums exp x) (:num)
      #|  !x. real_infsum (from 0) (\\k. &1 / &(FACT k) * x pow k) = exp x
      #|  a - -- &1 * x = a + x
      #|  abs (-- &1 * x) = abs x
      #|  -- &1 * x
      #|  0
      #|  !x. abs x < &1\n   ==> ((\\k. (-- &1) pow k * x pow k) real_sums inv (&1 + x)) (:num)
      #|  a * x / b = a / b * x
      #|  x:real
      #|  &1
      #|  (:num)
      #|  \\k. (-- &1) pow k
      #|  \\x. inv (&1 + x)
      #|  \\x. log (&1 + x)
      #|  !x. abs x < &1\n   ==> ((\\k. (-- &1) pow k / &(k + 1) * x pow (k + 1)) real_sums log (&1 + x)) (:num)
      #|  !x. abs x < &1 ==> \n     real_infsum (from 0) (\\k. ((-- &1) pow k / &(k + 1)) * x pow (k + 1)) = log (&1 + x)
      #|  (2 * k) DIV 2 = k
      #|  abs (-- &1) = &1
      #|  (-- &1) * x pow 2
      #|  0
      #|  !x. abs x < &1\n   ==> ((\\k. (if EVEN k then (-- &1) pow (k DIV 2) else &0) * x pow k) \n\t  real_sums inv (&1 + x pow 2)) (:num)
      #|  (2 * i) DIV 2 = i
      #|  x:real
      #|  &1
      #|  (:num)
      #|  \\k. if EVEN k then (-- &1) pow (k DIV 2) else &0
      #|  \\x. inv (&1 + x pow 2)
      #|  atn
      #|  !x. abs x < &1\n   ==> ((\\k. ((-- &1) pow k) / &(2 * k + 1) * x pow (2 * k + 1))\n\t  real_sums atn x) (:num)
      #|  !x. abs x < &1 ==> \n     real_infsum (from 0) (\\k. ((-- &1) pow k / &(2 * k + 1)) * x pow (2 * k + 1)) = atn x
      #|  lift o (\\k. -- &1 pow k / &(FACT (2 * k + 1)) * x pow (2 * k + 1)) = \\k. lift (-- &1 pow k / &(FACT (2 * k + 1)) * x pow (2 * k + 1))
      #|  !n. -- Cx (&1) pow n * Cx x pow (2 * n + 1) / Cx (&(FACT (2 * n + 1))) = Cx (((-- &1) pow n / &(FACT (2 * n + 1))) * x pow (2 * n + 1))
      #|  Cx x
      #|  !x. ((\\k. ((-- &1) pow k / &(FACT (2 * k + 1))) * x pow (2 * k + 1)) real_sums sin x) (:num)
      #|  !x. real_infsum (from 0) (\\k. ((-- &1) pow k / &(FACT(2 * k + 1))) * x pow (2 * k + 1)) = sin x
      #|  lift o (\\k. -- &1 pow k / &(FACT (2 * k)) * x pow (2 * k)) = \\k. lift (-- &1 pow k / &(FACT (2 * k)) * x pow (2 * k))
      #|  !n. -- Cx (&1) pow n * Cx x pow (2 * n) / Cx (&(FACT (2 * n))) = Cx (((-- &1) pow n / &(FACT (2 * n))) * x pow (2 * n))
      #|  Cx x
      #|  !x. ((\\k. ((-- &1) pow k / &(FACT (2 * k))) * x pow (2 * k)) real_sums cos x) (:num)
      #|  !x. real_infsum (from 0) (\\k. ((-- &1) pow k / &(FACT(2 * k))) * x pow (2 * k)) = cos x
      #|Series.real_infsum_offset =  |- (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\k:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#<=:fun(num,fun(num,bool)) m:num) k:num))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) k:num)) f:fun(num,real))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real)))))))))))
      #|Series.real_infsum_offset_alt =  |- (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\k:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#<:fun(num,fun(num,bool)) m:num) k:num))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) k:num)) f:fun(num,real)))))))))))
      #|Series.power_series_simple_bound =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(real,bool),bool) (\u:real. (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) i:num))) u:real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))))) ((#real_mul:fun(real,fun(real,real)) u:real) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))))
      #|Series.power_series_simple_bound2 =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) (#real_abs:fun(real,real) (a:fun(num,real) i:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) (a:fun(num,real) m:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))
      #|Series.real_sums_simple_bound =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(real,bool),bool) (\u:real. (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) t:real) (#from:fun(num,fun(num,bool)) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) i:num))) u:real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) t:real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))) ((#real_mul:fun(real,fun(real,real)) u:real) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))))))))
      #|Series.real_sums_simple_bound2 =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) t:real) (#from:fun(num,fun(num,bool)) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) (#real_abs:fun(real,real) (a:fun(num,real) i:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) t:real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) (a:fun(num,real) m:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))))))
      #|Series.abs_sum_lemma_pos =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) a:real) b:real))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) a:real) b:real))) ((#real_add:fun(real,fun(real,real)) (#real_abs:fun(real,real) a:real)) (#real_abs:fun(real,real) b:real))))))))
      #|Series.abs_sum_lemma_neg =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) a:real) b:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) a:real)) (#real_abs:fun(real,real) b:real)))))))))
      #|Series.sign_mul_lemma =  |- (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. (#!:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) b:real) c:real))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) b:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) c:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Series.sum_bound_lemma =  |- (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\k:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) k:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real)))) (#real_abs:fun(real,real) (f:fun(num,real) m:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) (f:fun(num,real) m:num)))))))))))
      #|Series.alt_sign_converges =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) (#?:fun(fun(real,bool),bool) (\l:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) f:fun(num,real)) l:real) (#from:fun(num,fun(num,bool)) k:num)))))))))
      #|Series.alt_sign_summable =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) k:num)) f:fun(num,real)))))))
      #|Series.alt_sign_converges2 =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) (#?:fun(fun(real,bool),bool) (\l:real. ((#/\:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) f:fun(num,real)) l:real) (#from:fun(num,fun(num,bool)) k:num))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) l:real)) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) l:real) (f:fun(num,real) k:num))))))))))))
      #|Series.alt_sign_bound =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) k:num)) f:fun(num,real)))) (#real_abs:fun(real,real) (f:fun(num,real) k:num))))))))
      #|Series.alt_sign_abs_bound =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num))) ((#<:fun(num,fun(num,bool)) m:num) k:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))))) (#real_abs:fun(real,real) (f:fun(num,real) k:num))))))))))
      #|Series.alt_sign_upper_bound =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num))) ((#<:fun(num,fun(num,bool)) m:num) k:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))))))))))
      #|Series.alt_sign_lower_bound =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(num,bool),bool) (\m:num. (#!:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num))) ((#<:fun(num,fun(num,bool)) m:num) k:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))))))))))
      #|Series.abs_neg_pow =  |- (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) x:real)) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) n:num))))))
      #|Series.abs_neg_one_pow =  |- (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|Series.integral_uniform_limit =  |- (#!:fun(fun(fun(num,fun(real,real)),bool),bool) (\f:fun(num,fun(real,real)). (#!:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#!:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((f:fun(num,fun(real,real)) n:num) x:real)) (g:fun(real,real) x:real)))) e:real)))))))))))) (#!:fun(fun(num,bool),bool) (\n:num. (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (f:fun(num,fun(real,real)) n:num)) (s:fun(num,real) n:num)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))))) (#?:fun(fun(real,bool),bool) (\r:real. ((#/\:fun(bool,fun(bool,bool)) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) g:fun(real,real)) r:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) s:fun(num,real)) r:real) #sequentially:net(num))))))))))))))))
      #|Series.integral_series =  |- (#!:fun(fun(fun(num,fun(real,real)),bool),bool) (\f:fun(num,fun(real,real)). (#!:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(fun(num,real),bool),bool) (\r:fun(num,real). (#!:fun(fun(real,bool),bool) (\a:real. (#!:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((f:fun(num,fun(real,real)) i:num) x:real)))) (g:fun(real,real) x:real)))) e:real)))))))))))) (#!:fun(fun(num,bool),bool) (\n:num. (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (f:fun(num,fun(real,real)) n:num)) (r:fun(num,real) n:num)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))))) (#?:fun(fun(real,bool),bool) (\v:real. ((#/\:fun(bool,fun(bool,bool)) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) g:fun(real,real)) v:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) r:fun(num,real)) v:real) s:fun(num,bool))))))))))))))))))
      #|Series.power_series_uniform =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\t:real. (#!:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) i:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) y:real)))) (#!:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_neg:fun(real,real) (#real_abs:fun(real,real) t:real))) (#real_abs:fun(real,real) t:real))) #NIL:list(prod(real,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))) e:real))))))))))))))))))))
      #|Series.has_real_integral_pow_pos =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) #NIL:list(prod(real,real))))))))))
      #|Series.has_real_integral_pow_neg =  |- (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) #NIL:list(prod(real,real))))))))))
      #|Series.power_series_integral =  |- (#!:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f:fun(real,real) x:real)) s:fun(num,bool)))))) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) ((#LET:fun(fun(real,bool),fun(real,bool)) (\v:real. (#LET_END:fun(bool,bool) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) v:real) s:fun(num,bool))))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_neg:fun(real,real) ((#real_integral:fun(fun(real,bool),fun(fun(real,real),real)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) #NIL:list(prod(real,real))))) f:fun(real,real)))) ((#real_integral:fun(fun(real,bool),fun(fun(real,real),real)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) #NIL:list(prod(real,real))))) f:fun(real,real))))))))))))))))
      #|Series.power_series_integral2 =  |- (#!:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#!:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real)))))) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f':fun(real,real) x:real)) s:fun(num,bool))))))) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) s:fun(num,bool))))))))))))))))
      #|Series.strict_increasing_num_le =  |- (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#!:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) (h:fun(num,num) n:num)))))))
      #|Series.strict_increasing_num_lt =  |- (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))))))))))
      #|Series.strict_increasing_num_inj =  |- (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))) ((#=:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.strict_increasing_num_le_eq =  |- (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))) ((#<=:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.strict_increasing_num_lt_eq =  |- (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))) ((#<:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.strict_increasing_num_le2 =  |- (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) m:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.real_sums_image =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) f:fun(num,real)) l:real) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) h:fun(num,num)) s:fun(num,bool)))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) ((#o:fun(fun(num,real),fun(fun(num,num),fun(num,real))) f:fun(num,real)) h:fun(num,num))) l:real) s:fun(num,bool))))))))))))
      #|Series.real_summable_image =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#=:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) h:fun(num,num)) s:fun(num,bool))) f:fun(num,real))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) ((#o:fun(fun(num,real),fun(fun(num,num),fun(num,real))) f:fun(num,real)) h:fun(num,num)))))))))))
      #|Series.real_sums_image_odd =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#ODD:fun(num,bool) i:num)) (f:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) l:real) #UNIV:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) l:real) #UNIV:fun(num,bool)))))))
      #|Series.real_sums_image_even =  |- (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) i:num)) (f:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) l:real) #UNIV:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (f:fun(num,real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)))) l:real) #UNIV:fun(num,bool)))))))
      #|Series.n_le_pow_lemma =  |- (#!:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) e:real)) n:num))))))))))
      #|Series.real_summable_lmul_eq =  |- (#!:fun(fun(real,bool),bool) (\c:real. (#!:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(num,real) i:num))))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) f:fun(num,real))))))))))
      #|Series.summable_power_series_shift =  |- (#!:fun(fun(num,bool),bool) (\k:num. (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) k:num))))))))))))))
      #|Series.power_sum_derivative_shift_lemma =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool)))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num)))))))))))
      #|Series.power_sum_derivative_shift_lemma2 =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) #PRE:fun(num,num)) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool))))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) (#PRE:fun(num,num) n:num)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))))))))))))
      #|Series.power_sum_derivative_shift_lemma3 =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(num,bool),bool) (\n:num. (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) #PRE:fun(num,num)) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool))))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) (#PRE:fun(num,num) n:num)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))
      #|Series.power_series_derivative_shift_lemma =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num)))) l:real) s:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num)))) l:real) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool)))))))))))
      #|Series.power_series_derivative_shift =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\x:real. (#!:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) l:real) s:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) l:real) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) #PRE:fun(num,num)) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool))))))))))))))
      #|Series.summable_power_series_derivative =  |- (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) i:num))))) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) y:real)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))
      #|Series.power_series_has_derivative =  |- (#!:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f:fun(real,real) x:real)) s:fun(num,bool)))))) (#?:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (f':fun(real,real) x:real)) s:fun(num,bool)))))))))))))))))
      #|Series.power_series_has_derivative2 =  |- (#!:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#!:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#!:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f:fun(real,real) x:real)) #UNIV:fun(num,bool)))))) (#?:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f':fun(real,real) x:real)) #UNIV:fun(num,bool)))))))))))))))
      #|Series.real_sums_i_xi =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) ((#real_div:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) #UNIV:fun(num,bool)))))
      #|Series.real_sums_neg_i_xi =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) #UNIV:fun(num,bool)))))
      #|Series.real_sums_neg_xi =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) #UNIV:fun(num,bool)))))
      #|Series.exp_series =  |- (#!:fun(fun(real,bool),bool) (\x:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#exp:fun(real,real) x:real)) #UNIV:fun(num,bool))))
      #|Series.exp_infsum =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))) (#exp:fun(real,real) x:real))))
      #|Series.log_derivative_series =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) #UNIV:fun(num,bool)))))
      #|Series.log_series =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#log:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) #UNIV:fun(num,bool)))))
      #|Series.log_infsum =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#log:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))))))
      #|Series.atn_derivative_series =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) k:num)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) #UNIV:fun(num,bool)))))
      #|Series.atn_series =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#atn:fun(real,real) x:real)) #UNIV:fun(num,bool)))))
      #|Series.atn_infsum =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#atn:fun(real,real) x:real)))))
      #|Series.sin_series =  |- (#!:fun(fun(real,bool),bool) (\x:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#sin:fun(real,real) x:real)) #UNIV:fun(num,bool))))
      #|Series.sin_infsum =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#sin:fun(real,real) x:real))))
      #|Series.cos_series =  |- (#!:fun(fun(real,bool),bool) (\x:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num))))) (#cos:fun(real,real) x:real)) #UNIV:fun(num,bool))))
      #|Series.cos_infsum =  |- (#!:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)))))) (#cos:fun(real,real) x:real))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? ! ==> /\ T =
      #|definitions = 1052
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1858298
      #|counter_genvar = _3716892:bool
      #|
    ),
  )
}
