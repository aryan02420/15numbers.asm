proc near
	push	di, bp, ax

	; fill gState
	di = word ptr [gSize]
	di--
	lea	bp, gState
@l1:	ax = di
	[bp + di] = al
	di--
	cmp	di, 0
	jge	@l1

	; set empty block
	ah = byte ptr [gWidth]
	ah--
	al = byte ptr [gHeight]
	al--
	word ptr [gEmpty] = ax


	pop	ax, bp, di
	ret

endp