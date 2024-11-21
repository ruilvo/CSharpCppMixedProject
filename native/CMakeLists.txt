# SPDX-License-Identifier: Apache-2.0
#
# SPDX-FileCopyrightText: 2023 Rui Oliveira <ruimail24@gmail.com>

cmake_minimum_required(VERSION 3.23)

project(
  AetherCSharpAndNativeProject
  VERSION 0.1
  LANGUAGES C CXX)

# Options ------------------------------------------------------------------------------------------

option(BUILD_SHARED_LIBS "Build libraries as shared libraries." ON) # CMake option name

option(AETHER_DEVELOPER_MODE "Enable developer helpers." OFF)

option(AETHER_USE_LTO "Enable link-time optimization when possible." ON)

option(AETHER_SET_CXX_STANDARD "Set the C++ standard directly." ON)
option(AETHER_USE_CXX_ISO_FLAGS "Add extra compiler flags to make C++ compilers more compliant." ON)

# --------------------------------------------------------------------------------------------------

# Global variables
set(AETHER_VENDOR_NAME "Aether")
set(AETHER_INCLUDE_DIR "include/aether")

# Global modules
include(GenerateExportHeader)
include(CheckCXXCompilerFlag)
include(FetchContent)

# Local variables
set(FETCHCONTENT_QUIET OFF)

# Local modules
include(cmake/output_structure.cmake)
include(cmake/install_structure.cmake)
include(cmake/default_visibility.cmake)

include(cmake/compiler_flags/cxx_standard.cmake)
include(cmake/compiler_flags/cxx_iso_flags.cmake)
include(cmake/compiler_flags/ipo_support.cmake)

include(cmake/developer_mode.cmake)

# Dependencies
add_subdirectory(dependencies)

# Code for the application
add_subdirectory(lib)

# Install and packaging code
include(cmake/installation.cmake)
include(cmake/packaging.cmake)
