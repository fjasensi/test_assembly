# MASM32 Hello World Example

A simple Hello World program written in MASM32 assembly language that displays a message box using the Windows API.

## Prerequisites

- MASM32 SDK installed
- Windows operating system

## Project Structure

```
.
├── hello.asm    # Main assembly program
├── make.bat     # Build automation script
└── README.md    # This file
```

## Assembly Code Explanation

```nasm
.386                    ; Specifies 386 processor or higher
.model flat, stdcall    ; Memory model and calling convention
option casemap:none     ; Case sensitive

; Include Windows API definitions
include \masm32\include\windows.inc    ; Basic Windows definitions
include \masm32\include\kernel32.inc   ; Kernel functions
include \masm32\include\user32.inc     ; User interface functions
includelib \masm32\lib\kernel32.lib    ; Kernel library
includelib \masm32\lib\user32.lib      ; User interface library

.data
    MsgCaption  db "Program", 0        ; Window caption text
    MsgText     db "Hello world from MASM32!", 0  ; Message to display

.code
start:
    ; Show message box
    invoke MessageBox, NULL, addr MsgText, addr MsgCaption, MB_OK
    ; Exit program
    invoke ExitProcess, 0
end start
```

## Build Script Explanation

The `make.bat` script automates the build process:

```batch
@echo off
REM Setup environment variables for MASM32
SET PATH=%PATH%;F:\masm32\bin
SET INCLUDE=F:\masm32\include
SET LIB=F:\masm32\lib

REM Check if a file name was provided
if "%1"=="" (
    echo Use: make file_name [run]
    goto end
)

REM Compile the ASM file
echo Compiling %1.asm...
ml /c /coff %1.asm
if errorlevel 1 (
    echo Compilation error
    goto error
)

REM Link the object file
echo Linking %1.obj...
link /subsystem:windows %1.obj
if errorlevel 1 (
    echo Linking error
    goto error
)

REM Clean up object files
if exist %1.obj del %1.obj

REM Execute if 'run' parameter is provided
if "%2"=="run" (
    echo Running %1.exe...
    start %1.exe
)

echo "Process completed successfully!"
goto end

:error
echo Process has failed
pause

:end
```

## Usage

1. Ensure MASM32 is installed and update the paths in `make.bat` if necessary
2. Open a command prompt
3. Run the build script:
   ```bash
   # To compile only:
   .\make hello
   
   # To compile and run:
   .\make hello run
   ```

## Output

The program will display a Windows message box with the text "Hello world from MASM32!"

## Notes

- Update the MASM32 paths in `make.bat` to match your installation directory
- The script automatically cleans up temporary files after successful compilation
- Error messages will be displayed if compilation or linking fails

## License

This project is open-source and available under the MIT License.