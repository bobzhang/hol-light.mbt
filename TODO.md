# TODO

State at the pause (2026-10-04). PLAN.md has the design and the history;
this file is what to do next.

## Done

- Core: every file hol.ml loads (13 hand-ported, 32 translated).
- Library/: every file except `tactician_light.ml`.
- Multivariate/: all 32 theory files (make.ml/make_complex.ml order, plus the
  12 others loaded after their anchor).
- 100/: 25 files (arithmetic .. euler).
- Each translated file loads identically to upstream (theorem statements,
  constants, counters) and asserts no axiom but upstream's three
  (`@testkit.check_axioms`): `tools/test.py all` (wasm-gc, 25 min on 24
  cores; `--target wasm` takes hours). Tiers: `tools/test.py` (hand-ported
  core, 10 s), `core`, `library`, `multivariate`, `100`.
- OCaml `int` is exact 63-bit `Int64`; native (debug) passes too.

## Resume

    python3 tools/ocaml_ref/batch.py --files 100/x.ml 100/y.ml ...
    python3 tools/ocaml_ref/batch.py --resume --files ...   # after a failure
    python3 tools/ocaml_ref/batch.py Multivariate/a.ml Multivariate/b.ml  # range

batch.py translates in one OCaml session and checks against one upstream
session (forked children per file), then runs the new tests with
`moon test --target wasm-gc`. Untranslated dependencies are added as targets. Progress:
`tools/ocaml_ref/_build/batch/translate.log` and `ref.log`. Keep batches to
~10-15 files: a failure late in a big batch costs hours.

## Next

1. **100/ chunk 2** (34 files, pythagoras .. transcendence): translated on
   branch `wip/100-chunk2`, references and tests not run. The translations
   type-check against the current main (2026-10-04). Take the 34 package
   directories and their `tools/ocaml_ref/100_*_ref.ml` from the branch
   (not its batch.py), then `batch.py --resume --files <those files>` (with
   every target translated it goes straight to the references); the ten
   files that need only Library/ make a quick first batch. Commit to main
   when the tests pass. Blocked on the reference toolchain (below).
2. **100/ remainder**: buffon (Probability), cubic (Complex), dirichlet and
   pnt (Examples/mangoldt.ml), piseries (Examples/machin.ml), thales and
   ceva (Examples/sos.ml, see csdp below).
3. **Probability/** (97k lines), then Jordan/ (75k), Examples/ (30k),
   RichterHilbertAxiomGeometry/, Divstep/, Rqe/, Logic/, the smaller theory
   directories, Autoformalization/ (205k). Check each for external tools
   first.

## Open issues

- **Reference toolchain**: run.sh and translate.sh select the opam switch
  `4.14.1+idea`, which this machine no longer has; the 4.14 switch that
  exists (`idea-dev`) has num and camlp-streams but no camlp5, so reference
  runs fail with `No_such_package ("camlp5")`. Install camlp5 8.00 there
  (or recreate the switch) and fix the switch name in both scripts.

- **Publishing**: mooncakes caps a module at 100 MB unpacked (over it, the
  server answers "Invalid ZIP archive"). `bobzhang/hol_light` 0.1.0 has the
  core and Library/ with their tests (71 MB). Multivariate/ (166 MB: 73 MB
  source, 93 MB tests) and 100/ (which needs it) are on GitHub only. Publish
  them as separate modules (e.g. `bobzhang/hol_light_multivariate`, possibly
  split further, tests trimmed): the translator and theory.py write import
  paths `bobzhang/hol_light/<pkg>`, so they need a module prefix per
  directory.

- **Package alias collisions**: MoonBit imports a package by its last path
  component; `Probability/measure.ml` clashes with `Multivariate/measure`,
  `Probability/independence.ml` with `100/independence`,
  `Logic/canon.ml` with core `canon`. moon.pkg supports
  `"path" @alias`; add an override table (e.g.
  `tools/translator/aliases.txt`) read by the translator (`Lower.pkg_alias`,
  `Mbti.qualify`) and theory.py (setup's alias check), and check how
  `moon info` spells aliased packages in interfaces.
- **csdp**: Examples/sos.ml (REAL_SOS) runs the external SDP solver csdp
  (not in Homebrew; build from COIN-OR source, ask first). For wasm, replay
  recorded solver answers like lib/gp.mbt does for PARI/GP; the kernel
  checks the certificates.
- **Parallel reference branches**: batch.py on `wip/100-chunk2` runs
  reference branches in parallel (token pipe, 8 at a time); validate that
  it reproduces committed goldens byte for byte (the first 100/ chunk)
  before using it. The translation session is still serial (each
  translation needs the previous interfaces from `moon info`).
- **CI**: none yet. `tools/test.py <tier> --shard I/N` is meant for it: the
  quick tier on every push, the theory tiers as a matrix (Multivariate is
  3.7 of the suite's 4.5 CPU hours; building every test executable takes
  another 10 minutes on 24 cores).
- **Stale references**: tools/ocaml_ref/num_ref.expected has three lines
  the test no longer embeds (`int_big`, `int_too_big`, `max_min`), and
  parser_ref.expected is not what parser_ref_test.mbt embeds; regenerate
  or delete them.
- **Native release**: `moon test --release --target native` hits a moonc
  C-backend miscompile; repro in tools/moonbit_bugs/. Retry after a compiler
  update (debug native passes).
- **Regenerate everything once** (`tools/ocaml_ref/retranslate_all.py`,
  then the batch for Multivariate/100): later translator changes (`x = []`
  as a constructor test, formatter-ignored output) are not yet applied to
  older packages; equivalent, but the code differs.
- **Codex review** of the last commits (frexp, `= []`, --resume, streamed
  logs, alias table when added).
- **Not ported**: tactician_light.ml (needs a tactic-expression interpreter
  to replace `loadt` of OCaml strings), help.ml/database.ml and the
  Multivariate `*_database.ml` search tables (interactive), 
  100/e_is_transcendental.ml (fails upstream).
- **Known limitations**: see PLAN.md (Num representation history,
  non-ASCII byte strings, float-array hashing, let rec groups with
  ambiguous initialization order are rejected).
