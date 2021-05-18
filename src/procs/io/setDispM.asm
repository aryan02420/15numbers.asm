proc near
	mov	ah, 0fh
	int	10h
	mov	oDispM, al
	mov	ah, 00h
	mov	al, 00h
	int	10h
	ret
endp
