#!/usr/bin/env python3
"""Run the test suite a tier (and a shard) at a time.

usage: tools/test.py [tier ...] [--target T] [--shard I/N] [-j JOBS] [--stack-size KB] [--list]

Every theory's test loads its whole chain in a fresh process, so the suite
costs hours of CPU. The tiers, cheapest first:

  quick         the hand-ported core (kernel .. simp): seconds; the default
  core          every file hol.ml loads (quick included)
  library       Library/
  multivariate  Multivariate/
  100           100/
  all           everything

A package directory (`library/prime`) selects that package; any other
top-level directory of packages is a tier of its own. A test file
(`complex/make/05_quelim_test.mbt`) selects that file's tests alone: one
member of a chain, which loads what is before it by itself (as
`moon test FILE -i N` selects one test block).

Targets: the quick tier runs on wasm (the primary target) and on wasm-gc;
the theory tiers run on wasm-gc, where the same tests take a fifth of the
time. `--target wasm` (or native) runs the selection there instead: do it
for the whole suite before a release.

On the wasm targets `moon test --build-only` builds the test executables
and this script runs them with `moonrun --stack-size` (16 MB by default):
`moon test` runs them with moonrun's default stack, which upstream's
recursive list functions overflow on long lists (the Grobner bases of
Complex/grobner_examples.ml), and one at a time unless given `-j`.
`-j JOBS` is how many run at once (one per package, each a single thread
taking 1 to 6 GB): half the cores by default. A test executable above
`--max-rss-gb` (24) is killed and reported.

`--shard I/N` runs the I-th of N parts of the selection (I from 1), for
machines in parallel; the parts are balanced with the recorded times
(tools/test_times.tsv, seconds on wasm-gc; `--list` shows them).
"""
import argparse
import glob
import json
import os
import re
import subprocess
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TIMES = os.path.join(ROOT, "tools", "test_times.tsv")
# hol.ml's hand-ported files and the support packages
QUICK = ["kernel", "lib", "num", "pp", "basics", "nets", "printer", "preterm", "parser",
         "equal", "bool", "drule", "tactics", "itab", "simp", "omap", "oset", "testkit"]
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


# package -> the test files selected in it (all of them when absent)
ONLY = {}


def select(names, pkgs):
    out = []
    for n in names:
        n = n.rstrip("/")
        if n.endswith(".mbt") and os.path.isfile(os.path.join(ROOT, n)) and os.path.dirname(n) in pkgs:
            ONLY.setdefault(os.path.dirname(n), set()).add(os.path.basename(n))
            sel = [os.path.dirname(n)]
        elif n == "all":
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


def build_log(target):
    os.makedirs(os.path.join(ROOT, "_build"), exist_ok=True)
    return os.path.join(ROOT, "_build", f"test_{target}.log")


def run_moon(target, ps, a):
    """`moon test` builds and runs (the targets moonrun does not run)."""
    logf = build_log(target)
    # the warnings of generated code and the goldens' context lines would
    # bury the result: show failures, the start of each diff and the totals
    # as they come; the full output goes to the log
    show = 0
    cmd = ["moon", "test", "--target", target, "-j", a.jobs] + ps
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
    print(f"   log: {os.path.relpath(logf, ROOT)}")
    return r.returncode == 0


def describe(message):
    """A failed test's message: the first lines an expect test differs in."""
    if message.startswith("@EXPECT_FAILED "):
        try:
            d = json.loads(message[len("@EXPECT_FAILED "):])
            want, got = str(d.get("expect", "")).split("\n"), str(d.get("actual", "")).split("\n")
            i = next((i for i, (x, y) in enumerate(zip(want, got)) if x != y), min(len(want), len(got)))
            loc = d.get("loc", {})
            return (f"expect test at {loc.get('filename', '?')}:{loc.get('start_line', '?')} differs from line {i + 1} "
                    f"({len(want)} lines expected, {len(got)} actual)\n"
                    f"     - {(want[i] if i < len(want) else '<end>')[:300]}\n"
                    f"     + {(got[i] if i < len(got) else '<end>')[:300]}")
        except ValueError:
            pass
    return message[:600]


