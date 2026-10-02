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
    return f[:-3] if f.endswith(".ml") else f


def pkg_of(f):
    """`Library/prime.ml` -> `library/prime`; `arith.ml` -> `arith`."""
    s = stem(f)
    if "/" in s:
        d, b = s.split("/", 1)
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


def needs(f):
    path = os.path.join(HOL, f if f.endswith(".ml") else f + ".ml")
    # the same rule as the translator's Translator.needs_of
    return re.findall(r'(?<![A-Za-z0-9_\'])needs\s+"([^"]+)"', strip_comments(open(path).read()))


# Multivariate/ is loaded as Multivariate/make.ml and make_complex.ml load
# it, then the remaining files (each after what it needs): a file there is
# loaded after its predecessor in this order (and that one's chain), then
# what it needs. One session can then load the chain once for a batch
# (tools/ocaml_ref/batch.py).
MV_ORDER = ["Multivariate/" + n + ".ml" for n in [
    "misc", "metric", "homology", "vectors", "determinants", "topology", "convex", "paths",
    "polytope", "degree", "derivatives", "clifford", "integration", "measure",
    "multivariate_database", "complexes", "canal", "transcendentals", "realanalysis",
    "moretop", "cauchy", "complex_database", "cross", "msum", "paracompact",
    "specialtopologies", "tarski", "wlog", "wlog_examples", "geom", "lpspaces", "gamma",
    "cvectors", "flyspeck"]]


def chain_prev(f):
    """The file loaded just before `f`'s own needs (Multivariate order)."""
    if f in MV_ORDER and MV_ORDER.index(f) > 0:
        return MV_ORDER[MV_ORDER.index(f) - 1]
    return None


def deps(f):
    """The files loaded before `f` outside hol.ml's list, in order:
    its predecessor's chain and the predecessor (Multivariate order), then
    what `f` needs, dependencies first."""
    prev = chain_prev(f)
    seen = deps(prev) + [prev] if prev else []
    visiting = [f]

    def visit(g):
        # hol.ml's files (hand-ported or translated) are already loaded
        if stem(g) in CORE or stem(g) in LOADED or g in seen or g in visiting:
            return
        visiting.append(g)
        for h in needs(g):
            visit(h)
        seen.append(g)

    for h in needs(f):
        visit(h)
    return seen


def run(cmd, **kw):
    return subprocess.run(cmd, cwd=ROOT, **kw)


def setup(f):
    pkg = pkg_of(f)
    alias = os.path.basename(pkg)
    name = stem(f)
    os.makedirs(os.path.join(ROOT, pkg), exist_ok=True)
    before = CORE[:CORE.index(name)] if name in CORE else CORE
    # translated packages, including the Stdlib replacements
    imports = HAND + ["omap", "oset"] + before + [pkg_of(d) for d in deps(f)]
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
        lib_needs = ([chain_prev(f)] if chain_prev(f) else []) + \
            [n for n in needs(f) if stem(n) not in CORE and stem(n) not in LOADED]
        calls = "".join(f"  @{os.path.basename(pkg_of(n))}.load()\n" for n in lib_needs)
        open(os.path.join(ROOT, pkg, "init.mbt"), "w").write(
            f"// {name}.ml: the load steps are generated ({alias}{'_ml' if alias.endswith('test') else ''}.mbt).\n\n"
            "///|\nlet loaded : Ref[Bool] = Ref::{ val: false }\n\n"
            f"///|\n/// Load {name}.ml (once), after the files it needs.\npub fn load() -> Unit {{\n"
            "  if loaded.val {\n    return\n  }\n  loaded.val = true\n" + calls +
            f'  @parser.begin_theory("{name}")\n  load_steps() catch {{\n'
            f'    e => abort("HOL Light: loading {name}.ml failed: " + e.to_string())\n  }}\n'
            "  @parser.end_theory()\n}\n")
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
    uses = USE_BEFORE + before + [stem(d) for d in deps(f)]
    ml = [f"(* Load-fidelity test for {name}.ml (translated by tools/translator). Keep\n"
          f"   in sync with {pkg}/{alias}_ref_test.mbt (the theorem list part is\n"
          "   generated by tools/ocaml_ref/gen_theorems_test.py). *)\n"]
    ml += [f'#use "{u}.ml";;\n' for u in uses]
    ml += ["start_trace ();;\n", f'#use "{name}.ml";;\n', f'show_trace "{name}";;\n',
           "(* BEGIN generated theorem list *)\n(* END generated theorem list *)\n",
           "let tm s = parse_term s;;\n",
           'attempt "types" (fun () -> String.concat " " (map (fun (s,n) -> s ^ "/" ^ string_of_int n) (types())));;\n',
           'attempt "constants" (fun () -> String.concat " " (map fst (constants())));;\n',
           'attempt "definitions" (fun () -> string_of_int (length (definitions())));;\n',
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
    if f in MV_ORDER:
        # Multivariate files: loaded after their predecessor's chain, which
        # tools/ocaml_ref/batch.py plans (the translator's own `needs` order
        # would differ)
        os.execvp("python3", ["python3", os.path.join(REF, "batch.py"), f])
    pkg0 = pkg_of(f)
    aside = os.path.join(REF, "_build", "pkg_" + pkg0.replace("/", "__"))
    # an interrupted earlier run left the package aside: put it back
    if os.path.exists(aside):
        if os.path.exists(os.path.join(ROOT, pkg0)):
            sys.exit(f"both {pkg0} and {aside} exist; resolve by hand")
        os.rename(aside, os.path.join(ROOT, pkg0))
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
            run(["moon", "info"], capture_output=True)
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
    chk = run(["moon", "info"], capture_output=True, text=True)
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
    t = run(["moon", "test", "--target", "wasm", "-p", "bobzhang/hol_light/" + pkg], capture_output=True, text=True)
    log = t.stdout + t.stderr
    stage("moon-test")
    open(os.path.join(REF, "_build", "theory_" + alias + ".log"), "w").write(log)
    shown = [l for l in log.splitlines() if not l.lstrip().startswith("#|")]
    keep = [l for l in shown if re.match(r"^(Error|Total|Diff|[-+])|failed", l) and not re.match(r"^[-+ ]0\.\.", l)]
    print("\n".join(keep[:40]))
    sys.exit(t.returncode)


if __name__ == "__main__":
    main()
