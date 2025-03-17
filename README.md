# DLL C interop

This example is creating a C library (A_mathlib) and a Zig library and 
using them on each other.

There are 3 scenarios in this example:

    How to build:

## 1. C library and C example of using the library

```sh
task run_a
```

## 2. C library together with a Zig library and running on a Zig program

```sh
task run_b
```

## 3. C library together with a Zig library and running on a C program

```sh
task run_c
```

# Dependencies used

- CMake 3.30
- Taskfile v3.39.2
- Visual Studio 17 2022
- Zig 0.14.0
