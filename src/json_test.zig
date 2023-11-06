const std = @import("std");

test "Scanner" {
    const s =
        \\ {
        \\   "bar": 15,
        \\	 "foo": true,
        \\   "hoge": "hello world"
        \\ }
    ;
    var scanner = std.json.Scanner.initCompleteInput(std.testing.allocator, s);
    defer scanner.deinit();

    try std.testing.expectEqual(std.json.Token.object_begin, try scanner.next());
    try std.testing.expectEqualSlices(u8, "bar", (try scanner.next()).string);
    try std.testing.expectEqualSlices(u8, "15", (try scanner.next()).number);
    try std.testing.expectEqualSlices(u8, "foo", (try scanner.next()).string);
    try std.testing.expectEqual(std.json.Token.true, (try scanner.next()));
    try std.testing.expectEqualSlices(u8, "hoge", (try scanner.next()).string);
    try std.testing.expectEqualSlices(u8, "hello world", (try scanner.next()).string);
    try std.testing.expectEqual(std.json.Token.object_end, try scanner.next());
    try std.testing.expectEqual(std.json.Token.end_of_document, try scanner.next());
}
