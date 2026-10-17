///|
using @list {type List}

///|
/// Left-associated binary operators.
fn[X, A, S] leftbin(
  p : (X) -> (A, X) raise,
  sep : (X) -> (S, X) raise,
  cons : (S, A, A) -> A raise?,
  err : String,
) -> (X) -> (A, X) raise {
  map(seq(p, many(seq(sep, fix(err, p)))), xo => {
    let (x, opxs) = xo
    let (ops, xs) = @lib.unzip(opxs)
    @lib.itlist2((op, y, acc) => cons(op, acc, y), ops.rev(), xs.rev(), x)
  })
}

///|
/// Right-associated binary operators.
fn[X, A, S] rightbin(
  p : (X) -> (A, X) raise,
  sep : (X) -> (S, X) raise,
  cons : (S, A, A) -> A raise?,
  err : String,
) -> (X) -> (A, X) raise {
  map(seq(p, many(seq(sep, fix(err, p)))), xo => {
    let (x, opxs) = xo
    if opxs.is_empty() {
      x
    } else {
      let (ops, xs) = @lib.unzip(opxs)
      @lib.itlist2(cons, ops, @lib.butlast(xs).prepend(x), @lib.last(xs))
    }
  })
}
