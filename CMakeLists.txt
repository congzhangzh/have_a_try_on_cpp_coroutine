cmake_minimum_required(VERSION 3.18)
project(coroutines)

set(CMAKE_CXX_STANDARD 23)

add_compile_options(-stdlib=libstdc++)

add_executable(coroutines async_coroutine_example.cpp)
target_link_libraries(coroutines pthread)