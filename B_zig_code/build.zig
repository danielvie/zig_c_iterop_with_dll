const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // --- Build the Zig dynamic library (zigmath) ---
    const zigmath_lib = b.addSharedLibrary(.{
        .name = "zigmath",
        .root_source_file = b.path("lib/zigmath/zigmath.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Install the library (copies zigmath.dll to zig-out/bin)
    const zigmath_install_step = b.addInstallArtifact(zigmath_lib, .{});
    b.getInstallStep().dependOn(&zigmath_install_step.step); // Ensure installation is part of the default build

    // --- Build the executable ---
    const exe = b.addExecutable(.{
        .name = "zig_math_example",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Link the C DLL (mathlib)
    exe.addIncludePath(b.path("lib"));
    exe.addLibraryPath(b.path("lib"));
    exe.linkSystemLibrary("mathlib");
    b.installBinFile("lib/mathlib.dll", "mathlib.dll");

    // Link the Zig dynamic library (zigmath)
    exe.step.dependOn(&zigmath_install_step.step); // Ensure zigmath is installed before exe links
    exe.addLibraryPath(b.path("zig-out/bin")); // Where zigmath.dll is placed
    exe.linkSystemLibrary("zigmath");

    // Install the executable
    b.installArtifact(exe);

    // Add a run step
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    b.step("run", "Run the app").dependOn(&run_cmd.step);
}
