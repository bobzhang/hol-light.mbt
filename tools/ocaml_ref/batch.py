#!/usr/bin/env python3
"""Translate and check a run of files in load order with one session per
side instead of three chain reloads per file (tools/ocaml_ref/theory.py):

  python3 tools/ocaml_ref/batch.py Multivariate/polytope.ml [Multivariate/x.ml]
    (from the first file to the last, inclusive, in theory.MV_ORDER)

1. Package set-up and test files for every target (theory.setup,
   theory.write_tests).
2. One translation session (translate.sh batch): the chain is loaded once;
   each target is translated in a forked child, then `moon info` refreshes
   the interfaces the next targets read, then the parent loads the target.
3. Theorem lists of the tests (gen_theorems_test.py).
4. One upstream session: each file's output goes to its own log; at each
   target a forked child runs the reference script's tail (start_trace,
   the target, the theorem list, the checks). A target's expected output is
   its chain's logs followed by the child's, which is what a fresh run of
   the reference script prints.
5. Goldens embedded, `moon test -j 16` on the targets' packages.
"""
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import theory  # noqa: E402

ROOT, REF, HOL = theory.ROOT, theory.REF, theory.HOL
OUT = os.path.join(REF, "_build", "batch")


def ml_str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def ml_file(f):
    return f if f.endswith(".ml") else f + ".ml"


def after(target):
    """`moon info` after a target's translation; errors stop the batch."""
    r = subprocess.run(["moon", "info"], cwd=ROOT, capture_output=True, text=True)
    errs = re.findall(r"^Error.*(?:\n.*){0,9}", r.stdout + r.stderr, re.M)
    if errs or r.returncode != 0:
        print(f"moon info after {target} (status {r.returncode}):\n" +
              "\n--\n".join(errs[:8] or [(r.stdout + r.stderr)[-3000:]]), flush=True)
        sys.exit(1)
    print(f"translated {target}", flush=True)


def translate(targets):
    plan = "[" + "; ".join(
        f"([{'; '.join(ml_str(d) for d in theory.deps(t))}], {ml_str(t)})" for t in targets) + "]"
    os.makedirs(OUT, exist_ok=True)
    pf = os.path.join(OUT, "plan.ml")
    open(pf, "w").write(plan)
    cmd = f"python3 {os.path.abspath(__file__)} after"
    p = subprocess.run([os.path.join(REF, "translate.sh"), "batch", pf, cmd], cwd=ROOT,
                       capture_output=True, text=True)
    out = p.stdout + p.stderr
    open(os.path.join(OUT, "translate.log"), "w").write(out)
    keep = [l for l in out.splitlines()
            if "wrote" in l or "unsupported" in l or "BATCH" in l or "Exception" in l or "moon info" in l
            or l.startswith("translated ") or l.startswith("Error")]
    print("\n".join(keep[-60:]), flush=True)
    if "BATCH DONE" not in out:
        sys.exit("translation batch failed (tools/ocaml_ref/_build/batch/translate.log)")


def log_of(f):
    return os.path.join(OUT, "out_" + ml_file(f).replace("/", "__") + ".txt")


def references(targets, refs):
    """One upstream session; returns {target: expected output}."""
    core = [u + ".ml" for u in theory.USE_BEFORE + theory.CORE]
    tails = {}
    for t in targets:
        text = open(refs[t]).read()
        i = text.index("start_trace ();;")
        tails[t] = os.path.join(OUT, "tail_" + t.replace("/", "__"))
        open(tails[t], "w").write(text[i:])
    # plain OCaml, before pa_j (HOL Light's syntax) is loaded
    helpers = [
        "let batch_flush () = flush_all (); Format.pp_print_flush Format.std_formatter ();;\n",
        "let batch_redirect path = batch_flush ();\n"
        "  let fd = Unix.openfile path [Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC] 0o644 in\n"
        "  Unix.dup2 fd Unix.stdout; Unix.close fd;;\n",
        "let batch_use f = if not (Toploop.use_silently Format.std_formatter (Toploop.File f)) then\n"
        "  (batch_flush (); prerr_endline (\"batch: loading \" ^ f ^ \" failed\"); exit 1);;\n",
        "let batch_load f out = batch_redirect out; batch_use f;;\n",
        "let batch_target tail out = batch_flush ();\n"
        "  match Unix.fork () with\n"
        "  | 0 -> batch_redirect out;\n"
        "      let ok = Toploop.use_silently Format.std_formatter (Toploop.File tail) in\n"
        "      batch_flush (); Unix._exit (if ok then 0 else 1)\n"
        "  | pid -> (match Unix.waitpid [] pid with\n"
        "      | _, Unix.WEXITED 0 -> ()\n"
        "      | _ -> prerr_endline (\"batch: reference of \" ^ tail ^ \" failed\"); exit 1);;\n",
    ]
    lines = [
        f"let () = batch_redirect {ml_str(os.path.join(OUT, 'prelude.txt'))};;\n",
        open(os.path.join(REF, "prelude.ml")).read(), "\n",
    ]
    loaded = set()

    def load(f):
        if f not in loaded:
            loaded.add(f)
            lines.append(f"let () = batch_load {ml_str(f)} {ml_str(log_of(f))};;\n")

    for t in targets:
        for f in core + theory.deps(t):
            load(ml_file(f))
        lines.append(f"let () = batch_target {ml_str(tails[t])} {ml_str(log_of('child_' + t))};;\n")
        load(t)
    body = os.path.join(OUT, "ref_body.ml")
    open(body, "w").write("".join(lines))
    script = os.path.join(OUT, "ref_script.ml")
    boot = open(os.path.join(REF, "boot.ml")).read()
    i = boot.index('#load "pa_j.cmo";;')
    open(script, "w").write(boot[:i] + '#load "unix.cma";;\n' + "".join(helpers) + boot[i:] +
                            f"let () = if not (Toploop.use_silently Format.std_formatter (Toploop.File {ml_str(body)})) "
                            "then exit 1;;\n")
    env = os.environ.copy()
    p = subprocess.run(["sh", "-c", 'eval "$(opam env --switch=4.14.1+idea --set-switch 2>/dev/null)"; '
                        f'ocaml -w -a -alert -all -I {HOL} -I _build {script}'],
                       cwd=REF, capture_output=True, text=True, env=env)
    open(os.path.join(OUT, "ref.log"), "w").write(p.stdout + p.stderr)
    if p.returncode != 0:
        sys.exit("reference batch failed (tools/ocaml_ref/_build/batch/ref.log):\n" + (p.stdout + p.stderr)[-3000:])
    expected = {}
    for t in targets:
        parts = [os.path.join(OUT, "prelude.txt")] + [log_of(ml_file(f)) for f in core + theory.deps(t)] + \
            [log_of("child_" + t)]
        s = "".join(open(x).read() for x in parts)
        # run.sh's filters, then theory.py's normalization
        s = "\n".join(l for l in s.splitlines() if "HOL-Light syntax in effect" not in l and l != "") + "\n"
        s = re.sub(r"(?m)^CPU time \(user\): .*$", "CPU time (user): <t>", s)
        expected[t] = s
    return expected


