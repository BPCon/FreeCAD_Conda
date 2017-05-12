cmake . -G "NMake Makefiles" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE="Release"

if errorlevel 1 exit 1
set CL=/MP
nmake install
if errorlevel 1 exit 1
