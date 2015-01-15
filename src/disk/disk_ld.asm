;-----------------------------------
;
;	@disk_ld - load from disk
;
;	parameters:
;
;-----------------------------------

%ifndef DISK_LD
	%define DISK_LD
	%include "../print/*"

	disk_ld:
		pusha
		popa
		ret
%endif

