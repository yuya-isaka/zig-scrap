const std = @import("std");

pub fn main() !void {
    // const argv = std.os.argv;
    // std.log.info("Hello, world! {s}", .{try std.fmt.parseInt(u32, argv[1].*, 10)});

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        switch (gpa.deinit()) {
            .ok => {},
            .leak => std.debug.panic("Failed to deinit allocator", .{}),
        }
    }
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    std.log.info("{any}", .{@TypeOf(args[1])});
    std.log.info("{s}", .{args[1]});

    const slice_args = std.mem.sliceTo(args[1], 0);

    std.log.info("Hello, world! {d}", .{try std.fmt.parseInt(i32, args[1], 10)});
    std.log.info("Hello, world! {d}", .{try std.fmt.parseInt(i32, slice_args, 10)});

    const str = [_]u8{ 'h', 'e', 'l', 'l', 'o', 0x00, 'w', 'o', 'r', 'l', 'd' };
    const str2 = std.mem.sliceTo(&str, 0);
    try std.testing.expect(std.mem.eql(u8, str2, "hello"));
    try std.testing.expectEqualStrings(str2, "hello");

    const str3 = std.mem.sliceTo(args[1], 10);

    std.log.info("{any}", .{@TypeOf(str)});
    std.log.info("{any}", .{@TypeOf(str2)});
    std.log.info("{any}", .{@TypeOf(str3)});

    std.log.info("{s}", .{str});
    std.log.info("{s}", .{str2});
}
