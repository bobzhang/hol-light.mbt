// OCaml's file channels, on the in-memory files of gp.mbt (wasm has no file
// system): what translated code writes, an emulated or replayed command
// reads, and the other way round (Cadical/dimacs.ml writes a problem and
// reads cadical's proof).

///|
/// OCaml's `End_of_file`.
pub(all) suberror EndOfFile derive(Debug)

///|
/// OCaml's `Sys.Break` (an interrupt from the keyboard): matched by code
/// that cleans up after one (Minisat/sat_tools.ml), never raised here.
pub(all) suberror Break derive(Debug)

///|
/// `out_channel`: the file is written when the channel is flushed or closed.
pub struct OutChannel {
  name : String
  buf : StringBuilder
}

///|
/// `open_out`: creates the file, or empties it.
pub fn open_out(name : String) -> OutChannel {
  virtual_files[name] = ""
  { name, buf: StringBuilder(), }
}

///|
/// `output_string`
pub fn output_string(oc : OutChannel, s : String) -> Unit {
  oc.buf.write_string(s)
}

///|
/// `output_char`
pub fn output_char(oc : OutChannel, c : Char) -> Unit {
  oc.buf.write_char(c)
}

///|
/// `flush`
pub fn flush_out(oc : OutChannel) -> Unit {
  virtual_files[oc.name] = oc.buf.to_string()
}

///|
/// `close_out`
pub fn close_out(oc : OutChannel) -> Unit {
  flush_out(oc)
}

///|
/// `in_channel`: the file as it was when opened.
pub struct InChannel {
  text : String
  mut pos : Int
}

///|
/// `open_in`
pub fn open_in(name : String) -> InChannel raise {
  match virtual_files.get(name) {
    Some(text) => { text, pos: 0, }
    None => raise SysError(name + ": No such file or directory")
  }
}

///|
/// `input_line`: up to the next newline, which is not part of the result;
/// `End_of_file` when nothing is left.
pub fn input_line(ic : InChannel) -> String raise {
  let n = ic.text.length()
  if ic.pos >= n {
    raise EndOfFile
  }
  let start = ic.pos
  let mut i = start
  while i < n && ic.text[i].to_int() != 10 {
    i += 1
  }
  ic.pos = if i < n { i + 1 } else { i }
  ic.text.view(start_offset=start, end_offset=i).to_string()
}

///|
/// `input_char`
pub fn input_char(ic : InChannel) -> Char raise {
  if ic.pos >= ic.text.length() {
    raise EndOfFile
  }
  let c = ic.text[ic.pos]
  ic.pos += 1
  c.to_int().unsafe_to_char()
}

///|
/// `close_in`
pub fn close_in(_ic : InChannel) -> Unit {

}

///|
/// `String.index_opt s c`
pub fn string_index_opt(s : String, c : Char) -> Int64? {
  for i in 0..<s.length() {
    if s[i].to_int() == c.to_int() {
      return Some(i.to_int64())
    }
  }
  None
}

///|
/// hol.ml's `temp_path`: where the files handed to external programs go.
pub let temp_path : Ref[String] = Ref::{ val: "/tmp", }

///|
/// `Filename.concat dir file`
pub fn filename_concat(dir : String, file : String) -> String {
  if dir == "" || dir.has_suffix("/") {
    dir + file
  } else {
    dir + "/" + file
  }
}

///|
/// `String.split_on_char c s`: the pieces of `s` between occurrences of `c`
/// (empty ones too; never an empty list).
pub fn string_split_on_char(c : Char, s : String) -> @list.List[String] {
  let parts : Array[String] = []
  let mut start = 0
  for i in 0..<s.length() {
    if s[i].to_int() == c.to_int() {
      parts.push(s.view(start_offset=start, end_offset=i).to_string())
      start = i + 1
    }
  }
  parts.push(s.view(start_offset=start).to_string())
  @list.from_array(parts)
}

///|
/// `String.map f s`
pub fn string_map(f : (Char) -> Char raise?, s : String) -> String raise? {
  let b = StringBuilder()
  for c in s {
    b.write_char(f(c))
  }
  b.to_string()
}

///|
/// `Filename.is_relative`
pub fn filename_is_relative(name : String) -> Bool {
  !name.has_prefix("/")
}

///|
/// `input_byte`: the next character's code (the files are byte strings).
pub fn input_byte(ic : InChannel) -> Int64 raise {
  input_char(ic).to_int().to_int64()
}

///|
/// `Filename.quote` (Unix): the name between single quotes, each single
/// quote inside written `'\''`.
pub fn filename_quote(name : String) -> String {
  "'" + name.replace_all(old="'", new="'\\''") + "'"
}
