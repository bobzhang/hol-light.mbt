# Migrating a package's quotations to the term syntax (issue #140)

Quotations written in HOL Light's extensible syntax (`@parser.parse_term("forall n. n + 0 = n")`) are being rewritten in the fixed MoonBit term syntax (`@term_syntax.parse_term("∀ n : Num, n + 0 == n")`, see `term_syntax/term_syntax.mbt`). Each package is one small PR.

## Steps

1. Branch from `origin/main`: `git checkout -b migrate/<dir>-<name> origin/main`.
2. Run the converter, under a large stack:

   ```
   ulimit -s 65520
   moon run tools/migrate.mbtx -- <package dir>      # e.g. 100/gcd
   ```

   It is a MoonBit script, so it needs only `moon`, `moonrun` and `git`, and it refuses to start on a dirty working tree. It numbers the package's quotation sites and loads the package once, recording each run of each site. Each term is printed in the new syntax, in exactly that environment, and the printer checks that the text reads back as the same term, with the same bound variable names (theorems show them). A site is migrated when it ran and read the same way on every run. The converter then:
   - replaces each `@parser.parse_term("old")` by `@term_syntax.parse_term("new")`;
   - adds `term_syntax` to the package's `moon.pkg`;
   - rewrites the migrated runs' lines in the package's quotation trace, in its reference test (`<pkg>/*_ref_test.mbt` or `<dir>/make/NN_<name>_test.mbt`) and in `tools/ocaml_ref/*.expected`; it first checks that the trace there is exactly this run's;
   - runs that reference test (wasm-gc, large stack);
   - undoes the `pkg.generated.mbti` changes a newer local toolchain makes outside the package.

   It prints a summary (`N migrated, N left (N unprintable, N not run, N conflict)`), the leftovers, and `test: pass`.
3. The test must pass. If it fails (the script exits non-zero), the golden differs in more than the rewritten trace lines: stop and report it instead of updating the golden. Check `git status`: apart from the package's source and `moon.pkg`, only its golden(s) and `.expected` file(s) may change, and only in trace lines.
4. Leftovers the converter does not touch stay as `@parser.parse_term`. That is fine; list them in the PR.
   - `not run`: the quotation is inside a function not called while the package loads.
   - `unprintable`: no spelling reads back as exactly the same term. Most are set comprehensions (`{x | P x}`): HOL binds a generated `GEN%PVAR%n` there, which theorems show and the term syntax has no way to write. Others: a free variable whose type repeats an invented type variable (holes cannot tie those together), or a name with no spelling.
   - `conflict`: the site read differently on different runs (a function called under different overload priorities).
   
   Do not hand-convert a leftover unless a test exercises it.
5. Commit only the package's files, its golden(s) and its `.expected` file(s).
6. Open a PR titled `Migrate <dir>/<name> to the term syntax`. In its body, give the converter summary, the test command and result, and the leftovers.

## Rules

- **No hand edits of goldens.** A golden may change only in the trace lines the converter rewrote.
- **One package per PR**, or a few small leaves together.
- **Build with `--build-jobs 4` or less.** Each link of a long chain can take 14 GB or more.
- **Never run `moon fmt` or `moon info` over the whole repository.** The pinned CI toolchain (0.10.14) is older than a typical local one.
