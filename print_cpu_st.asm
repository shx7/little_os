;-----------------------------------
;
;	@print_cpu_st - prints an state
;	of all cpu registers
;
;-----------------------------------
%ifndef PRINT_CPU_ST
	%define PRINT_CPU_ST
	%include "print_sz.asm"
	%include "print_nl.asm"

	print_cpu_st:
		pusha								
		
		push dx								; Sequentially store general purpose regs
		push cx								; in stack to print it
		push bx
		push ax

		mov cx, 0							; @CX contain regs count

		p_cpu_st_print_loop:
			cmp cx, 4						; IF cx == 4 than
			je p_cpu_st_ret					; RETURN

			mov ax, cx						; Calculate offset for next register string
			mov bx, 5
			mul bx

			mov bx, sz_p_cpu_st_data_regs	; Load to @BX address of first reg 
			add bx, ax						; Calculate real address of reg string
			call print_sz

			pop dx							; Load next reg value
			call print_hex					; Write reg state

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

%endif

