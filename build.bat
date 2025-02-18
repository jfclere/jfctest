del /s /f /q build-64
mkdir build-64

ver | findstr "10.0" &&  goto new

echo "Win7"
PATH=%PATH%;C:\Program Files (x86)\CMake 2.8\bin;C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\amd64;C:\Windows\Microsoft.NET\Framework64\v4.0.30319

call vcvars64
cd build-64
cmake -G "Visual Studio 11" ^
c:\Tools\SOURCES\jfctest
goto next

:new

PATH=%PATH%;C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;C:\Tools\VS\2017b\VC\Auxiliary\Build;C:\Tools\VS\2017b\MSBuild\15.0\Bin

call vcvars64

REM Does nothing ? SET CL=/D _WIN32_WINNT=0x0601 /D WINVER=0x0601

cd build-64
cmake -G "Visual Studio 15 2017 Win64" ^
c:\Tools\SOURCES\jfctest

:next
MSBuild ALL_BUILD.vcxproj -t:build -p:Configuration=Release
