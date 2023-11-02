const std = @import("std");

const zig_code =
    \\var y: i32 = add(10, x);
    \\ const x: i32 = add(20, 30);
    \\
    \\const std = @import("std");
    \\
    \\pub fn main() void {
    \\	std.debug.warn("Hello, {}!\n", .{"World"});
    \\}
    \\
    \\test "integer overflow at compile time" {
    \\	const x: u8 = 255;
    \\	const y = x + 1;
    \\};
;

fn skipStrListeral(p: []const u8) ?[]const u8 {
    var i: usize = 0;
    while (i < p.len and p[i] != '"') : (i += 1) {}
    return if (i < p.len) p[i + 1 ..] else null;
}
