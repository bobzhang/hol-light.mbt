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
- **100/**: 59 of 67 files (`100/<name>`); the rest wait for other
  directories.
- **Complex/, Arithmetic/, Permutation/, Ntrie/, Model/, GL/, Divstep/, Rqe/,
  Unity/, Logic/**:
  their theory files (`complex/<name>`, ...).
- **EC/**: 26 of 30 files so far. **Jordan/**: 13 of 14 (the main theorem
  is next). **Examples/**: 31 of 50. **Autoformalization/**: 2 of 7.

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
python3 tools/test.py all                  # the whole suite on wasm-gc
python3 tools/test.py all --target wasm    # on the primary target (hours): before a release
python3 tools/ocaml_ref/batch.py --files 100/x.ml ...   # translate and check
```

A file's test loads everything before it in a fresh process and compares
what HOL Light itself gives. The files of a directory with a load order
(its make.ml) are the test blocks of one package, `<dir>/make`, which
loads the chain once; `tools/test.py complex/make/05_quelim_test.mbt` runs
one member alone. Files outside such an order (100/, most of Library/)
have a test each. Run the tier you touch; `--shard I/N` splits a selection
across machines. Builds run 4 compiler processes at once (`--build-jobs`,
`$HOL_MOON_JOBS`): linking the test executable of a long chain takes about
14 GB, so moon's default of one per core is not safe here.

The upstream sources go in `.repos/hol-light`. The reference runs use the
opam switch `hol-light` (or `$HOL_LIGHT_SWITCH`):

```
opam switch create hol-light ocaml-base-compiler.4.14.1 --no-switch
opam install --switch=hol-light camlp5.8.02.01 num camlp-streams ocamlfind
brew install pari    # upstream's PRIME_CONV calls gp (Library/pocklington.ml)
```

[PLAN.md](PLAN.md) has the design, decisions and known limitations;
[TODO.md](TODO.md) the plan for what is left.
