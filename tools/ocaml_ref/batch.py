#!/usr/bin/env python3
"""Translate and check a run of files in load order with one session per
side instead of three chain reloads per file (tools/ocaml_ref/theory.py):

  python3 tools/ocaml_ref/batch.py Multivariate/polytope.ml [Multivariate/x.ml]
    (from the first file to the last, inclusive, in theory.MV_ORDER)
  python3 tools/ocaml_ref/batch.py --files 100/ballot.ml 100/bertrand.ml ...
  python3 tools/ocaml_ref/batch.py --resume ...  (keeps a failed run's translations)
  python3 tools/ocaml_ref/batch.py --translate-only [--resume] ...  (no references yet)

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
5. Goldens embedded, tools/test.py on the targets' packages (wasm-gc).
"""
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import theory  # noqa: E402

ROOT, REF, HOL = theory.ROOT, theory.REF, theory.HOL
# (another directory for a second batch in the same checkout)
OUT = os.environ.get("HOL_BATCH_OUT") or os.path.join(REF, "_build", "batch")
PLACEHOLDER = "///|\nfn load_steps() -> Unit raise {\n  ()\n}\n"


def ml_str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def ml_file(f):
    return f if f.endswith((".ml", ".hl")) else f + ".ml"


def after(target):
    """`moon info` after a target's translation; errors stop the batch."""
    r = theory.moon_info(capture_output=True, text=True)
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


def translate(targets, done=()):
    """`done`: targets already translated (--resume): loaded, not translated."""
    def ml(st):
        return "[" + "; ".join(
            f"Main.Branch {ml(x)}" if kind == "branch" else
            f"Main.{'Target' if kind == 'target' and x.f not in done else 'Load'} {ml_str(x.f)}"
            for kind, x in st) + "]"
    # files a target loads part-way through (theory.MID_NEEDS)
    mids = "".join(f"Main.Mid ({ml_str(t)}, {ml_str(x)}, [{'; '.join(ml_str(g) for g in new)}]); "
                   for t in targets for x, new in theory.mid_plan(t))
    plan = "[" + mids + ml(steps(trie(targets, [])))[1:]
    os.makedirs(OUT, exist_ok=True)
    pf = os.path.join(OUT, "plan.ml")
    open(pf, "w").write(plan)
    cmd = f"python3 {os.path.abspath(__file__)} after"
    # streamed to the log as it runs (progress: `translated <file>` lines)
    log = os.path.join(OUT, "translate.log")
    with open(log, "w") as lf:
        subprocess.run([os.path.join(REF, "translate.sh"), "batch", pf, cmd], cwd=ROOT,
                       stdout=lf, stderr=subprocess.STDOUT)
    out = open(log).read()
    keep = [l for l in out.splitlines()
            if "wrote" in l or "unsupported" in l or "BATCH" in l or "Exception" in l or "moon info" in l
            or l.startswith("translated ") or l.startswith("Error")]
    print("\n".join(keep[-60:]), flush=True)
    if "BATCH DONE" not in out:
        # a target with unsupported items has an incomplete translation:
        # back to the placeholder, or --resume would take it for done
        for f in re.findall(r"BATCH FAILED: unsupported items in (\S+)", out):
            pkg = theory.pkg_of(f)
            alias = pkg.split("/")[-1]
            gen = os.path.join(ROOT, pkg, alias + ("_ml" if alias.endswith("test") else "") + ".mbt")
            open(gen, "w").write(PLACEHOLDER)
        sys.exit("translation batch failed (tools/ocaml_ref/_build/batch/translate.log)")


def command_log_path(t):
    return os.path.join(OUT, "commands_" + t.replace("/", "__") + ".log")


def mbt_str(s):
    """A MoonBit string literal."""
    esc = {"\\": "\\\\", '"': '\\"', "\n": "\\n", "\t": "\\t", "\r": "\\r"}
    return '"' + "".join(esc.get(c) or ("\\u{%x}" % ord(c) if ord(c) < 32 or ord(c) == 127 else c) for c in s) + '"'


