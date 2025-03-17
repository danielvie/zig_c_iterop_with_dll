cmake_minimum_required(VERSION 3.10)
project(example)

add_executable(example main.c)

# Add the mathlib directory and ensure it is built first
add_subdirectory(.. mathlib_build)

# Link against the mathlib target
target_link_libraries(example PRIVATE mathlib)
target_include_directories(example PRIVATE ../src)
