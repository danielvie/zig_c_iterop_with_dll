// lib/zigmath/zigmath.zig
const std = @import("std");

// Export the function with C linkage so it can be called from other languages if needed
pub export fn mul(a: i32, b: i32) i32 {
    return a * b;
}

// Optional: Zig idiomatic function (not exported, for Zig-only use)
pub fn multiply(a: i32, b: i32) i32 {
    return a * b;
}
