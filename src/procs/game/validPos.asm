; INPUT
; ah:al = col:row = x:y
; OUTPUT
; if valid, CF = 0
; if invalid CF = 1
; LOGIC
; assuming unsigned integer
; lhs is always true
; 0 <= col < width
; 0 <= row < height
proc near
	stc
	cmp	ah, gWidth
	jge	@x1
	cmp	al, gHeight
	jge	@x1
	clc
@x1:	ret
endp
