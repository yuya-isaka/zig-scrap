const std = @import("std");

pub fn main() !void {
    std.log.debug("debug", .{});
    std.log.info("info", .{});
    std.log.err("err", .{});
    std.log.info("This is test. My Birthday is {d:0>2}/{d:0>2}", .{ 6, 9 });
}
