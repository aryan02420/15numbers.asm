; INPUT
; ax = index
; bp =
; si = gState[0]
; di = gSymb[0]
; dx = empty block value
drawBloc proc near
	mov	bl, 00010111b		; bg = Blue 	; fg = bWhite

	mov	bp, ax
	mov	al, [bp+si]		; ax = val	; get val from gState
	mov	ah, 0
	mov	bp, ax
	; cmp	bp, dx			; skip if empty val
	; je	db_x1
	call	idxToPos		; ax = pos
	call	setCursr
	mov	al, [bp+di]		; al = di[val]	; get symbol from gSymb
	call	wrtChar

db_x1:	ret
drawBloc endp
