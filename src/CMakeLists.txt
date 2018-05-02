#1.cmake verson，指定cmake版本 
cmake_minimum_required(VERSION 3.11)

message(${HTTP_SERVER_LIBS})

aux_source_directory(. SOURCES)

add_executable(http_server ${SOURCES})

target_link_libraries(http_server ${HTTP_SERVER_LIBS})