def write_commands(t, pkg):
    """`<pkg>/commands.mbt`: the external programs `t` ran upstream while it
    loaded (csdp, ...), as prelude.ml's `Sys.command` recorded them, for
    lib/gp.mbt to replay. No file when it ran none."""
    dst, log = os.path.join(ROOT, pkg, "commands.mbt"), command_log_path(t)
    if not os.path.exists(log) or os.path.getsize(log) == 0:
        if os.path.exists(dst):
            os.remove(dst)
        return
    data, pos, entries = open(log, "rb").read(), 0, []

    def line():
        nonlocal pos
        j = data.index(b"\n", pos)
        l, pos = data[pos:j].decode("latin-1"), j + 1
        return l.split()

    def blob(n):
        nonlocal pos
        # files are byte strings (MiniSat's proofs are binary): a byte is a character
        b, pos = data[pos:pos + n].decode("latin-1"), pos + n + 1
        return b

    while pos < len(data):
        tag, n = line()
        assert tag == "CMD", tag
        shape, ins, st, outs = blob(int(n)), [], 0, []
        while True:
            w = line()
            if w[0] == "IN":
                ins.append(None if w[1] == "-1" else blob(int(w[1])))
            elif w[0] == "ST":
                st = int(w[1])
            elif w[0] == "OUT":
                outs.append((int(w[1]), blob(int(w[2]))))
            else:
                break
        e = (shape, tuple(ins), st, tuple(outs))
        if e not in entries:
            entries.append(e)
    text = (f"// The external programs {t} ran upstream while it loaded, for\n"
            "// @lib.sys_command to replay (wasm has no processes; the answers only guide\n"
            "// proofs the kernel checks). Written by tools/ocaml_ref/batch.py; do not edit.\n\n"
            "///|\nfn init {\n")
    for shape, ins, st, outs in entries:
        text += ("  @lib.replay_command(\n    " + mbt_str(shape) + ",\n    ["
                 + ", ".join("None" if x is None else "Some(" + mbt_str(x) + ")" for x in ins) + "],\n    "
                 + str(st) + ",\n    [" + ", ".join(f"({i}, {mbt_str(o)})" for i, o in outs) + "],\n  )\n")
    open(dst, "w").write(text + "}\n")
    print(f"{pkg}/commands.mbt: {len(entries)} recorded commands")


def untested(t):
    """A directory's make.ml, when another directory needs it (as
    Geometric_Algebra/quaternions.ml needs Quaternions/make.ml): a package
    that loads the directory's files, which have their own tests."""
    return t.endswith("/make.ml")


