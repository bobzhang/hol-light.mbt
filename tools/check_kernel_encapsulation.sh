#!/bin/sh
# Checks that code outside kernel/ cannot construct, update or read the
# private parts of kernel values. Each probe must fail to compile, with an
# error of an expected code located in the probe file itself.
set -u
cd "$(dirname "$0")/.."
probe_dir=_kernel_probe
status=0
run_probe() {
  name=$1; body=$2; codes=$3
  rm -rf "$probe_dir"; mkdir -p "$probe_dir"
  printf 'import {\n  "bobzhang/hol_light/kernel",\n  "moonbitlang/core/list",\n}\n' > "$probe_dir/moon.pkg"
  printf '%s\n' "$body" > "$probe_dir/probe.mbt"
  out=$(moon check --target wasm --output-json "$probe_dir" 2>/dev/null)
  rc=$?
  verdict=$(printf '%s\n' "$out" | python3 -c '
import json, sys
codes = {int(c) for c in sys.argv[1].split(",")}
errs = []
for line in sys.stdin:
    line = line.strip()
    if not line.startswith("{"):
        continue
    d = json.loads(line)
    if d.get("level") == "error":
        errs.append(d)
probe_errs = [d for d in errs if d["path"].endswith("/_kernel_probe/probe.mbt")]
other = [d for d in errs if d not in probe_errs]
if other:
    print("errors outside the probe: " + "; ".join(d["message"] for d in other))
elif not probe_errs:
    print("probe compiled")
elif not any(d["error_code"] in codes for d in probe_errs):
    print("unexpected errors: " + "; ".join("%d %s" % (d["error_code"], d["message"]) for d in probe_errs))
else:
    print("ok")
' "$codes")
  if [ "$rc" -ne 0 ] && [ "$verdict" = ok ]; then
    echo "ok   $name"
  else
    echo "FAIL $name (exit $rc): $verdict"
    status=1
  fi
}
# 4036: cannot create values of a read-only type; 4033: no such record;
# 4091: no (visible) field.
run_probe "construct Term" 'pub fn f() -> @kernel.Term { @kernel.Var("x", @kernel.bool_ty) }' 4036
run_probe "construct HolType" 'pub fn f() -> @kernel.HolType { @kernel.Tyvar("A") }' 4036
run_probe "construct Thm" 'pub fn f(t : @kernel.Term) -> @kernel.Thm { { hyps: @list.empty(), concl: t } }' 4036,4033
run_probe "update Thm" 'pub fn f(th : @kernel.Thm, t : @kernel.Term) -> @kernel.Thm { { ..th, concl: t } }' 4036,4033
run_probe "read private field" 'pub fn f(th : @kernel.Thm) -> @kernel.Term { th.concl }' 4091
rm -rf "$probe_dir"
exit $status
