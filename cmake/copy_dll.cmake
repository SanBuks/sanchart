function(copy_qt_dll target_name)
  if (WIN32 AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(DEBUG_SUFFIX)
    if (MSVC AND CMAKE_BUILD_TYPE MATCHES "Debug")
      set(DEBUG_SUFFIX "d")
    endif ()
    set(QT_INSTALL_PATH "${CMAKE_PREFIX_PATH}")
    if (EXISTS "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll")
      add_custom_command(TARGET ${target_name} POST_BUILD
                         COMMAND ${CMAKE_COMMAND} -E make_directory
                         "$<TARGET_FILE_DIR:${target_name}>/plugins/platforms/")
      add_custom_command(TARGET ${target_name} POST_BUILD
                         COMMAND ${CMAKE_COMMAND} -E copy
                         "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll"
                         "$<TARGET_FILE_DIR:${target_name}>/plugins/platforms/")
    endif ()
    foreach (QT_LIB Core Gui Widgets)
      add_custom_command(TARGET ${target_name} POST_BUILD
                         COMMAND ${CMAKE_COMMAND} -E copy
                         "${QT_INSTALL_PATH}/bin/Qt6${QT_LIB}${DEBUG_SUFFIX}.dll"
                         "$<TARGET_FILE_DIR:${target_name}>")
    endforeach (QT_LIB)
  endif ()
endfunction()

function(copy_custom_dll target_name lib_name)
  add_custom_command(TARGET ${target_name} POST_BUILD COMMAND ${CMAKE_COMMAND}
                     -E copy_if_different $<TARGET_FILE:${lib_name}>
                     $<TARGET_FILE_DIR:${target_name}>)
endfunction()