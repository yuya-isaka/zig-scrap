const std = @import("std");
const t = @import("t.zig");

pub fn main() !void {
    var r = try t.getRandom();
    const random = r.random();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        switch (gpa.deinit()) {
            .leak => std.debug.print("gpa.deinit() failed\n", .{}),
            .ok => std.debug.print("gpa.deinit() ok\n", .{}),
        }
    }
    const allocator = gpa.allocator();

    const body = t.randomString(random, allocator, 10);
    defer allocator.free(body);

    // バグってる？
    std.debug.print("length: {any}", .{body.len});
    for (0..body.len) |i| {
        std.debug.print("{d}\n", .{body[i]});
    }
    const d = [4]i32{ 1, 2, 3, 4 };
    std.log.info("length: {d}", .{d.len});
    try std.testing.expect(d.len == 4);
}
