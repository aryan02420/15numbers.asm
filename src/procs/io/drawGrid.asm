drawGrid proc near

	mov	cx, gSize		; cx = 16	; index
	dec	cx			; cx = 15	; zero based indexing
	mov	dx, cx			; dx = 15	; empty value

	lea	si, gState		; si = [0]
	add	si, cx			; si = [15]
	lea	di, gSymb		; di = [0]

	mov	bl, 00010111b		; bg = Blue 	; fg = bWhite

	mov	ax, cx			; ax = index
	call	idxToPos		; ax = pos
	call	setCursr
	mov	bp, [si]		; bp = val	; get val from gState
	cmp	bp, dx			; skip if empty val
	je	dg_x1
	mov	al, [bp+di]		; al = di[val]	; get symbol from gSymb
	call	wrtChar

	ret
drawGrid endp
