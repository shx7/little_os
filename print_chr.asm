;-----------------------------------
;
;	@print_chr - prints character
;	on screen, using BIOS int 0x10 
;	with proc number 0x0e - print 
;	character in TTY mode
;
;	parameters:
;	@dx - character rvalue 
;	to be printed on screen
;
;-----------------------------------

print_chr:
	pusha
	mov ah, 0x0e				; BIOS print subroutine number
	mov al, dl					; Load symbol from address [bx] = [0x7c00 + string_sz]
	int 0x10					; ELSE Write character in TTY mode
	popa
	ret
