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
