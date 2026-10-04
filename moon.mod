name = "bobzhang/hol_light"

version = "0.1.0"

readme = "README.md"

repository = "https://github.com/bobzhang/hol-light.mbt"

license = "BSD-2-Clause"

keywords = [ "theorem-prover", "hol", "logic" ]

preferred_target = "wasm"

description = "A MoonBit port of the HOL Light theorem prover"

// mooncakes caps a module at 100 MB unpacked (it answers "Invalid ZIP archive"):
// Multivariate/, 100/ and the tooling are on GitHub only for now (TODO.md)

options(
  exclude: [ "100", "multivariate", "tools" ],
)
