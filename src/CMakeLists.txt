#1.cmake verson，指定cmake版本 
cmake_minimum_required(VERSION 3.11)

add_executable(http_server http_server.cpp)

message(${HTTP_SERVER_LIBS})

target_link_libraries(http_server ${HTTP_SERVER_LIBS})
