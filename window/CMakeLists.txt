project(window)

target_sources(${TARGET} PRIVATE
               forms/main_window.ui
               include/main_window.h
               src/main_window.cc)