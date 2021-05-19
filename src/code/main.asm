@r1:	call	filBoard
	call	setDispM


	; write empty pos
@l1:	mov	bl, 01000111b		; bg = Red 	; fg = White
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

	call	drawGrid

	call	getKey
	cmp	al, 'w'
	je	@m1
	cmp	al, 'a'
	je	@m2
	cmp	al, 's'
	je	@m3
	cmp	al, 'd'
	je	@m4
	cmp	al, 'Q'
	je	@e1
	cmp	al, 'R'
	je	@r1
	jmp	@l1

@m1:	call	moveUp
	jmp	@l1
@m2:	mov	bx, 0100h
	call	moveDir
	jmp	@l1
@m3:	call	moveDn
	jmp	@l1
@m4:	mov	bx, 0ff00h
	call	moveDir

	jmp	@l1

@e1:	call	resDispM
