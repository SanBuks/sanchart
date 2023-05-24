function(copy_dll)
  if (WIN32 AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(DEBUG_SUFFIX)
    if (MSVC AND CMAKE_BUILD_TYPE MATCHES "Debug")
      set(DEBUG_SUFFIX "d")
    endif ()
    set(QT_INSTALL_PATH "${CMAKE_PREFIX_PATH}")
    if (EXISTS "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll")
      add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                         COMMAND ${CMAKE_COMMAND} -E make_directory
                         "$<TARGET_FILE_DIR:${PROJECT_NAME}>/plugins/platforms/")
      add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                         COMMAND ${CMAKE_COMMAND} -E copy
                         "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll"
                         "$<TARGET_FILE_DIR:${PROJECT_NAME}>/plugins/platforms/")
    endif ()
    foreach (QT_LIB Core Gui Widgets)
      add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
                         COMMAND ${CMAKE_COMMAND} -E copy
                         "${QT_INSTALL_PATH}/bin/Qt6${QT_LIB}${DEBUG_SUFFIX}.dll"
                         "$<TARGET_FILE_DIR:${PROJECT_NAME}>")
    endforeach (QT_LIB)
  endif ()
endfunction()