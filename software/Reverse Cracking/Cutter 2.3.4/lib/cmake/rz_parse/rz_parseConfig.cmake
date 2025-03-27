################################################################################
#
# This module provides the following imported targets, if found:
#
#  rz_parse::rz_parse
#
# This file is intended to be consumed by clients who wish to use rz_parse from CMake.
# The recommended way to use find this module is using `find_package(Rizin COMPONENTS ...)`.
#
# Provides the following variables
# rz_parse_FOUND        - Flag for indicating that rz_parse package has been found
# rz_parse_VERSION      - Version of rz_parse
# rz_parse_INCLUDE_DIRS - Directories to include
# rz_parse_LIBRARY      - Path to the single library that this module represents, without dependencies
# rz_parse_LIBRARIES    - Libraries to link
# rz_parse_LIBRARY_DIRS - Library directories to search for link libraries
# rz_parse_PLUGINDIR    - Directory where plugins are placed, without the prefix part
#
################################################################################

set(RIZIN_MODULE_PREFIXED rz_parse)
set(rz_parse_VERSION 0.7.1)

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

set(rz_parse_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/include\\librz" "${PACKAGE_PREFIX_DIR}/include\\librz/sdb")
set_and_check(rz_parse_LIBRARY_DIRS "${PACKAGE_PREFIX_DIR}/lib")
find_library(rz_parse_LIBRARY NAMES rz_parse HINTS "${rz_parse_LIBRARY_DIRS}" NO_DEFAULT_PATH REQUIRED)
set(rz_parse_LIBRARIES "${rz_parse_LIBRARY}")
set(_rz_parse_DEPENDENCIES rz_util rz_flag rz_syscall rz_reg rz_cons)
set(rz_parse_PLUGINDIR lib\\rizin\\plugins)

include(CMakeFindDependencyMacro)
get_filename_component(_rizin_cmake_path "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)
set(_rz_parse_DEPENDENCY_TARGETS)
foreach(_module_dep ${_rz_parse_DEPENDENCIES})
  if (NOT ${_module_dep}_FOUND)
    find_dependency(${_module_dep} PATHS ${_rizin_cmake_path} NO_DEFAULT_PATH)
  endif()

  if (NOT ${_module_dep}_FOUND)
    set(rz_parse_FOUND False)
    return()
  endif()

  list(APPEND rz_parse_INCLUDE_DIRS "${${_module_dep}_INCLUDE_DIRS}")
  list(APPEND rz_parse_LIBRARIES "${${_module_dep}_LIBRARIES}")
  list(APPEND _rz_parse_DEPENDENCY_TARGETS "${_module_dep}::${_module_dep}")
endforeach()

list(REMOVE_DUPLICATES rz_parse_INCLUDE_DIRS)
list(REMOVE_DUPLICATES rz_parse_LIBRARIES)

if(NOT TARGET rz_parse::rz_parse)
  add_library(rz_parse::rz_parse SHARED IMPORTED)
  target_link_libraries(rz_parse::rz_parse INTERFACE ${_rz_parse_DEPENDENCY_TARGETS})
  set_target_properties(rz_parse::rz_parse PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${rz_parse_INCLUDE_DIRS}")
  set_target_properties(rz_parse::rz_parse PROPERTIES
    IMPORTED_LOCATION "${rz_parse_LIBRARY}")
endif()
set(rz_parse_TARGET rz_parse::rz_parse)
