const std = @import("std");

pub fn build(b: *std.Build) void {
    // Define the target (Windows in this case)
    const target = b.standardTargetOptions(.{});

    // Define the optimization mode
    const optimize = b.standardOptimizeOption(.{});

    // Create the executable
    const exe = b.addExecutable(.{
        .name = "zig_math_example",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Add the path to the C header file
    exe.addIncludePath(b.path("lib"));

    // Link against the mathlib.lib (import library for the DLL)
    exe.addLibraryPath(b.path("lib"));
    exe.linkSystemLibrary("mathlib");

    // Ensure the DLL is copied to the output directory
    b.installBinFile("lib/mathlib.dll", "mathlib.dll");

    // Install the executable
    b.installArtifact(exe);

    // Add a run step
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // Register the run step as "zig run"
    b.step("run", "Run the app").dependOn(&run_cmd.step);
}
