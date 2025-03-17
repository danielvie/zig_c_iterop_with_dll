cmake_minimum_required(VERSION 3.10)
project(mathlib)

add_library(mathlib SHARED src/mathlib.c)

target_include_directories(mathlib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

target_compile_definitions(mathlib PRIVATE MATHLIB_EXPORTS)
