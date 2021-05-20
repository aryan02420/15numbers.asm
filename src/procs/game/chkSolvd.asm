; OUTPUT================================
; solved, CX = 1/TRUE
; not solved, CX = 0/FALSE

; LOGIC=================================
; empty is at last pos, CX=0/FALSE
; 0 TO 15 in wrong order, CX=0/FALSE
; else CX=1/TRUE

proc near
	push	ax, bx, bp

	cx = FALSE				; not solved

	ah = byte ptr [gWidth]
	al = byte ptr [gHeight]
	ah--
	al--
	bx = word ptr [gEmpty]
	cmp	ax, bx
	jne	@end

	bx = word ptr [gSize]			; counter
	bx--					; bx = 15
	lea	bp, gState
	bp += bx				; gState[15]

@loop1:	cmp	bl, byte ptr [bp]		; 15 == gState[15] ?
	jne	@end
	bp--
	bl--
	cmp	bl, 0
	jge	@loop1

	cx = TRUE

@end:	pop	bp, bx, ax
	ret
endp
