; INPUT
; ah:al = col:row = x:y
; OUTPUT
; ah:al = 0:index
; LOGIC
; index = col + width*row
proc near
	push	cx
	push	bx
	mov	cl, byte ptr [gWidth]
	mov	bl, ah
	mul	cl
	add	al, bl
	pop	bx
	pop	cx
	ret
endp
