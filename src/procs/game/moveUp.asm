proc near
	pusha
	mov	bx, 0001h			; dir = col:row = 0:1
	call	moveDir
	popa
	ret
endp
