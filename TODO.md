# TODO

State at the pause (2026-10-04). PLAN.md has the design and the history;
this file is what to do next.

## Done

- Core: every file hol.ml loads (13 hand-ported, 32 translated).
- Library/: every file except `tactician_light.ml`.
- Multivariate/: all 32 theory files (make.ml/make_complex.ml order, plus the
  12 others loaded after their anchor).
- 100/: 59 of 67 files. Left: cubic (Complex, now possible), buffon
  (Probability), dirichlet and pnt (Examples/mangoldt.ml), piseries
  (Examples/machin.ml), thales and ceva (Examples/sos.ml), and
  e_is_transcendental (fails upstream).
- Complex/: all 9 files, loaded in make.ml's order.
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

## Plan to finish

Upstream has about 1.25M lines; 500K are ported. What is left, in the
order to do it (dependencies first, cheap before expensive). Every step
is the same loop: `batch.py --files ...` in batches of 10-15 files,
`tools/test.py <tier>`, commit. Check a directory for external programs
and file I/O before starting it.

1. **Reference toolchain** (done): the opam switch `hol-light` (README.md)
   reproduces the committed goldens byte for byte (theorems, class,
   Library/prime, 100/fta). kernel_ref.ml no longer runs upstream (it
   builds `Tyvar "Z"` directly; `hol_type` is private): rewrite it with
   `mk_vartype`.
2. **100/ chunk 2** (done): 34 files, taken from `wip/100-chunk2` and
   checked in four batches.
3. **Package aliases** (done): the rename table described under Open
   issues.
4. **Small directories that need only the core or Library/** (63K lines):
   Complex, 100/cubic, Arithmetic (but pa.ml, which make.ml does not
   load), Permutation, Ntrie, Model, GL, Divstep and Rqe (but
   examples.ml, commented out of its make.ml) are done; EC has 26 of 30 files. After a directory with a make.ml passes, fold its tests
   into `<dir>/make` (tools/ocaml_ref/chain_test.py). Independent
   directories can run side by side in scratch clones under `.port/`
   (the OCaml sessions are the slow, single-threaded part). IsabelleLight and Boyer_Moore load their files from a computed
   list (`map (load_on_path paths) [...]`), and Boyer_Moore has
   `boyer-moore.ml` (no package can be named so) and a make.ml with
   definitions: step 8. A directory
   with a make.ml loads in that order (theory.make_plan). Expect translator
   work per directory: Complex needed five additions (over-applied
   primitives, unqualified Format functions, `Num.string_of_num`, weak type
   variables in lifted local functions, rewrite nets with other payloads).
5. **Examples/** (30K; 31 of 50 done) and Logic/ (done). sos.ml
   needs csdp and three files need Minisat/Cadical/miz3/Rqe: those wait
   for step 8. Then 100/dirichlet, pnt (mangoldt.ml), piseries (machin.ml).
6. **Directories on top of Multivariate/** (220K): Quaternions (`.hl`
   files: batch.py takes them), Geometric_Algebra, Functionspaces, Unity
   (done), Mizarlight, Probability (97K; then 100/buffon), Jordan (75K:
   the 13 files before jordan_curve_theorem.ml are done),
   RichterHilbertAxiomGeometry (36K; needs miz3), WZ.
   A background job is stopped after two hours: split a long batch with
   `--translate-only`, then `--resume` (and check finished files in a
   second clone meanwhile).
7. **Autoformalization/** (205K): seven large files, a batch each.
8. **External programs and other formats**: each needs a decision first.
   - Minisat, Cadical, QBF (SAT/QBF solver proofs) and Examples/sos.ml
     (csdp): replay recorded solver output, as lib/gp.mbt does for PARI/GP.
     Then 100/thales and ceva.
   - miz3 (its own proof language, evaluated at run time), LP_arith.
   - Formal_ineqs (44K) and IEEE (10K): `.hl` files; check what loads them.
   - Tutorial/, UnitTests/: scripts over the above; port as tests.
   - Not theories, not ported: Proofrecording (a second kernel), ProofTrace,
     mcp, update_database, help.ml/database.ml, tactician_light.ml.
9. **Closing**: regenerate everything once (retranslate_all.py), the whole
   suite on wasm (`tools/test.py all --target wasm`), CI with shards,
   separate mooncakes modules per directory, README.

## Open issues

- **Publishing**: mooncakes caps a module at 100 MB unpacked (over it, the
  server answers "Invalid ZIP archive"). `bobzhang/hol_light` 0.1.0 has the
  core and Library/ with their tests (71 MB). Multivariate/ (166 MB: 73 MB
  source, 93 MB tests) and 100/ (which needs it) are on GitHub only. Publish
  them as separate modules (e.g. `bobzhang/hol_light_multivariate`, possibly
  split further, tests trimmed): the translator and theory.py write import
  paths `bobzhang/hol_light/<pkg>`, so they need a module prefix per
  directory.

- **Package alias collisions** (done): MoonBit imports a package by its
  last path component, so a file named like a package loaded with it gets
  its directory's name too (`logic/logic_canon`,
  `probability/probability_measure`, `quaternions/quaternions_misc`): the
  table `RENAMED` in tools/ocaml_ref/theory.py, repeated in
  `Names.package_of_file` (tools/translator/translator.ml). Add an entry
  when a new directory collides.
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
- **Not ported**: Jordan/tactics_refine.ml's `dump_thm` and `load_thm`
  (theorems marshalled to a file and read back as proved: the port never
  deserializes theorems; the two functions exist and fail; upstream leaves
  the fast load off), GL/tests.ml (an interactive script: `e GL_TAC` fails on
  purpose to show a countermodel, so the file cannot be loaded upstream
  either), tactician_light.ml (needs a tactic-expression interpreter
  to replace `loadt` of OCaml strings), help.ml/database.ml and the
  Multivariate `*_database.ml` search tables (interactive), 
  100/e_is_transcendental.ml (fails upstream).
- **Known limitations**: see PLAN.md (Num representation history,
  non-ASCII byte strings, float-array hashing, let rec groups with
  ambiguous initialization order are rejected).
