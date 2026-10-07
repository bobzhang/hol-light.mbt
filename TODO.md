# TODO

State on 2026-10-06. PLAN.md has the design and the history; this file is
what to do next.

## Done

- Core: every file hol.ml loads (13 hand-ported, 32 translated).
- Library/: every file except `tactician_light.ml`.
- Multivariate/: all 32 theory files (make.ml/make_complex.ml order, plus the
  12 others loaded after their anchor).
- 100/: 66 of 67 files (e_is_transcendental fails upstream).
- The directories README.md lists, each in its make.ml's order.
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

Upstream has about 1.31M lines; 1.175M are ported (90%). Of the rest,
23K are files that do not load upstream (from_topology.ml is 18K of
them), 42K are the theorem search databases (database.ml, help.ml,
Multivariate/*_database.ml) and 6K the Proofrecording kernel; the
remainder is loaders, syntax extensions and test scripts (see step 8 and
Open issues: not counted file by file). What is left to port needs a
program that is not here (QBF: squolem; zChaff's half of Minisat/test.ml);
then step 9. The steps, in the
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
   examples.ml, commented out of its make.ml) are done, EC too (edwards25519.ml alone takes two hours to translate: in a terminal). After a directory with a make.ml passes, fold its tests
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
5. **Examples/** (30K; 48 of 50 done) and Logic/ (done). Left:
   inverse_bug_puzzle_miz3.ml (miz3, step 8) and update_database.ml (not a
   theory).
6. **Directories on top of Multivariate/**: Quaternions, Geometric_Algebra,
   Functionspaces, Unity, Jordan and Probability are done. Mizarlight and
   RichterHilbertAxiomGeometry (36K; needs miz3) wait for step 8.
   A background job is stopped after two hours: split a long batch with
   `--translate-only`, then `--resume` (and check finished files in a
   second clone meanwhile); a single file that takes longer
   (Autoformalization/fifteen_theorem.ml, EC/edwards25519.ml) has to run
   in a terminal.
7. **Autoformalization/** (205K): done, all 7 files. planar_graph loads
   Multivariate/cauchy.ml part-way through (theory.MID_NEEDS) and is
   loaded without Multivariate/clifford.ml (theory.CHAIN_SKIP);
   fifteen_theorem takes 2.5 hours to check against upstream (run it in a
   terminal) and parses `F` 2.4 million times (quotation traces collapse
   such runs).
   Also done on the way: IEEE, IsabelleLight, Boyer_Moore (the files
   boyer-moore.ml loads; not make.ml's definitions and testset/) and 18
   Tutorial/ files. Not ported from UnitTests/: basic_tests.ml needs the
   zarith bignum backend (`pow`), printer_tests.ml and records.ml are test
   scripts (`Format.set_margin`, `Printexc`, `exit`, `Assert_failure`).
8. **External programs and other formats**.
   - Done: a file's external commands are recorded in the reference session
     (tools/ocaml_ref/prelude.ml wraps `Sys.command`) and replayed
     (`@lib.sys_command`, `<pkg>/commands.mbt`), with in-memory files and
     channels (lib/gp.mbt, lib/channels.mbt). With it: Cadical/ and its
     test.ml (cadical, lrat-trim), Minisat/ (MiniSat-p 1.14; `readDimacs`
     by hand: upstream uses Stream and Genlex), Examples/sos.ml and what
     uses it (csdp): 100/thales, ceva, Examples/solovay, Tutorial/Vectors,
     Custom_tactics, Defining_new_types. The reference toolchain needs
     those programs on PATH (README).
     Also done with it: WZ/ and Tutorial/Linking_external_tools.ml
     (maxima), LP_arith/ (cddlib's `cdd_cert`), Examples/prover9.ml
     (Prover9, prooftrans).
   - Minisat/test.ml also runs zChaff (to download by hand from Princeton,
     licence to accept: not installed); minisat_prove's test has three
     SAT_PROVE checks instead.
   - QBF/ needs squolem, which exists only as x86 Linux and Windows
     binaries: not on this machine.
   - Done: Formal_ineqs/, the 62 files of make.ml's closure (one linear
     order, theory.ROOTS). Its files keep their theorems in modules: a
     test lists what the module's signature exports. Its tests compare a
     file's own output only (theory.OWN_OUTPUT: the output of what is
     loaded before, 79K lines, is not repeated in each golden);
     m_verifier_main's also runs the verifier on two of upstream's
     examples. Not ported: the examples*.hl files (they set the
     arithmetic base before loading the library) and tests/.
   - OCaml run from strings: RichterHilbertAxiomGeometry/readable.ml (and
     miz3) give the toplevel the theorem and tactic names of a proof as
     OCaml (`exec`: `Toploop.execute_phrase` on `Lexing.from_string`).
     Done for readable.ml: the translation session records every such
     string (Loader.executed), Emit.exec_phrases translates each as a
     function and registers it before the phrase that runs it, and the
     file's `exec` (by hand) looks it up (lib/toplevel.mbt). Str is the
     whole library now (lib/str.mbt, tools/ocaml_ref/str_ref.py), on
     bytes, as String.sub.
   - Done: RichterHilbertAxiomGeometry/: readable, UniversalPropCartProd,
     HilbertAxiom_read, TarskiAxiomGeometry_read (these two assert axioms
     upstream: theory.ASSERTS_AXIOMS compares the whole list),
     inverse_bug_puzzle_read and Topology (loaded with upstream's own
     closure, theory.UPSTREAM_CLOSURE: Topology.ml defines `istopology`).
     Not ported, because they are not files that load: from_topology.ml
     (18K lines; fails upstream in BOUNDED_INCREASING_CONVERGENT:
     "MATCH_MP_TAC: No match"), error-checking.ml (raises on purpose),
     thmFontHilbertAxiom.ml (a text of proof templates, not OCaml).
   - Done: miz3/miz3.ml, the thirteen samples miz3/test.ml loads
     (theory.AFTER) and Examples/inverse_bug_puzzle_miz3.ml. By hand
     (miz3/miz3/hand.mbt): `exec_phrase`, `TIMED_TAC` (no timer: a step
     is never timed out, where upstream gives it `!timeout` seconds),
     `print_to_string1`, and the editor server's functions (nothing).
     Not ported: miz3_of_hol.ml and Samples/wishes.ml (not loaded by
     test.ml).
   - Done: Mizarlight/ (make, miz2a, duality, duality_holby). Its camlp5
     extension (pa_f.ml: infix `by`, `st`, ...) is built by
     tools/ocaml_ref/ensure_pa_f.sh into _build/hol_dir, the sessions'
     `hol_dir`; make.ml is a file of its own (theory.HEADS); the two
     duality files use the sketch prover (CHEAT_TAC) upstream
     (theory.ASSERTS_AXIOMS).
   - Not theories, not ported: Proofrecording (a second kernel), ProofTrace,
     mcp, update_database, help.ml/database.ml, tactician_light.ml,
     UnitTests/ (test scripts; basic_tests.ml needs the zarith backend).
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
- **CI**: `.github/workflows/ci.yml` runs the core tier on every push
  and pull request (upstream's practice: its CI loads hol.ml), and
  `.github/workflows/full.yml` the whole suite on wasm-gc nightly and by
  hand, in 20 shards. Each shard uploads the seconds its packages took
  (tools/test_times.tsv, which balances the shards: many packages have no
  recorded time yet). Not done: skipping a test whose package and
  dependencies did not change. Native would not be faster: debug native
  takes three times as long as wasm-gc on the core tier, and release
  native does not build (the C backend bug in tools/moonbit_bugs/, in
  metis.mbt).
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
