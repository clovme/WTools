################################################################################
#
# This module provides the following imported targets, if found:
#
#  rz_asm::rz_asm
#
# This file is intended to be consumed by clients who wish to use rz_asm from CMake.
# The recommended way to use find this module is using `find_package(Rizin COMPONENTS ...)`.
#
# Provides the following variables
# rz_asm_FOUND        - Flag for indicating that rz_asm package has been found
# rz_asm_VERSION      - Version of rz_asm
# rz_asm_INCLUDE_DIRS - Directories to include
# rz_asm_LIBRARY      - Path to the single library that this module represents, without dependencies
# rz_asm_LIBRARIES    - Libraries to link
# rz_asm_LIBRARY_DIRS - Library directories to search for link libraries
# rz_asm_PLUGINDIR    - Directory where plugins are placed, without the prefix part
#
################################################################################

set(RIZIN_MODULE_PREFIXED rz_asm)
set(rz_asm_VERSION 0.7.1)

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

set(rz_asm_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/include\\librz" "${PACKAGE_PREFIX_DIR}/include\\librz/sdb")
set_and_check(rz_asm_LIBRARY_DIRS "${PACKAGE_PREFIX_DIR}/lib")
find_library(rz_asm_LIBRARY NAMES rz_asm HINTS "${rz_asm_LIBRARY_DIRS}" NO_DEFAULT_PATH REQUIRED)
set(rz_asm_LIBRARIES "${rz_asm_LIBRARY}")
set(_rz_asm_DEPENDENCIES rz_util rz_config rz_syscall rz_flag rz_parse rz_bin)
set(rz_asm_PLUGINDIR lib\\rizin\\plugins)

include(CMakeFindDependencyMacro)
get_filename_component(_rizin_cmake_path "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)
set(_rz_asm_DEPENDENCY_TARGETS)
foreach(_module_dep ${_rz_asm_DEPENDENCIES})
  if (NOT ${_module_dep}_FOUND)
    find_dependency(${_module_dep} PATHS ${_rizin_cmake_path} NO_DEFAULT_PATH)
  endif()

  if (NOT ${_module_dep}_FOUND)
    set(rz_asm_FOUND False)
    return()
  endif()

  list(APPEND rz_asm_INCLUDE_DIRS "${${_module_dep}_INCLUDE_DIRS}")
  list(APPEND rz_asm_LIBRARIES "${${_module_dep}_LIBRARIES}")
  list(APPEND _rz_asm_DEPENDENCY_TARGETS "${_module_dep}::${_module_dep}")
endforeach()

list(REMOVE_DUPLICATES rz_asm_INCLUDE_DIRS)
list(REMOVE_DUPLICATES rz_asm_LIBRARIES)

if(NOT TARGET rz_asm::rz_asm)
  add_library(rz_asm::rz_asm SHARED IMPORTED)
  target_link_libraries(rz_asm::rz_asm INTERFACE ${_rz_asm_DEPENDENCY_TARGETS})
  set_target_properties(rz_asm::rz_asm PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${rz_asm_INCLUDE_DIRS}")
  set_target_properties(rz_asm::rz_asm PROPERTIES
    IMPORTED_LOCATION "${rz_asm_LIBRARY}")
endif()
set(rz_asm_TARGET rz_asm::rz_asm)
