///|
/// `Format.formatter_of_out_channel` (printer.ml includes Format): a
/// formatter writing to a channel (lib/channels.mbt: an in-memory file).
/// Formal_ineqs/tests/log.hl keeps one per log file.
pub fn formatter_of_out_channel(oc : @lib.OutChannel) -> @pp.Formatter {
  @pp.Formatter::new(s => @lib.output_string(oc, s), out_flush=() => {
    @lib.flush_out(oc)
  })
}
