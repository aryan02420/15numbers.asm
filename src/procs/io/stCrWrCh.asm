; set cursor and write character
; INPUT
; dh:dl = col:row
; al = character
; bl = attribute
proc near
	pusha

	mov	bh, al
	mov	ax, dx
	call	setCursr
	mov	al, bh
	call	wrtChar

	popa
	ret
endp
