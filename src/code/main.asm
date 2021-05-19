	call	setDispM

@l1:	cmp	byte ptr [gDebug], TRUE
	jne	@s1
	call	debug

@s1:	call	drawGrid

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
@m2:	call	moveLt
	jmp	@l1
@m3:	call	moveDn
	jmp	@l1
@m4:	call	moveRt
	jmp	@l1

@r1:	; call	shflBrd
	jmp	@l1

@e1:	call	resDispM
