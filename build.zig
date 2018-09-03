const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const custom_4coder = b.addSharedLibrary("custom_4coder", "src/main.zig", b.version(0, 0, 0));
    custom_4coder.setBuildMode(mode);
    custom_4coder.addIncludeDir("include");

    b.default_step.dependOn(&custom_4coder.step);
}