def references(targets, refs):
    """One upstream session; returns {target: expected output} (of the
    targets with a reference script)."""
    tails = {}
    for t in refs:
        text = open(refs[t]).read()
        i = text.index("start_trace ();;")
        tails[t] = os.path.join(OUT, "tail_" + t.replace("/", "__"))
        # the programs it runs are recorded (prelude.ml)
        if os.path.exists(command_log_path(t)):
            os.remove(command_log_path(t))
        open(tails[t], "w").write(f"command_log := {ml_str(command_log_path(t))};;\n" + text[i:])
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
                if kind == "target" and x.f in tails:
                    out.append(f"let () = batch_target {ml_str(tails[x.f])} {ml_str(log(x, True))};;\n")
                    if not x.children:
                        # nothing is loaded after it: not loaded again
                        continue
                mids = theory.mid_plan(x.f)
                if mids:
                    # a file it loads part-way through is loaded there
                    cases = " | ".join('"%s" -> List.iter batch_use [%s]' % (g, "; ".join(f'"{h}"' for h in new))
                                       for g, new in mids)
                    out.append(f"let needs s = match s with {cases} | _ -> ();;\n")
                out.append(f"let () = batch_load {ml_str(x.f)} {ml_str(log(x))};;\n")
                if mids:
                    out.append("let needs (_:string) = ();;\n")
        return out

    lines += emit(steps(root))
    body = os.path.join(OUT, "ref_body.ml")
    open(body, "w").write("".join(lines))
    script = os.path.join(OUT, "ref_script.ml")
    boot = open(os.path.join(REF, "boot.ml")).read()
    i = boot.index('#load "pa_j.cmo";;')
    open(script, "w").write(boot[:i] + '#load "unix.cma";;\n#load "str.cma";;\n' + "".join(helpers) + boot[i:] +
                            f"let () = if not (Toploop.use_silently Format.std_formatter (Toploop.File {ml_str(body)})) "
                            "then exit 1;;\n")
    subprocess.run(["./ensure_pa_j.sh"], cwd=REF, check=True)
    env = os.environ.copy()
    # the bytecode stack limit, as run.sh
    env.setdefault("OCAMLRUNPARAM", "l=256M")
    rlog = os.path.join(OUT, "ref.log")
    with open(rlog, "w") as lf:
        p = subprocess.run(["sh", "-c", 'eval "$(opam env --switch="${HOL_LIGHT_SWITCH:-hol-light}" --set-switch 2>/dev/null)"; '
                            f'ocaml -w -a -alert -all -I {HOL} -I _build {script}'],
                           cwd=REF, stdout=lf, stderr=subprocess.STDOUT, env=env)
    if p.returncode != 0:
        sys.exit("reference batch failed (tools/ocaml_ref/_build/batch/ref.log):\n" + open(rlog).read()[-3000:])
    expected = {}
    for t in refs:
        nodes = path_to(root, t, before)
        parts = [os.path.join(OUT, "prelude.txt")] + [log(n) for n in nodes[:-1]] + [log(nodes[-1], True)]
        if theory.own_output(t):
            # the target's own output (theory.OWN_OUTPUT)
            parts = parts[-1:]
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
    # --translate-only: stop after the translation session (the reference
    # session is as long again: a batch on top of Multivariate/ does not fit
    # in one two-hour job; run it again with --resume for the references)
    translate_only = sys.argv[1] == "--translate-only"
    if translate_only:
        del sys.argv[1]
    # --resume: keep the translations a failed run of the same batch made
    resume = sys.argv[1] == "--resume"
    if resume:
        del sys.argv[1]
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
        gen = os.path.join(ROOT, pkg, alias + ("_ml" if alias.endswith("test") else "") + ".mbt")
        # a placeholder (left by an interrupted batch) is not a translation
        return os.path.exists(gen) and open(gen).read() != PLACEHOLDER
    expanded = []
    for t in targets:
        for d in theory.deps(t) + [g for _, new in theory.mid_plan(t) for g in new] + [t]:
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
        # (every target is translated again: a stale translation from an
        # interrupted run must not break the build meanwhile)
        if not resume or not translated(t):
            open(gen, "w").write(PLACEHOLDER)
        # regenerate the test files (the chain may have changed), keeping
        # their hand-written checks (BEGIN/END EXTRA)
        pkgs[t] = pkg
        if untested(t):
            continue
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
    done = [t for t in targets if resume and translated(t)]
    if len(done) == len(targets):
        # nothing left to translate: no translation session (it would only
        # load the chains again); the interfaces must still be current
        os.makedirs(OUT, exist_ok=True)
        after("nothing: every target is already translated")
    else:
        translate(targets, done)
    if translate_only:
        print("translated; run again with --resume for the references and the tests")
        return
    for t in refs:
        theory.run(["python3", "tools/ocaml_ref/gen_theorems_test.py", pkgs[t], os.path.relpath(refs[t], ROOT),
                    os.path.relpath(tests[t], ROOT)])
    expected = references(targets, refs)
    for t in refs:
        write_commands(t, pkgs[t])
    for t in refs:
        e = refs[t][:-3] + ".expected"
        open(e, "w").write(expected[t])
        theory.run(["python3", "tools/ocaml_ref/embed_golden.py", os.path.relpath(e, ROOT),
                    os.path.relpath(tests[t], ROOT)])
    theory.run(["moon", "fmt"], capture_output=True)
    # tools/test.py runs the test executables with a larger stack than
    # `moon test` gives them
    args = ["python3", "tools/test.py"] + [pkgs[t] for t in refs]
    r = subprocess.run(args, cwd=ROOT, capture_output=True, text=True)
    log = r.stdout + r.stderr
    open(os.path.join(OUT, "test.log"), "w").write(log)
    print("\n".join(log.splitlines()[:80]))
    sys.exit(r.returncode)


if __name__ == "__main__":
    main()
