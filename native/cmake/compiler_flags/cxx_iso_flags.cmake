# SPDX-License-Identifier: Apache-2.0
#
# SPDX-FileCopyrightText: 2024 Rui Oliveira <ruimail24@gmail.com>

include_guard(GLOBAL)

if(NOT AETHER_USE_CXX_ISO_FLAGS)
  return()
endif()

if(MSVC)
  set(ISO_FLAGS "/EHsc" "/volatile:iso" "/Zc:preprocessor" "/Zc:throwingNew" "/Zc:externConstexpr")
else()
  set(ISO_FLAGS) # TODO: Add ISO flags for other compilers, if needed
endif()

foreach(ISO_FLAG ${ISO_FLAGS})
  check_cxx_compiler_flag(${ISO_FLAG} HAS_CXX_${ISO_FLAG})
  if(HAS_CXX_${ISO_FLAG})
    add_compile_options($<$<COMPILE_LANGUAGE:CXX>:${ISO_FLAG}>)
  endif()
endforeach()
