; INPUT
; ax = index
; bp =
; si = gState[0]
; di = gSymb[0]
; cx = empty block value
drawBloc proc near
	pusha

	mov	bl, 00011111b		; bg = Blue 	; fg = bWhite

	mov	bp, ax
	mov	dl, [bp+si]		; dx = val	; get val from gState
	mov	dh, 0
	mov	bp, dx			; bp = val
	cmp	bp, cx			; skip if empty val
	je	db_x1
	call	idxToPos		; ax = pos
	call	setCursr
	mov	al, [bp+di]		; al = di[val]	; get symbol from gSymb
	call	wrtChar

db_x1:	popa
	ret
drawBloc endp
