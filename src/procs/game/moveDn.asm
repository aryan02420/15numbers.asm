proc near
	pusha
	mov	bx, DirDn
	call	moveDir
	popa
	ret
endp
