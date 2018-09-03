const coder = @import("4coder.zig");

export fn get_alpha_4coder_version(maj: i32, min: i32, patch: i32) i32 {
    return (maj == coder.MAJOR and min == coder.MINOR and patch == coder.PATCH);
}

export fn get_bindings(data: *c_void, size: i32) i32 {
    const units = getBindingUnits(data, size) catch return -1; // TODO: Error code

    
    return 0;
}