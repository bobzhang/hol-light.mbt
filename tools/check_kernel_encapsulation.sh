#!/bin/sh
# Checks that code outside kernel/ cannot construct or update kernel values.
# Each probe must FAIL to compile with "read-only" / "no record definition".
set -u
cd "$(dirname "$0")/.."
probe_dir=_kernel_probe
status=0
run_probe() {
  name=$1; body=$2; expect=$3
  rm -rf "$probe_dir"; mkdir -p "$probe_dir"
  printf 'import {\n  "bobzhang/hol_light/kernel",\n  "moonbitlang/core/list",\n}\n' > "$probe_dir/moon.pkg"
  printf '%s\n' "$body" > "$probe_dir/probe.mbt"
  out=$(moon check --target wasm 2>&1)
  if printf '%s' "$out" | grep -q "$expect"; then
    echo "ok   $name"
  else
    echo "FAIL $name: expected compile error matching '$expect'"
    status=1
  fi
}
run_probe "construct Term" 'pub fn f() -> @kernel.Term { @kernel.Var("x", @kernel.bool_ty) }' "read-only"
run_probe "construct HolType" 'pub fn f() -> @kernel.HolType { @kernel.Tyvar("A") }' "read-only"
run_probe "construct Thm" 'pub fn f(t : @kernel.Term) -> @kernel.Thm { { hyps: @list.empty(), concl: t } }' "read-only\|no record definition"
run_probe "update Thm" 'pub fn f(th : @kernel.Thm, t : @kernel.Term) -> @kernel.Thm { { ..th, concl: t } }' "read-only\|no record\|private\|not visible\|Cannot"
run_probe "read private field" 'pub fn f(th : @kernel.Thm) -> @kernel.Term { th.concl }' "private\|not visible\|Cannot\|no field\|does not have"
rm -rf "$probe_dir"
exit $status
