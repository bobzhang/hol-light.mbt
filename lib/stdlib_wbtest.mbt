///|
fn hex(b : Bytes) -> String {
  let digits = "0123456789abcdef"
  let sb = StringBuilder()
  for x in b {
    sb.write_char(digits[x.to_int() >> 4].unsafe_to_char())
    sb.write_char(digits[x.to_int() & 15].unsafe_to_char())
  }
  sb.to_string()
}

///|
/// Values from OCaml 4.14 (Digest.string, Random.bits/int/init/full_init).
test "md5 and Random match OCaml 4.14" {
  inspect(hex(md5(b"")), content="d41d8cd98f00b204e9800998ecf8427e")
  inspect(hex(md5(b"x0")), content="e50eb7598b580311bab8f39bb8f4815b")
  let show = (xs : Array[Int]) => xs.map(x => x.to_string()).join(" ")
  inspect(
    show(Array::makei(5, _ => random_bits())),
    content="89809344 994326685 290180182 366831641 332180439",
  )
  random_init(0)
  inspect(
    show(Array::makei(5, _ => random_bits())),
    content="218040752 178628190 911923154 33712936 1041571162",
  )
  let ints = []
  for i in 0..<8 {
    ints.push(random_int(i * 7 + 3))
  }
  inspect(show(ints), content="1 8 5 2 8 14 43 18")
  random_full_init([1, 2, 3])
  inspect(random_bits(), content="311998834")
  random_init(123456)
  inspect(random_int(0x3FFFFFFF), content="353840024")
}

///|
/// OCaml 4.14's List.sort calls `cmp 1 2` first on [1; 2].
test "list_sort compares like OCaml" {
  let calls = []
  let r = list_sort(
    (x : Int, y : Int) => {
      calls.push("\{x},\{y}")
      x.compare(y)
    },
    @list.from_array([5, 3, 8, 1, 9, 2, 7]),
  )
  inspect(r.to_array(), content="[1, 2, 3, 5, 7, 8, 9]")
  inspect(
    calls.join(" "),
    content="5,3 3,8 5,8 1,9 2,7 1,2 9,2 9,7 8,9 8,7 5,7 5,2 3,2",
  )
}

///|
/// Shifts on OCaml's 63-bit ints (values from OCaml 4.14, 64-bit).
test "shifts like OCaml" {
  inspect(lsr(-1, 32), content="2147483647")
  inspect(lsr(-8, 1), content="-4")
  inspect(lsr(12, 2), content="3")
  inspect(asr(-8, 40), content="-1")
  inspect(lsl(3, 4), content="48")
}

///|
/// Hashtbl.hash and compare on floats (values from OCaml 4.14).
test "floats hash and compare like OCaml" {
  inspect(hash(1.5), content="819188451")
  inspect(hash(-0.0), content="256347020")
  inspect(hash(@double.not_a_number), content="841516429")
  inspect(hash((2.0, 3)), content="928673522")
  inspect(compare(@double.not_a_number, 1.0), content="-1")
  inspect(compare(1.0, @double.not_a_number), content="1")
  inspect(compare(@double.not_a_number, @double.not_a_number), content="0")
  inspect(compare(2.0, 1.5), content="1")
}
