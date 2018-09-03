pub const ApplicationLink = @OpaqueType();
pub const Bool32 = i32;
pub const Color = u32;
pub const ParseContextId = u32;
pub const BufferId = i32;
pub const ViewId = i32;

pub const KeyModifierIndex = enum(i32) {
    Shift,
    Control,
    Alt,
    Command,
    Caps,
    Hold,
};

pub const KeyModifierFlag = u32;
pub const KeyModifier = struct {
    pub const None: KeyModifierFlag = 0x0;
    pub const Ctrl: KeyModifierFlag = 0x1;
    pub const Alt: KeyModifierFlag = 0x2;
    pub const Command: KeyModifierFlag = 0x4;
    pub const Shift: KeyModifierFlag = 0x8;
};

pub const CommandId = enum(u64) {
    Null,
    Undo,
    Redo,
    InteractiveNew,
    InteractiveOpen,
    InteractiveOpenOrNew,
    InteractiveSwitchBuffer,
    InteractiveKillBuffer,
    Reopen,
    Save,
    KillBuffer,
    OpenColorTweaker,
    Count,
};

pub const MemoryProtectFlags = u32;
pub const MemoryProtect = struct {
    pub const Read: MemoryProtectFlags = 0x1,
    pub const Write: MemoryProtectFlags = 0x2,
    pub const Execute: MemoryProtectFlags = 0x4,
};

pub const UserInputTypeId = enum(i32) {
    None,
    Key,
    Mouse,
};

pub const WrapIndicatorMode = enum(i32) {
    Hide,
    ShowAfterLine,
    ShowAtWrapEdge,
};

pub const GlobalSettingId = enum(i32) {
    Null,
    LAltLCtrlIsAltGr,
};

pub const BufferSettingId = enum(i32) {
    Null,
    Lex,
    LexWithoutStrings,
    ParserContext,
    WrapLine,
    WrapPositions,
    MinimumBaseWrapPosition,
    WrapIndicator,
    MapId,
    Eol,
    Unimportant,
    ReadOnly,
    VirtualWhitespace,
};

pub const ViewSettingsId = enum(i32) {
    Null,
    ShowWhitespace,
    ShowScrollbar,
    ShowFileBar,
};

pub const BufferCreateFlag = u32;
pub const BufferCreate = struct {
    pub const Background: BufferCreateFlag = 0x1;
    pub const AlwaysNew: BufferCreateFlag = 0x2;
    pub const NeverNew: BufferCreateFlag = 0x4;
    pub const JustChangedFile: BufferCreateFlag = 0x8;
};

pub const BufferCreationData = extern struct {
    flags: BufferCreateFlag,
    fname_space: [256]u8,
    fname_len: i32,
};

pub const BufferSaveFlag = u32;
pub const BufferSave = struct {
     pub const IgnoreDirtyFlag: BufferSaveFlag = 0x1;
};

pub const BufferKillFlag = u32;
pub const BufferKill = struct {
    pub const Background: BufferKillFlag = 0x1;
    pub const AlwaysKill: BufferKillFlag = 0x2;
};

pub const AccessFlag = u32;
pub const Access = struct {
    pub const AccessOpen: AccessFlag = 0x0;
    pub const AccessProtected: AccessFlag = 0x1;
    pub const AccessHidden: AccessFlag = 0x2;
    pub const AccessAll: AccessFlag = 0xFF;
};

pub const DirtyState = enum(u32) {
    UpToData,
    UnsavedChanges,
    UnloadedChanges,
};

pub const SeekBoundaryFlag = u32;
pub const SeekBoundary = struct {
     pub const Whitespace: SeekBoundaryFlag = 0x1;
     pub const Token: SeekBoundaryFlag = 0x2;
     pub const Alphanumeric: SeekBoundaryFlag = 0x4;
     pub const CamelCase: SeekBoundaryFlag = 0x8;
};

pub const CommandLineInterfaceFlag = u32;
pub const Cli = struct {
    pub const OverlapWithConflict: CommandLineInterfaceFlag = 0x1;
    pub const AlwaysBindToView: CommandLineInterfaceFlag = 0x2;
    pub const CursorAtEnd: CommandLineInterfaceFlag = 0x4;
};

pub const AutoIndentFlag = u32;
pub const AutoIndent = struct {
     pub const ClearLine: AutoIndentFlag = 0x1;
     pub const UseTab: AutoIndentFlag = 0x2;
     pub const ExactAlignBlock: AutoIndentFlag = 0x4;
     pub const FullTokens: AutoIndentFlag = 0x8;
};

pub const SetBufferFlag = u32;
pub const SetBuffer = struct {
    pub const KeepOriginalGui: SetBufferFlag = 0x1;
};

