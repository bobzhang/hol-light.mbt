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

///|
/// `List.fold_left2`: raises `Invalid_argument` on a length mismatch,
/// after folding the common prefix.
pub fn[A, B, C] list_fold_left2(
  f : (A, B, C) -> A raise?,
  acc : A,
  l1 : @list.List[B],
  l2 : @list.List[C],
) -> A raise {
  let mut acc = acc
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, Empty) => return acc
      (More(x, tail=xs), More(y, tail=ys)) => {
        acc = f(acc, x, y)
        a = xs
        b = ys
      }
      _ => raise @num.InvalidArgument("List.fold_left2")
    }
  }
  acc
}

///|
/// OCaml's `Hashtbl.t` with structural keys: each key holds its bindings,
/// newest first (`add` shadows, `remove` uncovers). Bucket iteration order
/// is not modelled (no iteration functions).
pub struct OHashtbl[K, V] {
  priv buckets : Map[Int, Array[(K, @list.List[V])]]
}

///|
/// `Hashtbl.create n`
pub fn[K, V] hashtbl_create(_n : Int) -> OHashtbl[K, V] {
  { buckets: Map([]), }
}

///|
fn[K : OCompare + OHash, V] OHashtbl::slot(
  self : OHashtbl[K, V],
  k : K,
) -> (Array[(K, @list.List[V])], Int) {
  let h = hash(k)
  let b = match self.buckets.get(h) {
    Some(b) => b
    None => {
      let b = []
      self.buckets[h] = b
      b
    }
  }
  for i, e in b {
    if compare(e.0, k) == 0 {
      return (b, i)
    }
  }
  (b, -1)
}

///|
/// `Hashtbl.clear`
pub fn[K, V] hashtbl_clear(t : OHashtbl[K, V]) -> Unit {
  t.buckets.clear()
}

///|
/// `Hashtbl.add t k v`: shadows the previous binding of `k`.
pub fn[K : OCompare + OHash, V] hashtbl_add(
  t : OHashtbl[K, V],
  k : K,
  v : V,
) -> Unit {
  let (b, i) = t.slot(k)
  if i < 0 {
    b.push((k, @list.singleton(v)))
  } else {
    b[i] = (b[i].0, b[i].1.prepend(v))
  }
}

///|
/// `Hashtbl.replace t k v`: replaces the newest binding of `k`.
pub fn[K : OCompare + OHash, V] hashtbl_replace(
  t : OHashtbl[K, V],
  k : K,
  v : V,
) -> Unit {
  let (b, i) = t.slot(k)
  if i < 0 {
    b.push((k, @list.singleton(v)))
  } else {
    match b[i].1 {
      More(_, tail=rest) => b[i] = (b[i].0, rest.prepend(v))
      Empty => b[i] = (b[i].0, @list.singleton(v))
    }
  }
}

///|
/// `Hashtbl.find`: the newest binding; raises `Not_found`.
pub fn[K : OCompare + OHash, V] hashtbl_find(
  t : OHashtbl[K, V],
  k : K,
) -> V raise {
  let (b, i) = t.slot(k)
  if i >= 0 {
    match b[i].1 {
      More(v, ..) => return v
      Empty => ()
    }
  }
  raise NotFound
}

///|
/// `Hashtbl.find_opt`
pub fn[K : OCompare + OHash, V] hashtbl_find_opt(
  t : OHashtbl[K, V],
  k : K,
) -> V? {
  try hashtbl_find(t, k) catch {
    _ => None
  } noraise {
    v => Some(v)
  }
}

///|
/// `Hashtbl.mem`
pub fn[K : OCompare + OHash, V] hashtbl_mem(t : OHashtbl[K, V], k : K) -> Bool {
  hashtbl_find_opt(t, k) is Some(_)
}

///|
/// `Hashtbl.remove`: removes the newest binding of `k`.
pub fn[K : OCompare + OHash, V] hashtbl_remove(
  t : OHashtbl[K, V],
  k : K,
) -> Unit {
  let (b, i) = t.slot(k)
  if i >= 0 {
    match b[i].1 {
      More(_, tail=rest) => b[i] = (b[i].0, rest)
      Empty => ()
    }
  }
}

///|
/// OCaml's `Lazy.t`: forced at most once; an exception raised while
/// forcing is raised again by every later force.
pub struct OLazy[T] {
  priv mut state : LazyState[T]
}

///|
priv enum LazyState[T] {
  Pending(() -> T raise)
  Forcing
  Done(T)
  Failed(Error)
}

///|
/// OCaml's `Lazy.Undefined` (a lazy value forced while being forced).
pub(all) suberror LazyUndefined derive(Debug)

///|
/// `lazy e`
pub fn[T] lazy_new(f : () -> T raise) -> OLazy[T] {
  { state: Pending(f), }
}

///|
/// `Lazy.force`
pub fn[T] lazy_force(l : OLazy[T]) -> T raise {
  match l.state {
    Done(v) => v
    Failed(e) => raise e
    Forcing => raise LazyUndefined
    Pending(f) => {
      l.state = Forcing
      let v = f() catch {
        e => {
          l.state = Failed(e)
          raise e
        }
      }
      l.state = Done(v)
      v
    }
  }
}

///|
/// `Char.chr`: raises `Invalid_argument` outside 0..255.
pub fn char_chr(n : Int) -> Char raise {
  if n < 0 || n > 255 {
    raise @num.InvalidArgument("Char.chr")
  }
  n.unsafe_to_char()
}
