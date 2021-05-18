; INPUT
; ah:al = col:row = x0:y0
; bh:bl = col:row = x1:y1
; OUTPUT
; ah:al = col:row = x0+x1:y0+y1
proc near
	add	al, bl
	add	ah, bh
	ret
endp
