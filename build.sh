#!/bin/bash

#LOCATION_OF_B0_C_API=/home/pc/Apps/CoppeliaSim_Edu/programming/bluezero/include/b0/bindings
#LOCATION_OF_B0_LIB=/home/pc/Apps/CoppeliaSim_Edu #libb0.so is normally located in the same folder as coppeliaSim.sh. libb0.dylib is normally located in coppeliaSim.app/Contents/Frameworks/
#g++ -std=c++11 -I$LOCATION_OF_B0_C_API -I /home/pc/Apps/CoppeliaSim_Edu/programming/b0RemoteApiBindings/cpp/msgpack-c/include -I.. ../b0RemoteApi.cpp testing.cpp -L$LOCATION_OF_B0_LIB -lb0 -lboost_system -o testing

LOCATION_OF_B0_C_API=/home/pc/CoppeliaSim_Edu_V4_2_0_Ubuntu20_04/programming/bluezero/include/b0/bindings
LOCATION_OF_B0_LIB=/home/pc/CoppeliaSim_Edu_V4_2_0_Ubuntu20_04 #libb0.so is normally located in the same folder as coppeliaSim.sh. libb0.dylib is normally located in coppeliaSim.app/Contents/Frameworks/
LOCATION_OF_MSGPACK=/home/pc/CoppeliaSim_Edu_V4_2_0_Ubuntu20_04/programming/b0RemoteApiBindings/cpp/msgpack-c/include
LOCATION_OF_B0_REMOTE_API=/home/pc/CoppeliaSim_Edu_V4_2_0_Ubuntu20_04/programming/b0RemoteApiBindings/cpp/

g++ -c -o b0RemoteApi.o $LOCATION_OF_B0_REMOTE_API/b0RemoteApi.cpp -I$LOCATION_OF_MSGPACK -I$LOCATION_OF_B0_C_API
g++ -c -o main.o src/main.cpp -I$LOCATION_OF_B0_REMOTE_API -I$LOCATION_OF_MSGPACK -I$LOCATION_OF_B0_C_API
g++ -o tutorial_remoteApi_ros2 main.o b0RemoteApi.o -L$LOCATION_OF_B0_LIB -lb0 -lboost_system
