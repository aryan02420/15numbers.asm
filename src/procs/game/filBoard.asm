proc near
	push	di
	push	bp
	push	ax

	; fill gState
	mov	di, word ptr [gSize]
	dec	di
	lea	bp, gState
@l1:	mov	ax, di
	mov	[bp+di], al
	dec	di
	cmp	di, 0
	jge	@l1

	; set empty block
	mov	ah, byte ptr [gWidth]
	dec	ah
	mov	al, byte ptr [gHeight]
	dec	al
	mov	word ptr [gEmpty], ax


	pop	ax
	pop	bp
	pop	di
	ret
endp
