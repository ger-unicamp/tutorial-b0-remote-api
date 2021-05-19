<<<<<<< HEAD
cmake_minimum_required(VERSION 3.0)
=======
cmake_minimum_required(VERSION 3.16)
>>>>>>> 6a79ee87c87322932797605ef1ffe503b9dcd8a2

project(tutorial-remote-api-ros2 VERSION 0.1)

# Enable c++ 17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED)

# Include coppeliasim remoteapi directory
<<<<<<< HEAD
set(COPPELIA_ROOT_DIR "C:/Program Files/CoppeliaRobotics/CoppeliaSimEdu")
set(COPPELIA_PROGRAMMING_DIR "${COPPELIA_ROOT_DIR}/programming")
set(COPPELIA_B0BASED_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/b0Based/cpp")
set(COPPELIA_MSGPACK_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/b0Based/cpp/msgpack-c/include")
set(COPPELIA_B0INCLUDE_DIR "${COPPELIA_PROGRAMMING_DIR}/blueZero/include/b0/bindings")
set(BOOST_LIBRARY "C:/dev/boost_1_76_0")

include_directories(tutorial-remote-api-ros2 ${COPPELIA_B0BASED_DIR})
include_directories(tutorial-remote-api-ros2 ${COPPELIA_MSGPACK_DIR})
include_directories(tutorial-remote-api-ros2 ${BOOST_LIBRARY})
include_directories(tutorial-remote-api-ros2 ${COPPELIA_ROOT_DIR})

add_compile_options(-DWIN2 -D_WINDOWS -DNDEBUG)
=======
set(COPPELIA_ROOT_DIR "/home/pc/Apps/CoppeliaSim_Edu")

set(COPPELIA_PROGRAMMING_DIR "${COPPELIA_ROOT_DIR}/programming") 

set(COPPELIA_B0BASED_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/cpp")
set(COPPELIA_MSGPACK_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/cpp/msgpack-c/include")
set(COPPELIA_B0INCLUDE_DIR "${COPPELIA_PROGRAMMING_DIR}/bluezero/include/b0/bindings")  

include_directories(tutorial-remote-api-ros2 ${COPPELIA_B0BASED_DIR})
include_directories(tutorial-remote-api-ros2 ${COPPELIA_MSGPACK_DIR})
include_directories(tutorial-remote-api-ros2 ${COPPELIA_B0INCLUDE_DIR})
>>>>>>> 6a79ee87c87322932797605ef1ffe503b9dcd8a2

# Add executable with coppelia's extApi
add_executable(tutorial-remote-api-ros2  "src/main.cpp" "${COPPELIA_B0BASED_DIR}/b0RemoteApi.cpp")

target_include_directories(tutorial-remote-api-ros2
    PUBLIC "${PROJECT_BINARY_DIR}"
    PUBLIC "${COPPELIA_ROOT_DIR}"
    PUBLIC "${BOOST_LIBRARY}"
)

target_link_libraries(tutorial-remote-api-ros2 b0 boost_system)