; INPUT
; ah:al = col:row = x:y
; OUTPUT
; ah:al = 0:index
; LOGIC
; index = col + width*row
posToIdx proc near
	push	cx
	push	bx
	mov	cl, gWidth
	mov	bl, ah
	mul	cl
	add	al, bl
	pop	bx
	pop	cx
	ret
posToIdx endp
