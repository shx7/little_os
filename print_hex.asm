;-----------------------------------
;
;	@print_hex - prints hex value
;	on screen, using BIOS int 0x10 
;	with proc number 0x0e - print 
;	character in TTY mode
;
;	parameters:
;	@DX - hex rvalue 
;	to be printed on screen
;
;-----------------------------------
%ifndef PRINT_HEX
	%define PRINT_HEX
	%include "print_sz.asm"			; Include procedure to put character to screen

	print_hex:
		pusha
		
		mov bx, print_hex_start_string	; Print '0x'
		call print_sz

		; Get all 4-bit hex values from @DX 
		; and push em to stack in inverse order

		mov cx, 4						; @CX contains count of hex bytes in @DX(4)
		print_hex_reorder_hex:			; Pushes all hex values in stack to be printed
										; in right order
			xor ax, ax
			mov al, dl					; @AL contain 2x hex values
			and al, 0xf					; @AL contain one hex value
			push ax						; Save current hex value in stack
			shr dx, 4					; Right arithmetic shift @DX for 4 bits
			dec cx						; Decrement counter
			cmp cx, 0					; IF NOT all hex values in stack than continue
			jg print_hex_reorder_hex

		; Pop hex values from stack and print them in right order
		mov cx, 4
		print_hex_loop:
			cmp cx, 0
			je print_hex_ret
			dec cx
			xor ax, ax
			pop ax						; Load next hex value from stack
			cmp al, 0xa					; IF hex value >= 0xA then
			jge print_hex_print_chr		; print char
			jmp print_hex_print_digit	; ELSE print digit

		; Print character hex digit
		print_hex_print_digit:			; Print digit '0' - '9'
			xor dx, dx
			mov dl, al					; Load @DX with hex byte to be printed
			add dl, '0'					; Calculate ASCII character code
			call print_chr				; Print character
			jmp print_hex_loop

		; Print numeric hex digit
		print_hex_print_chr:			; Print char 'A' - 'F'
			xor dx, dx
			mov dl, al					; Load @DX with hex byte to be printed
			sub dl, 0xa					; Get offset for ACSII code
			add dl, 'A'					; Calculate ASCII character code
			call print_chr				; Print character
			jmp print_hex_loop

		print_hex_ret:					; RETURN
		popa
		ret 
		
		print_hex_start_string:
			db '0x', 0

%endif