def run_wasm(target, ps, a):
    """Build the test executables, then run each with moonrun."""
    logf = build_log(target)
    b = subprocess.run(["moon", "test", "--target", target, "--build-only", "-j", a.jobs] + ps,
                       cwd=ROOT, capture_output=True, text=True)
    open(logf, "w").write(b.stdout + b.stderr)
    if b.returncode != 0:
        errs = [l for l in (b.stdout + b.stderr).splitlines() if l.startswith(("Error", "error"))]
        print("\n".join(errs[:20]) or (b.stdout + b.stderr)[-2000:])
        print(f"   build failed: {os.path.relpath(logf, ROOT)}")
        return False
    out = os.path.join(ROOT, "_build", target, "debug", "test")
    jobs = []  # (package, kind, executable, test-args)
    for p in ps:
        for info in sorted(glob.glob(os.path.join(out, p, "__*_test_info.json"))):
            kind = os.path.basename(info)[2:].split("_test_info")[0]
            tests = json.load(open(info))["tests"]
            # a chain's test files are numbered (NN_name_test.mbt) and run
            # in that order (tools/ocaml_ref/chain_test.py); the files of
            # any other package in the order moon lists them (the kernel's
            # tests expect it)
            files = [(f, v) for f, v in tests.items() if v]
            if files and all(re.match(r"\d\d_", f) for f, _ in files):
                files.sort()
            ranges = [[f, [{"start": 0, "end": len(v)}]] for f, v in files
                      if p not in ONLY or f in ONLY[p]]
            if not ranges:
                continue
            exe = glob.glob(os.path.join(out, p, f"*.{kind}_test.wasm"))
            if len(exe) != 1:
                print(f"   {p}: no {kind} test executable")
                return False
            args = json.dumps({"package": "bobzhang/hol_light/" + p, "file_and_index": ranges})
            jobs.append((p, kind, exe[0], args, sum(r[1][0]["end"] for r in ranges)))

    def run(job):
        p, kind, exe, args, n = job
        t = time.time()
        proc = subprocess.Popen(["moonrun", "--stack-size", a.stack_size, "--test-args", args, exe, "--"],
                                cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        # watch its memory: a test that runs away is killed, not left to
        # take the machine with it
        peak, killed, done = [0.0], [False], threading.Event()

        def watch():
            while not done.wait(5):
                r = subprocess.run(["ps", "-o", "rss=", "-p", str(proc.pid)], capture_output=True, text=True)
                gb = int(r.stdout.strip() or 0) / 1048576
                peak[0] = max(peak[0], gb)
                if gb > float(a.max_rss_gb):
                    killed[0] = True
                    proc.kill()

        w = threading.Thread(target=watch, daemon=True)
        w.start()
        out, err = proc.communicate()
        done.set()
        res = [json.loads(l) for l in out.splitlines() if l.startswith('{"type":"result"')]
        bad = [x for x in res if x.get("message")]
        lines = [f"   FAILED {p} ({kind}) {x['file']} #{x['index']}: {describe(x['message'])}" for x in bad]
        if killed[0]:
            lines.append(f"   FAILED {p} ({kind}): killed above {a.max_rss_gb} GB of memory (--max-rss-gb), "
                         f"{len(res)} of {n} tests ran")
        elif proc.returncode != 0 or len(res) != n:
            # a trap (stack overflow, abort) ends the executable
            tail = [l for l in err.strip().splitlines() if l.strip()][:6]
            lines.append(f"   FAILED {p} ({kind}): exit {proc.returncode}, {len(res)} of {n} tests ran\n     " +
                         "\n     ".join(l[:300] for l in tail))
        for l in lines:
            print(l, flush=True)
        return p, time.time() - t, n, len(res) - len(bad), not lines, peak[0]

    with ThreadPoolExecutor(int(a.jobs)) as ex:
        results = list(ex.map(run, jobs))
    total, passed = sum(r[2] for r in results), sum(r[3] for r in results)
    print(f"Total tests: {total}, passed: {passed}, failed: {total - passed}.")
    top = sorted(results, key=lambda r: -r[5])[:3]
    print("   most memory: " + ", ".join(f"{r[0]} {r[5]:.1f} GB" for r in top))
    if a.times:
        secs = {}
        for p, dt, *_ in results:
            secs[p] = secs.get(p, 0) + dt
        record_times(secs)
    return all(r[4] for r in results)


def record_times(secs):
    """Merge the measured seconds into tools/test_times.tsv."""
    head, known = [], {}
    if os.path.exists(TIMES):
        for line in open(TIMES):
            if line.startswith("#"):
                head.append(line)
            elif line.strip():
                p, s = line.split("\t")[:2]
                known[p] = s.strip()
    known.update({p: str(max(1, round(s))) for p, s in secs.items()})
    with open(TIMES, "w") as f:
        f.write("".join(head) + "".join(f"{p}\t{s}\n" for p, s in sorted(known.items())))


def main():
    ap = argparse.ArgumentParser(usage=__doc__)
    ap.add_argument("tiers", nargs="*", default=["quick"])
    ap.add_argument("--target")
    ap.add_argument("--shard")
    # moon runs the test executables one at a time unless told otherwise
    ap.add_argument("-j", "--jobs", default=str(max(1, (os.cpu_count() or 2) // 2)))
    ap.add_argument("--stack-size", default="16000")
    # a test executable above this much memory is killed (the largest, a
    # whole chain in one process, stays well under it)
    ap.add_argument("--max-rss-gb", default="24")
    # record each package's seconds in tools/test_times.tsv (wasm-gc)
    ap.add_argument("--times", action="store_true")
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
        runs.append((a.target, sel))
    else:
        quick = [p for p in sel if tier_of(p) == "quick"]
        if quick:
            runs.append(("wasm", quick))
        runs.append(("wasm-gc", sel))
    if a.list:
        for target, ps in runs:
            print(f"{target}: {len(ps)} packages, {sum(w[p] for p in ps):.0f}s of tests "
                  f"(longest {max(w[p] for p in ps):.0f}s)")
            for p in ps:
                print(f"  {w[p]:7.0f}s  {p}")
        return
    status = 0
    for target, ps in runs:
        print(f"== {target}: {len(ps)} packages", flush=True)
        t = time.time()
        ok = run_wasm(target, ps, a) if target in ("wasm", "wasm-gc") else run_moon(target, ps, a)
        print(f"== {target}: {'ok' if ok else 'FAILED'} in {time.time() - t:.0f}s", flush=True)
        status = status or (0 if ok else 1)
    sys.exit(status)


if __name__ == "__main__":
    main()
