proc near
	pusha

	mov	ax, 0			; ax = 0	; index
	mov	cx, gSize
	dec	cx			; cx = 15	; empty value and total blocks

	lea	si, gState		; si = [0]
	lea	di, gSymb		; di = [0]

@l1:	call	drawBloc		; ax = index
	inc	ax
	cmp	ax, cx
	jbe	@l1

	mov	ah, 40
	mov	al, 25
	call	setCursr		; move cursor outside screen to hide

	popa
	ret
endp
