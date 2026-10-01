# hol_light.mbt

A MoonBit port of [HOL Light](https://github.com/jrh13/hol-light), John Harrison's
LCF-style interactive theorem prover. See [PLAN.md](PLAN.md) for the migration plan
and progress.

The trusted kernel lives in `kernel/` (a port of `fusion.ml`); everything else
constructs theorems only through its API.
