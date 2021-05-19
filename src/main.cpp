#include <iostream>
#include "b0RemoteApi.h"

int main(int argc, char** argv)
{
    std::cout << "Hello World" << std::endl;
    for (int i = 0; i < argc; i++){
        std::cout << argv[i] << std::endl;
    }
    b0RemoteApi client("TutorialRemoteAPIRosClient","TutorialRemoteAPI");
}