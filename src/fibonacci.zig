const std = @import("std");

fn fibonacci(x: i32) i32 {
    if (x <= 1) return x;
    return fibonacci(x - 1) + fibonacci(x - 2);
}

test "fib example" {
    const x = comptime fibonacci(7);
    var array: [x]i32 = undefined;
    std.debug.print("fibonacci(7) = {}\n", .{array.len});
}
