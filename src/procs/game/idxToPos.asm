; INPUT
; ah:al = 0:index
; OUTPUT
; ah:al = col:row = x:y
; LOGIC
; col = index % width
; row = index // width
proc near
	push	bx
	mov	bl, gWidth
	div	bl
	pop	bx
	ret
endp
