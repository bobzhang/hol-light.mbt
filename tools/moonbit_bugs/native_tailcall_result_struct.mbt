fn outer(n : Int) -> (Int) -> String raise {
  let count : ((Int) -> Bool raise) -> Int raise = fn(pred) {
    fn filt(i : Int, acc : Int) -> Int raise {
      if i == 0 {
        acc
      } else {
        filt(i - 1, if pred(i) { acc + 1 } else { acc })
      }
    }
    filt(n, 0)
  }
  fn go(i : Int, acc : String) -> String raise {
    if i == 0 {
      acc
    } else {
      go(i - 1, acc + count(y => y != i).to_string())
    }
  }
  fn(i) { go(i, "") }
}

fn main {
  println(try outer(3)(3) catch { _ => "err" })
}
