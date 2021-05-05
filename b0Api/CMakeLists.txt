add_library(b0Api b0RmoteApi.cpp)

target_include_directories(b0Api INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}
)

install(TARGETS b0Api DESTINATION lib)
install(TARGETS b0RemoteApi.h DESTINATION include)