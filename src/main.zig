const coder = @import("4coder.zig");

export fn get_bindings(data: *c_void, size: i32) i32 {
    const units = coder.getBindingUnits(data, size) catch return -1; // TODO: Error code

    
    return 0;
}