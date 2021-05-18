; OUTPUT
; solved, CF = 0
; not solved, CF = 1
proc near
	push	cx
	push	bp

	stc
	xor	cx, cx
	mov	cl, gSize	; cl = 16
	dec	cl		; cl = 15
	lea	bp, gState	; bp = [0]
	add	bp, cx		; bp = [15]

@x2:	cmp	cl, [bp]	; 15 == [15] ?
	jne	@x1
	dec	bp		; bp = [14]
	dec	cl
	jo	@x2		; cl = 14

@x1:	pop	bp
	pop	cx
	ret
endp
