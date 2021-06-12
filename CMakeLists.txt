cmake_minimum_required(VERSION 3.0)

project(tutorial-remote-api-ros2 VERSION 0.1)

# Enable c++ 17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED)

# configuracao do Linux (testada no Ubuntu 20.04)
if(UNIX AND NOT APPLE)
    set(LINUX TRUE)
elseif(WIN32)
    set(WINDOWS TRUE)
endif()
    
if(LINUX)
    set(COPPELIA_ROOT_DIR "$ENV{HOME}/CoppeliaSim_Edu")
    set(COPPELIA_PROGRAMMING_DIR "${COPPELIA_ROOT_DIR}/programming") 
    set(COPPELIA_B0BASED_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/cpp")
    set(COPPELIA_MSGPACK_DIR "${COPPELIA_B0BASED_DIR}/msgpack-c/include")
    set(COPPELIA_B0INCLUDE_DIR "${COPPELIA_PROGRAMMING_DIR}/bluezero/include/b0/bindings")  
endif()

if(WINDOWS)
    set(COPPELIA_ROOT_DIR "C:/Program Files/CoppeliaRobotics/CoppeliaSimEdu")
    set(COPPELIA_PROGRAMMING_DIR "${COPPELIA_ROOT_DIR}/programming")
    set(COPPELIA_B0BASED_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/cpp")
    set(COPPELIA_MSGPACK_DIR "${COPPELIA_B0BASED_DIR}/msgpack-c/include")
    set(COPPELIA_B0INCLUDE_DIR "${COPPELIA_PROGRAMMING_DIR}/bluezero/include/b0/bindings")
    set(BOOST_DIR "C:/dev/boost_1_76_0") # caminho no pc do natan (vamos tentar padronizar)
    add_compile_options(-DWIN2 -D_WINDOWS -DNDEBUG)
endif()

include_directories(${COPPELIA_B0BASED_DIR})
include_directories(${COPPELIA_MSGPACK_DIR})
include_directories(${COPPELIA_B0INCLUDE_DIR})
include_directories(${COPPELIA_ROOT_DIR})
if(WINDOWS)
    include_directories(${BOOST_DIR})
endif()

# Add executable with coppelia's extApi
link_directories(SHARED ${COPPELIA_ROOT_DIR})
add_executable(tutorial-remote-api-ros2 src/main.cpp ${COPPELIA_B0BASED_DIR}/b0RemoteApi.cpp)
target_include_directories(tutorial-remote-api-ros2
    PUBLIC src/
    PUBLIC ${COPPELIA_ROOT_DIR} # pasta raiz do Coppelia e localizacao do boost
    PUBLIC ${COPPELIA_B0BASED_DIR} # pasta do b0
    PUBLIC ${COPPELIA_MSGPACK_DIR} # do msgpack
    PUBLIC ${COPPELIA_B0INCLUDE_DIR} # do c.h
    if(WINDOWS) PUBLIC ${BOOST_DIR} endif() # pasta raiz do boost no windows
)

if(LINUX)
    target_link_libraries(tutorial-remote-api-ros2 b0 boost_system)
elseif(WINDOWS)
    target_link_libraries(tutorial-remote-api-ros2 b0)
endif()

