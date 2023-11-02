const std = @import("std");
const assert = std.debug.assert;

test "compile-time expressions" {
    const x = comptime block_label: {
        var i = 0;
        var sum = 0;
        while (i < 10) : (i += 1) {
            sum += i;
        }
        break :block_label sum;
    };

    // @compileLog(x);

    comptime {
        assert(x == 45);
    }
}
