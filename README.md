# zdb

Allocator-free document oriented database management, heavily inspired by [TinyDB](https://github.com/msiemens/tinydb).

## Abstract

Warning
|-
This library is still in development. Please use at your own expense.

zdb is inspired by TinyDB, meaning this library also utilises JSON files
as its main storage. zdb is also designed and meant to go hand-in-hand with
[zorm](https://github.com/ziglibs/zorm), interoperable with one another.

## Structure

The architecture of this database design has been shrinked for maximising
efficiency and optimisation strategies.

Here's a mockup example for a lack of better words:

```md
Database {
    Table {
        Item {
            T (type)
            v (T) -> undefined
        }

        size (u64) -> undefined
        items (array of Item)

        search(T or expr)
        add(T or expr)
        remove(T or expr)
        clear(?T)
    }

    tables (array of Table) -> undefined
}

Query {
    where(expr) !Item
    exists(T) !bool
}
```

### Caviats

Simplicity and ease-of-use are the primary goals of zdb. You may not
want to use this if:

- You need the database cached during realtime
- Are seeking to use your own alloc for memory allocation
- Needing to hook in-between transactions with middleware

## Building

zdb runs on 0.11.0-dev and higher versions of Zig.

It is recommended to install and build from source:

```bash
$ git clone --recursive https://github.com/ziglibs/zdb
$ cd ./zdb
$ zig build
```
