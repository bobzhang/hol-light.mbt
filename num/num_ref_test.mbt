// Differential test against OCaml's Num library and HOL Light's lib.ml.
//
// Replays tools/ocaml_ref/num_ref.ml; the expected output comes from
// `tools/ocaml_ref/run.sh num_ref.ml`. Keep the two files in sync.

///|
priv struct Log {
  buf : StringBuilder
}

///|
fn Log::out(self : Log, s : String) -> Unit {
  self.buf.write_string(s)
  self.buf.write_char('\n')
}

///|
fn Log::attempt(self : Log, name : String, f : () -> String raise) -> Unit {
  let line = try f() catch {
    Failure(msg) => name + " ! " + msg
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.out(line)
}

///|
test "num matches OCaml Num and lib.ml" {
  let log = { buf: StringBuilder(), }
  let n = @num.num_of_int
  let q = (a, b) => @num.div_num(n(a), n(b))
  let s = @num.string_of_num
  let vals = [
    n(7),
    n(-7),
    q(7, 2),
    q(-7, 2),
    q(1, 3),
    n(0),
    q(-2, 6),
    @num.num_of_string("123456789012345678901234567890"),
    @num.minus_num(@num.num_of_string("98765432109876543210")),
  ]
  let divs = [
    n(2),
    n(-2),
    q(2, 3),
    q(-3, 4),
    @num.num_of_string("10000000000000000000000"),
  ]
  for x in vals {
    log.out("v " + s(x))
  }
  for x in vals {
    for y in divs {
      let sx = s(x)
      let sy = s(y)
      log.attempt("quo " + sx + " " + sy, () => s(@num.quo_num(x, y)))
      log.attempt("mod " + sx + " " + sy, () => s(@num.mod_num(x, y)))
      log.attempt("div " + sx + " " + sy, () => s(@num.div_num(x, y)))
    }
  }
  for x in vals {
    let sx = s(x)
    log.attempt("floor " + sx, () => s(@num.floor_num(x)))
    log.attempt("ceiling " + sx, () => s(@num.ceiling_num(x)))
    log.attempt("round " + sx, () => s(@num.round_num(x)))
    log.attempt("integer " + sx, () => s(@num.integer_num(x)))
    log.attempt("is_integer " + sx, () => @num.is_integer_num(x).to_string())
    log.attempt("sign " + sx, () => @num.sign_num(x).to_string())
    log.attempt("abs " + sx, () => s(@num.abs_num(x)))
    log.attempt("int_of " + sx, () => @num.int_of_num(x).to_string())
    log.attempt("numdom " + sx, () => {
      let (a, b) = @num.numdom(x)
      s(a) + "," + s(b)
    })
    log.attempt("pow3 " + sx, () => s(@num.power_num(x, n(3))))
    log.attempt("pow-2 " + sx, () => s(@num.power_num(x, n(-2))))
    log.attempt("succ " + sx, () => s(@num.succ_num(x)))
    log.attempt("pred " + sx, () => s(@num.pred_num(x)))
  }
  log.attempt("div0", () => s(@num.div_num(n(1), n(0))))
  log.attempt("quo0", () => s(@num.quo_num(n(1), n(0))))
  log.attempt("mod0", () => s(@num.mod_num(n(1), n(0))))
  log.attempt("gcd", () => {
    let g = @num.gcd_num
    [g(n(12), n(18)), g(n(-12), n(18)), g(n(0), n(0)), g(n(0), n(-5))]
    .map(s)
    .join(",")
  })
  log.attempt("gcd_ratio", () => s(@num.gcd_num(q(1, 2), n(3))))
  log.attempt("lcm", () => {
    let l = @num.lcm_num
    [l(n(4), n(6)), l(n(-4), n(6)), l(n(0), n(0)), l(n(0), n(3))]
    .map(s)
    .join(",")
  })
  log.attempt("cmp", () => {
    let c = @num.compare_num
    [c(q(1, 3), q(1, 2)), c(n(2), q(4, 2)), c(n(-1), n(0))]
    .map(i => i.to_string())
    .join(",")
  })
  log.attempt("nary", () => {
    [
      @num.string_of_num_nary(2, n(10)),
      @num.string_of_num_hex(n(255)),
      @num.string_of_num_nary(16, n(0)),
    ].join(",")
  })
  log.attempt("of_string", () => {
    let out = []
    for str in ["0", "007", "0x1F", "0xff", "0b1011", "12345678901234567890123"] {
      out.push(s(@num.num_of_string(str)))
    }
    out.join(",")
  })
  log.attempt("of_string_bad1", () => s(@num.num_of_string("0x")))
  log.attempt("of_string_bad2", () => s(@num.num_of_string("12a")))
  log.attempt("of_string_bad3", () => s(@num.num_of_string("")))
  log.attempt("of_string_bad4", () => s(@num.num_of_string("0b2")))
  log.attempt("pow2", () => s(@num.pow2(100)))
  log.attempt("pow10", () => s(@num.pow10(-2)))
  inspect(
    log.buf.to_string(),
    content=(
      #|v 7
      #|v -7
      #|v 7/2
      #|v -7/2
      #|v 1/3
      #|v 0
      #|v -1/3
      #|v 123456789012345678901234567890
      #|v -98765432109876543210
      #|quo 7 2 = 3
      #|mod 7 2 = 1
      #|div 7 2 = 7/2
      #|quo 7 -2 = -3
      #|mod 7 -2 = 1
      #|div 7 -2 = -7/2
      #|quo 7 2/3 = 10
      #|mod 7 2/3 = 1/3
      #|div 7 2/3 = 21/2
      #|quo 7 -3/4 = -9
      #|mod 7 -3/4 = 1/4
      #|div 7 -3/4 = -28/3
      #|quo 7 10000000000000000000000 = 0
      #|mod 7 10000000000000000000000 = 7
      #|div 7 10000000000000000000000 = 7/10000000000000000000000
      #|quo -7 2 = -4
      #|mod -7 2 = 1
      #|div -7 2 = -7/2
      #|quo -7 -2 = 4
      #|mod -7 -2 = 1
      #|div -7 -2 = 7/2
      #|quo -7 2/3 = -11
      #|mod -7 2/3 = 1/3
      #|div -7 2/3 = -21/2
      #|quo -7 -3/4 = 10
      #|mod -7 -3/4 = 1/2
      #|div -7 -3/4 = 28/3
      #|quo -7 10000000000000000000000 = -1
      #|mod -7 10000000000000000000000 = 9999999999999999999993
      #|div -7 10000000000000000000000 = -7/10000000000000000000000
      #|quo 7/2 2 = 1
      #|mod 7/2 2 = 3/2
      #|div 7/2 2 = 7/4
      #|quo 7/2 -2 = -1
      #|mod 7/2 -2 = 3/2
      #|div 7/2 -2 = -7/4
      #|quo 7/2 2/3 = 5
      #|mod 7/2 2/3 = 1/6
      #|div 7/2 2/3 = 21/4
      #|quo 7/2 -3/4 = -4
      #|mod 7/2 -3/4 = 1/2
      #|div 7/2 -3/4 = -14/3
      #|quo 7/2 10000000000000000000000 = 0
      #|mod 7/2 10000000000000000000000 = 7/2
      #|div 7/2 10000000000000000000000 = 7/20000000000000000000000
      #|quo -7/2 2 = -2
      #|mod -7/2 2 = 1/2
      #|div -7/2 2 = -7/4
      #|quo -7/2 -2 = 2
      #|mod -7/2 -2 = 1/2
      #|div -7/2 -2 = 7/4
      #|quo -7/2 2/3 = -6
      #|mod -7/2 2/3 = 1/2
      #|div -7/2 2/3 = -21/4
      #|quo -7/2 -3/4 = 5
      #|mod -7/2 -3/4 = 1/4
      #|div -7/2 -3/4 = 14/3
      #|quo -7/2 10000000000000000000000 = -1
      #|mod -7/2 10000000000000000000000 = 19999999999999999999993/2
      #|div -7/2 10000000000000000000000 = -7/20000000000000000000000
      #|quo 1/3 2 = 0
      #|mod 1/3 2 = 1/3
      #|div 1/3 2 = 1/6
      #|quo 1/3 -2 = 0
      #|mod 1/3 -2 = 1/3
      #|div 1/3 -2 = -1/6
      #|quo 1/3 2/3 = 0
      #|mod 1/3 2/3 = 1/3
      #|div 1/3 2/3 = 1/2
      #|quo 1/3 -3/4 = 0
      #|mod 1/3 -3/4 = 1/3
      #|div 1/3 -3/4 = -4/9
      #|quo 1/3 10000000000000000000000 = 0
      #|mod 1/3 10000000000000000000000 = 1/3
      #|div 1/3 10000000000000000000000 = 1/30000000000000000000000
      #|quo 0 2 = 0
      #|mod 0 2 = 0
      #|div 0 2 = 0
      #|quo 0 -2 = 0
      #|mod 0 -2 = 0
      #|div 0 -2 = 0
      #|quo 0 2/3 = 0
      #|mod 0 2/3 = 0
      #|div 0 2/3 = 0
      #|quo 0 -3/4 = 0
      #|mod 0 -3/4 = 0
      #|div 0 -3/4 = 0
      #|quo 0 10000000000000000000000 = 0
      #|mod 0 10000000000000000000000 = 0
      #|div 0 10000000000000000000000 = 0
      #|quo -1/3 2 = -1
      #|mod -1/3 2 = 5/3
      #|div -1/3 2 = -1/6
      #|quo -1/3 -2 = 1
      #|mod -1/3 -2 = 5/3
      #|div -1/3 -2 = 1/6
      #|quo -1/3 2/3 = -1
      #|mod -1/3 2/3 = 1/3
      #|div -1/3 2/3 = -1/2
      #|quo -1/3 -3/4 = 1
      #|mod -1/3 -3/4 = 5/12
      #|div -1/3 -3/4 = 4/9
      #|quo -1/3 10000000000000000000000 = -1
      #|mod -1/3 10000000000000000000000 = 29999999999999999999999/3
      #|div -1/3 10000000000000000000000 = -1/30000000000000000000000
      #|quo 123456789012345678901234567890 2 = 61728394506172839450617283945
      #|mod 123456789012345678901234567890 2 = 0
      #|div 123456789012345678901234567890 2 = 61728394506172839450617283945
      #|quo 123456789012345678901234567890 -2 = -61728394506172839450617283945
      #|mod 123456789012345678901234567890 -2 = 0
      #|div 123456789012345678901234567890 -2 = -61728394506172839450617283945
      #|quo 123456789012345678901234567890 2/3 = 185185183518518518351851851835
      #|mod 123456789012345678901234567890 2/3 = 0
      #|div 123456789012345678901234567890 2/3 = 185185183518518518351851851835
      #|quo 123456789012345678901234567890 -3/4 = -164609052016460905201646090520
      #|mod 123456789012345678901234567890 -3/4 = 0
      #|div 123456789012345678901234567890 -3/4 = -164609052016460905201646090520
      #|quo 123456789012345678901234567890 10000000000000000000000 = 12345678
      #|mod 123456789012345678901234567890 10000000000000000000000 = 9012345678901234567890
      #|div 123456789012345678901234567890 10000000000000000000000 = 12345678901234567890123456789/1000000000000000000000
      #|quo -98765432109876543210 2 = -49382716054938271605
      #|mod -98765432109876543210 2 = 0
      #|div -98765432109876543210 2 = -49382716054938271605
      #|quo -98765432109876543210 -2 = 49382716054938271605
      #|mod -98765432109876543210 -2 = 0
      #|div -98765432109876543210 -2 = 49382716054938271605
      #|quo -98765432109876543210 2/3 = -148148148164814814815
      #|mod -98765432109876543210 2/3 = 0
      #|div -98765432109876543210 2/3 = -148148148164814814815
      #|quo -98765432109876543210 -3/4 = 131687242813168724280
      #|mod -98765432109876543210 -3/4 = 0
      #|div -98765432109876543210 -3/4 = 131687242813168724280
      #|quo -98765432109876543210 10000000000000000000000 = -1
      #|mod -98765432109876543210 10000000000000000000000 = 9901234567890123456790
      #|div -98765432109876543210 10000000000000000000000 = -9876543210987654321/1000000000000000000000
      #|floor 7 = 7
      #|ceiling 7 = 7
      #|round 7 = 7
      #|integer 7 = 7
      #|is_integer 7 = true
      #|sign 7 = 1
      #|abs 7 = 7
      #|int_of 7 = 7
      #|numdom 7 = 7,1
      #|pow3 7 = 343
      #|pow-2 7 = 1/49
      #|succ 7 = 8
      #|pred 7 = 6
      #|floor -7 = -7
      #|ceiling -7 = -7
      #|round -7 = -7
      #|integer -7 = -7
      #|is_integer -7 = true
      #|sign -7 = -1
      #|abs -7 = 7
      #|int_of -7 = -7
      #|numdom -7 = -7,1
      #|pow3 -7 = -343
      #|pow-2 -7 = 1/49
      #|succ -7 = -6
      #|pred -7 = -8
      #|floor 7/2 = 3
      #|ceiling 7/2 = 4
      #|round 7/2 = 4
      #|integer 7/2 = 3
      #|is_integer 7/2 = false
      #|sign 7/2 = 1
      #|abs 7/2 = 7/2
      #|int_of 7/2 ! integer argument required
      #|numdom 7/2 = 7,2
      #|pow3 7/2 = 343/8
      #|pow-2 7/2 = 4/49
      #|succ 7/2 = 9/2
      #|pred 7/2 = 5/2
      #|floor -7/2 = -4
      #|ceiling -7/2 = -3
      #|round -7/2 = -4
      #|integer -7/2 = -3
      #|is_integer -7/2 = false
      #|sign -7/2 = -1
      #|abs -7/2 = 7/2
      #|int_of -7/2 ! integer argument required
      #|numdom -7/2 = -7,2
      #|pow3 -7/2 = -343/8
      #|pow-2 -7/2 = 4/49
      #|succ -7/2 = -5/2
      #|pred -7/2 = -9/2
      #|floor 1/3 = 0
      #|ceiling 1/3 = 1
      #|round 1/3 = 0
      #|integer 1/3 = 0
      #|is_integer 1/3 = false
      #|sign 1/3 = 1
      #|abs 1/3 = 1/3
      #|int_of 1/3 ! integer argument required
      #|numdom 1/3 = 1,3
      #|pow3 1/3 = 1/27
      #|pow-2 1/3 = 9
      #|succ 1/3 = 4/3
      #|pred 1/3 = -2/3
      #|floor 0 = 0
      #|ceiling 0 = 0
      #|round 0 = 0
      #|integer 0 = 0
      #|is_integer 0 = true
      #|sign 0 = 0
      #|abs 0 = 0
      #|int_of 0 = 0
      #|numdom 0 = 0,1
      #|pow3 0 = 0
      #|pow-2 0 ! create_normalized_ratio infinite or undefined rational number
      #|succ 0 = 1
      #|pred 0 = -1
      #|floor -1/3 = -1
      #|ceiling -1/3 = 0
      #|round -1/3 = 0
      #|integer -1/3 = 0
      #|is_integer -1/3 = false
      #|sign -1/3 = -1
      #|abs -1/3 = 1/3
      #|int_of -1/3 ! integer argument required
      #|numdom -1/3 = -1,3
      #|pow3 -1/3 = -1/27
      #|pow-2 -1/3 = 9
      #|succ -1/3 = 2/3
      #|pred -1/3 = -4/3
      #|floor 123456789012345678901234567890 = 123456789012345678901234567890
      #|ceiling 123456789012345678901234567890 = 123456789012345678901234567890
      #|round 123456789012345678901234567890 = 123456789012345678901234567890
      #|integer 123456789012345678901234567890 = 123456789012345678901234567890
      #|is_integer 123456789012345678901234567890 = true
      #|sign 123456789012345678901234567890 = 1
      #|abs 123456789012345678901234567890 = 123456789012345678901234567890
      #|int_of 123456789012345678901234567890 ! int_of_big_int
      #|numdom 123456789012345678901234567890 = 123456789012345678901234567890,1
      #|pow3 123456789012345678901234567890 = 1881676372353657772546716040589641726257477229849409426207693797722198701224860897069000
      #|pow-2 123456789012345678901234567890 = 1/15241578753238836750495351562536198787501905199875019052100
      #|succ 123456789012345678901234567890 = 123456789012345678901234567891
      #|pred 123456789012345678901234567890 = 123456789012345678901234567889
      #|floor -98765432109876543210 = -98765432109876543210
      #|ceiling -98765432109876543210 = -98765432109876543210
      #|round -98765432109876543210 = -98765432109876543210
      #|integer -98765432109876543210 = -98765432109876543210
      #|is_integer -98765432109876543210 = true
      #|sign -98765432109876543210 = -1
      #|abs -98765432109876543210 = 98765432109876543210
      #|int_of -98765432109876543210 ! int_of_big_int
      #|numdom -98765432109876543210 = -98765432109876543210,1
      #|pow3 -98765432109876543210 = -963418328982521107745469393594323734901949040439108518161000
      #|pow-2 -98765432109876543210 = 1/9754610579850632525677488187778997104100
      #|succ -98765432109876543210 = -98765432109876543209
      #|pred -98765432109876543210 = -98765432109876543211
      #|div0 ! create_ratio infinite or undefined rational number
      #|quo0 !! Division_by_zero
      #|mod0 !! Division_by_zero
      #|gcd = 6,6,0,5
      #|gcd_ratio ! big_int_of_ratio
      #|lcm = 12,12,0,0
      #|cmp = -1,0,-1
      #|nary = 1010,0xff,0
      #|of_string = 0,7,31,255,11,12345678901234567890123
      #|of_string_bad1 ! num_of_string: no digits after base indicator
      #|of_string_bad2 ! num_of_string: invalid digit for base
      #|of_string_bad3 ! num_of_string: no digits
      #|of_string_bad4 ! num_of_string: invalid digit for base
      #|pow2 = 1267650600228229401496703205376
      #|pow10 = 1/100
      #|
    ),
  )
}

///|
test "float_of_num" {
  let n = @num.num_of_int
  inspect(@num.float_of_num(n(7)), content="7")
  inspect(@num.float_of_num(@num.div_num(n(-7), n(2))), content="-3.5")
  inspect(
    @num.float_of_num(@num.div_num(n(1), n(3))),
    content="0.3333333333333333",
  )
}

///|
test "int64_of_num" {
  inspect(
    @num.int64_of_num(@num.num_of_string("4611686018427387903")),
    content="4611686018427387903",
  )
  try @num.int_of_num(@num.num_of_string("4611686018427387903")) catch {
    Failure(msg) => inspect(msg, content="int_of_big_int")
    e => fail("unexpected error \{e}")
  } noraise {
    _ => fail("expected int_of_num to fail")
  }
}

///|
/// Bit-exact `float_of_num` results from OCaml (tools/ocaml_ref/float_ref.ml).
test "float_of_num matches OCaml bit for bit" {
  let n = @num.num_of_int
  let check = (name : String, x : @num.Num, bits : UInt64) => {
    @test.assert_eq(
      @num.float_of_num(x).reinterpret_as_uint64(),
      bits,
      msg=name,
    )
  }
  check("pow2_-1022", @num.pow2(-1022), 0x0010000000000000UL)
  check("pow2_-1074", @num.pow2(-1074), 0x0000000000000001UL)
  check("pow2_1023", @num.pow2(1023), 0x7FE0000000000000UL)
  check("pow2_1024", @num.pow2(1024), 0x7FF0000000000000UL)
  check("neg_pow2_1024", @num.minus_num(@num.pow2(1024)), 0xFFF0000000000000UL)
  check("third", @num.div_num(n(1), n(3)), 0x3FD5555555555555UL)
  check("tenth", @num.div_num(n(1), n(10)), 0x3FB999999999999AUL)
  check("big_ratio", @num.div_num(@num.pow10(400), n(3)), 0x7FF0000000000000UL)
  check(
    "near_half",
    @num.div_num(@num.pow2(53) + n(1), @num.pow2(54)),
    0x3FE0000000000000UL,
  )
  check("int_round", @num.pow2(53) + n(1), 0x4340000000000000UL)
  check("int_round_up", @num.pow2(53) + n(3), 0x4340000000000002UL)
  check("tiny_ratio", @num.div_num(n(1), @num.pow10(320)), 0x00000000000007E8UL)
}

///|
test "power_num with a fractional exponent raises Invalid_argument" {
  let n = @num.num_of_int
  try @num.power_num(n(4), @num.div_num(n(1), n(2))) catch {
    @num.InvalidArgument(msg) => inspect(msg, content="power_num")
    e => fail("unexpected error \{e}")
  } noraise {
    _ => fail("expected power_num to fail")
  }
}

///|
test "sign_num and compare_num return -1, 0 or 1 on every target" {
  let big = @num.power_num(@num.num_of_int(2), @num.num_of_int(100))
  let small = @num.num_of_int(3)
  let half = @num.div_num(@num.num_of_int(1), @num.num_of_int(2))
  inspect(
    [
      @num.sign_num(big),
      @num.sign_num(@num.minus_num(big)),
      @num.sign_num(@num.num_of_int(0)),
      @num.compare_num(big, small),
      @num.compare_num(small, big),
      @num.compare_num(big, big),
      @num.compare_num(@num.mult_num(big, half), half),
      @num.compare_num(half, @num.mult_num(big, half)),
    ],
    content="[1, -1, 0, 1, -1, 0, 1, -1]",
  )
}
