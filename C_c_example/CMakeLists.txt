cmake_minimum_required(VERSION 3.10)
project(example C)

# Add the executable
add_executable(example src/main.c)

# Include directories for both libraries
target_include_directories(example PRIVATE 
    ${CMAKE_SOURCE_DIR}/mathlib/include
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Link against mathlib (reference the target directly)
target_link_libraries(example PRIVATE mathlib)

# Find the zigmath library
find_library(ZIGMATH_LIBRARY zigmath HINTS ${CMAKE_SOURCE_DIR}/ziglib)

# Link against zigmath
target_link_libraries(example PRIVATE ${ZIGMATH_LIBRARY})

# Ensure mathlib is built before example
add_dependencies(example mathlib)