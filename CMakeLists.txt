cmake_minimum_required(VERSION 3.0)

project(tutorial-remote-api-ros2 VERSION 0.1)

add_subdirectory(b0Api)
list(APPEND INCLUDE_LIBS b0Api)

add_executable(tutorial_remoteApi_ros2 "src/main.cpp")

target_link_libraries(tutorial_remoteApi_ros2
    PUBLIC ${INCLUDE_LIBS}
)

target_include_directories(tutorial_remoteApi_ros2
    PUBLIC "${PROJECT_BINARY_DIR}"
)