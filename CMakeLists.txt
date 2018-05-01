cmake_minimum_required(VERSION 3.2)

PROJECT(http_server)

set(PROTOBUF_PROTOC_EXECUTABLE /opt/protobuf/bin/protoc)
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
set(PROC_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

#设置proto目录下的产出的库文件名
set(PROTO_LIB_NAME protocol_proto)

set(CMAKE_CXX_FLAGS "-O2 -std=c++11 -pipe -Wall -W -fstrict-aliasing \
        -Wno-invalid-offsetof -Wno-unused-parameter -fno-omit-frame-pointer")
set(CMAKE_C_FLAGS "-O2 -std=c++11 -pipe -Wall -W -fstrict-aliasing \
        -Wno-unused-parameter -fno-omit-frame-pointer")

# 查找依赖库，设置相关头文件以及库文件目录
find_package(Protobuf REQUIRED)
find_package(Gflags REQUIRED)
find_package(Brpc REQUIRED)
find_package(Openssl REQUIRED)
find_package(Gperftools REQUIRED)
find_package(Leveldb REQUIRED)

include_directories(${Protobuf_INCLUDE_PATH})
include_directories(${Gflags_INCLUDE_PATH})
include_directories(${Brpc_INCLUDE_PATH})
include_directories(${Openssl_INCLUDE_PATH})
include_directories(${Gperftools_INCLUDE_PATH})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/proto)
include_directories(${Leveldb_INCLUDE_PATH})
include_directories(/opt/zlib/include)
    
message(${Openssl_crypto_LIBRARY})
message(${Openssl_ssl_LIBRARY})
message(${Gflags_LIBRARY})
message(${Brpc_LIBRARY})
message(${Gperftools_profiler_tcmalloc_LIBRARY})
message(${Leveldb_LIBRARY})

set(HTTP_SERVER_LIBS 
    ${Brpc_LIBRARY} 
    ${Leveldb_LIBRARY}
    ${Openssl_ssl_LIBRARY}
    ${Openssl_crypto_LIBRARY}
    ${Gflags_LIBRARY}
    ${Gperftools_profiler_tcmalloc_LIBRARY}
    ${CMAKE_CURRENT_SOURCE_DIR}/proto/libprotocol_proto.a
    ${Protobuf_LIBRARY}
    /opt/zlib/lib/libz.a
    libpthread.so
    libstdc++.so
    libdl.so
    )

add_subdirectory(proto)
add_subdirectory(src)

