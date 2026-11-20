# Multi-argument functions in the logic (#865)

Status: proposal. This note fixes the decisions a prototype needs, with a
default for each; the open questions at the end are for review.

## Where we are

Every quotation is in the fixed term syntax and the old parser is gone
(#140, #434). The term syntax reads MoonBit-shaped text but means HOL
Light's curried terms:

| Written | Means today |
| --- | --- |
| `(A, B) -> C` | `A -> B -> C` |
| `f(x, y)` | `f x y` |
| `(x : A, y : B) => e` | `\x y. e` |
| `fn { (x, y) => e }` | a function of one pair, `\(x, y). e` (GABS) |
| `f((x, y))` | `f` applied to the pair `(x, y)` |

The goal is to make the first three mean what they say: a function of two
arguments, not a function returning a function.

## Decision 1: a two-argument function takes a tuple

`(A, B) -> C` becomes `A # B -> C`, a function on the product type, and
`f(x, y)` becomes `f (x, y)`.

- **Kernel:** no change. `fun` stays binary and `prod` stays the
  definition in `pair`. The trusted kernel stays HOL Light's.
- **Lambdas:** `(x : A, y : B) => e` becomes the paired abstraction
  `\(x, y). e`, built with `GABS`, as `fn { (x, y) => e }` is today.
- **Alternative rejected:** an n-ary function type constructor in the
  kernel. It needs new primitive rules and a new type theory, and it
  makes the kernel diverge from fusion.ml, the one file the port keeps
  trusted and minimal.

Consequence: `fn { (x, y) => e }` and `(x, y) => e` mean the same thing,
so the pattern form is only needed for nested or constructor patterns.

## Decision 2: infix operators stay curried

`+`, `*`, `<`, `==`, `&&`, `→`, set operators and the other infixes are
written infix, so the surface syntax never shows whether they are
curried. They keep their HOL Light types. Defaults:

- **Logical constants** (`=`, `/\`, `==>`, quantifiers) are defined in
  bool, before `pair` exists, and must stay curried.
- **Arithmetic and order operators** stay curried. The decision
  procedures (arith, real, ring, MESON) work on their argument positions.
- **Only names written in application syntax `f(x, y)` change meaning.**
  Those are the library's prefix constants (`MAP`, `EL`, `IMAGE`, `SUBSET`
  when written prefix, …) and user variables of function type.

## Decision 3: curried constants are written `f(x)(y)`

After the switch, `f(x, y)` is uncurried application. A constant that
stays curried is applied one argument at a time: `MAP(f)(l)`. Partial
application is then visible in the text (`MAP(f)`), which is honest about
what the term is.

The re-spelling is mechanical:

1. switch the meaning of `f(x, y)` in the term syntax;
2. re-print every quotation with the printer under the new meaning;
3. check each one reads back to the same term, the round-trip check the
   migration already uses.

The library's quotations keep denoting exactly the theorems they denote
today; only their spelling changes. No theorem or printed result changes.
The goldens' quotation traces record the spelling, so they change with
it, and curried types are spelled `(A) -> (B) -> C`. This step is worth
doing before any constant changes type: it makes the syntax truthful, it
is reversible, and nothing in the logic moves.

## Decision 4: constants change type one family at a time, with bridges

A curried constant `c : A -> B -> C` becomes multi-argument by defining
`c' : A # B -> C` with `c'(x, y) = c x y`. Then:

1. prove the bridge theorem;
2. restate the family's theorems over `c'`, deriving them from the
   curried ones through the bridge, so no proof is redone;
3. move the users over;
4. retire `c` once nothing uses it.

Both forms coexist while a family migrates, and each family is its own
PR, gated on the full suite.

## Decision 5: goldens stay byte-exact against upstream until a family moves

The reference tests compare with upstream HOL Light. That stays true for
everything still curried. When a family changes type, its goldens are
regenerated in the same PR, and the PR lists the theorems whose
statements changed (curried → tupled). The alternative, comparing up to
uncurrying, needs a normaliser in the test harness that would also hide
real regressions.

## Plan

1. **Truthful syntax (Decision 3).** Add `f(x)(y)` printing for curried
   constants and switch `f(x, y)`, `(A, B) -> C` and `(x, y) => e`. This
   touches every quotation (and the goldens' quotation traces) and no
   theorem. It lands as several PRs: the
   switch with its printer, then per-tier re-spellings, then removal of
   the curried reading.
2. **Prototype one family (Decision 4)** on a small, closed one, for
   example `lists`' `MAP`/`FILTER`/`EL`, to measure the restatement
   churn and the cost of partial application in proofs (`MAP(f)`).
3. **Roll out** by family, ordered by how many users each has, gated on
   the full suite.

## Open questions

- **Scope:** should any library constant change type at all? Or is
  truthful syntax (step 1) the goal, with tupled functions only for new
  definitions? Step 1 is valuable on its own and fully reversible.
- **Operators:** should the arithmetic operators eventually change too?
  Decision 2 keeps them curried because the decision procedures depend on
  argument positions.
- **Lambda patterns:** should `(x, y) => e` keep its pattern reading, so
  that a nested tuple `((a, b), c) => e` is a pattern? Or should it bind a
  flat argument list only?
