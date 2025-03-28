################################################################################
#
# This module provides the Rizin package, which is composed of multiple
# components, such as:
#
#  Analysis
#  Asm
#  Bin
#  Bp
#  Config
#  Cons
#  Core
#  Crypto
#  Debug
#  Demangler
#  Diff
#  Egg
#  Flag
#  Hash
#  Il
#  IO
#  Lang
#  Librz
#  Magic
#  Main
#  Parse
#  Reg
#  Search
#  Signature
#  Socket
#  Syscall
#  Type
#  Util
#
# This file is intended to be consumed by clients who wish to use Rizin libraries
# from CMake. It can be used by doing `find_package(Rizin COMPONENTS Bin IO)` from
# within a `CMakeLists.txt` file.

# Provides the following variables:
#
# Rizin_PLUGINDIR    - Directory where plugins are placed, without the prefix part
#
################################################################################

set(Rizin_VERSION 0.7.1)

if(NOT Rizin_FIND_COMPONENTS)
    set(Rizin_FIND_COMPONENTS Core)
endif()

set(_supported_components
    Analysis
    Asm
    Bin
    Bp
    Config
    Cons
    Core
    Crypto
    Debug
    Demangler
    Diff
    Egg
    Flag
    Hash
    Il
    IO
    Lang
    Librz
    Magic
    Main
    Parse
    Reg
    Search
    Signature
    Socket
    Syscall
    Type
    Util
)

get_filename_component(_rizin_cmake_path "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)

foreach(_comp ${Rizin_FIND_COMPONENTS})
  string(TOLOWER ${_comp} _comp_lower)
  if(NOT ";${_supported_components};" MATCHES ";${_comp};")
    set(Rizin_FOUND False)
    set(Rizin_NOT_FOUND_MESSAGE "Unsupported component: ${_comp}")
    return()
  endif()
  if (TARGET "Rizin::${_comp}")
    # Already got this component, trying to re-add the
    # target below would be an error
    continue()
  endif()
  find_package(rz_${_comp_lower} PATHS ${_rizin_cmake_path} NO_DEFAULT_PATH)
  if (NOT rz_${_comp_lower}_FOUND)
    set(Rizin_FOUND False)
    set(Rizin_NOT_FOUND_MESSAGE "Failed to find Rizin component ${_comp}")
    return()
  endif()
  add_library(Rizin::${_comp} UNKNOWN IMPORTED)
  get_target_property(Rizin_${_comp}_LOCATION rz_${_comp_lower}::rz_${_comp_lower} IMPORTED_LOCATION)
  set_target_properties(Rizin::${_comp} PROPERTIES
    IMPORTED_LOCATION "${Rizin_${_comp}_LOCATION}"
    IMPORTED_LINK_INTERFACE_LIBRARIES "${rz_${_comp_lower}_LIBRARIES}"
    INTERFACE_LINK_DIRECTORIES "${rz_${_comp_lower}_LIBRARY_DIRS}"
    INTERFACE_INCLUDE_DIRECTORIES "${rz_${_comp_lower}_INCLUDE_DIRS}")
endforeach()

set(Rizin_PLUGINDIR lib\\rizin\\plugins)
