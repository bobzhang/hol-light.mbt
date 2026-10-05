#!/usr/bin/env python3
"""Translate a HOL Light theory file and run its differential test.

usage: theory.py <file>     e.g. theory.py arith.ml, theory.py Library/prime.ml

Sets up the MoonBit package (importing every package of hol.ml's files,
then those of the files <file> needs, dependencies first), writes the
standard reference script and test (theorem list, types, constants,
definitions, counters; per-file extra checks go between the EXTRA
markers) unless they exist, translates <file>, regenerates the theorem
lists, runs the OCaml reference and embeds its output, and runs the test.
Exits with the test's status.
"""
import functools
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
HOL = os.path.join(ROOT, ".repos/hol-light")
REF = os.path.join(ROOT, "tools/ocaml_ref")

# hol.ml's files after the hand-ported core, in order
CORE = ["theorems", "ind_defs", "class", "trivia", "canon", "meson", "firstorder", "metis",
        "thecops", "quot", "impconv", "pair", "compute", "nums", "recursion", "arith", "wf",
        "calc_num", "normalizer", "grobner", "ind_types", "lists", "realax", "calc_int",
        "realarith", "real", "calc_rat", "int", "sets", "iterate", "cart", "define"]
# the reference scripts load these (the prelude loads lib.ml .. equal.ml)
USE_BEFORE = ["bool", "drule", "tactics", "itab", "simp"]
# hol.ml's hand-ported files (loaded by the prelude or the scripts)
LOADED = ["lib", "fusion", "basics", "nets", "printer", "preterm", "parser", "equal",
          "bool", "drule", "tactics", "itab", "simp"]
HAND = ["kernel", "lib", "num", "basics", "nets", "printer", "preterm", "parser", "pp",
        "equal", "bool", "drule", "tactics", "itab", "simp"]


def stem(f):
    f = f[:-3] if f.endswith(".ml") else f
    return f[:-3] if f.endswith(".hl") else f


# A package is imported under its last component: a file named like a
# package loaded with it takes its directory's name too (the same table:
# tools/translator/translator.ml, Names.package_of_file)
RENAMED = {
    "Logic/canon": "logic/logic_canon",                    # canon.ml
    "Probability/measure": "probability/probability_measure",  # Multivariate/measure.ml
    "Quaternions/misc": "quaternions/quaternions_misc",    # Multivariate/misc.ml
}


def pkg_of(f):
    """`Library/prime.ml` -> `library/prime`; `arith.ml` -> `arith`."""
    s = stem(f)
    if s in RENAMED:
        return RENAMED[s]
    if "/" in s:
        d, b = s.split("/", 1)
        same = [x for x in os.listdir(HOL) if x.lower() == d.lower() and os.path.isdir(os.path.join(HOL, x))]
        if len(same) > 1:
            sys.exit(f"upstream directories {same} map to the same package directory")
        return d.lower() + "/" + b
    return s


def strip_comments(text):
    """OCaml text without (nested) comments; string literals kept."""
    out, depth, i, in_str = [], 0, 0, False
    while i < len(text):
        c = text[i]
        if in_str:
            if depth == 0:
                out.append(c)
            if c == "\\" and i + 1 < len(text):
                if depth == 0:
                    out.append(text[i + 1])
                i += 2
                continue
            if c == '"':
                in_str = False
            i += 1
        elif text.startswith("(*", i):
            depth += 1
            i += 2
        elif depth > 0 and text.startswith("*)", i):
            depth -= 1
            i += 2
        else:
            if c == '"':
                in_str = True
            if depth == 0:
                out.append(c)
            i += 1
    return "".join(out)


@functools.lru_cache(maxsize=None)
def needs(f):
    # `f` as named (`Quaternions/misc.hl`), else with `.ml`
    path = os.path.join(HOL, f)
    if not os.path.isfile(path):
        path = os.path.join(HOL, f if f.endswith((".ml", ".hl")) else f + ".ml")
    # the same rule as the translator's Translator.needs_of
    # `loadt "f"` is used as `needs` too (100/lagrange.ml), and `loads "f"`
    # (Rqe/make.ml): a file is loaded once here. Only top-level phrases
    # with a literal file name are dependencies
    text = strip_comments(open(path).read())
    return [m.group(1) for m in re.finditer(r'(?<![A-Za-z0-9_\'])(?:needs|loadt|loads)\s+"([^"]+)"', text)
            if text[:m.start()].rstrip() == "" or text[:m.start()].rstrip().endswith(";;")]


