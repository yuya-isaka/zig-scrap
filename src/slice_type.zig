const std = @import("std");

pub fn main() void {
    const a = [_]i32{ 1, 2, 3, 4, 5 };
    var end: usize = 4;
    const b = a[1..end];
    std.debug.print("{any}\n", .{@TypeOf(b)});

    const end2: usize = 4;
    const b2 = a[1..end2];
    std.debug.print("{any}\n", .{@TypeOf(b2)});
}
