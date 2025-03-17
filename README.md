# DLL C interop

This example is creating a C library (A_mathlib) and a Zig library and 
using them on each other.

There are 3 scenarius in this example:

## 1. C library and C example os using the library

how to build this:

```sh
cd A_mathlib/example
task
```

## 2. C library together with a Zig library and running on a zig program

```sh
cd B_zig_code
task
```

## 3. C library together with a Zig library and running on a C program

```sh
task
```

# Dependencies used

- CMake 3.30
- Taskfile v3.39.2
- Visual Studio 17 2022
- Zig 0.14.0