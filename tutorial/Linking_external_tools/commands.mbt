// The external programs Tutorial/Linking_external_tools.ml ran upstream while it loaded, for
// @lib.sys_command to replay (wasm has no processes; the answers only guide
// proofs the kernel checks). Written by tools/ocaml_ref/batch.py; do not edit.

///|
fn init {
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;factor((1234567890));' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [(2, "2*3^2*5*3607*3803\n")],
  )
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;factor(((x ^ 6) - (1)));' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [(2, "(x-1)*(x+1)*(x^2-x+1)*(x^2+x+1)\n")],
  )
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;factor(((r * ((r * (x * ((1) - x))) * ((1) - (r * (x * ((1) - x)))))) - x));' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [(2, "-(x*(r*x-r+1)*(r^2*x^2-r^2*x-r*x+r+1))\n")],
  )
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;integrate((((x + (5)) ^ 2) + ((77) * x)),x);' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [(2, "x^3/3+(87*x^2)/2+25*x\n")],
  )
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;integrate((sin(x) + (x ^ 11)),x);' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [(2, "x^12/12-cos(x)\n")],
  )
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;expand(integrate((sin(x) ^ 3),x));' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [(2, "cos(x)^3/3-cos(x)\n")],
  )
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;expand(integrate(((sin(x) * ((sin(x) ^ 5) * (cos(x) ^ 4))) + cos(x)),x));' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [(2, "sin(8*x)/2048-sin(4*x)/256-sin(2*x)^5/320+sin(x)+(3*x)/256\n")],
  )
  @lib.replay_command(
    "echo 'linel:10000; display2d:false;expand(integrate((sin(x) ^ 13),x));' | maxima | grep '^(%o3)' | sed -e '<F1>(%o3) <F2>' ><F3>",
    [None, None, Some("")],
    0,
    [
      (
        2, "-(cos(x)^13/13)+(6*cos(x)^11)/11-(5*cos(x)^9)/3+(20*cos(x)^7)/7-3*cos(x)^5+2*cos(x)^3-cos(x)\n",
      ),
    ],
  )
}
