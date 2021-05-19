proc near
	pusha
	mov	bx, DirUp
	call	moveDir
	popa
	ret
endp
