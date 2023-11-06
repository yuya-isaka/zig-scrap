const std = @import("std");

test "dead beef test" {
    const deadbeef = @as(u32, 0xDEADBEEF);
    // const deadbeef = 0xDEADBEEF;
    const dead_beef_byte = switch (@import("builtin").cpu.arch.endian()) {
        .Big => "\xDE\xAD\xBE\xEF",
        .Little => "\xEF\xBE\xAD\xDE",
    };

    // std.debug.print("\n{}\n", .{deadbeef});
    // std.debug.print("\n{any}\n", .{std.mem.asBytes(&deadbeef)});

    try std.testing.expect(std.mem.eql(u8, std.mem.asBytes(&deadbeef), dead_beef_byte));
}
