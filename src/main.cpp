#include <iostream>
#include <thread>
#include <chrono>

#include "b0RemoteApi.h"

int main(int argc, char** argv)
{
    std::cout << "==== Sent by coppelia ====" << std::endl;
    for (int i = 0; i < argc; i++){
        std::cout << argv[i] << std::endl;
    }
    b0RemoteApi client("TutorialRemoteAPIRosClient","b0RemoteApiAddOn");

    std::cout << "==== Retrieved from source code ====" << std::endl;
    std::vector<int> handlers(4);
    handlers[0] = b0RemoteApi::readInt(client.simxGetObjectHandle("transportadorRob_leftMotor", client.simxServiceCall()), 1);
    handlers[1] = b0RemoteApi::readInt(client.simxGetObjectHandle("transportadorRob_rightMotor", client.simxServiceCall()), 1);
    handlers[2] = b0RemoteApi::readInt(client.simxGetObjectHandle("ForceSensor", client.simxServiceCall()), 1);
    handlers[3] = b0RemoteApi::readInt(client.simxGetObjectHandle("carregadorRob_vision", client.simxServiceCall()), 1);
    for (auto h : handlers)
    {
        std::cout << h << std::endl;
    }

    std::this_thread::sleep_for(std::chrono::minutes(2));

    return 0;
}