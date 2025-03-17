const std = @import("std");
const c = @cImport({
    @cInclude("mathlib.h");
});

// Declare the mul function from zigmath.dll
extern fn mul(a: i32, b: i32) i32;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const a: c_int = 10;
    const b: c_int = 5;

    const sum = c.add(a, b);
    const diff = c.sub(a, b);
    const product = mul(a, b);

    try stdout.print("Add: {d} + {d} = {d}\n", .{ a, b, sum });
    try stdout.print("Subtract: {d} - {d} = {d}\n", .{ a, b, diff });
    try stdout.print("Multiply: {d} * {d} = {d}\n", .{ a, b, product });
}
