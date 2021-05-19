proc near
	pusha

	; write empty pos
	mov	bl, 01000111b		; bg = Red 	; fg = White
	mov	ax, 0006h
	call	setCursr
	mov	al, byte ptr [gEmpty+1]	; col
	or	al, 30h			; num to ascii
	call	wrtChar
	mov	ax, 0106h
	call	setCursr
	mov	al, byte ptr [gEmpty]	; row
	or	al, 30h			; num to ascii
	call	wrtChar

	; write moves
	mov	bl, 01010111b		; bg = Blue 	; fg = White
	mov	ax, 0306h
	call	setCursr
	mov	al, byte ptr [gMoves]	; col
	or	al, 30h			; num to ascii
	call	wrtChar

	popa
	ret
endp
