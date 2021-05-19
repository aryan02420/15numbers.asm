proc near
	pusha
	mov	bx, 00ffh			; dir = col:row = 0:-1
	call	moveDir
	popa
	ret
endp
