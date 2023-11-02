const std = @import("std");
const print = std.debug.print;
const assert = std.debug.assert;

fn fib(x: u32) u32 {
    if (x <= 1) return x;
    return fib(x - 1) + fib(x - 2);
}

test "cimpile-time evaluation" {
    var array: [fib(6)]i32 = undefined;

    comptime {
        assert(array.len == 8);
    }
}
