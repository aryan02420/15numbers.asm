; INPUT
; ah:al = col:row = x:y
; OUTPUT
; if valid, CF = 0
; if invalid CF = 1
; LOGIC
; 0 <= col < width
; 0 <= row < height
validPos proc near
	stc
	cmp	ah, 0
	jb	vp_x1
	cmp	ah, gWidth
	jge	vp_x1
	cmp	al, 0
	jb	vp_x1
	cmp	al, gHeight
	jge	vp_x1
	clc
vp_x1:	ret
validPos endp
