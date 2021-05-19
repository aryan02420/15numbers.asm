; INPUT
; ah:al = col:row = direction = 0:1|0:-1|1:0|-1:0
; OUTPUT
; if valid, CF = 0
; if invalid CF = 1
proc near
	stc
	cmp	ax, 00001h
	je	@x1
	cmp	ax, 000ffh
	je	@x1
	cmp	ax, 00100h
	je	@x1
	cmp	ax, 0ff00h
	je	@x1
	jmp	@x2
@x1:	clc
@x2:	ret
endp
