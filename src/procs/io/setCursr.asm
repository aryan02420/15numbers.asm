; INPUT
; ah:al = col:row
proc near
	pusha

	mov	dh, al		; row
	mov	dl, ah		; col
	mov	bh, 0
	mov	ah, 02h
	int	10h

	popa
	ret
endp
