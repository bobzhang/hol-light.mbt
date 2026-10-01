# HOL Light → MoonBit port plan

Upstream: `.repos/hol-light` (jrh13/hol-light @ `cba9198`), not tracked in this repo.

## Goals and decisions

- **Scope:** everything, incrementally. First the full `hol.ml` load sequence
  (~56K lines in the root dir), then `Library/`, `Multivariate/`, and the rest
  (~1.2M lines in total).
- **Targets:** `wasm` (linear memory) is the primary target, and every
  package must pass `moon test --target wasm`. `native` comes later. Keep
  packages target-agnostic: no FFI and no async in core packages.
- **Small trusted kernel:** only `kernel/` (a port of `fusion.ml`) is trusted.
  It depends only on `moonbitlang/core` and the tiny `failure/` package. `Thm`
  has private fields, so the 10 primitive rules plus the axiom and definition
  functions are the only way to make a theorem. Everything else (lib, parser,
  tactics, decision procedures, theories) is untrusted and goes through the
  kernel API.
- **Review:** each commit gets `codex review --commit <sha>`. Valid findings
  are fixed in a follow-up commit, and disagreements are escalated.

## Semantic hazards (OCaml → MoonBit)

| Hazard | Decision |
|---|---|
| Polymorphic `compare` on terms, types and strings. MoonBit `String::compare` puts shorter strings first (`"b" < "aa"`), while OCaml compares byte by byte. This is load-bearing: the kernel sorts hypotheses with `alphaorder`, and `setify` and `sort` change output order. | Write `Compare` by hand to reproduce OCaml's order: constructor tag first, then fields from left to right, `[] < _::_`, and strings compared by code point (the same as UTF-8 byte order). Never use derived `Compare` or `String::compare` where OCaml's order matters. |
| `string` | HOL names and quotations are ASCII text, so use `String`. The only byte-level places are char/string theories (`mk_char`, `Library/strings`), which get explicit byte helpers. |
| OCaml `list` and physical-equality sharing (`==`) in `qmap`, `vsubst`, `inst`, `term_image` | Use the immutable `@list.List[T]` and `physical_equal`. Lists keep their order exactly as in OCaml (for example `constants()` returns the newest first). |
| `Failure`, `try … with Failure _`, `can`, `Unchanged` | `failure/` defines `suberror Failure String` and `failwith`. Fallible functions are declared `raise`, and `can f x` becomes `try`. |
| Deep recursion. Both wasm and wasm-gc overflow somewhere between 10K and 30K frames. | List utilities use loops or `@list` builtins. Recursion over terms is fine. Watch long assumption lists and numerals. |
| `Num` / Zarith bignums and rationals | `num/` implements arbitrary-precision rationals on top of `@bigint`, matching the `Num` operations HOL uses (`quo_num`/`mod_num` sign rules, `string_of_num`, …). |
| `Format` pretty printing | Port a minimal OCaml `Format` box engine (`pp/`) so that printer output matches byte for byte. |
| Term quotations `` `...` `` (camlp5 `pa_j`) | Becomes a call to the parser on a string (`@parser.parse_term("...")`). Type quotations `` `:ty` `` become `parse_type`. |
| `Hashtbl.hash`-dependent order | Where iteration order changes results, use insertion-ordered `Map` and check against the reference output. |

## Package layout (each package follows one HOL file or a few adjacent ones)

```
failure/   Failure error type (shared by kernel and everything else)
kernel/    fusion.ml               ← TRUSTED, kept minimal
lib/       lib.ml                  general utilities (untrusted)
num/       Num replacement on @bigint
pp/        OCaml Format subset
basics/    basics.ml, nets.ml
printer/   printer.ml
parser/    preterm.ml, parser.ml
equal/ … drule/ tactics/ simp/ …   one package per layer, in hol.ml load order
theories/… generated or hand-ported theory scripts
```

Theories register themselves in order through explicit `load_*()`
functions, never through top-level side effects, so callers control loading.

## Proof scripts strategy

1. **Engine (hand-ported, idiomatic):** every file that mostly defines ML
   functions (rules, conversions, tactics, decision procedures, `define`,
   `ind_types`, …).
2. **Theory scripts (translated by a tool):** most of the remaining lines are
   `let NAME = prove(`…`, TAC)` and `new_definition` calls. Write a
   translator in OCaml using `compiler-libs`. It works on the camlp5-expanded,
   type-checked AST, so it has full type information (MoonBit needs types on
   top-level functions). It emits MoonBit; the output is spot-checked and
   fixed by hand where needed. Decide on the translator after a spike on
   `pair.ml` and `nums.ml` (phase 5).
3. Optionally later: a small ML-subset interpreter or REPL for interactive use.

## Verification

- **Reference outputs:** run real HOL Light (OCaml 4.14 and camlp5 are
  installed locally) and dump `name: string_of_thm` for every theorem a file
  defines, plus selected printer and parser cases. The MoonBit port must
  match these exactly.
- Unit tests ported from `UnitTests/`. Kernel tests cover every rule's
  success and failure cases.
- Every commit must pass `moon check --target wasm`,
  `moon test --target wasm`, `moon fmt` and `moon info`.

## Phases

0. Scaffold, plan and `.gitignore` (upstream excluded).
1. `failure/` and `kernel/` (`fusion.ml`), with exhaustive kernel tests.
2. `lib/` (`lib.ml`) and `num/`.
3. `basics/`, `nets/`, `pp/`, `printer/`, `preterm/`, `parser/`, and the
   reference harness.
4. `equal`, `bool`, `drule`, `tactics`, `itab`, `simp`, `theorems`,
   `ind_defs`, `class`, `trivia`, `canon`, `meson`, `firstorder`, `metis`,
   `thecops`, `quot`, `impconv`.
5. `pair` … `realarith` … `sets`, `iterate`, `cart`, `define`, … (the rest
   of `hol.ml`), plus the translator spike.
6. `Library/`, `Multivariate/`, and the other subdirectories, incrementally.
7. Add the `native` target and performance work.

## Progress log

- [ ] Phase 0
