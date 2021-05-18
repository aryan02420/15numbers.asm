proc near
	push	di
	push	bp
	push	ax

	mov	di, gSize
	dec	di
	lea	bp, gState
@l1:	mov	ax, di
	mov	[bp+di], al
	dec	di
	cmp	di, 0
	jge	@l1

	pop	ax
	pop	bp
	pop	di
	ret
endp
