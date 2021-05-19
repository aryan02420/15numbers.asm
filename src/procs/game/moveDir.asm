; bh:bl = col:row = direction = 0:1|0:-1|1:0|-1:0
; ch:cl = 0:num
proc near
	pusha

	mov	ax, word ptr [gEmpty]		; ax = empty pos
	mov	dx, ax				; dx = empty pos
	call	posOfst				; ax = a + b
	call	validPos			; new empty pos is valid?
	jcxz	@err

	mov	word ptr [gEmpty], ax		; ax = new empty pos
	mov	bx, dx				; bx = old empty pos
	call	swapPos
	inc	gMoves

@err:	popa
	ret
endp
