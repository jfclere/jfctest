del /s /f /q build-64
mkdir build-64

PATH=%PATH%;C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Tools\VS\2017b\VC\Auxiliary\Build;C:\Tools\VS\2017b\MSBuild\15.0\Bin

call vcvars64

SET CL=/D _WIN32_WINNT=0x0601 /D WINVER=0x0601

cd build-64
cmake -G "Visual Studio 15 2017 Win64" ^
c:\Tools\SOURCES\jfctest

MSBuild ALL_BUILD.vcxproj -t:build -p:Configuration=Release
