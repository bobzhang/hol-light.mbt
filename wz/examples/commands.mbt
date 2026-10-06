// The external programs WZ/examples.ml ran upstream while it loaded, for
// @lib.sys_command to replay (wasm has no processes; the answers only guide
// proofs the kernel checks). Written by tools/ocaml_ref/batch.py; do not edit.

///|
fn init {
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)/((2)^n)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)/2^n,k,n))\n__HOL_LIGHT_WZ_RESULT__[[k/(2*(n-k+1)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((binomial(n,k)^2)/binomial((2*n),n)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)^2/binomial(2*n,n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k^2*(3*n-2*k+3))/(2*(n-k+1)^2*(2*n+1))),[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)*(binomial(m,(k+p))/binomial((n+m),(n+p)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)*(binomial(m,k+p)/binomial(n+m,n+p)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(p+k))/((n-k+1)*(n+m+1)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial((n+1),(k+1))*((k+(1))*((k+(1))*(factorial(k)/((n+(1))^(k+(1))))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n+1,k+1)*((k+1)*((k+1)*(k!/(n+1)^(k+1)))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(-n-1)/(k+1),[1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((((-1)^k)*(binomial(n,k)*(binomial((2*k),k)*(((4)^n)/((4)^k)))))/binomial((2*n),n)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((-1)^k*(binomial(n,k)*(binomial(2*k,k)*(4^n/4^k))))/binomial(2*n,n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(2*k^2)/((n-k+1)*(2*n+1)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((-1)^k)*binomial((n+1),k)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((-1)^k*binomial(n+1,k),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-(k/(n+1)),[1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((binomial((n+k),k)^2)*(binomial(n,k)^2)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n+k,k)^2*binomial(n,k)^2,k,n))\n__HOL_LIGHT_WZ_RESULT__[[(4*k^4*(2*n+3)*(4*n^2+12*n-2*k^2+3*k+8))/((n-k+1)^2*(n-k+2)^2),[-(n+1)^3,(2*n+3)*(17*n^2+51*n+39),-(n+2)^3]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((((-1)^k)*(binomial((2*n),k)^3))/(((-1)^n)*(factorial((3*n))/(factorial(n)^3)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((-1)^k*binomial(2*n,k)^3)/((-1)^n*((3*n)!/n!^3)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k^3*(448*n^5-624*k*n^4+1760*n^4+348*k^2*n^3-1932*k*n^3+2728*n^3-90*k^3*n^2+792*k^2*n^2-2214*k*n^2+2084*n^2+9*k^4*n-132*k^3*n+594*k^2*n-1113*k*n+784*n+6*k^4-48*k^3+147*k^2-207*k+116))/(3*(2*n-k+1)^3*(2*n-k+2)^3*(3*n+1)*(3*n+2)),[-2,2]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)^3),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)^3,k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k^3*(n+1)^2*(14*n^3-27*k*n^2+74*n^2+18*k^2*n-93*k*n+128*n-4*k^3+30*k^2-78*k+72))/((n-k+1)^3*(n-k+2)^3),[8*(n+1)^2,7*n^2+21*n+16,-(n+2)^2]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((1)-((2)*n))*((((-1)^k)*(binomial(n,k)*((4)^k)))/binomial((2*k),k))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((1-2*n)*(((-1)^k*(binomial(n,k)*4^k))/binomial(2*k,k)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((2*(k-1/2))/(2*n-1)),[1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((-1)^k)*(binomial(n,k)/factorial(k))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((-1)^k*(binomial(n,k)/k!),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k^2*(n+1))/((n-k+1)*(n-k+2))),[n+1,-(2*(n+1)),n+2]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((-1)^k)*((binomial((a+n),(a+k))*(binomial((a+c),(c+k))*binomial((n+c),(n+k))))/(factorial((a+(n+c)))/(factorial(a)*(factorial(n)*factorial(c)))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((-1)^k*((binomial(a+n,a+k)*(binomial(a+c,c+k)*binomial(n+c,n+k)))/((a+(n+c))!/(a!*(n!*c!)))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[((k+a)*(k+c))/((n+c+a+1)*(n-k+1)),[2,-2]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((((-1)^k)*(binomial((2*n),k)^2))/(((-1)^n)*binomial((2*n),n))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((-1)^k*binomial(2*n,k)^2)/((-1)^n*binomial(2*n,n)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k^2*(10*n^2-6*k*n+17*n+k^2-5*k+7))/((2*n-k+1)^2*(2*n-k+2)^2)),[2,-2]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((k*(binomial((n+1),k)/((n+(1))*((2)^n)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(k*(binomial(n+1,k)/((n+1)*2^n)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k-1)/(2*(n-k+2)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial((n+(1+k)),(2*k))*(binomial((2*k),k)*(((-1)^k)/(k+(1))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n+(1+k),2*k)*(binomial(2*k,k)*((-1)^k/(k+1))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k*(k+1))/(n^2+3*n+2)),[1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((n+(2))/(((2)*k)+(1)))*(binomial(n,(2*k))*(((2)^((n-((2)*k))-(1)))*(binomial(((2*k)+1),k)/binomial(((2*n)+1),n))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((n+2)/(2*k+1))*(binomial(n,2*k)*(2^((n-2*k)-1)*(binomial(2*k+1,k)/binomial(2*n+1,n)))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(4*k*(k+1))/((n-2*k+1)*(2*n+3)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(((2*n)+1),(2*k))*(((3)^k)/((2)^n))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(2*n+1,2*k)*(3^k/2^n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k*(2*k-1)*(2*n^2+4*k*n+n-4*k^2+14*k-7))/(4*(n-k+1)*(n-k+2)*(2*n-2*k+3)*(2*n-2*k+5))),[1,-2^2,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((binomial(n,k)^2)*binomial((2*k),n)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)^2*binomial(2*k,n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k^2*(n+1)*(n-2*k)*(n-2*k+1)*(3*n-2*k+6))/((n-k+1)^2*(n-k+2)^2)),[-(8*(n+1)^2),-(7*n^2+21*n+16),(n+2)^2]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((-1)^k)*(binomial(n,k)*(binomial((n+x),n)*(x/(k+x))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((-1)^k*(binomial(n,k)*(binomial(n+x,n)*(x/(k+x)))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(x+k))/(n-k+1),[n+1,-(n+1)]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)*(factorial(k)*factorial(k))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)*(k!*k!),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-(((n+1)*(n+2))/((n-k+1)*(n-k+2))),[(n+1)*(n+2),-(n+2)^2,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)*((x^k)/((x+(1))^n))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)*(x^k/(x+1)^n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[k/((n-k+1)*(x+1)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,(2*k))*((2)/((2)^n))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,2*k)*(2/2^n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(2*k-1))/(n-2*k+1),[n,-n]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(((2*n)+1),((2*k)+1))/((2)^(((2)*n)+(1)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(2*n+1,2*k+1)/2^(2*n+1),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k*(2*k+1)*(6*n-4*k+5))/(4*(n-k+1)*(2*n-2*k+1))),[-(2*n+1),2*n+1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((binomial(n,(2*k))*(binomial((2*k),k)*((2)^n)))/(((4)^k)*binomial((2*n),n))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,2*k)*(binomial(2*k,k)*2^n))/(4^k*binomial(2*n,n)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(4*k^2)/((n-2*k+1)*(2*n+1)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((binomial(n,k)^2)*(binomial((p+k),(2*n))/(binomial(p,n)^2))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)^2*(binomial(p+k,2*n)/binomial(p,n)^2),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k^2*(p-2*n+k)*(3*n*p-2*k*p+3*p-4*n^2+3*k*n-5*n+k-1))/(2*(n-k+1)^2*(2*n+1)*(p-n)^2)),[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)^4),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)^4,k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k^4*(n+1)*(75*n^6-260*k*n^5+725*n^5+374*k^2*n^4-2056*k*n^4+2885*n^4-276*k^3*n^3+2314*k^2*n^3-6420*k*n^3+6045*n^3+104*k^4*n^2-1244*k^3*n^2+5298*k^2*n^2-9892*k*n^2+7030*n^2-16*k^5*n+298*k^4*n-1844*k^3*n+5322*k^2*n-7520*k*n+4300*n-20*k^5+210*k^4-900*k^3+1980*k^2-2256*k+1080))/((n-k+1)^4*(n-k+2)^4)),[-(4*(n+1)*(4*n+3)*(4*n+5)),-(2*(2*n+3)*(3*n^2+9*n+7)),(n+2)^3]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((((2)*n)+(1))/((4)^n))*(binomial((2*n),n)*(((-1)^k)*(binomial(n,k)*(((2)^k)/(((2)*k)+(1))))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((2*n+1)/4^n)*(binomial(2*n,n)*((-1)^k*(binomial(n,k)*(2^k/(2*k+1))))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(2*k+1)*(2*n+3))/(2*(n-k+1)*(n-k+2)),[2*n+3,1,-(2*(n+2))]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((n+(m+(1)))*(binomial((n+m),m)*(((-1)^k)*(binomial(n,k)/(m+(k+(1))))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((n+(m+1))*(binomial(n+m,m)*((-1)^k*(binomial(n,k)/(m+(k+1))))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(m+k+1))/(n-k+1),[n+1,-(n+1)]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((binomial(((2*n)+1),(2*k))*(binomial((2*k),k)/((4)^k)))/(binomial(((4*n)+1),(2*n))/((4)^n))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(2*n+1,2*k)*(binomial(2*k,k)/4^k))/(binomial(4*n+1,2*n)/4^n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((2*k^2*(12*n^2-8*k*n+30*n-10*k+19))/((n-k+1)*(2*n-2*k+3)*(4*n+3)*(4*n+5))),[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)*(binomial(k,j)/(binomial(n,j)*((2)^(n-j))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(n,k)*(binomial(k,j)/(binomial(n,j)*2^(n-j))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k-j)/(2*(n-k+1)),[1,-1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((((-1)^(n-k))*(((4)^k)*binomial((n+(k+1)),((2*k)+1))))/(n+(1))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((-1)^(n-k)*(4^k*binomial(n+(k+1),2*k+1)))/(n+1),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(2*k+1))/((n+2)*(n-k+1)),[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((-1)^(k+d))*(binomial(d,k)*(binomial((n+k),(p+k))/binomial(n,(p+d))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((-1)^(k+d)*(binomial(d,k)*(binomial(n+k,p+k)/binomial(n,p+d))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k*(p+k))/((n+1)*(p-n-1))),[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(p,k)*(binomial(q,k)*(binomial((n+k),(p+q))/(binomial(n,p)*binomial(n,q))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(p,k)*(binomial(q,k)*(binomial(n+k,p+q)/(binomial(n,p)*binomial(n,q)))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[k^2/(n+1)^2,[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(((2*n)+1),(2*k))*(binomial((m+k),(2*n))/binomial(((2*m)+1),(2*n)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(2*n+1,2*k)*(binomial(m+k,2*n)/binomial(2*m+1,2*n)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(2*k-1)*(2*n-m-k)*(8*n^2-6*m*n-6*k*n+10*n+4*k*m-7*m-k+1))/(2*(n-k+1)*(n-m)*(2*n-2*k+3)*(2*n-2*m-1)),[2*n+1,-(2*n+1)]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((-1)^(k+(1)))*(binomial(n,(k+1))/(k+(1)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((-1)^(k+1)*(binomial(n,k+1)/(k+1)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k+1)^2/(n-k),[n+1,-(n+1)]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((-1)^k)*binomial(((2*n)+1),(2*k))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((-1)^k*binomial(2*n+1,2*k),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k*(2*k-1)*(10*n^2-12*k*n+37*n+4*k^2-22*k+33))/((n-k+1)*(n-k+2)*(2*n-2*k+3)*(2*n-2*k+5))),[2^2,0,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(((2*n)+1),((2*k)+1))*(k/((((2)*n)-(1))*((4)^(n-(1)))))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(binomial(2*n+1,2*k+1)*(k/((2*n-1)*4^(n-1))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-(((k-1)*(2*k+1)*(6*n^2-4*k*n+7*n-2*k+1))/(4*(n-k+1)*(2*n+1)*(2*n-2*k+1))),[-n,n]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((((-1)^k)*(binomial(x,k)*binomial(x,(((2)*n)-k))))/(((-1)^n)*binomial(x,n))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((-1)^k*(binomial(x,k)*binomial(x,2*n-k)))/((-1)^n*binomial(x,n)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(x+1)*(x-2*n+k))/((2*n-k+1)*(2*n-k+2)*(x-n)),[-2,2]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((n*(((-1)^k)*(binomial(n,k)*(binomial((n+k),k)*((4)^k)))))/(((-1)^n)*(binomial((2*k),k)*(n+k)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((n*((-1)^k*(binomial(n,k)*(binomial(n+k,k)*4^k))))/((-1)^n*(binomial(2*k,k)*(n+k))),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(2*k-1))/(n*(n-k+1)),[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((((-1)^k)*(binomial((2*n),k)*(binomial(((2*n)+(2*k)),(n+k))*((2)^(((2)*n)-k)))))/binomial((2*n),n)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((-1)^k*(binomial(2*n,k)*(binomial(2*n+2*k,n+k)*2^(2*n-k))))/binomial(2*n,n),k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((32*k*(n+1)^2*(250*k*n^4-250*n^4+270*k^2*n^3+1015*k*n^3-1275*n^3+15*k^3*n^2+1016*k^2*n^2+1393*k*n^2-2385*n^2-5*k^4*n+57*k^3*n+1195*k^2*n+737*k*n-1940*n-9*k^4+54*k^3+431*k^2+112*k-576))/((n+k+1)*(2*n-k+1)*(2*n-k+2)*(2*n-k+3)*(2*n-k+4))),[32*(n+1)^2*(5*n+9),-(4*(145*n^3+551*n^2+665*n+256)),3*(3*n+4)*(3*n+5)*(5*n+4)]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((((-1)^k)*(binomial(n,k)*binomial((x+k),(r+k))))/(((-1)^n)*binomial(x,(n+r)))),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger(((-1)^k*(binomial(n,k)*binomial(x+k,r+k)))/((-1)^n*binomial(x,n+r)),k,n))\n__HOL_LIGHT_WZ_RESULT__[[(k*(r+k))/((n-k+1)*(x-r-n)),[-1,1]]]\nquit()\n",
      ),
    ],
  )
  @lib.replay_command(
    "'maxima' --very-quiet --batch='<F1>' >'<F2>' 2>&1",
    [
      Some(
        "display2d:false$\nlinel:100000$\nload(zeilberger)$\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((((binomial(n,k)^2)*binomial(((3*n)+k),(2*n)))/(binomial((3*n),n)^2)),k,n))$\nquit()$\n",
      ),
      Some(""),
    ],
    0,
    [
      (
        1, "batch(\"<F1>\")\ndisplay2d:false\nlinel:100000\nload(zeilberger)\nprintf(true,\"__HOL_LIGHT_WZ_RESULT__~a~%\",Zeilberger((binomial(n,k)^2*binomial(3*n+k,2*n))/binomial(3*n,n)^2,k,n))\n__HOL_LIGHT_WZ_RESULT__[[-((k^2*(207*n^4+66*k*n^3+468*n^3-145*k^2*n^2+294*k*n^2+340*n^2-186*k^2*n+294*k*n+78*n-59*k^2+84*k-1))/(9*(n-k+1)^2*(3*n+1)^2*(3*n+2)^2)),[-1,1]]]\nquit()\n",
      ),
    ],
  )
}
