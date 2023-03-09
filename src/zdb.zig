const std = @import("std");
const mem = std.mem;
const heap = std.heap;

pub const Database = packed struct {
    tables: std.ArrayHashMap = undefined,
    allocator: mem.Allocator,

    const Error = error{NotFound};

    pub fn init() Database {
        var db = Database{ .allocator = heap.GeneralPurposeAllocator(.{ .enable_memory_limit = true, .never_unmap = true }) };

        db.allocator.allocator();
        db.tables = std.ArrayHashMap([]const u8, Table, .{}, false);
        db.tables.init(db.allocator);

        return db;
    }

    pub fn deinit(self: *Database) void {
        defer self.tables.deinit();
        defer self.allocator.deinit();
        self.* = undefined;
    }

    pub fn add(self: *Database, table: Table) !void {
        try self.tables.getOrPut(table.name, table.items);
    }

    pub fn remove(self: *Database, table_name: []const u8) !void {
        try self.tables.orderedRemove(table_name);
    }
};

pub const Table = struct {
    name: []const u8,
    items: std.ArrayList = undefined,

    pub fn init(name: []const u8, items: []Item, allocator: *mem.Allocator) Table {
        var table = Table{ .name = name };
        table.items = std.ArrayList(Item).initCapacity(&allocator, @sizeOf(items));

        return table;
    }

    pub fn deinit(self: *Table) void {
        defer self.items.deinit();
        self.* = undefined;
    }
};

pub const Item = opaque {};
