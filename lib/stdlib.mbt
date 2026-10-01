// OCaml Stdlib functions used by translated code, with OCaml's semantics
// (strings as UTF-8 byte sequences, Invalid_argument on bad indices).

///|
/// `lsr`: logical shift right.
pub fn lsr(x : Int, n : Int) -> Int {
  (x.reinterpret_as_uint() >> n).reinterpret_as_int()
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
/// `String.get s i`: the byte at `i`.
pub fn string_get(s : String, i : Int) -> Char raise {
  let b = @utf8.encode(s)
  if i < 0 || i >= b.length() {
    raise @num.InvalidArgument("index out of bounds")
  }
  b[i].to_int().unsafe_to_char()
}

///|
/// `String.sub s start len` on UTF-8 bytes.
pub fn string_sub(s : String, start : Int, len : Int) -> String raise {
  let b = @utf8.encode(s)
  if start < 0 || len < 0 || start > b.length() - len {
    raise @num.InvalidArgument("String.sub / Bytes.sub")
  }
  @utf8.decode_lossy(b[start:start + len])
}

///|
/// `String.make n c`
pub fn string_make(n : Int, c : Char) -> String raise {
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
