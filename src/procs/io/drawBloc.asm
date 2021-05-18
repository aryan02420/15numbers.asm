; INPUT
; ax = index
; bp =
; si = gState[0]
; di = gSymb[0]
; cx = empty block value
proc near
	pusha

	mov	bl, 00011111b		; bg = Blue 	; fg = bWhite

	mov	bp, ax
	mov	dl, [bp+si]		; dx = val	; get val from gState
	mov	dh, 0
	mov	bp, dx			; bp = val
	cmp	bp, cx			; skip if empty val
	je	@x1
	call	idxToPos		; ax = pos
	call	setCursr
	mov	al, [bp+di]		; al = di[val]	; get symbol from gSymb
	call	wrtChar

@x1:	popa
	ret
endp
