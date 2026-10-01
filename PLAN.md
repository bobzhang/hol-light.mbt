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
  It depends only on `moonbitlang/core` and uses the builtin `Failure` error.
  The `lib.ml` helpers it needs (`union`, `subtract`, `qmap`, `rev_assocd`, …)
  are private copies inside `kernel/`, so the audited trusted code is
  exactly that package. `HolType` and `Term` are read-only enums (they can be
  matched but not constructed outside the kernel), so every term is well
  typed. Axioms added with `new_axiom` are checked against the upstream
  approved list (`hol_lib.ml`). `Thm`
  has private fields, so the 10 primitive rules plus the axiom and definition
  functions are the only way to make a theorem. Everything else (lib, parser,
  tactics, decision procedures, theories) is untrusted and goes through the
  kernel API.
- **Review:** each commit gets `codex review --commit <sha>` (model
  `gpt-6-astra`, reasoning effort high). Valid findings
  are fixed in a follow-up commit, and disagreements are escalated.

## Semantic hazards (OCaml → MoonBit)

| Hazard | Decision |
|---|---|
| Polymorphic `compare` on terms, types and strings. MoonBit `String::compare` puts shorter strings first (`"b" < "aa"`), while OCaml compares byte by byte. This is load-bearing: the kernel sorts hypotheses with `alphaorder`, and `setify` and `sort` change output order. | Write `Compare` by hand to reproduce OCaml's order: constructor tag first, then fields from left to right, `[] < _::_`, and strings compared by code point (the same as UTF-8 byte order). Never use derived `Compare` or `String::compare` where OCaml's order matters. |
| `string` | HOL names and quotations are ASCII text, so use `String`. The only byte-level places are char/string theories (`mk_char`, `Library/strings`), which get explicit byte helpers. |
| OCaml `list` and physical-equality sharing (`==`) in `qmap`, `vsubst`, `inst`, `term_image` | Use the immutable `@list.List[T]` and `physical_equal`. Lists keep their order exactly as in OCaml (for example `constants()` returns the newest first). |
| `Failure`, `try … with Failure _`, `can`, `Unchanged` | `failure/` defines `suberror Failure String` and `failwith`. Fallible functions are declared `raise`, and `can f x` becomes `try`. |
| Deep recursion. Both wasm and wasm-gc overflow somewhere between 10K and 30K frames. | List utilities use loops or `@list` builtins. Recursion over terms is **not** assumed safe: there are stress tests for deep combinations, binders and long lists, and explicit work stacks are added where needed. |
| Evaluation order. OCaml 4.14 evaluates tuples, function arguments, list literals and binary operators right to left, but `let … and …` left to right. MoonBit is always left to right. | Whenever the parts have effects (fresh names, registration, exceptions), write the order out explicitly. Library callback order follows `lib.ml` exactly: `map` runs head-first, `filter`/`mapfilter` tail-first. |
| OCaml 63-bit `int` vs MoonBit 32-bit `Int` | Use `Int` only where the range is clearly small (indexes, arities, counters). Use `Int64` where values can grow (hash values, user-visible numbers), with an audit at each port. |
| `Hashtbl.hash` decides the tree shape of the `lib.ml` Patricia maps (`func`, `\|->`), and so their fold and `choose` order | Implement an OCaml-compatible `caml_hash` (MurmurHash3, limits 10/256) for the key types used (strings, ints, terms, types, tuples) and test it against OCaml values. Keep `Hashtbl` duplicate-binding semantics. |
| Physical equality `==` | Use `physical_equal` only as a sharing optimization. Results must be structurally identical whether it returns true or false. |
| Alpha order vs structural order | They are kept separate: `alphaorder` puts `Const < Var < Comb < Abs`, while structural `compare` uses the constructor order `Var < Const < Comb < Abs`. |
| `Lazy` (thecops), exceptions other than `Failure` (`Unchanged`, `Noparse`, `Not_found`) | Port to `Lazy`-like explicit cells and separate `suberror`s. `can`/`try … with Failure _` catch only `Failure`. `abort` is used only for states the kernel makes impossible. |
| `Num` / Zarith bignums and rationals | `num/` implements arbitrary-precision rationals on top of `@bigint`, matching the `Num` operations HOL uses (`quo_num`/`mod_num` sign rules, `string_of_num`, …). |
| `Format` pretty printing | Port a minimal OCaml `Format` box engine (`pp/`) so that printer output matches byte for byte. |
| Term quotations `` `...` `` (camlp5 `pa_j`) | Becomes a call to the parser on a string (`@parser.parse_term("...")`). Type quotations `` `:ty` `` become `parse_type`. |
| `Hashtbl.hash`-dependent order | Where iteration order changes results, use insertion-ordered `Map` and check against the reference output. |

## Naming

MoonBit treats uppercase identifiers as constructors, so HOL's UPPERCASE
values (rules, tactics, conversions, theorems) become lowercase:
`REFL` → `refl`, `EQ_MP` → `eq_mp`, `ADD_SYM` → `add_sym`. When the
lowercase name collides with an existing lowercase HOL/OCaml identifier
or a MoonBit keyword, a suffix based on the kind is added: `_rule` for
inference rules, `_thm` for theorems, `_conv` for conversions, `_tac` for
tactics. Kernel examples: `MK_COMB` → `mk_comb_rule`, `INST` → `inst_rule`,
`ABS` → `abs_rule`, `ASSUME` → `assume_rule` (`assume` is reserved). Doc
comments name the original HOL identifier.

## Package layout (each package follows one HOL file or a few adjacent ones)

```
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
1. `kernel/` (`fusion.ml`), with exhaustive kernel tests and deep-term
   stress tests.
2. Reference harness (OCaml dump of theorems, registries and printer
   output), `lib/` (`lib.ml`, including OCaml-compatible hashing and
   `func`), and `num/`.
3. `basics/`, `nets/`, `pp/`, `printer/`, `preterm/`, `parser/`, plus an
   early translator spike on `pair.ml`.
4. `equal`, `bool`, `drule`, `tactics`, `itab`, `simp`, `theorems`,
   `ind_defs`, `class`, `trivia`, `canon`, `meson`, `firstorder`, `metis`,
   `thecops`, `quot`, `impconv`.
5. `pair` … `realarith` … `sets`, `iterate`, `cart`, `define`, … (the rest
   of `hol.ml`), plus the translator spike.
6. `Library/`, `Multivariate/`, and the other subdirectories, incrementally.
7. Add the `native` target and performance work.

## Progress log

- [x] Phase 0: scaffold, plan, OCaml reference harness (`tools/ocaml_ref`:
  builds `pa_j` for camlp5 8.00, loads upstream sources, emits reference
  output that is embedded into MoonBit tests with `embed_golden.py`).
- [x] Phase 1: `kernel/` matches `fusion.ml` on 56 differential checks
  (`kernel/kernel_ref_test.mbt`).
  Known limit: with the default wasm stack (984 KB) recursive kernel
  operations handle terms nested about 2500 deep in debug builds
  (`vsubst_rec` overflows first). `moonrun --stack-size 4000` makes depth
  3000+ work. Mitigations, if real theories need them: run the CLI through
  `moonrun --stack-size`, or rewrite the hot paths with explicit stacks.