pub const InputTypeFlag = u32;
pub const EventOn = struct {
     pub const AnyKey: InputTypeFlag = 0x1;
     pub const Esc: InputTypeFlag = 0x2;
     pub const LeftButton: InputTypeFlag = 0x4;
     pub const RightButton: InputTypeFlag = 0x8;
     pub const Wheel: InputTypeFlag = 0x10;
     pub const MouseMove: InputTypeFlag = 0x20;

     pub const Button = LeftButton | RightButton | Wheel;
    pub const Mouse = Button | MouseMove;

     pub const All: InputTypeFlag = 0xFF;
};

pub const MouseCursorShowType = enum(i32) {
    Never,
    Always,
};

pub const ViewSplitPosition = enum(i32) {
    Top,
    Buttom,
    Left,
    Right,
};

pub const KeyCode = u32;
pub const KeyModifier = u8;

pub const KeyEventData = extern struct {
    keycode: KeyCode,
    character: KeyCode,
    character_no_caps_lock: KeyCode,
    // Enum array plz?
    modifiers: [@typeInfo(KeyModifierIndex).Enum.fields.len],
};

pub const MouseState = extern struct {
    l: i8, // TODO: All i8 are bools
    r: i8,
    press_l: i8,
    press_r: i8,
    release_l: i8,
    release_r: i8,
    out_of_window: i8,
    wheel: i32,
    x: i32,
    y: i32,
};

pub const Range = extern struct {
    start: i32,
    end: i32,
};

pub const ParserStringAndType = extern struct {
    str: [*]u8,
    length: u32,
    type: u32,
};

pub const FileInfo = extern struct {
    filename: [*]u8, // Null terminated
    filename_len: i32,
    folder: Bool32,
};

pub const FileList = extern struct {
    block: *c_void,
    infos: [*]FileInfo,
    count: u32,
    block_size: u32,
};

pub const BufferIdentifier = extern struct {
    name: [*]u8,
    name_len: i32,
    id: BufferId
};

pub const GUIScrollVars = extern struct {
    scroll_y: f32,
    target_y: i32,
    prev_target_y: i32,
    scroll_x: f32,
    target_x: i32,
    prev_target_x: i32,
};

pub const BufferSeek = extern struct {
    type: Type,
    data: Data,

    pub const Type = extern struct {
        Pos,
        CharacterPos,
        WrappedXY,
        UnwrappedXY,
        LineChar,
    };

    pub const Data = extern union {
        abs: Absolute,
        cord: Coordinate,
        line_char: LineCharacter,
    };

    pub const Absolute = extern struct {
        pus: i32,
    };

    pub const Coordinate = extern struct {
        round_down: Bool32,
        x: f32,
        y: f32,
    };

    pub const LineCharacter = extern struct {
        line: i32,
        character: i32,
    };
};

pub const FullCursor = extern struct {
    pos: i32,
    character_pos: i32,
    line: i32,
    character: i32,
    wrap_line: i32,
    unwrapped_x: f32,
    unwrapped_y: f32,
    wrapped_x: f32,
    wrapped_y: f32,
};

pub const PartialCursor = extern struct {
    pos: i32,
    line: i32,
    character: i32,
};

pub const BufferEdit = extern struct {
    str_start: i32,
    len: i32,
    start: i32,
    end: i32,
};

pub const BufferSummery = extern struct {
    exists: Bool32,
    ready: Bool32,
    buffer_id: i32,
    lock_flags: AccessFlag,
    size: i32,
    line_count: i32,
    file_name: [*]u8,
    file_name_len: i32,
    buffer_name: [*]u8,
    buffer_name_len: i32,
    dirty: DirtyState,
    is_lexed: Bool32,
    tokens_are_ready: Bool32,
    map_id: i32,
    unwrapped_lines: Bool32,
};

pub const Marker = extern struct {
    pos: i32,
    lean_right: Bool32,
};

pub const MarkerHandle = *@OpaqueType();
pub const MarkerDeleteCallback = extern fn(*Application_Links, MarkerHandle, *c_void, u32);

pub const I32Rect = extern struct {
    x0: i32,
    y0: i32,
    x1: i32,
    y1: i32,
};

pub const F32Rect = extern struct {
    x0: f32,
    y0: f32,
    x1: f32,
    y1: f32,
};

pub const ViewSummery = extern struct {
    exists: Bool32,
    view_id: i32,
    buffer_id: i32,
    lock_flags: AccessFlag,
    cursor: FullCursor,
    mark: FullCursor,
    preferred_x: f32,
    line_height: f32,
    unwrapped_lines: Bool32,
    show_whitespace: Bool32,
    view_region: I32Rect,
    fill_region: I32Rect,
    scroll_vars: GuiScrollVars,
};

// TODO: To another file?
pub const String = extern struct {
    str: [*]u8,
    size: i32,
    memory_size: i32,
};

pub const QueryBar = extern struct {
    prompt: String,
    string: String,
};

pub const EventMessage = extern struct {
    type: i32,
};

pub const ThemeColor = extern struct {
    tag: StyleTag,
    color: Color,
};

pub const Theme {
    colors: [???]Color,
};

