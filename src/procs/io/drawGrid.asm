drawGrid proc near
	push	ax
	push	dx
	push	si
	push	di

	mov	ax, 0			; ax = 0	; index
	mov	dx, gSize
	dec	dx			; dx = 15	; empty value

	lea	si, gState		; si = [0]
	lea	di, gSymb		; di = [0]

dg_l1:	call	drawBloc		; ax = index
	inc	ax
	cmp	ax, dx
	jbe	dg_l1

	pop	di
	pop	si
	pop	dx
	pop	ax
	ret
drawGrid endp
