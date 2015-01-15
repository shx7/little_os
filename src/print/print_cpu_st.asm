;-----------------------------------
;
;	@print_cpu_st - prints an state
;	of all cpu registers:
;	@AX, @BX, @CX, @DX, 
;	@DS, @CS, @SS, @ES
;
;-----------------------------------
%ifndef PRINT_CPU_ST
	%define PRINT_CPU_ST
	%include "print_sz.asm"
	%include "print_nl.asm"

	print_cpu_st:
		pusha								
		; Sequentially store general purpose regs
		; in stack to print it
		push es								; Segment regs
		push ss
		push cs
		push ds

		push dx								; General purpose regs
		push cx
		push bx
		push ax

		mov bx, sz_p_cpu_greeting			; Print greeting
		call print_sz

		mov cx, 0							; @CX contain regs count

		p_cpu_st_print_loop:
			cmp cx, 8						; IF (all registers printed) than
			je p_cpu_st_ret					; RETURN

			mov ax, cx						; Print current register label
			mov bx, 5
			mul bx 
			mov bx, sz_p_cpu_st_data_regs
			add bx, ax
			call print_sz

			pop dx							; Print reg value 
			call print_hex

			call print_nl					; Print new line

			inc cx
			inc bx
			jmp p_cpu_st_print_loop
		
		p_cpu_st_ret:
		popa
		ret


	sz_p_cpu_st_data_regs:
		db 'AX: ', 0
		db 'BX: ', 0
		db 'CX: ', 0
		db 'DX: ', 0
		db 'DS: ', 0
		db 'CS: ', 0
		db 'SS: ', 0
		db 'ES: ', 0

	sz_p_cpu_greeting:
		db 'CPU state:', 13, 10, 0

%endif

