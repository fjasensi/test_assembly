REM ---- make.bat - Run script with options ----
@echo off
REM Setup environ variables
SET PATH=%PATH%;F:\masm32\bin
SET INCLUDE=F:\masm32\include
SET LIB=F:\masm32\lib

REM Check if a file name was provided
if "%1"=="" (
    echo Use: make file_name [run]
    goto end
)

REM Compile
echo Compiling %1.asm...
ml /c /coff %1.asm
if errorlevel 1 (
    echo Compilation error
    goto error
)

REM Link
echo Linking %1.obj...
link /subsystem:windows %1.obj
if errorlevel 1 (
    echo Linking error
    goto error
)

REM Clean temporary files
if exist %1.obj del %1.obj

REM Execute if 'run' parameter is provided
if "%2"=="run" (
    echo Running %1.exe...
    start %1.exe
)

echo "Process completed successfully!
goto end

:error
echo Process has failed
pause

:end