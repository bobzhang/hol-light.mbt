// ===========================================================================
// OCaml polymorphic `compare` and `Hashtbl.hash`, for the value shapes HOL
// Light uses.
//
// HOL Light relies on OCaml's structural `compare` (for `mem`, `assoc`,
// `setify`, ...) and on `Hashtbl.hash` (whose values decide the shape of
// the Patricia trees in `func`, and therefore their fold order). Each type
// that takes part implements these traits following OCaml's runtime
// representation:
//
// - `int`, `bool`, `char`, `unit` and constant constructors are immediate
//   integers (`false`/`[]`/`None`/`()` are 0, `true` is 1);
// - strings are byte strings (hashed and compared as UTF-8);
// - tuples, records, cons cells and non-constant constructors are blocks
//   with a tag (constructor index among the non-constant constructors) and
//   their fields in order.
// ===========================================================================

///|
/// OCaml's polymorphic `compare`.
pub trait OCompare {
  fn ocompare(Self, Self) -> Int
}

///|
/// OCaml's polymorphic hash (`Hashtbl.hash`): visits a value in the
/// breadth-first order of `caml_hash`.
pub trait OHash {
  fn ohash_visit(Self, OHasher) -> Unit
}

///|
/// OCaml `compare x y`.
pub fn[T : OCompare] compare(x : T, y : T) -> Int {
  x.ocompare(y)
}

///|
/// State of `caml_hash(10, 100, 0, v)`.
pub struct OHasher {
  priv queue : Array[&OHash]
  priv mut h : UInt
  priv mut num : Int
}

///|
/// Size limit of the queue (`Hashtbl.hash` uses 100).
let hash_queue_limit = 100

///|
fn rotl32(x : UInt, n : Int) -> UInt {
  (x << n) | (x >> (32 - n))
}

///|
fn OHasher::mix(self : OHasher, d : UInt) -> Unit {
  let mut d = d * 0xcc9e2d51U
  d = rotl32(d, 15)
  d = d * 0x1b873593U
  let mut h = self.h ^ d
  h = rotl32(h, 13)
  self.h = h * 5U + 0xe6546b64U
}

///|
/// Mix an OCaml `int` (counts as a meaningful value).
pub fn OHasher::int(self : OHasher, n : Int64) -> Unit {
  // The tagged representation 2n+1, folded to 32 bits as in
  // caml_hash_mix_intnat.
  let d = n * 2L + 1L
  let folded = (d >> 32) ^ (d >> 63) ^ d
  self.mix(folded.to_int().reinterpret_as_uint())
  self.num -= 1
}

///|
/// Mix an OCaml string given as UTF-8 bytes (counts as a meaningful value).
pub fn OHasher::bytes(self : OHasher, b : Bytes) -> Unit {
  let len = b.length()
  let mut i = 0
  while i + 4 <= len {
    let w = b[i].to_uint() |
      (b[i + 1].to_uint() << 8) |
      (b[i + 2].to_uint() << 16) |
      (b[i + 3].to_uint() << 24)
    self.mix(w)
    i += 4
  }
  let rest = len & 3
  if rest > 0 {
    let mut w = 0U
    if rest == 3 {
      w = b[i + 2].to_uint() << 16
    }
    if rest >= 2 {
      w = w | (b[i + 1].to_uint() << 8)
    }
    w = w | b[i].to_uint()
    self.mix(w)
  }
  self.h = self.h ^ len.reinterpret_as_uint()
  self.num -= 1
}

///|
/// Mix an OCaml string (counts as a meaningful value).
pub fn OHasher::string(self : OHasher, s : String) -> Unit {
  self.bytes(@utf8.encode(s))
}

///|
/// Start a block with the given tag and size. The header is mixed in but
/// does not count as a meaningful value; the fields must then be pushed
/// with `field`, in order.
pub fn OHasher::block(self : OHasher, tag : Int, size : Int) -> Unit {
  self.mix(((size << 10) | tag).reinterpret_as_uint())
}

///|
/// Enqueue a field of the current block (dropped once the queue is full).
pub fn[T : OHash] OHasher::field(self : OHasher, x : T) -> Unit {
  if self.queue.length() < hash_queue_limit {
    self.queue.push(x as &OHash)
  }
}

///|
/// OCaml `Hashtbl.hash`: a nonnegative 30-bit integer.
pub fn[T : OHash] hash(x : T) -> Int {
  let st : OHasher = { queue: [x as &OHash], h: 0U, num: 10, }
  let mut rd = 0
  while rd < st.queue.length() && st.num > 0 {
    let v = st.queue[rd]
    rd += 1
    v.ohash_visit(st)
  }
  let mut h = st.h
  h = h ^ (h >> 16)
  h = h * 0x85ebca6bU
  h = h ^ (h >> 13)
  h = h * 0xc2b2ae35U
  h = h ^ (h >> 16)
  (h & 0x3FFFFFFFU).reinterpret_as_int()
}

// ---------------------------------------------------------------------------
// Primitive types.
// ---------------------------------------------------------------------------

///|
pub impl OCompare for Int with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for Int with fn ohash_visit(self, h) {
  h.int(self.to_int64())
}

///|
/// OCaml ints are 63-bit; `Int64` stands for an OCaml `int` that may not
/// fit in 32 bits.
pub impl OCompare for Int64 with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for Int64 with fn ohash_visit(self, h) {
  h.int(self)
}

///|
pub impl OCompare for Bool with fn ocompare(self, other) {
  self.to_int().compare(other.to_int())
}

