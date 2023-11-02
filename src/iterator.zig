const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const msg = "hello world                \n\n";
    // var it = std.mem.tokenize(u8, msg, &" \n".*);
    var it = std.mem.tokenize(u8, msg, " \n");
    while (it.next()) |token| {
        print("{s}", .{token});
    }
}
