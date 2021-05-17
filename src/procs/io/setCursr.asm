; INPUT
; ah:al = col:row
setCursr proc near
	push	dx
	push	bx

	mov	dh, al		; row
	mov	dl, ah		; col
	mov	bh, 0
	mov	ah, 02h
	int	10h

	pop	bx
	pop	dx
	ret
setCursr endp
