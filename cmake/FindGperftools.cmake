find_path(Gperftools_INCLUDE_PATH
        NAMES gperftools/profiler.h gperftools/tmalloc.h google/profiler.h
        HINTS /opt/gperftools/include)
if(Gperftools_INCLUDE_PATH)
    set(Gperftools_INCLUDE_PATH_FOUND true)
else(Gperftools_INCLUDE_PATH)
    message(FATAL_ERROR: "Gperftools_INCLUDE_PATH not found.")
endif(Gperftools_INCLUDE_PATH)

find_library(Gperftools_profiler_tcmalloc_LIBRARY 
        NAMES libtcmalloc_and_profiler.a
        HINTS /opt/gperftools/lib)
if(Gperftools_profiler_tcmalloc_LIBRARY)
    set(Gperftools_profiler_tcmalloc_LIBRARY_FOUND TRUE)
else(Gperftools_profiler_tcmalloc_LIBRARY)
    message(FATAL_ERROR "Gperftools_LIBRARY not found.")
endif(Gperftools_profiler_tcmalloc_LIBRARY)

if(Gperftools_profiler_tcmalloc_LIBRARY_FOUND AND Gperftools_INCLUDE_PATH_FOUND)
    set(Gperftools_FOUND true)
endif(Gperftools_profiler_tcmalloc_LIBRARY_FOUND AND Gperftools_INCLUDE_PATH_FOUND)


