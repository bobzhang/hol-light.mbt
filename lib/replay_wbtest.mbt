///|
test "command replay: same shape and inputs, any file names" {
  replay_command(
    "cd <F1>; csdp <F2> <F3>> <F4>",
    [None, Some("problem\n"), None, None],
    3,
    [(2, "answer\n")],
  )
  file_of_string("/tmp/sos000000.dat-s", "problem\n")
  let cmd = "cd /tmp; csdp /tmp/sos000000.dat-s /tmp/sos000000.out> /dev/null"
  inspect(command_shape(cmd).0, content="cd <F1>; csdp <F2> <F3>> <F4>")
  inspect(sys_command(cmd), content="3")
  inspect(string_of_file("/tmp/sos000000.out"), content="answer")
  // other inputs: not answered
  file_of_string("/tmp/sos000000.dat-s", "another problem\n")
  inspect(sys_command(cmd), content="127")
}

///|
test "channels on in-memory files" {
  let oc = open_out("/tmp/chan.txt")
  output_string(oc, "p cnf 2 1\n")
  output_string(oc, "1 -2 0")
  output_char(oc, '\n')
  close_out(oc)
  let ic = open_in("/tmp/chan.txt")
  inspect(input_line(ic), content="p cnf 2 1")
  inspect(input_char(ic), content="1")
  inspect(input_line(ic), content=" -2 0")
  let end = try {
    ignore(input_line(ic))
    "more"
  } catch {
    EndOfFile => "End_of_file"
    _ => "other"
  }
  inspect(end, content="End_of_file")
  close_in(ic)
  inspect(string_index_opt("a.b", '.'), content="Some(1)")
  inspect(string_index_opt("ab", '.'), content="None")
  inspect(
    string_split_on_char(' ', "1 -2  0").to_array().join("|"),
    content="1|-2||0",
  )
  inspect(string_split_on_char(' ', "").to_array().length(), content="1")
}
