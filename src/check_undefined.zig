const std = @import("std");

pub fn main() !void {
    var buf: []const u8 = undefined;
    buf = "hello world\n";

    buf = "hello";
    buf[3] = 'x';

    for (buf, 0..) |v, i| {
        std.debug.print("buf[{}]: {c}\n", .{ i, v });
    }
}
