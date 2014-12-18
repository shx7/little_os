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
	mov ah, 0x0e				; BIOS print subroutine number
	add bx, 0x7c00					; Add offset of boot program for loaded in bx string address

	print_sz_print_loop:
		mov al, [bx]				; Load symbol from address [bx] = [0x7c00 + string_sz]
		cmp al, 0					; IF nul symbol
		je print_sz_ret				; return from proc
		int 0x10					; ELSE Write character in TTY mode
		inc bx						; get next symbol address
		jmp print_sz_print_loop		; jmp to start of printing loop

	print_sz_ret:
	popa
	ret
