proc near
	push	ax
	mov	al, oDispM
	mov	ah, 0
	int	10h
	pop	ax
	ret
endp
