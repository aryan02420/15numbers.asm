mov	ah, GDefW
mov	byte ptr [gWidth], ah
mov	al, GDefH
mov	byte ptr [gHeight], al
mov	bx, ax
mul	ah
mov	word ptr [gSize], ax
dec	bh
dec	bl
mov	word ptr [gEmpty], bx
mov	word ptr [gMoves], 0h
mov	word ptr [gMoves+2], 0h
mov	byte ptr [gDebug], FALSE
call	filBoard
