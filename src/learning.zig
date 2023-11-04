const std = @import("std");
const user = @import("models/user.zig");
const User = user.User;
const MAX_POWER = user.MAX_POWER;

pub fn main() void {
    const goku: User = .{
        .name = "Goku",
        .power = 10000,
    };

    // goku.power = 20000;
    goku.set(20000);

    std.debug.print("name: {s}\npower: {d}\n", .{ goku.name, goku.power });
    std.debug.print("max power: {d}\n", .{MAX_POWER});
}
