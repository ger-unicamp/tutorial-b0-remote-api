@ECHO ON

set VCVARSALL_STRING="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

if not defined COPPELIA_ROOT_DIR (
    set COPPELIA_ROOT_DIR="C:\Program Files\CoppeliaRobotics\CoppeliaSimEdu"
)
set COPPELIA_PROGRAMMING_DIR=%COPPELIA_ROOT_DIR%\programming
echo %COPPELIA_PROGRAMMING_DIR%

set COMPILER_FLAGS=/W3 /O1 /EHsc /c /std:c++17
set COMPILER_DEFINES=/D "WIN32" /D "_WINDOWS" /D "NDEBUG"
set COMPILER_INCLUDES=/I%COPPELIA_PROGRAMMING_DIR%\blueZero\include\b0\bindings /I%COPPELIA_PROGRAMMING_DIR%\b0RemoteApiBindings\cpp /I%COPPELIA_PROGRAMMING_DIR%\b0RemoteApiBindings\cpp\msgpack-c\include /I"C:\local\boost_1_76_0"
set COMPILERSTRING=%COMPILER_INCLUDES% %COMPILER_DEFINES% %COMPILER_FLAGS%

REM  b0.lib is normally located in the same folder as coppeliaSim.exe
set LINKER_LIBS=%COPPELIA_ROOT_DIR%"\b0.lib"
set LINKERSTRING=/OUT:"tutorial_remoteApi_ros2" %LINKER_LIBS%

if not defined DevEnvDir (
    call %VCVARSALL_STRING%
)

cl .\src\main.cpp %COMPILERSTRING%
cl %COPPELIA_PROGRAMMING_DIR%\b0RemoteApiBindings\cpp\b0RemoteApi.cpp %COMPILERSTRING%
link main.obj b0RemoteApi.obj %LINKERSTRING%
