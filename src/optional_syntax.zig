const std = @import("std");
const assert = std.debug.assert;

test "null @intToPtr" {
    const ptr: ?*i32 = @ptrFromInt(0x0);
    assert(ptr == null);

    const ptr2: ?*i32 = @ptrFromInt(0);
    assert(ptr2 == null);

    const ptr3: ?*i32 = @ptrFromInt(4);
    assert(ptr3 != null);
}
