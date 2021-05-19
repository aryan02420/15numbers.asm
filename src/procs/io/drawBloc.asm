; INPUT
; ax = index
; bl = color attribute
; si = gState[0]
; di = gSymb[0]
; cx = empty block value
proc near
	pusha

	mov	bp, ax
	mov	dl, [bp+si]		; dx = val	; get val from gState
	mov	dh, 0
	mov	bp, dx			; bp = val
	cmp	bp, cx			; if  not empty val, draw normally
	jne	@x1
	xor	bl, bl			; black

@x1:	call	idxToPos		; ax = pos
	call	setCursr
	mov	al, [bp+di]		; al = di[val]	; get symbol from gSymb
	call	wrtChar

	popa
	ret
endp
