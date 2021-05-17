; INPUT
; ah:al = col:row = x0:y0
; bh:bl = col:row = x1:y1
; OUTPUT
; ah:al = col:row = x0+x1:y0+y1
swapPos proc near
	push	dx
	push	si
	push	di
	push	bp

	call	posToIdx
	mov	si, ax
	mov	ax, bx
	call	posToIdx
	mov	di, ax

	lea	bp, gState
	mov	dl, [bp + si]
	mov	dh, [bp + di]
	mov	[bp + si], dh
	mov	[bp + di], dl

	pop	bp
	pop	di
	pop	si
	pop	dx
	ret
swapPos endp
