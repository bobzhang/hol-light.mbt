#!/usr/bin/env python3
"""Run the test suite a tier (and a shard) at a time.

usage: tools/test.py [tier ...] [--target T] [--shard I/N] [-j JOBS] [--list]

Every theory's test loads its whole chain in a fresh process, so the suite
costs hours of CPU. The tiers, cheapest first:

  quick         the hand-ported core (kernel .. simp): seconds; the default
  core          every file hol.ml loads (quick included)
  library       Library/
  multivariate  Multivariate/
  100           100/
  all           everything

A package directory (`library/prime`) selects that package; any other
top-level directory of packages is a tier of its own.

Targets: the quick tier runs on wasm (the primary target) and on wasm-gc;
the theory tiers run on wasm-gc, where the same tests take a fifth of the
time. `--target wasm` (or native) runs the selection there instead: do it
for the whole suite before a release.

`-j JOBS` is how many test executables (one per package, each a single
thread taking up to 1.5 GB) run at once: every core by default.

`--shard I/N` runs the I-th of N parts of the selection (I from 1), for
machines in parallel; the parts are balanced with the recorded times
(tools/test_times.tsv, seconds on wasm-gc; `--list` shows them).
"""
import argparse
import os
import subprocess
import sys
import time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TIMES = os.path.join(ROOT, "tools", "test_times.tsv")
# hol.ml's hand-ported files and the support packages
QUICK = ["kernel", "lib", "num", "pp", "basics", "nets", "printer", "preterm", "parser",
         "equal", "bool", "drule", "tactics", "itab", "simp", "omap", "oset", "testkit"]
# kernel_stress_test's terms of depth 2500 overflow the stack moonrun gives
# wasm-gc code (the limit PLAN.md documents is for wasm)
WASM_ONLY = {"kernel"}
SKIP_DIRS = {"tools", "_build", "target"}


def packages():
    """Every package directory with tests, relative to the root."""
    out = []
    for d, subdirs, files in os.walk(ROOT):
        rel = os.path.relpath(d, ROOT)
        subdirs[:] = sorted(s for s in subdirs if not s.startswith(".") and
                            not (rel == "." and s in SKIP_DIRS))
        if "moon.pkg" in files and any(f.endswith(("_test.mbt", "_wbtest.mbt")) for f in files):
            out.append(rel)
    return out


def tier_of(pkg):
    if "/" in pkg:
        return pkg.split("/")[0]
    return "quick" if pkg in QUICK else "core"


def select(names, pkgs):
    out = []
    for n in names:
        n = n.rstrip("/")
        if n == "all":
            sel = pkgs
        elif n == "core":
            sel = [p for p in pkgs if "/" not in p]
        elif n in pkgs:
            sel = [n]
        else:
            sel = [p for p in pkgs if tier_of(p) == n]
        if not sel:
            sys.exit(f"no tier or package {n!r}; tiers: quick core " +
                     " ".join(sorted({tier_of(p) for p in pkgs if '/' in p})) + " all")
        out += [p for p in sel if p not in out]
    return out


def weights(pkgs):
    """Recorded seconds per package; an unrecorded one counts as its
    tier's mean (a new file costs about what its neighbours do)."""
    known = {}
    if os.path.exists(TIMES):
        for line in open(TIMES):
            if line.strip() and not line.startswith("#"):
                p, s = line.split("\t")[:2]
                known[p] = float(s)
    out = {}
    for p in pkgs:
        if p in known:
            out[p] = known[p]
        else:
            same = [known[q] for q in known if tier_of(q) == tier_of(p)] or [60.0]
            out[p] = sum(same) / len(same)
    return out


def shard(pkgs, w, i, n):
    """The i-th of n parts: heaviest first, each to the lightest part."""
    parts, load = [[] for _ in range(n)], [0.0] * n
    for p in sorted(pkgs, key=lambda p: (-w[p], p)):
        k = load.index(min(load))
        parts[k].append(p)
        load[k] += w[p]
    return sorted(parts[i - 1], key=pkgs.index)


def main():
    ap = argparse.ArgumentParser(usage=__doc__)
    ap.add_argument("tiers", nargs="*", default=["quick"])
    ap.add_argument("--target")
    ap.add_argument("--shard")
    # moon runs the test executables one at a time unless told otherwise
    ap.add_argument("-j", "--jobs", default=str(os.cpu_count() or 1))
    ap.add_argument("--list", action="store_true")
    a = ap.parse_args()
    pkgs = packages()
    sel = select(a.tiers, pkgs)
    w = weights(sel)
    if a.shard:
        i, n = map(int, a.shard.split("/"))
        if not 1 <= i <= n:
            sys.exit("--shard I/N: 1 <= I <= N")
        sel = shard(sel, w, i, n)
    runs = []  # (target, packages)
    if a.target:
        runs.append((a.target, [p for p in sel if a.target != "wasm-gc" or p not in WASM_ONLY]))
    else:
        quick = [p for p in sel if tier_of(p) == "quick"]
        if quick:
            runs.append(("wasm", quick))
        gc = [p for p in sel if p not in WASM_ONLY]
        if gc:
            runs.append(("wasm-gc", gc))
    runs = [(target, ps) for target, ps in runs if ps]
    if not runs:
        sys.exit(f"nothing to run: {' '.join(sel)} only runs on wasm")
    if a.list:
        for target, ps in runs:
            print(f"{target}: {len(ps)} packages, {sum(w[p] for p in ps):.0f}s of tests "
                  f"(longest {max(w[p] for p in ps):.0f}s)")
            for p in ps:
                print(f"  {w[p]:7.0f}s  {p}")
        return
    status = 0
    for target, ps in runs:
        cmd = ["moon", "test", "--target", target, "-j", a.jobs] + ps
        print(f"== {target}: {len(ps)} packages", flush=True)
        t = time.time()
        os.makedirs(os.path.join(ROOT, "_build"), exist_ok=True)
        logf = os.path.join(ROOT, "_build", f"test_{target}.log")
        # the warnings of generated code and the goldens' context lines
        # would bury the result: show failures, the start of each diff and
        # the totals as they come; the full output goes to the log
        show = 0
        with open(logf, "w") as log, subprocess.Popen(
                cmd, cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True) as r:
            for line in r.stdout:
                log.write(line)
                if line.startswith(("Error", "error", "Total tests", "Diff:")) or " failed" in line \
                        or "FAILED" in line or "panic" in line.lower():
                    show = 12 if line.startswith("Diff:") else 1
                if show > 0:
                    print(line.rstrip("\n")[:400], flush=True)
                    show -= 1
        print(f"== {target}: {'ok' if r.returncode == 0 else 'FAILED'} in {time.time() - t:.0f}s "
              f"({os.path.relpath(logf, ROOT)})", flush=True)
        status = status or r.returncode
    sys.exit(status)


if __name__ == "__main__":
    main()
