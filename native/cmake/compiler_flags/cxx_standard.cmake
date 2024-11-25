# SPDX-License-Identifier: Apache-2.0
#
# SPDX-FileCopyrightText: 2024 Rui Oliveira <ruimail24@gmail.com>

include_guard(GLOBAL)

if(NOT AETHER_SET_CXX_STANDARD)
  return()
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS OFF)
