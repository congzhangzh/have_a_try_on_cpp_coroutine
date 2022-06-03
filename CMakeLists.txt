cmake_minimum_required(VERSION 3.18)
project(coroutines)

set(CMAKE_CXX_STANDARD 23)

add_compile_options(-stdlib=libstdc++)

# ref: https://twitter.com/lewissbaker/status/1528563836995125248
add_executable(async_coroutine_example async_coroutine_example.cpp)
target_link_libraries(async_coroutine_example pthread)

# ref: https://www.scs.stanford.edu/~dm/blog/corodemo.cc
add_executable(corodemo corodemo.cc)
target_link_libraries(corodemo pthread)