///|
pub impl OHash for Bool with fn ohash_visit(self, h) {
  h.int(if self { 1L } else { 0L })
}

///|
pub impl OCompare for Char with fn ocompare(self, other) {
  self.to_int().compare(other.to_int())
}

///|
pub impl OHash for Char with fn ohash_visit(self, h) {
  h.int(self.to_int().to_int64())
}

///|
pub impl OCompare for Unit with fn ocompare(_, _) {
  0
}

///|
pub impl OHash for Unit with fn ohash_visit(_, h) {
  h.int(0L)
}

///|
pub impl OCompare for String with fn ocompare(self, other) {
  @kernel.compare_string(self, other)
}

///|
pub impl OHash for String with fn ohash_visit(self, h) {
  h.string(self)
}

// ---------------------------------------------------------------------------
// Polymorphic containers.
// ---------------------------------------------------------------------------

///|
pub impl[A : OCompare, B : OCompare] OCompare for (A, B) with fn ocompare(
  self,
  other,
) {
  let c = self.0.ocompare(other.0)
  if c != 0 {
    c
  } else {
    self.1.ocompare(other.1)
  }
}

///|
pub impl[A : OHash, B : OHash] OHash for (A, B) with fn ohash_visit(self, h) {
  h.block(0, 2)
  h.field(self.0)
  h.field(self.1)
}

///|
pub impl[A : OCompare, B : OCompare, C : OCompare] OCompare for (A, B, C) with fn ocompare(
  self,
  other,
) {
  let c = self.0.ocompare(other.0)
  if c != 0 {
    return c
  }
  let c = self.1.ocompare(other.1)
  if c != 0 {
    return c
  }
  self.2.ocompare(other.2)
}

///|
pub impl[A : OHash, B : OHash, C : OHash] OHash for (A, B, C) with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 3)
  h.field(self.0)
  h.field(self.1)
  h.field(self.2)
}

///|
pub impl[A : OCompare, B : OCompare, C : OCompare, D : OCompare] OCompare for (
  A,
  B,
  C,
  D,
) with fn ocompare(self, other) {
  let c = self.0.ocompare(other.0)
  if c != 0 {
    return c
  }
  let c = self.1.ocompare(other.1)
  if c != 0 {
    return c
  }
  let c = self.2.ocompare(other.2)
  if c != 0 {
    return c
  }
  self.3.ocompare(other.3)
}

///|
pub impl[A : OHash, B : OHash, C : OHash, D : OHash] OHash for (A, B, C, D) with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 4)
  h.field(self.0)
  h.field(self.1)
  h.field(self.2)
  h.field(self.3)
}

///|
/// `[]` is the immediate 0, so it sorts before every cons cell.
pub impl[A : OCompare] OCompare for @list.List[A] with fn ocompare(self, other) {
  let mut a = self
  let mut b = other
  while true {
    match (a, b) {
      (Empty, Empty) => return 0
      (Empty, More(_)) => return -1
      (More(_), Empty) => return 1
      (More(x, tail=xs), More(y, tail=ys)) => {
        let c = x.ocompare(y)
        if c != 0 {
          return c
        }
        a = xs
        b = ys
      }
    }
  }
  0
}

///|
pub impl[A : OHash] OHash for @list.List[A] with fn ohash_visit(self, h) {
  match self {
    Empty => h.int(0L)
    More(x, tail=t) => {
      h.block(0, 2)
      h.field(x)
      h.field(t)
    }
  }
}

///|
pub impl[A : OCompare] OCompare for A? with fn ocompare(self, other) {
  match (self, other) {
    (None, None) => 0
    (None, Some(_)) => -1
    (Some(_), None) => 1
    (Some(x), Some(y)) => x.ocompare(y)
  }
}

///|
pub impl[A : OHash] OHash for A? with fn ohash_visit(self, h) {
  match self {
    None => h.int(0L)
    Some(x) => {
      h.block(0, 1)
      h.field(x)
    }
  }
}

// ---------------------------------------------------------------------------
// HOL kernel types (their `Compare` impls already follow OCaml's order).
// ---------------------------------------------------------------------------

///|
pub impl OCompare for @kernel.HolType with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for @kernel.HolType with fn ohash_visit(self, h) {
  match self {
    Tyvar(s) => {
      h.block(0, 1)
      h.field(s)
    }
    Tyapp(s, args) => {
      h.block(1, 2)
      h.field(s)
      h.field(args)
    }
  }
}

///|
pub impl OCompare for @kernel.Term with fn ocompare(self, other) {
  self.compare(other)
}

///|
pub impl OHash for @kernel.Term with fn ohash_visit(self, h) {
  match self {
    Var(s, ty) => {
      h.block(0, 2)
      h.field(s)
      h.field(ty)
    }
    Const(s, ty) => {
      h.block(1, 2)
      h.field(s)
      h.field(ty)
    }
    Comb(f, x) => {
      h.block(2, 2)
      h.field(f)
      h.field(x)
    }
    Abs(v, b) => {
      h.block(3, 2)
      h.field(v)
      h.field(b)
    }
  }
}

///|
pub impl OCompare for @kernel.Thm with fn ocompare(self, other) {
  self.compare(other)
}

///|
/// `thm` is `Sequent of (term list * term)`: a block of size 1 holding a
/// pair.
pub impl OHash for @kernel.Thm with fn ohash_visit(self, h) {
  h.block(0, 1)
  h.field(@kernel.dest_thm(self))
}
