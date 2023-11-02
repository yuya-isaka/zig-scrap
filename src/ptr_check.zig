const std = @import("std");

pub fn main() !void {
    var value: i32 = 10;
    const ptr = &value;

    var val = ptr.*;
    std.debug.assert(val == 10);
    val = 20;
    std.debug.assert(val == 20);
    ptr.* = 30;
    const val2 = ptr.*;
    std.debug.assert(val2 == 30);
    std.debug.print("value: {d}\n", .{ptr.*});
}
