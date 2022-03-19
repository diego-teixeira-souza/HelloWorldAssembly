; ----------------------------------------------------------------------------------------------------
; file: helloworldGUI.asm
; description: A simple program written in 32 bits that display in GUI an Hello World!
; ----------------------------------------------------------------------------------------------------

%define NULL 0
%define MB_OK 0
%define EXIT_CODE 0

section .info									; Linker section
	global	_main								; Define the main entry point
	extern	_MessageBoxA@16						; External Win32API function
    extern	_ExitProcess@4						; External Win32PAI function

section .text									; Code section
	_main:										; Start of Main Program
	
		.prompt:								; Display an prompt with Win32API
		push	DWORD MB_OK						; UINT uType
		push	DWORD tit						; LPCSTR lpCaption
		push 	DWORD msg						; LPCSTR lpText
		push	DWORD NULL						; HWND hWnd
		call 	_MessageBoxA@16					; Display an prompt GUI
		
		.done:									; Return control to the system
		push	dword EXIT_CODE					; UINT uExitCode
		call	_ExitProcess@4					; Windows Exit Process Function
		
section .data									; Initialized variables area
	tit db "Example in GUI", NULL				; Prompt Title
	msg db "Hello World!", NULL					; Hello World message
; ----------------------------------------------------------------------------------------------------
; compiler: nasm -fwin32 -ohelloworldGUI.obj helloworldGUI.asm && gcc -m32 -mwindows -ohelloworldGUI.exe helloworldGUI.obj
; ----------------------------------------------------------------------------------------------------