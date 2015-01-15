;-----------------------------------
;
;	@print_chr - prints character
;	on screen, using BIOS int 0x10 
;	with proc number 0x0e - print 
;	character in TTY mode
;
;	parameters:
;	@DX - character rvalue 
;	to be printed on screen
;
;-----------------------------------
%ifndef PRINT_CHR
	%define PRINT_CHR

	print_chr:
		pusha
		mov ah, 0x0e				; BIOS print subroutine number
		mov al, dl					; Load symbol from address [bx] = [0x7c00 + string_sz]
		int 0x10					; ELSE Write character in TTY mode
		popa
		ret
%endif
