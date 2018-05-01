find_path(Gflags_INCLUDE_PATH
        NAMES gflags/gflags.h
        HINTS /opt/gflags/include)
if(Gflags_INCLUDE_PATH)
    set(Gflags_INCLUDE_PATH_FOUND true)
else(Gflags_INCLUDE_PATH)
    message(FATAL_ERROR: "Gflags_INCLUDE_PATH not found.")
endif(Gflags_INCLUDE_PATH)


find_library(Gflags_LIBRARY 
        NAMES libgflags.a
        HINTS /opt/gflags/lib)
if(Gflags_LIBRARY)
    set(Gflags_LIBRARY_FOUND TRUE)
else(Gflags_LIBRARY)
    message(FATAL_ERROR "Gflags_LIBRARY not found.")
endif(Gflags_LIBRARY)

if(Gflags_LIBRARY_FOUND AND Gflags_INCLUDE_PATH_FOUND)
    set(Gflags_FOUND true)
endif(Gflags_LIBRARY_FOUND AND Gflags_INCLUDE_PATH_FOUND)


