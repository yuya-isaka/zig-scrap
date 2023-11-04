const std = @import("std");

pub const MAX_POWER = 100_000;

pub const User = struct {
    name: []const u8,
    power: u32,

    pub fn set(self: *const @This(), new_power: u32) void {
        if (new_power > MAX_POWER) {
            std.debug.print("Power too high!\n", .{});
        }
        self.power = new_power;
    }
};
