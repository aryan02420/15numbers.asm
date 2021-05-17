filBoard proc near
	push	di
	push	bp
	push	ax

	mov	di, gSize
	dec	di
	lea	bp, gState
fb_l1:	mov	ax, di
	mov	[bp+di], al
	dec	di
	cmp	di, 0
	jge	fb_l1

	pop	ax
	pop	bp
	pop	di
	ret
filBoard endp
