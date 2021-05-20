proc near
	pusha

	; write empty pos
	bl = 01000111b			; bg = Red 	; fg = White
	ax = 0006h
	setCursr()
	al = byte ptr [gEmpty+1]	; col
	al = 30h			; num to ascii
	wrtChar()
	ax = 0106h
	setCursr()
	al = byte ptr [gEmpty]		; row
	al |= 30h			; num to ascii
	wrtChar()

	; write moves
	bl = 01010111b			; bg = Blue 	; fg = White
	ax = 0306h
	setCursr()
	al = byte ptr [gMoves]		; col
	al |= 30h			; num to ascii
	wrtChar()

	popa
	ret
endp
