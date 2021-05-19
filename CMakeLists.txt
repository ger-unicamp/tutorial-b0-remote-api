cmake_minimum_required(VERSION 3.16)

project(tutorial-remote-api-ros2 VERSION 0.1)

# Enable c++ 17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED)

# Include coppeliasim remoteapi directory
set(COPPELIA_ROOT_DIR "/home/pc/Apps/CoppeliaSim_Edu")

set(COPPELIA_PROGRAMMING_DIR "${COPPELIA_ROOT_DIR}/programming") 

set(COPPELIA_B0BASED_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/cpp")
set(COPPELIA_MSGPACK_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/cpp/msgpack-c/include")
set(COPPELIA_B0INCLUDE_DIR "${COPPELIA_PROGRAMMING_DIR}/bluezero/include/b0/bindings")  

include_directories(tutorial-remote-api-ros2 ${COPPELIA_B0BASED_DIR})
include_directories(tutorial-remote-api-ros2 ${COPPELIA_MSGPACK_DIR})
include_directories(tutorial-remote-api-ros2 ${COPPELIA_B0INCLUDE_DIR})

# Add executable with coppelia's extApi
add_executable(tutorial-remote-api-ros2  "src/main.cpp" "${COPPELIA_B0BASED_DIR}/b0RemoteApi.cpp")

target_include_directories(tutorial-remote-api-ros2
    PUBLIC "${PROJECT_BINARY_DIR}"
)

target_link_libraries(tutorial-remote-api-ros2 b0 boost_system)