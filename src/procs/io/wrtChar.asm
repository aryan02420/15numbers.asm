; INPUT
; al = char
; bl = attr
proc near
	push	ax
	push	bx
	push	cx

	mov	ah, 09h
	mov	bh, 0
	mov	cx, 1
	int	10h

	pop	cx
	pop	bx
	pop	ax
	ret
endp
