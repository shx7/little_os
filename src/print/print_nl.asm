;-----------------------------------
;
;	@print_nl - prints new line
;
;-----------------------------------

%ifndef PRINT_NL
	%define PRINT_NL
	%include "print_sz.asm"	

	print_nl:
		pusha
		mov bx, sz_new_line
		call print_sz
		popa
		ret

	sz_new_line:
		db 10, 13, 0
%endif