# A file's `needs` are all loaded before it, wherever they stand in it,
# except these: files loaded part-way through, where the place matters.
# Autoformalization/planar_graph.ml loads Multivariate/cauchy.ml after 12K
# lines, between two `prioritize_real()`: Library/rstc.ml, loaded at its
# top, leaves the naturals' priority, under which cauchy.ml fails.
MID_NEEDS = {"Autoformalization/planar_graph.ml": ["Multivariate/cauchy.ml"]}


def head_needs(f):
    """What `f` needs before its first phrase (all but MID_NEEDS)."""
    return [n for n in needs(f) if n not in MID_NEEDS.get(f, [])]


def mid_plan(f):
    """[(file `f` loads part-way through, the files that load brings in, in
    order: what it needs that is not loaded yet, then itself)]."""
    seen, out = deps(f), []
    for x in MID_NEEDS.get(f, []):
        new = [g for g in deps(x) + [x] if g not in seen]
        out.append((x, new))
        seen = seen + new
    return out


# Multivariate/ is loaded as Multivariate/make.ml and make_complex.ml load
# it, then the remaining files (each after what it needs): a file there is
# loaded after its predecessor in this order (and that one's chain), then
# what it needs. One session can then load the chain once for a batch
# (tools/ocaml_ref/batch.py). Not ported: multivariate_database.ml and
# complex_database.ml, the name/theorem tables of the interactive `search`
# (help.ml, like database.ml); they define no theory.
MAKE_ORDER = ["Multivariate/" + n + ".ml" for n in [
    "misc", "metric", "homology", "vectors", "determinants", "topology", "convex", "paths",
    "polytope", "degree", "derivatives", "clifford", "integration", "measure",
    "complexes", "canal", "transcendentals", "realanalysis", "moretop", "cauchy"]]
# the other files, loaded after the deepest make.ml file they need (their
# anchor) and what they need: e.g. tarski.ml's proofs expect convex.ml's
# context, not the complex analysis loaded after it
EXTRAS = ["Multivariate/" + n + ".ml" for n in [
    "cross", "msum", "paracompact", "specialtopologies", "tarski", "wlog", "wlog_examples",
    "geom", "lpspaces", "gamma", "cvectors", "flyspeck"]]
MV_ORDER = MAKE_ORDER + EXTRAS


def needs_closure(f):
    """Every file `f` needs, transitively (hol.ml's excluded)."""
    out, todo = [], list(needs(f))
    while todo:
        g = todo.pop()
        if stem(g) in CORE or stem(g) in LOADED or g in out:
            continue
        out.append(g)
        todo += needs(g)
    return out


# directories loaded by each file's own `needs`, not in their make.ml's
# order: every EC file states what it needs, and the chain (thirty files,
# the curves one after another) is more than three hours of proofs in one
# OCaml session, where a curve by itself is at most forty minutes
NEEDS_ONLY = {"EC"}


@functools.lru_cache(maxsize=None)
def make_plan(d):
    """What `d`/make.ml loads, in order: (file of `d`, the files of other
    directories make.ml loads just before it). Empty without a make.ml, and
    for Multivariate/ (MAKE_ORDER above)."""
    if d == "Multivariate" or d in NEEDS_ONLY or not os.path.isfile(os.path.join(HOL, d, "make.ml")):
        return []
    plan, pre = [], []
    for g in needs(d + "/make.ml"):
        if g.startswith(d + "/"):
            plan.append((g, pre))
            pre = []
        else:
            pre.append(g)
    return plan


def make_pre(f):
    """The files of other directories its directory's make.ml loads just
    before `f`: loaded before `f`, like what it needs."""
    for g, pre in make_plan(os.path.dirname(f)):
        if g == f:
            return pre
    return []


def chain_prev(f):
    """The file loaded just before `f`'s own needs: its predecessor in
    make.ml's order, or an extra file's anchor. A directory with a make.ml
    is loaded as that loads it (some files name no `needs` and rely on it:
    Complex/complex_real.ml)."""
    if f in MAKE_ORDER:
        i = MAKE_ORDER.index(f)
        return MAKE_ORDER[i - 1] if i > 0 else None
    if f in EXTRAS:
        anchored = [g for g in needs_closure(f) if g in MAKE_ORDER]
        return max(anchored, key=MAKE_ORDER.index) if anchored else None
    order = [g for g, _ in make_plan(os.path.dirname(f))]
    if f in order:
        i = order.index(f)
        return order[i - 1] if i > 0 else None
    return None


