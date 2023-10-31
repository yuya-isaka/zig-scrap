const std = @import("std");

fn ask_user() !i64 {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [11]u8 = undefined;
    try stdout.print("Guess a number between 1 and 2000: ", .{});

    if (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
        return std.fmt.parseInt(i64, user_input, 10);
    } else {
        return error.InvalidParam;
    }
}

pub fn main() !void {
    // 出力先を標準出力に設定
    const stdout = std.io.getStdOut().writer();

    // 乱数生成器を初期化
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    // 乱数生成
    const value = prng.random().intRangeAtMost(i64, 1, 2000);

    while (true) {
        const guess = try ask_user();
        if (guess == value) {
            break;
        }
        const message = if (guess < value) "high" else "low";
        try stdout.print("Too {s}\n", .{message});
    }

    try stdout.print("You guessed it!\n", .{});
}
