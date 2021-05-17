; OUTPUT
; solved, CF = 0
; not solved, CF = 1
chkSolvd proc near
	push	cx
	push	bp

	stc
	xor	cx, cx
	mov	cl, gSize	; cl = 16
	dec	cl		; cl = 15
	lea	bp, gState	; bp = [0]
	add	bp, cl		; bp = [15]

cs_x2:	cmp	cl, [bp]	; 15 == [15] ?
	jne	cs_x1
	dec	bp		; bp = [14]
	dec	cl
	jo	cs_x2		; cl = 14

cs_x1:	pop	bp
	pop	cx
	ret
chkSolvd endp