def alone(g, frm):
    """Whether `frm` loads `g` by itself (`g` and what `g` needs) rather
    than at its place in its directory's make.ml: a file of another
    directory that needs it, as upstream's `needs` does. Jordan/make.ml loads
    Rqe/num_calc_simp.ml so, and fails after the Rqe files before it.
    Multivariate/ keeps its order from everywhere (MAKE_ORDER)."""
    d = os.path.dirname(g)
    return (g not in MV_ORDER and os.path.dirname(frm) != d
            and g in [x for x, _ in make_plan(d)])


def before(g, frm):
    """The files `g`'s load brings in before `g`, when `frm` asks for it."""
    chain = [] if alone(g, frm) else ([chain_prev(g)] if chain_prev(g) else []) + make_pre(g)
    return chain + head_needs(g)


@functools.lru_cache(maxsize=None)
def _deps(f):
    """The files loaded before `f` outside hol.ml's list, in order:
    its predecessor's chain and the predecessor (its directory's order),
    then what `f` needs, dependencies first."""
    prev = chain_prev(f)
    seen = deps(prev) + [prev] if prev else []
    visiting = [f]

    def visit(g, frm):
        # hol.ml's files (hand-ported or translated) are already loaded
        if stem(g) in CORE or stem(g) in LOADED or g in seen or g in visiting:
            return
        visiting.append(g)
        # as g's load(): its predecessor's chain first (unless `frm` loads
        # it alone), then what it needs
        for h in before(g, frm):
            visit(h, g)
        seen.append(g)

    for h in make_pre(f) + head_needs(f):
        visit(h, f)
    return seen


def deps(f):
    return list(_deps(f))


def run(cmd, **kw):
    return subprocess.run(cmd, cwd=ROOT, **kw)


# moonc processes at once: one per core (moon's default) exhausted the
# machine's memory on the large generated packages
MOON_JOBS = os.environ.get("HOL_MOON_JOBS", "4")


def moon_info(**kw):
    """`moon info`, after `moon check` at MOON_JOBS at a time: `moon info`
    takes no -j, and then finds the packages already checked."""
    run(["moon", "check", "-j", MOON_JOBS], capture_output=True)
    return run(["moon", "info"], **kw)


def setup(f):
    pkg = pkg_of(f)
    alias = os.path.basename(pkg)
    name = stem(f)
    os.makedirs(os.path.join(ROOT, pkg), exist_ok=True)
    before = CORE[:CORE.index(name)] if name in CORE else CORE
    # translated packages, including the Stdlib replacements
    mids = [g for _, new in mid_plan(f) for g in new]
    imports = HAND + ["omap", "oset"] + before + [pkg_of(d) for d in deps(f) + mids]
    # MoonBit imports packages by their last path component: no clashes
    aliases = [os.path.basename(p) for p in imports + [pkg]] + ["list", "testkit"]
    dup = sorted({a for a in aliases if aliases.count(a) > 1})
    if dup:
        sys.exit(f"package aliases collide for {f}: {dup}")
    text = "import {\n" + "".join(f'  "bobzhang/hol_light/{p}",\n' for p in imports)
    text += '  "moonbitlang/core/list",\n}\n\nimport {\n  "bobzhang/hol_light/testkit",\n} for "test"\n\n'
    text += 'warnings = "-unused_value-unused_trait_bound-unused_package-unused_error_type"\n'
    # the translation stays as the translator emits it
    gen = alias + ("_ml" if alias.endswith("test") else "") + ".mbt"
    text += f'\nformatter(ignore: [ "{gen}" ])\n'
    open(os.path.join(ROOT, pkg, "moon.pkg"), "w").write(text)
    if "/" in pkg:
        # loaded on demand, as upstream's `needs`: what it needs first (in
        # order), then itself, once (MoonBit's package initialization order
        # is not upstream's)
        def call(n):
            return f"  @{os.path.basename(pkg_of(n))}.{'load_alone' if alone(n, f) else 'load'}()\n"

        def ported(ns):
            return [n for n in ns if stem(n) not in CORE and stem(n) not in LOADED]

        chain = ([chain_prev(f)] if chain_prev(f) else []) + ported(make_pre(f))
        own = ported(head_needs(f))
        body = (f'  @parser.begin_theory("{name}")\n  load_steps() catch {{\n'
                f'    e => abort("HOL Light: loading {name}.ml failed: " + e.to_string())\n  }}\n'
                "  @parser.end_theory()\n}\n")
        text = (f"// {name}.ml: the load steps are generated ({alias}{'_ml' if alias.endswith('test') else ''}.mbt).\n\n"
                "///|\nlet loaded : Ref[Bool] = Ref::{ val: false }\n\n"
                f"///|\n/// Load {name}.ml (once), after the files it needs.\npub fn load() -> Unit {{\n"
                "  if loaded.val {\n    return\n  }\n  loaded.val = true\n"
                + "".join(call(n) for n in chain + own) + body)
        if f in [x for x, _ in make_plan(os.path.dirname(f))]:
            # a member of its directory's make.ml order: a file of another
            # directory that needs it loads it without the files before it
            text += (f"\n///|\n/// Load {name}.ml (once) as `needs` does: after what it needs itself, not\n"
                     "/// after the files its directory's make.ml loads before it.\n"
                     "pub fn load_alone() -> Unit {\n"
                     "  if loaded.val {\n    return\n  }\n  loaded.val = true\n"
                     + "".join(call(n) for n in own) + body)
        open(os.path.join(ROOT, pkg, "init.mbt"), "w").write(text)
    else:
        open(os.path.join(ROOT, pkg, "init.mbt"), "w").write(
            f"// {name}.ml: the load steps are generated ({alias}.mbt).\n\n///|\nfn init {{\n"
            f'  @parser.begin_theory("{name}")\n  load_steps() catch {{\n'
            f'    e => abort("HOL Light: loading {name}.ml failed: " + e.to_string())\n  }}\n'
            "  @parser.end_theory()\n}\n")
    return pkg, alias, name


