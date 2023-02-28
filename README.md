# zdb

Allocator-free document oriented database management, heavily inspired by [TinyDB](https://github.com/msiemens/tinydb).

## Abstract

Warning
|-
This library is still in development. Please use at your own expense.

zdb is inspired by TinyDB, meaning this library also utilises JSON files
as its main storage. zdb is also designed and meant to go hand-in-hand with 
[zorm](https://github.com/ziglibs/zorm), interoperable with one another.

## Building

zdb runs on 0.11.0-dev and higher versions of Zig.

It is recommended to install and build from source:

```bash
$ git clone --recursive https://github.com/ziglibs/zdb
$ cd ./zdb
$ zig build
```