.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
    MsgCaption  db "Program", 0
    MsgText     db "Hello world from MASM32!", 0

.code
start:
    invoke MessageBox, NULL, addr MsgText, addr MsgCaption, MB_OK
    invoke ExitProcess, 0
end start