def write_tests_paths(f, pkg, alias, name):
    """The reference script and the MoonBit test of `f`."""
    ref = os.path.join(REF, alias + "_ref.ml" if "/" not in name else name.replace("/", "_") + "_ref.ml")
    return ref, os.path.join(ROOT, pkg, alias + "_ref_test.mbt")


def write_tests(f, pkg, alias, name):
    ref, test = write_tests_paths(f, pkg, alias, name)
    if os.path.exists(test) and os.path.exists(ref):
        return ref, test
    before = CORE[:CORE.index(name)] if name in CORE else CORE
    # the files by their upstream names (Quaternions/'s are `.hl`)
    uses = [u + ".ml" for u in USE_BEFORE + before] + deps(f)
    src = f if f.endswith((".ml", ".hl")) else f + ".ml"
    ml = [f"(* Load-fidelity test for {name}.ml (translated by tools/translator). Keep\n"
          f"   in sync with {pkg}/{alias}_ref_test.mbt (the theorem list part is\n"
          "   generated by tools/ocaml_ref/gen_theorems_test.py). *)\n"]
    ml += [f'#use "{u}";;\n' for u in uses]
    ml += ["start_trace ();;\n"]
    if mid_plan(f):
        # a file loaded part-way through is loaded there (`needs` does
        # nothing otherwise: everything else is loaded before)
        cases = " | ".join('"%s" -> List.iter batch_use [%s]' % (x, "; ".join(f'"{g}"' for g in new))
                           for x, new in mid_plan(f))
        ml += [f"let needs s = match s with {cases} | _ -> ();;\n"]
    ml += [f'#use "{src}";;\n']
    if mid_plan(f):
        ml += ["let needs (_:string) = ();;\n"]
    ml += [f'show_trace "{name}";;\n',
           "(* BEGIN generated theorem list *)\n(* END generated theorem list *)\n",
           "let tm s = parse_term s;;\n",
           # Stdlib's functions by their qualified names: a file may define
           # `length` or `map` itself (100/chords.ml defines `length`)
           'attempt "types" (fun () -> String.concat " " (List.map (fun (s,n) -> s ^ "/" ^ string_of_int n) (types())));;\n',
           'attempt "constants" (fun () -> String.concat " " (List.map fst (constants())));;\n',
           'attempt "definitions" (fun () -> string_of_int (List.length (definitions())));;\n',
           "(* BEGIN EXTRA *)\n(* END EXTRA *)\n",
           'attempt "counter_tyvar" (fun () -> stm (tm "zz_counter"));;\n',
           'attempt "counter_genvar" (fun () -> stm (genvar bool_ty));;\n']
    open(ref, "w").write("".join(ml))
    theories = ["simp"] + before + [stem(d) for d in deps(f)] + [name]
    quoted = ", ".join(f'"{t}"' for t in theories)
    load = f"  @{alias}.load()\n" if "/" in pkg else ""
    mbt = f"""// Load-fidelity test for {name}.ml: replays tools/ocaml_ref/{os.path.basename(ref)}
// (keep in sync; the theorem list part is generated by
// tools/ocaml_ref/gen_theorems_test.py).

///|
using @testkit {{stm, sthm}}

///|
test "{name} matches {name}.ml" {{
{load}  let log = @testkit.Log::new()
  log.capture_reports()
  for th in [{quoted}] {{
    log.show_theory_output(th)
  }}
  log.show_theory_trace("{name}")
  log.capture_stdout()
  // BEGIN generated theorem list
  // END generated theorem list
  let tm = @parser.parse_term
  log.attempt("types", () => {{
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  }})
  log.attempt("constants", () => {{
    @kernel.constants().map(c => c.0).to_array().join(" ")
  }})
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.attempt("counter_tyvar", () => stm(tm("zz_counter")))
  log.attempt("counter_genvar", () => stm(@basics.genvar(@kernel.bool_ty)))
  @testkit.check_axioms()
  inspect(@testkit.normalize_times(log.contents()))
}}
"""
    open(test, "w").write(mbt)
    return ref, test


