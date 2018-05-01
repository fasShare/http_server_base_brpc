find_path(Brpc_INCLUDE_PATH
        NAMES brpc/server.h
        HINTS /opt/brpc/include)
if(Brpc_INCLUDE_PATH)
    set(Brpc_INCLUDE_PATH_FOUND true)
else(Brpc_INCLUDE_PATH)
    message(FATAL_ERROR: "Brpc_INCLUDE_PATH not found.")
endif(Brpc_INCLUDE_PATH)


find_library(Brpc_LIBRARY 
        NAMES brpc libgbrpc
        HINTS /opt/brpc/lib)
if(Brpc_LIBRARY)
    set(Brpc_LIBRARY_FOUND TRUE)
else(Brpc_LIBRARY)
    message(FATAL_ERROR "Brpc_LIBRARY not found.")
endif(Brpc_LIBRARY)

if(Brpc_LIBRARY_FOUND AND Brpc_INCLUDE_PATH_FOUND)
    set(Brpc_FOUND true)
endif(Brpc_LIBRARY_FOUND AND Brpc_INCLUDE_PATH_FOUND)


