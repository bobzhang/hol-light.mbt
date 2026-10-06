// The Num library's Big_int module, as far as upstream's files use it
// (Formal_ineqs/arith/arith_float.hl): arbitrary-precision integers.

///|
/// `Big_int.zero_big_int`
pub let zero_big_int : @bigint.BigInt = 0N

///|
/// `Big_int.big_int_of_int`
pub fn big_int_of_int(n : Int64) -> @bigint.BigInt {
  @bigint.BigInt::from_int64(n)
}

///|
/// `Big_int.add_big_int`
pub fn add_big_int(a : @bigint.BigInt, b : @bigint.BigInt) -> @bigint.BigInt {
  a + b
}

///|
/// `Big_int.sub_big_int`
pub fn sub_big_int(a : @bigint.BigInt, b : @bigint.BigInt) -> @bigint.BigInt {
  a - b
}

///|
/// `Big_int.mult_big_int`
pub fn mult_big_int(a : @bigint.BigInt, b : @bigint.BigInt) -> @bigint.BigInt {
  a * b
}

///|
/// `Big_int.succ_big_int`
pub fn succ_big_int(a : @bigint.BigInt) -> @bigint.BigInt {
  a + 1N
}

///|
/// `Big_int.pred_big_int`
pub fn pred_big_int(a : @bigint.BigInt) -> @bigint.BigInt {
  a - 1N
}

///|
/// `Big_int.quomod_big_int`: Euclidean division (the remainder is not
/// negative); `Division_by_zero` for a zero divisor.
pub fn quomod_big_int(
  a : @bigint.BigInt,
  b : @bigint.BigInt,
) -> (@bigint.BigInt, @bigint.BigInt) raise {
  if b.is_zero() {
    raise Failure("Division_by_zero")
  }
  let q = a / b
  let r = a % b
  if r < big_zero {
    if b > big_zero {
      (q - 1N, r + b)
    } else {
      (q + 1N, r - b)
    }
  } else {
    (q, r)
  }
}

///|
/// `Big_int.div_big_int`: the quotient of `quomod_big_int`.
pub fn div_big_int(
  a : @bigint.BigInt,
  b : @bigint.BigInt,
) -> @bigint.BigInt raise {
  quomod_big_int(a, b).0
}

///|
/// `Big_int.eq_big_int`
pub fn eq_big_int(a : @bigint.BigInt, b : @bigint.BigInt) -> Bool {
  a == b
}

///|
/// `Big_int.lt_big_int`
pub fn lt_big_int(a : @bigint.BigInt, b : @bigint.BigInt) -> Bool {
  a < b
}

///|
/// `Big_int.le_big_int`
pub fn le_big_int(a : @bigint.BigInt, b : @bigint.BigInt) -> Bool {
  a <= b
}

///|
/// `Big_int.sign_big_int`: -1, 0 or 1.
pub fn sign_big_int(a : @bigint.BigInt) -> Int64 {
  if a < big_zero {
    -1L
  } else if a > big_zero {
    1L
  } else {
    0L
  }
}

///|
/// `Big_int.sqrt_big_int`: the integer square root, rounded down;
/// `Invalid_argument` for a negative number.
pub fn sqrt_big_int(a : @bigint.BigInt) -> @bigint.BigInt raise {
  if a < big_zero {
    raise InvalidArgument("sqrt_big_int: negative argument")
  }
  if a.is_zero() {
    return big_zero
  }
  // Newton's iteration from above
  let mut x = a
  let mut y = (x + 1N) / 2N
  while y < x {
    x = y
    y = (x + a / x) / 2N
  }
  x
}

///|
/// `Big_int.power_int_positive_int a n`: `a` to the `n`, `n >= 0`.
pub fn power_int_positive_int(a : Int64, n : Int64) -> @bigint.BigInt raise {
  if n < 0L {
    raise InvalidArgument("power_int_positive_int")
  }
  let mut r = 1N
  let mut b = @bigint.BigInt::from_int64(a)
  let mut e = n
  while e > 0L {
    if e % 2L == 1L {
      r = r * b
    }
    b = b * b
    e = e / 2L
  }
  r
}

///|
/// `Big_int.mult_int_big_int`
pub fn mult_int_big_int(n : Int64, a : @bigint.BigInt) -> @bigint.BigInt {
  @bigint.BigInt::from_int64(n) * a
}

///|
/// `Big_int.add_int_big_int`
pub fn add_int_big_int(n : Int64, a : @bigint.BigInt) -> @bigint.BigInt {
  @bigint.BigInt::from_int64(n) + a
}

///|
/// `Big_int.mod_big_int`: the remainder of `quomod_big_int` (not negative).
pub fn mod_big_int(
  a : @bigint.BigInt,
  b : @bigint.BigInt,
) -> @bigint.BigInt raise {
  quomod_big_int(a, b).1
}

///|
/// `Big_int.abs_big_int`
pub fn abs_big_int(a : @bigint.BigInt) -> @bigint.BigInt {
  if a < big_zero {
    -a
  } else {
    a
  }
}

///|
/// `Big_int.minus_big_int`
pub fn minus_big_int(a : @bigint.BigInt) -> @bigint.BigInt {
  -a
}
