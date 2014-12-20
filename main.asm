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
;.CODE
mov bx, boot_string			; Load address of greeting
call print_sz				; Print @boot_string on screen

mov ax, 1
mov bx, 2
mov cx, 0x35
mov dx, 106
call print_cpu_st			; Print @AX, @BX, @DX, @CX values
jmp endless_loop

%include "print_nl.asm"
%include "print_sz.asm"		; include print_sz procedure
%include "print_hex.asm"		; include print_sz procedure
%include "print_cpu_st.asm"

endless_loop:
	jmp $					; endless loop

;.DATA
boot_string:
	db 'I Love Nastia so much:3',10, 13, 0

times 510-($-$$) db 0
dw 0xaa55					; boot sector signature
