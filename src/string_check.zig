const std = @import("std");

pub fn main() void {
    const a: *const [3:0]u8 = "abc";
    std.debug.print("{s}\n", .{a});

    const b: []const u8 = "def";
    std.debug.print("{s}\n", .{b});
}
