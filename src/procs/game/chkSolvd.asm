; OUTPUT================================
; solved, CX = 1/TRUE
; not solved, CX = 0/FALSE

; LOGIC=================================
; empty is at last pos, CX=0/FALSE
; 0 TO 15 in wrong order, CX=0/FALSE
; else CX=1/TRUE

proc near
	push	ax, bx, bp

	mov	cx, FALSE			; not solved

	mov	ah, gWidth
	mov	al, gHeight
	dec	ah
	dec	al
	mov	bx, word ptr [gEmpty]
	cmp	ax, bx
	jne	@end

	mov	bx, gSize			; counter
	dec	bx				; bx = 15
	lea	bp, gState
	add	bp, bx				; gState[15]

@loop1:	cmp	bl, byte ptr [bp]		; 15 == gState[15] ?
	jne	@end
	dec	bp
	dec	bl
	cmp	bl, 0
	jge	@loop1

	mov	cx, TRUE

@end:	pop	bp, bx, ax
	ret
endp
