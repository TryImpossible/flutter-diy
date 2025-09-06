# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(ffi_plugin_library VERSION 0.0.1 LANGUAGES C)

add_library(ffi_plugin SHARED
  "ffi_plugin.c"
  "math.c"
  "strings.c"
)

set_target_properties(ffi_plugin PROPERTIES
  PUBLIC_HEADER ffi_plugin.h
  OUTPUT_NAME "ffi_plugin"
)

target_compile_definitions(ffi_plugin PUBLIC DART_SHARED_LIB)

if (ANDROID)
  # Support Android 15 16k page size
  target_link_options(ffi_plugin PRIVATE "-Wl,-z,max-page-size=16384")
endif()
