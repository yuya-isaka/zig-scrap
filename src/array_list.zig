const std = @import("std");

pub fn main() !void {
    var list = std.ArrayList(u32).init(std.heap.page_allocator);
    defer list.deinit();

    try list.append(3);
    try list.append(4);

    for (list.items) |item| {
        std.log.info("{}", .{item});
    }
    for (0..list.items.len) |i| {
        std.log.info("{}", .{list.items[i]});
    }

    std.log.info("{}", .{list.popOrNull().?});
}
