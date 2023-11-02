var y: i32 = add(10, x);
// var x: i32 = add(10, 30);
const x: i32 = add(10, 30);

test "global variables" {
    assert(x == 40);
    assert(y == 50);
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}

const std = @import("std");
const assert = std.debug.assert;
