#!/usr/bin/env python3
"""Translate and check a run of files in load order with one session per
side instead of three chain reloads per file (tools/ocaml_ref/theory.py):

  python3 tools/ocaml_ref/batch.py Multivariate/polytope.ml [Multivariate/x.ml]
    (from the first file to the last, inclusive, in theory.MV_ORDER)
  python3 tools/ocaml_ref/batch.py --files 100/ballot.ml 100/bertrand.ml ...

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


class Node:
    """A trie node: the session state after loading the files on its path."""
    count = 0

    def __init__(self, f):
        self.f, self.children, self.target = f, {}, False
        Node.count += 1
        self.id = Node.count


def trie(targets, before):
    """The targets' load sequences (`before` + chain + target) as a trie."""
    root = Node(None)
    for t in targets:
        n = root
        for f in [ml_file(x) for x in before + theory.deps(t)] + [t]:
            n = n.children.setdefault(f, Node(f))
        n.target = True
    return root


def targets_in(node):
    return ({node.f} if node.target else set()).union(*[targets_in(k) for k in node.children.values()])


def ordered_children(node):
    """The children, a subtree before any whose targets need one of its
    targets (that translation and its interface come first); otherwise in
    insertion order."""
    kids = list(node.children.values())
    tset = {id(k): targets_in(k) for k in kids}
    needed = {id(k): set().union(*[set(map(ml_file, theory.deps(t))) for t in tset[id(k)]]) for k in kids}
    out = []
    while kids:
        free = [k for k in kids if not any(tset[id(j)] & needed[id(k)] for j in kids if j is not k)]
        k = free[0] if free else kids[0]
        out.append(k)
        kids.remove(k)
    return out


def steps(node):
    """Depth-first steps: every child but the last runs in a branch (a
    forked copy of the session), the last continues the session."""
    out, kids = [], ordered_children(node)
    for i, k in enumerate(kids):
        sub = [("target" if k.target else "load", k)] + steps(k)
        if i < len(kids) - 1:
            out.append(("branch", sub))
        else:
            out += sub
    return out


def path_to(root, t, before):
    """The nodes from the root to target `t`."""
    nodes, n = [], root
    for f in [ml_file(x) for x in before + theory.deps(t)] + [t]:
        n = n.children[f]
        nodes.append(n)
    return nodes


def translate(targets):
    def ml(st):
        return "[" + "; ".join(
            f"Main.Branch {ml(x)}" if kind == "branch" else
            f"Main.{'Target' if kind == 'target' else 'Load'} {ml_str(x.f)}" for kind, x in st) + "]"
    plan = ml(steps(trie(targets, [])))
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


def references(targets, refs):
    """One upstream session; returns {target: expected output}."""
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
        "let batch_branch file = batch_flush ();\n"
        "  match Unix.fork () with\n"
        "  | 0 -> let ok = Toploop.use_silently Format.std_formatter (Toploop.File file) in\n"
        "      batch_flush (); Unix._exit (if ok then 0 else 1)\n"
        "  | pid -> (match Unix.waitpid [] pid with\n"
        "      | _, Unix.WEXITED 0 -> ()\n"
        "      | _ -> prerr_endline (\"batch: branch \" ^ file ^ \" failed\"); exit 1);;\n",
    ]
    lines = [
        f"let () = batch_redirect {ml_str(os.path.join(OUT, 'prelude.txt'))};;\n",
        open(os.path.join(REF, "prelude.ml")).read(), "\n",
    ]
    before = theory.USE_BEFORE + theory.CORE
    root = trie(targets, before)
    nbranch = [0]

    def log(n, child=False):
        return os.path.join(OUT, f"out_{'child_' if child else ''}{n.id}.txt")

    def emit(st):
        out = []
        for kind, x in st:
            if kind == "branch":
                nbranch[0] += 1
                bf = os.path.join(OUT, f"branch_{nbranch[0]}.ml")
                open(bf, "w").write("".join(emit(x)))
                out.append(f"let () = batch_branch {ml_str(bf)};;\n")
            else:
                if kind == "target":
                    out.append(f"let () = batch_target {ml_str(tails[x.f])} {ml_str(log(x, True))};;\n")
                out.append(f"let () = batch_load {ml_str(x.f)} {ml_str(log(x))};;\n")
        return out

    lines += emit(steps(root))
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
        nodes = path_to(root, t, before)
        parts = [os.path.join(OUT, "prelude.txt")] + [log(n) for n in nodes[:-1]] + [log(nodes[-1], True)]
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
    order = theory.MV_ORDER
    if sys.argv[1] == "--files":
        # explicit targets (any directory), e.g. `--files 100/*.ml`
        targets = [ml_file(os.path.relpath(f, HOL) if os.path.isabs(f) else f) for f in sys.argv[2:]]
    else:
        first = sys.argv[1]
        last = sys.argv[2] if len(sys.argv) > 2 else first
        targets = order[order.index(first):order.index(last) + 1]
    # dependencies not translated yet are targets too, before their users
    def translated(f):
        pkg = theory.pkg_of(f)
        alias = pkg.split("/")[-1]
        return os.path.exists(os.path.join(ROOT, pkg, alias + ("_ml" if alias.endswith("test") else "") + ".mbt"))
    expanded = []
    for t in targets:
        for d in theory.deps(t) + [t]:
            if d not in expanded and (d in targets or not translated(d)):
                expanded.append(d)
    targets = expanded
    refs, tests, pkgs = {}, {}, {}
    # the Multivariate packages already in the chain load in the current
    # order (their init.mbt and moon.pkg are regenerated)
    for d in dict.fromkeys(d for t in targets for d in theory.deps(t)):
        if d in order and d not in targets:
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
