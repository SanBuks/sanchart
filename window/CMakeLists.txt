project(window)

add_library(window SHARED src/main_window.cc include/main_window.h)
target_include_directories(window PUBLIC include)
target_link_libraries(window PUBLIC Qt::Core Qt::Gui Qt::Widgets)