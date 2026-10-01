// The outside world translated code may reach: wasm has no shell and no
// file system. One command is emulated: Library/pocklington.ml and
// Library/pratt.ml ask PARI/GP to factor a number,
//   echo 'print(factorint(N))  \n quit' | gp >FILE 2>/dev/null
// and read FILE back. The factorization is computed here (Miller-Rabin and
// Pollard rho) and printed as gp prints it ("[p1, e1; p2, e2]", or
// "Mat([p, e])" for one factor) into an in-memory file. It only guides the
// construction of primality certificates, which the kernel checks.

///|
/// The in-memory files written by emulated commands.
let virtual_files : Map[String, String] = Map([])

///|
/// `Sys.command`: the gp factorization above, else "command not found"
/// (exit status 127, as on a host without the command).
pub fn sys_command(cmd : String) -> Int {
  match gp_factorint_command(cmd) {
    Some((n, file)) => {
      virtual_files[file] = gp_factorint(n) + "\n"
      0
    }
    None => 127
  }
}

///|
/// `Sys.remove`
pub fn sys_remove(name : String) -> Unit raise {
  if virtual_files.contains(name) {
    virtual_files.remove(name)
  } else {
    raise SysError(name + ": No such file or directory")
  }
}

///|
/// `Sys.file_exists`
pub fn sys_file_exists(name : String) -> Bool {
  virtual_files.contains(name)
}

///|
/// lib.ml's `string_of_file`
pub fn string_of_file(name : String) -> String raise {
  match virtual_files.get(name) {
    Some(s) => s
    None => raise SysError(name + ": No such file or directory")
  }
}

///|
/// `echo 'print(factorint(N))...' | gp >FILE ...` -> (N, FILE)
fn gp_factorint_command(cmd : String) -> (@bigint.BigInt, String)? {
  let prefix = "echo 'print(factorint("
  guard cmd.has_prefix(prefix) else { return None }
  let rest = cmd.view(start_offset=prefix.length()).to_string()
  let digits = StringBuilder()
  let mut i = 0
  while i < rest.length() && rest[i] >= '0' && rest[i] <= '9' {
    digits.write_char(rest[i].unsafe_to_char())
    i += 1
  }
  guard i > 0 && rest.view(start_offset=i).has_prefix("))") else { return None }
  guard rest.contains("| gp >") else { return None }
  let after = rest.split("| gp >").to_array()
  let file = after[after.length() - 1].to_string()
  let file = match file.find(" ") {
    Some(j) => file.view(end_offset=j).to_string()
    None => file
  }
  Some((@bigint.BigInt::from_string(digits.to_string()), file))
}

///|
let big0 : @bigint.BigInt = @bigint.BigInt::from_int(0)

///|
let big1 : @bigint.BigInt = @bigint.BigInt::from_int(1)

///|
let big2 : @bigint.BigInt = @bigint.BigInt::from_int(2)

///|
/// Deterministic Miller-Rabin for n < 3.3e24, a strong probable-prime test
/// beyond (as gp's factorint, which returns probable primes).
fn is_probable_prime(n : @bigint.BigInt) -> Bool {
  if n < big2 {
    return false
  }
  let small = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]
  for p in small {
    let bp = @bigint.BigInt::from_int(p)
    if n == bp {
      return true
    }
    if (n % bp).is_zero() {
      return false
    }
  }
  let nm1 = n - big1
  let s = nm1.ctz()
  let d = nm1.shr(s)
  for a in small {
    let mut x = @bigint.BigInt::from_int(a).pow(d, modulus=n)
    if x == big1 || x == nm1 {
      continue
    }
    let mut composite = true
    for _ in 1..<s {
      x = x * x % n
      if x == nm1 {
        composite = false
        break
      }
    }
    if composite {
      return false
    }
  }
  true
}

///|
fn big_gcd_(a : @bigint.BigInt, b : @bigint.BigInt) -> @bigint.BigInt {
  let mut a = a
  let mut b = b
  while !b.is_zero() {
    let t = a % b
    a = b
    b = t
  }
  a
}

///|
/// A nontrivial factor of composite `n` (Pollard rho, Brent's variant).
fn rho_factor(n : @bigint.BigInt) -> @bigint.BigInt {
  if (n % big2).is_zero() {
    return big2
  }
  let mut c = big1
  while true {
    let f = (x : @bigint.BigInt) => (x * x + c) % n
    let mut x = big2
    let mut y = big2
    let mut d = big1
    while d == big1 {
      x = f(x)
      y = f(f(y))
      let diff = if x > y { x - y } else { y - x }
      d = big_gcd_(diff, n)
    }
    if d != n {
      return d
    }
    c = c + big1
  }
  n
}

///|
/// The prime factors of `n` (with repetition).
fn prime_factors(n : @bigint.BigInt, acc : Array[@bigint.BigInt]) -> Unit {
  if n == big1 {
    return
  }
  if is_probable_prime(n) {
    acc.push(n)
    return
  }
  // small factors by trial division first
  for p in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47] {
    let bp = @bigint.BigInt::from_int(p)
    if (n % bp).is_zero() {
      acc.push(bp)
      prime_factors(n / bp, acc)
      return
    }
  }
  let d = rho_factor(n)
  prime_factors(d, acc)
  prime_factors(n / d, acc)
}

///|
/// gp's `print(factorint(n))` for n >= 2.
pub fn gp_factorint(n : @bigint.BigInt) -> String {
  let fs = []
  prime_factors(n, fs)
  fs.sort_by((a, b) => a.compare(b))
  let rows : Array[(@bigint.BigInt, Int)] = []
  for p in fs {
    if rows.length() > 0 && rows[rows.length() - 1].0 == p {
      rows[rows.length() - 1] = (p, rows[rows.length() - 1].1 + 1)
    } else {
      rows.push((p, 1))
    }
  }
  let body = rows.map(r => r.0.to_string() + ", " + r.1.to_string()).join("; ")
  if rows.length() == 1 {
    "Mat([" + body + "])"
  } else {
    "[" + body + "]"
  }
}
