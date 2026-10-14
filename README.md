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
- **100/**: 66 of 67 files (`100/<name>`): `e_is_transcendental` does not
  load upstream.
- **Complex/, Arithmetic/, Permutation/, Ntrie/, Model/, GL/, Divstep/, Rqe/,
  Unity/, Logic/, Jordan/** (with the Jordan curve theorem),
  **Functionspaces/, Quaternions/, Geometric_Algebra/, Probability/, IEEE/,
  IsabelleLight/, Boyer_Moore/, EC/, Autoformalization/, Cadical/,
  Minisat/, WZ/, LP_arith/**: their theory files (`complex/<name>`, ...).
- **Formal_ineqs/**: the 62 files its make.ml loads (the verifier of
  nonlinear inequalities; `formal_ineqs/<dir>/<name>`).
- **Examples/**: 49 of 50. **Tutorial/**: 23 of 24.
- **RichterHilbertAxiomGeometry/**: readable.ml and the six developments
  in its proof format that load upstream (`richterhilbertaxiomgeometry/<name>`).
- **miz3/**: miz3.ml and its thirteen sample proofs (`miz3/miz3`,
  `miz3/Samples/<name>`). **Mizarlight/**: its four files.
- Not ported: QBF/ (needs squolem, which has no build for this platform);
  see [TODO.md](TODO.md).

Files that run an external program (csdp for `Examples/sos.ml`'s REAL_SOS,
cadical, MiniSat, maxima for WZ/, cdd for LP_arith/, Prover9) load without
it: the program's runs are recorded when the reference output is made and
replayed (`<pkg>/commands.mbt`); the kernel checks the proofs they lead to.
Files that give OCaml to the toplevel as strings (the proofs of readable.ml
and miz3 name their theorems and tactics so) run what the translator made of
each string the reference session ran (`@lib.exec_phrase`).

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

Terms may be written with `∀ ∃ ∧ ∨ ¬ ⇒ ⇔ ≤ ≥ λ` for upstream's
`! ? /\ \/ ~ ==> <=> <= >= \` (the lexer gives the same tokens; the
printer keeps upstream's spelling):

```moonbit
let th = @int.arith_rule(@parser.parse_term("∀m n. m ≤ n ⇒ ¬(n < m)"))
println(@printer.string_of_thm(th))    // |- forall m n. m <= n ==> ~(n < m)
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

CI (`.github/workflows/ci.yml`) runs the core tier on every push and pull
request, as upstream's CI builds HOL Light and loads hol.ml. The whole
suite (`.github/workflows/full.yml`, upstream's `holtest`) runs each night
after a change to main, split over 20 machines, and by hand:

```
gh workflow run "Full suite"                        # everything
gh workflow run "Full suite" -f tiers=multivariate -f shards=8
```

Locally, run the tier you touch.

The upstream sources go in `.repos/hol-light`. The reference runs use the
opam switch `hol-light` (or `$HOL_LIGHT_SWITCH`):

```
opam switch create hol-light ocaml-base-compiler.4.14.1 --no-switch
opam install --switch=hol-light camlp5.8.02.01 num camlp-streams ocamlfind
brew install pari    # upstream's PRIME_CONV calls gp (Library/pocklington.ml)
brew install cadical # Cadical/ (also lrat-trim, github.com/arminbiere/lrat-trim)
brew install maxima  # WZ/, Tutorial/Linking_external_tools.ml
# on PATH too, built from source: csdp (github.com/coin-or/Csdp, for
# Examples/sos.ml), MiniSat-p 1.14 as `minisat` (minisat.se, for Minisat/),
# cddlib with LP_arith/cdd_cert.c as `cdd_cert` (LP_arith/), and Prover9
# with `prooftrans` (LADR, for Examples/prover9.ml)
```

[PLAN.md](PLAN.md) has the design, decisions and known limitations;
[TODO.md](TODO.md) the plan for what is left.
