# coloque o diretório da pasta do Coppelia na sua máquina
COPPELIA_DIR=$HOME/CoppeliaSim_Edu

# localizações das libs, cpp e hpp necessários 
LOCATION_OF_B0_C_API=$COPPELIA_DIR/programming/bluezero/include/b0/bindings
LOCATION_OF_B0_LIB=$COPPELIA_DIR
LOCATION_OF_MSGPACK=$COPPELIA_DIR/programming/b0RemoteApiBindings/cpp/msgpack-c/include
LOCATION_OF_B0_REMOTE_API=$COPPELIA_DIR/programming/b0RemoteApiBindings/cpp

# compilando os códigos e gerando o executável
g++ -c -o b0RemoteApi.o $LOCATION_OF_B0_REMOTE_API/b0RemoteApi.cpp -I$LOCATION_OF_MSGPACK -I$LOCATION_OF_B0_C_API
g++ -c -o main.o src/main.cpp -I$LOCATION_OF_B0_REMOTE_API -I$LOCATION_OF_MSGPACK -I$LOCATION_OF_B0_C_API
g++ -o tutorial_remoteApi_ros2 main.o b0RemoteApi.o -L$LOCATION_OF_B0_LIB -lb0 -lboost_system
rm *.o