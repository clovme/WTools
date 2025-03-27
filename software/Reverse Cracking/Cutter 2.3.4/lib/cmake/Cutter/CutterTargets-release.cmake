#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Cutter::Cutter" for configuration "Release"
set_property(TARGET Cutter::Cutter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Cutter::Cutter PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/cutter.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/./cutter.exe"
  )

list(APPEND _cmake_import_check_targets Cutter::Cutter )
list(APPEND _cmake_import_check_files_for_Cutter::Cutter "${_IMPORT_PREFIX}/lib/cutter.lib" "${_IMPORT_PREFIX}/./cutter.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