def main():
    if sys.argv[1] == "after":
        after(sys.argv[2])
        return
    first = sys.argv[1]
    last = sys.argv[2] if len(sys.argv) > 2 else first
    order = theory.MV_ORDER
    targets = order[order.index(first):order.index(last) + 1]
    refs, tests, pkgs = {}, {}, {}
    # the Multivariate packages already in the chain load in the current
    # order (their init.mbt and moon.pkg are regenerated)
    for d in theory.deps(targets[0]):
        if d in order:
            theory.setup(d)
    for t in targets:
        pkg, alias, name = theory.setup(t)
        # a placeholder translation until the target's turn, so that the
        # project builds (`moon info`) while earlier targets are translated
        gen = os.path.join(ROOT, pkg, alias + ("_ml" if alias.endswith("test") else "") + ".mbt")
        if not os.path.exists(gen):
            open(gen, "w").write("///|\nfn load_steps() -> Unit raise {\n  ()\n}\n")
        # regenerate the test files (the chain may have changed), keeping
        # their hand-written checks (BEGIN/END EXTRA)
        extras = {}
        for old in theory.write_tests_paths(t, pkg, alias, name):
            if os.path.exists(old):
                m = re.search(r"BEGIN EXTRA[^\n]*\n(.*?)^[^\n]*END EXTRA", open(old).read(), re.S | re.M)
                extras[old] = m.group(1) if m else ""
                os.remove(old)
        refs[t], tests[t] = theory.write_tests(t, pkg, alias, name)
        for path, body in extras.items():
            if body:
                text = open(path).read()
                text = re.sub(r"(BEGIN EXTRA[^\n]*\n)(?=[^\n]*END EXTRA)", lambda m: m.group(1) + body, text, count=1)
                open(path, "w").write(text)
        pkgs[t] = pkg
    translate(targets)
    for t in targets:
        theory.run(["python3", "tools/ocaml_ref/gen_theorems_test.py", pkgs[t], os.path.relpath(refs[t], ROOT),
                    os.path.relpath(tests[t], ROOT)])
    expected = references(targets, refs)
    for t in targets:
        e = refs[t][:-3] + ".expected"
        open(e, "w").write(expected[t])
        theory.run(["python3", "tools/ocaml_ref/embed_golden.py", os.path.relpath(e, ROOT),
                    os.path.relpath(tests[t], ROOT)])
    theory.run(["moon", "fmt"], capture_output=True)
    args = ["moon", "test", "--target", "wasm", "-j", "16"]
    for t in targets:
        args += ["-p", "bobzhang/hol_light/" + pkgs[t]]
    r = subprocess.run(args, cwd=ROOT, capture_output=True, text=True)
    log = r.stdout + r.stderr
    open(os.path.join(OUT, "test.log"), "w").write(log)
    shown = [l for l in log.splitlines() if not l.lstrip().startswith("#|")]
    print("\n".join([l for l in shown if re.match(r"^(Error|Total|Diff|\[|[-+])|failed", l)
                     and not re.match(r"^[-+ ]0\.\.", l)][:60]))
    sys.exit(r.returncode)


if __name__ == "__main__":
    main()
