find_path(Protobuf_INCLUDE_PATH
        NAMES google/protobuf/service.h
        HINTS /opt/protobuf/include)
if(Protobuf_INCLUDE_PATH)
    set(Protobuf_INCLUDE_PATH_FOUND true)
else(Protobuf_INCLUDE_PATH)
    message(FATAL_ERROR: "Protobuf_INCLUDE_PATH not found.")
endif(Protobuf_INCLUDE_PATH)


find_library(Protobuf_LIBRARY 
        NAMES libprotobuf.a
        HINTS /opt/protobuf/lib)
if(Protobuf_LIBRARY)
    set(Protobuf_LIBRARY_FOUND TRUE)
else(Protobuf_LIBRARY)
    message(FATAL_ERROR "Protobuf_LIBRARY not found.")
endif(Protobuf_LIBRARY)

if(Protobuf_LIBRARY_FOUND AND Protobuf_INCLUDE_PATH_FOUND)
    set(Protobuf_FOUND true)
endif(Protobuf_LIBRARY_FOUND AND Protobuf_INCLUDE_PATH_FOUND)


