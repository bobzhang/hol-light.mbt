// OCaml Stdlib functions used by translated code, with OCaml's semantics
// (strings as UTF-8 byte sequences, Invalid_argument on bad indices).

///|
/// `lsl` on OCaml's 63-bit ints (truncated to 32 bits; MoonBit would mask
/// the shift count instead).
pub fn lsl(x : Int, n : Int) -> Int {
  (x.to_int64() << n).to_int()
}

///|
/// `lsr`: logical shift right of the 63-bit value (`(-1) lsr 32` is
/// `2147483647`, as in OCaml).
pub fn lsr(x : Int, n : Int) -> Int {
  ((x.to_int64() & 0x7FFFFFFFFFFFFFFFL).reinterpret_as_uint64() >> n)
  .reinterpret_as_int64()
  .to_int()
}

///|
/// `asr` on OCaml's 63-bit ints.
pub fn asr(x : Int, n : Int) -> Int {
  (x.to_int64() >> n).to_int()
}

///|
/// `log` (natural logarithm)
pub fn float_log(x : Double) -> Double {
  @math.ln(x)
}

///|
/// `**`
pub fn float_pow(x : Double, y : Double) -> Double {
  @math.pow(x, y)
}

///|
/// `String.length`: the number of UTF-8 bytes.
pub fn string_length(s : String) -> Int {
  @utf8.encode(s).length()
}

///|
/// OCaml strings are bytes, ours Unicode text: byte-level operations are
/// exact on ASCII and refuse (loudly) to split or build other characters.
fn ascii_only(s : String, what : String) -> Unit {
  for c in s {
    if c.to_int() >= 128 {
      abort("\{what}: byte-level operation on a non-ASCII string")
    }
  }
}

///|
/// `String.get s i`: the byte at `i`.
pub fn string_get(s : String, i : Int) -> Char raise {
  ascii_only(s, "String.get")
  if i < 0 || i >= s.length() {
    raise @num.InvalidArgument("index out of bounds")
  }
  s[i].unsafe_to_char()
}

///|
/// `String.sub s start len`
pub fn string_sub(s : String, start : Int, len : Int) -> String raise {
  ascii_only(s, "String.sub")
  if start < 0 || len < 0 || start > s.length() - len {
    raise @num.InvalidArgument("String.sub / Bytes.sub")
  }
  s.view(start_offset=start, end_offset=start + len).to_string()
}

///|
/// `String.make n c`
pub fn string_make(n : Int, c : Char) -> String raise {
  if c.to_int() >= 128 {
    abort("String.make: non-ASCII byte")
  }
  if n < 0 {
    raise @num.InvalidArgument("Bytes.create")
  }
  String::make(n, c)
}

///|
/// `String.concat sep l`
pub fn string_concat(sep : String, l : @list.List[String]) -> String {
  let sb = StringBuilder()
  let mut first = true
  for s in l {
    if !first {
      sb.write_string(sep)
    }
    first = false
    sb.write_string(s)
  }
  sb.to_string()
}

///|
/// `Array.make n x`
pub fn[A] array_make(n : Int, x : A) -> FixedArray[A] raise {
  if n < 0 {
    raise @num.InvalidArgument("Array.make")
  }
  FixedArray::make(n, x)
}

///|
/// `Array.get a i` (`a.(i)`)
pub fn[A] array_get(a : FixedArray[A], i : Int) -> A raise {
  if i < 0 || i >= a.length() {
    raise @num.InvalidArgument("index out of bounds")
  }
  a[i]
}

///|
/// `Array.set a i x` (`a.(i) <- x`)
pub fn[A] array_set(a : FixedArray[A], i : Int, x : A) -> Unit raise {
  if i < 0 || i >= a.length() {
    raise @num.InvalidArgument("index out of bounds")
  }
  a[i] = x
}

///|
/// `Array.length a`
pub fn[A] array_length(a : FixedArray[A]) -> Int {
  a.length()
}

///|
/// lib.ml's `(|>)`: `x |> f` is `f x`.
pub fn[A, B] op_bar_gt(x : A, f : (A) -> B raise) -> B raise {
  f(x)
}
