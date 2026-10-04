# hol_light.mbt

A MoonBit port of [HOL Light](https://github.com/jrh13/hol-light), John Harrison's
LCF-style interactive theorem prover, targeting wasm (native works too).

The trusted kernel lives in `kernel/` (a port of `fusion.ml`); everything else
constructs theorems only through its API.

## Status

- **Core**: everything `hol.ml` loads. `lib`, `fusion` (`kernel/`), `basics`,
  `nets`, `printer`, `preterm`, `parser`, `equal`, `bool`, `drule`, `tactics`,
  `itab` and `simp` are ported by hand; the theory files (`theorems` ..
  `define`) are translated.
- **Library/**: every file but `tactician_light.ml` (`library/<name>`).
- **Multivariate/**: all 32 theory files (`multivariate/<name>`).
- **100/**: 25 files so far (`100/<name>`).

The mooncakes package `bobzhang/hol_light` has the core and Library/ (the
registry caps a module at 100 MB); Multivariate/, 100/ and the translation
tooling are in the [GitHub repository](https://github.com/bobzhang/hol-light.mbt).

Translated files are produced from upstream's OCaml by `tools/translator`,
which reproduces OCaml's runtime behaviour exactly (63-bit ints, polymorphic
compare and hashing, evaluation order, Hashtbl/Map/Random). Each translated
file is checked against upstream: loading it must give the same theorems,
constants and name counters as HOL Light itself (`*_ref_test.mbt`, golden
outputs from `tools/ocaml_ref`).

## Use

Packages for hol.ml's files initialize when imported, in upstream order.
Library and Multivariate packages load on demand, after what they need:

```moonbit
@prime.load()      // Library/prime.ml and its needs
let th = @prime.prime_2()
```

## Develop

```
python3 tools/test.py                      # hand-ported core, wasm and wasm-gc (10 s)
python3 tools/test.py core                 # everything hol.ml loads (20 s)
python3 tools/test.py library              # or multivariate, 100, a package directory
python3 tools/test.py all                  # the whole suite on wasm-gc (25 min on 24 cores)
python3 tools/test.py all --target wasm    # on the primary target (hours): before a release
python3 tools/ocaml_ref/batch.py --files 100/x.ml ...   # translate and check
```

Each theory's test loads its whole chain in a fresh process, so the suite
is 4.5 hours of CPU on wasm-gc and five times that on wasm: run the tier
you touch. `--shard I/N` splits a selection across machines.

The upstream sources go in `.repos/hol-light`; the reference runs need OCaml
4.14 with camlp5 and num (see `tools/ocaml_ref`). [PLAN.md](PLAN.md) has the
design, decisions and known limitations.
