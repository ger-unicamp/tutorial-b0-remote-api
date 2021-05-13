cmake_minimum_required(VERSION 3.20)

project(tutorial-remote-api-ros2 VERSION 0.1)

# Enable c++ 17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED)

# Include coppeliasim remoteapi directory
set(COPPELIA_PROGRAMMING_DIR "C:/Program Files/CoppeliaRobotics/CoppeliaSimEdu/programming")
message(STATUS "Trying to link Coppelia's programming subdirectory: ${COPPELIA_PROGRAMMING_DIR}")
set(COPPELIA_B0BASED_DIR "${COPPELIA_PROGRAMMING_DIR}/remoteApiBindings/b0Based/cpp")
set(COPPELIA_MSGPACK_DIR "${COPPELIA_PROGRAMMING_DIR}/remoteApiBindings/b0Based/cpp/msgpack-c/include")
set(COPPELIA_B0INCLUDE_DIR "${COPPELIA_PROGRAMMING_DIR}/blueZero/include/b0/bindings")
set(BOOST_LIBRARY "")
include_directories(tutorial-remote-api-ros2 ${COPPELIA_B0BASED_DIR})
include_directories(tutorial-remote-api-ros2 ${COPPELIA_MSGPACK_DIR})
include_directories(tutorial-remote-api-ros2 ${BOOST_LIBRARY})

# Add executable with coppelia's extApi
add_executable(tutorial-remote-api-ros2  "src/main.cpp" "${COPPELIA_B0BASED_DIR}/b0RemoteApi.cpp")

target_include_directories(tutorial-remote-api-ros2
    PUBLIC "${PROJECT_BINARY_DIR}"
)

target_link_libraries(tutorial-remote-api-ros2 b0)