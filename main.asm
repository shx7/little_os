mov ah, 0x0e			; BIOS print subroutine number

mov bx, 0x7c00			; Start address of bare-metal app
add bx, boot_string		; Load address of greeting string

print_greeting:
	mov al, [bx]
	cmp al, 0
	je endless_loop
	int 0x10			; Call BIOS print character int TTY mode procedure
	inc bx
	jmp print_greeting

endless_loop:
	jmp $				; endless loop

boot_string:
	db 'I Love Nastia so much:3', 0

times 510-($-$$) db 0
dw 0xaa55	; bootloader signature
