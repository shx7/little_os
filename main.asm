;-----------------------------------
;
;	Little OS
;
;	Now is just x86 bare-metal 
;	application with BIOS ints 
;	tests
;
;	AUTHOR: 
;		Lyblinskii Alexander, 2014
;-----------------------------------
mov bx, boot_string			; Load address of greeting
call print_sz				; Print @boot_string on screen
jmp endless_loop

%include "print_sz.asm"		; include print_sz procedure

endless_loop:
	jmp $					; endless loop

boot_string:
	db 'I Love Nastia so much:3', 0

times 510-($-$$) db 0
dw 0xaa55					; boot sector signature
