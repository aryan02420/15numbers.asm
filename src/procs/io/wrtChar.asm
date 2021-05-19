; INPUT
; al = char
; bl = attr
proc near
	pusha

	mov	ah, 09h
	mov	bh, 0
	mov	cx, 1
	int	10h

	popa
	ret
endp
