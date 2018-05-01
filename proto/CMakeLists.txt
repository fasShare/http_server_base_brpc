#1.cmake verson，指定cmake版本 
cmake_minimum_required(VERSION 3.11)

file(GLOB PROTOS *.proto)
set(PROTO_OUT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
message(${PROTOS})
message(${PROTO_OUT_PATH})

list(APPEND PROTO_FLAGS -I${PROTO_OUT_PATH})

foreach(PROTO ${PROTOS})
    get_filename_component(PROTO_WE ${PROTO} NAME_WE)
    list(APPEND PROTO_SRCS "${PROTO_OUT_PATH}/${PROTO_WE}.pb.cc")
    list(APPEND PROTO_HDRS "${PROTO_OUT_PATH}/${PROTO_WE}.pb.h")
    execute_process(
        COMMAND ${PROTOBUF_PROTOC_EXECUTABLE} ${PROTO_FLAGS}  --cpp_out=${PROTO_OUT_PATH} --proto_path=${PROTO_OUT_PATH} ${PROTO}
        WORKING_DIRECTORY ${PROTO_OUT_PATH}
    )
endforeach()

include_directories(${Protobuf_INCLUDE_PATH} ${PROTO_OUT_PATH})

set(SOURCES ${PROTO_SRCS})
message(${SOURCES})
add_library(${PROTO_LIB_NAME} STATIC ${SOURCES})
