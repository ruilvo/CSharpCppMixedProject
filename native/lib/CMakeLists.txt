# SPDX-License-Identifier: Apache-2.0
#
# SPDX-FileCopyrightText: 2024 Rui Oliveira <ruimail24@gmail.com>

# It is not good CMake practice to define libraries as STATIC or SHARED directly.
# Rather, one should usually honor the BUILD_SHARED_LIBS variable and use the add_library() command
# without the TYPE argument. This allows the user to build both static and shared libraries with the
# same build files, by simply setting BUILD_SHARED_LIBS to true or false.
# HOWEVER, in this case, we want to build a shared library, as we need to load it from C#.
add_library(aether_lib SHARED)

set_target_properties(
  aether_lib
  PROPERTIES DEFINE_SYMBOL "aether_EXPORTING" #
             VERSION "${PROJECT_VERSION}" #
             SOVERSION "${PROJECT_VERSION_MAJOR}")

# Export header
set(AETHER_EXPORT_HEADER_FILE "${AETHER_INCLUDE_DIR}/api.h")
generate_export_header(
  aether_lib
  BASE_NAME
  "AETHER"
  EXPORT_MACRO_NAME
  "AETHER_API"
  EXPORT_FILE_NAME
  ${AETHER_EXPORT_HEADER_FILE})
target_sources(
  aether_lib
  PUBLIC #
         FILE_SET HEADERS #
         BASE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/include)
target_sources(
  aether_lib #
  PUBLIC #
         FILE_SET HEADERS #
         FILES ${CMAKE_CURRENT_BINARY_DIR}/${AETHER_EXPORT_HEADER_FILE})

add_subdirectory(src)
add_subdirectory(include)