def main():
    import time
    t0 = [time.time()]
    stages = []

    def stage(name):
        now = time.time()
        stages.append(f"{name} {now - t0[0]:.0f}s")
        t0[0] = now
        print("timing: " + ", ".join(stages), file=sys.stderr, flush=True)

    f = sys.argv[1]
    if not f.endswith(".ml"):
        f += ".ml"
    pkg0 = pkg_of(f)
    aside = os.path.join(REF, "_build", "pkg_" + pkg0.replace("/", "__"))
    # an interrupted earlier run left the package aside: put it back
    if os.path.exists(aside):
        if os.path.exists(os.path.join(ROOT, pkg0)):
            sys.exit(f"both {pkg0} and {aside} exist; resolve by hand")
        os.rename(aside, os.path.join(ROOT, pkg0))
    if f in MV_ORDER:
        # Multivariate files: loaded after their predecessor's chain, which
        # tools/ocaml_ref/batch.py plans (the translator's own `needs` order
        # would differ)
        os.execvp("python3", ["python3", os.path.join(REF, "batch.py"), f])
    alias0 = pkg0.split("/")[-1]
    gen0 = os.path.join(ROOT, pkg0, alias0 + ("_ml" if alias0.endswith("test") else "") + ".mbt")
    retranslating = os.path.exists(gen0)
    pkg, alias, name = setup(f)
    ref, test = write_tests(f, pkg, alias, name)
    if retranslating:
        # refresh the other packages' interfaces with this one (its old,
        # possibly stale translation) set aside; a new package needs no
        # refresh: the previous run left the interfaces current
        os.makedirs(os.path.dirname(aside), exist_ok=True)
        os.rename(os.path.join(ROOT, pkg), aside)
        try:
            moon_info(capture_output=True)
        finally:
            os.rename(aside, os.path.join(ROOT, pkg))
    stage("setup+info")
    out = run(["tools/ocaml_ref/translate.sh", "translate", f], capture_output=True, text=True).stdout
    stage("translate")
    lines = [l for l in out.splitlines() if "unsupported" in l or "wrote" in l or "Exception" in l]
    print("\n".join(lines))
    if not any(" 0 unsupported" in l for l in lines):
        print(f"UNSUPPORTED ITEMS in {f}", file=sys.stderr)
        sys.exit(1)
    # `moon info` type-checks and writes the interface the next translations
    # read
    chk = moon_info(capture_output=True, text=True)
    errs = re.findall(r"^Error.*(?:\n.*){0,8}", chk.stdout + chk.stderr, re.M)
    if errs:
        print("\n--\n".join(errs[:6]))
        sys.exit(1)
    stage("info")
    run(["python3", "tools/ocaml_ref/gen_theorems_test.py", pkg, os.path.relpath(ref, ROOT), os.path.relpath(test, ROOT)])
    expected = ref[:-3] + ".expected"
    res = subprocess.run(["./run.sh", os.path.basename(ref)], cwd=REF, capture_output=True, text=True)
    s = res.stdout.replace("    * HOL-Light syntax in effect *\n\n", "", 1)
    s = re.sub(r"(?m)^CPU time \(user\): .*$", "CPU time (user): <t>", s)
    open(expected, "w").write(s)
    stage("ocaml-ref")
    run(["python3", "tools/ocaml_ref/embed_golden.py", os.path.relpath(expected, ROOT), os.path.relpath(test, ROOT)])
    # cheap: translations are formatter-ignored (moon.pkg)
    run(["moon", "fmt"], capture_output=True)
    # tools/test.py: wasm-gc, with a larger stack than `moon test` gives
    t = run(["python3", "tools/test.py", pkg], capture_output=True, text=True)
    log = t.stdout + t.stderr
    stage("moon-test")
    open(os.path.join(REF, "_build", "theory_" + alias + ".log"), "w").write(log)
    print("\n".join(log.splitlines()[:40]))
    sys.exit(t.returncode)


if __name__ == "__main__":
    main()
