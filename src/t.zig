const std = @import("std");

pub fn getRandom() !std.rand.DefaultPrng {
    var seed: u64 = undefined;
    try std.os.getrandom(std.mem.asBytes(&seed));
    return std.rand.DefaultPrng.init(seed);
}

pub fn randomString(random: std.rand.Random, a: std.mem.Allocator, max: usize) []u8 {
    var buf = a.alloc(u8, random.uintAtMost(usize, max) + 1) catch unreachable;
    std.log.info("buf.len = {d}\n", .{buf.len});
    const valid = "abcdefghijklmnopqrstuvwxyz0123456789-_/";
    for (0..buf.len) |i| {
        buf[i] = valid[random.uintAtMost(usize, valid.len - 1)];
    }
    return buf;
}
