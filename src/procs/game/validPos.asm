; INPUT
; ah:al = col:row = x:y
; OUTPUT
; if invalid, CX = 0
; if valid CX = 1
; LOGIC
; assuming signed integer
; 0 <= col < width
; 0 <= row < height
proc near
	xor	cx, cx			; cx = 0, error

	cmp	ah, 0
	jl	@err

	cmp	ah, gWidth
	jge	@err

	cmp	al, 0
	jl	@err

	cmp	al, gHeight
	jge	@err

	inc	cx			; cx = 1, ok

@err:	ret
endp
