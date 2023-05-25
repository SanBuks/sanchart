cmake_minimum_required(VERSION 3.25)
project(sanchart)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC_SEARCH_PATHS ${PROJECT_SOURCE_DIR}/window/forms)
set(CMAKE_PREFIX_PATH "D:/develop_tool/qt6/6.4.3/mingw_64")

find_package(Qt6 COMPONENTS Core Gui Widgets REQUIRED)
include(cmake/copy_dll.cmake)

add_subdirectory(window)
add_executable(sanchart main.cc source.qrc)
target_link_libraries(sanchart PRIVATE window)

copy_custom_dll(sanchart window)
copy_qt_dll(sanchart)