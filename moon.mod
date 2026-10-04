name = "bobzhang/hol_light"

version = "0.1.0"

readme = "README.md"

repository = "https://github.com/bobzhang/hol-light.mbt"

license = "BSD-2-Clause"

keywords = [ "theorem-prover", "hol", "logic" ]

preferred_target = "wasm"

description = "A MoonBit port of the HOL Light theorem prover"

options(
  exclude: [ "tools", "TODO.md", "**/*_test.mbt", "**/*_wbtest.mbt" ],
)
