; INPUT
; ah:al = col:row = x0:y0
; bh:bl = col:row = x1:y1
proc near
	pusha

	call	posToIdx
	mov	si, ax			; si = index1

	mov	ax, bx
	call	posToIdx
	mov	di, ax			; di = index2

	lea	bp, gState
	mov	dl, [bp + si]
	mov	dh, [bp + di]
	mov	[bp + si], dh
	mov	[bp + di], dl

@err:	popa
	ret
endp
