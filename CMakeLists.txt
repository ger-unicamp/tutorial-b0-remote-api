cmake_minimum_required(VERSION 3.0)

project(tutorial-remote-api-ros2 VERSION 0.1)

# Enable c++ 17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED)

# Include coppeliasim remoteapi directory
#set(COPPELIA_ROOT_DIR "C:/Program Files/CoppeliaRobotics/CoppeliaSimEdu")
#set(COPPELIA_PROGRAMMING_DIR "${COPPELIA_ROOT_DIR}/programming")
#set(COPPELIA_B0BASED_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/b0Based/cpp")
#set(COPPELIA_MSGPACK_DIR "${COPPELIA_PROGRAMMING_DIR}/b0RemoteApiBindings/b0Based/cpp/msgpack-c/include")
#set(COPPELIA_B0INCLUDE_DIR "${COPPELIA_PROGRAMMING_DIR}/blueZero/include/b0/bindings")
#set(BOOST_LIBRARY "C:/dev/boost_1_76_0")

#include_directories(tutorial-remote-api-ros2 ${COPPELIA_B0BASED_DIR})
#include_directories(tutorial-remote-api-ros2 ${COPPELIA_MSGPACK_DIR})
#include_directories(tutorial-remote-api-ros2 ${BOOST_LIBRARY})
#include_directories(tutorial-remote-api-ros2 ${COPPELIA_ROOT_DIR})

#add_compile_options(-DWIN2 -D_WINDOWS -DNDEBUG)


# configuracao do Linux (testada no Ubuntu 20.04)
# nao sei pq os tokens nao estao funcionando, tenho q escrever o caminho completo em tudo q teoricamente era so colocar eles
if (LINUX)
    set(COPPELIA_ROOT_DIR "$ENV{HOME}/CoppeliaSim_Edu")
    set(COPPELIA_PROGRAMMING_DIR "$ENV{HOME}/CoppeliaSim_Edu/programming") 
    set(COPPELIA_B0BASED_DIR "$ENV{HOME}/CoppeliaSim_Edu/programming/b0RemoteApiBindings/cpp")
    set(COPPELIA_MSGPACK_DIR "$ENV{HOME}/CoppeliaSim_Edu/programming/b0RemoteApiBindings/cpp/msgpack-c/include")
    set(COPPELIA_B0INCLUDE_DIR "$ENV{HOME}/CoppeliaSim_Edu/programming/bluezero/include/b0/bindings")  
    include_directories(${COPPELIA_B0BASED_DIR})
    include_directories(${COPPELIA_MSGPACK_DIR})
    include_directories(${COPPELIA_B0INCLUDE_DIR})
    include_directories(${COPPELIA_ROOT_DIR})
endif()
#>>>>>>> 6a79ee87c87322932797605ef1ffe503b9dcd8a2

# Add executable with coppelia's extApi
link_directories(SHARED $ENV{HOME}/CoppeliaSim_Edu)
add_executable(tutorial-remote-api-ros2 src/main.cpp $ENV{HOME}/CoppeliaSim_Edu/programming/b0RemoteApiBindings/cpp/b0RemoteApi.cpp)
target_include_directories(tutorial-remote-api-ros2
    PUBLIC src/
    PUBLIC $ENV{HOME}/CoppeliaSim_Edu # pasta raiz do Coppelia
    PUBLIC $ENV{HOME}/CoppeliaSim_Edu/programming/b0RemoteApiBindings/cpp # pasta do b0
    PUBLIC $ENV{HOME}/CoppeliaSim_Edu # pasta da lib boost
    PUBLIC $ENV{HOME}/CoppeliaSim_Edu/programming/b0RemoteApiBindings/cpp/msgpack-c/include # do msgpack
    PUBLIC $ENV{HOME}/CoppeliaSim_Edu/programming/bluezero/include/b0/bindings # do c.h
)

target_link_libraries(tutorial-remote-api-ros2 b0 boost_system)