pub const AvailableFont = extern struct {
    name: [64]u8,
    in_local_font_folder: Bool32,
};

pub const FaceId = u32;

pub const FaceDescription = extern struct {
    font: AvailableFont,
    pt_size: i32,
    bold: Bool32,
    italic: Bool32,
    underline: Bool32,
    hinting: Bool32,
};

pub const BufferBatchEditType = enum(i32) {
    Normal,
    PreserveTokens,
};

pub const BufferBatchEdit = extern struct {
    str: [*]u8,
    str_len: i32,
    edits: [*]BufferEdit,
    edit_count: i32,
};

pub const CustomCommandFunction = extern fn(*ApplicationLink) c_void;

pub const GenericCommand = extern union {
    cmdid: CommandId,
    command: CustomCommandFunction,
};

pub const UserInput = extern struct {
    type: UserInputTypeId,
    abort: Bool32,
    data: Date,
    command: GenericCommand,

    pub const Data = extern union {
        key: KeyEventData,
        mouse: MouseState,
    };
};

pub const Data = extern struct {
    data: [*]u8,
    size: u64,
};

pub const HookId = enum(i32) {
    FileOutOfSync,
    Exit,
    ViewSizeChanged,
};

pub const SpecialHookId = enum(i32) {
    ScrollRule = @typeInfo(HookId).Enum.fields.len,
    NewFile,
    OpenFile,
    SaveFile,
    EndFile,
    CommandCaller,
    InputFilter,
    Start,
    BufferNameResolver,
};

pub const CommandCallerHookFunction = extern fn(*ApplicationLinks, GenericCommand) i32;
pub const HookFunction = extern fn(*ApplicationLinks) i32;
pub const OpenFileHookFunction = extern fn(*ApplicationLinks, BufferId) i32;
pub const InputFilterFunction = extern fn(*MouseState) c_void;
pub const ScrollRuleFunction = extern fn(f32, f32, *f32, *f32, i32, i32, f32)

pub const BufferNameConflictEntry = extern struct {
    buffer_id: BufferId,
    file_name: [*]u8,
    file_name_len: i32,
    base_name: [*]u8,
    base_name_len: i32,
    unique_name_in_out: [*]u8,
    unique_name_len_in_out: i32,
    unique_name_capacity: i32,
};

pub const BufferNameResolverFunction = extern fn(*ApplicationLinks, [*]BufferNameConflictEntry, i32) c_void;
pub const StartHookFunction = extern fn(*ApplicationLinks, [*][*]u8, i32) i32;
pub const GetBindingDataFunction(*c_void, i32) i32;

pub const MapId = enum(i32) {
    Global = 1 << 24,
    File,
    Ui,
    Nomap,
};

pub const BindingUnit = extern struct {
    type: Type,
    data: Data,

     pub const Type = enum(i32) {
        Header,
        MapBegin,
        Binding,
        Callback,
        Inherit,
        Hook,
    };

    pub const Data = extern union {
        header: Header,
        map_begin: MapBegin,
        map_inherit: MapInherit,
        binding: Binding,
        callback: Callback,
        hook: Hook,
    };

    pub const Header = extern struct {
        total_size: i32,
        user_map_count: i32,
        error: i32,
    };

    pub const MapBegin = extern struct {
        mapid: i32,
        replace: i32,
        bind_count: i32,
    };
    
    pub const MapInherit = extern struct {
        mapid: i32,
    };

    pub const Binding = extern struct {
        code: KeyCode,
        modifiers: u8,
        command_id: CommandId,
    };

    pub const Callback = extern struct {
        code: KeyCode,
        modifiers: u8,
        func: CustomCommandFunction, // Custom_Command_Function *func
    };
    
    pub const Hook = extern struct {
        hook_id: i32,
        func: *c_void,
    };
};

pub const GetVersionFunction(i32, i32, i32) i32;




// TODO: These are helpers and not part of the API. Move them
const std = @import("std");
const math = std.math;

pub fn getBindingUnits(data: *c_void, size: i32) ![]BindingUnit {
    const len = math.cast(usize, size / @sizeOf(BindingUnit));
     return @ptrCast([*]BindingUnit, data)[0..len];
}

pub const BindHelper = struct {
    header: *BindingUnit,

     units: []BindingUnit,
     next_index: usize,

     pub fn init(units: []BindingUnit) !BindHelper {
        var res = BindHelper{
            .header = undefined,
            .units = units,
               .next_index = 0,
        };

          res.header = res.next() orelse return error.OutOfUnits;
          *res.header = BindingUnit{
            .type = BindingUnit.Type.Header,
            .data = BindingUnit.Data{ .header = BindingUnit.Header{
                .total_size = 0,
                .user_map_count = 0,
                .error = 0,
            }},
        };
        
          return res;
    }

    pub fn next(helper: *BindHelper) ?*BindUnit {
        if (helper.units.len <= helper.next_index)
            return null;
        
        defer helper.next_index += 1;
        return &helper.units[helper.next_index];
    }

    
};

