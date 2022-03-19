; ----------------------------------------------------------------------------------------------------
; file: helloworld.asm
; description: A simple program in 32 bits that display in console an Hello World!
; ----------------------------------------------------------------------------------------------------

%define CHR_NULL 10

section .info									; Linker section
	global _main								; Define the main entry point
	extern _printf								; External referente to C library printf function

section .data									; Initialized variables area
	message db "Hello World!", CHR_NULL			; Hello World message

section .text									; Code section
	_main:										; Start of Main Program
		push 	message							; Put in Stack the address of message
		call	_printf							; Call the external C function printf
		add		esp, 4							; Remove from stack the message
		ret										; Return control to system
; ----------------------------------------------------------------------------------------------------
; compiler: nasm -fwin32 helloworld.asm -o helloworld.obj && gcc -m32 helloworld.obj -ohelloworld.exe && helloworld.exe
; ----------------------------------------------------------------------------------------------------