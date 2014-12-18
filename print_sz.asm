;-----------------------------------
;
;	@print_sz - prints string zero 
;	on screen, using BIOS int 0x10 
;	with proc number 0x0e - print 
;	character in TTY mode
;
;	parameters:
;	@bx - address of string zero
;
;-----------------------------------
print_sz:
	pusha
	add bx, 0x7c00					; Calculate effective address of @string_sz, means
									; Addition loaded in @bx string address offset 
									; with offset of program(0x7c00) 

	print_sz_print_loop:
		mov dx, [bx]				; Load next symbol from address @bx 
		cmp dx, 0					; IF nul symbol
		je print_sz_ret				; exit from proc
		call print_chr				
		inc bx						; Get addres of next character
		jmp print_sz_print_loop		; jmp to start of printing loop

	print_sz_ret:
	popa
	ret

%include "print_chr.asm"			; Include procedure to pu character to screen
