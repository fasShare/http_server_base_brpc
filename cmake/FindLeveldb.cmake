find_path(Leveldb_INCLUDE_PATH
        NAMES leveldb/cache.h
        HINTS /opt/leveldb/include)
if(Leveldb_INCLUDE_PATH)
    set(Leveldb_INCLUDE_PATH_FOUND true)
else(Leveldb_INCLUDE_PATH)
    message(FATAL_ERROR: "Leveldb_INCLUDE_PATH not found.")
endif(Leveldb_INCLUDE_PATH)


find_library(Leveldb_LIBRARY 
        NAMES libleveldb.a
        HINTS /opt/leveldb)
if(Leveldb_LIBRARY)
    set(Leveldb_LIBRARY_FOUND TRUE)
else(Leveldb_LIBRARY)
    message(FATAL_ERROR "Leveldb_LIBRARY not found.")
endif(Leveldb_LIBRARY)

if(Leveldb_LIBRARY_FOUND AND Leveldb_INCLUDE_PATH_FOUND)
    set(Leveldb_FOUND true)
endif(Leveldb_LIBRARY_FOUND AND Leveldb_INCLUDE_PATH_FOUND)


