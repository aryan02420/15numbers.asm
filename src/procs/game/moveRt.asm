proc near
	pusha
	mov	bx, DirRt
	call	moveDir
	popa
	ret
endp
