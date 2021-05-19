gWidth	db	4
gHeight	db	4
gSize	dw	16
gEmpty	db	1,1		; row:col => little endian
gMoves	dw	0
gState	db	64 dup (0)
gSymb	db	'123456789ABCDEFG'
	db	'HIJKLMNOPQRSTUVW'
	db	'XYZabcdefghijklm'
	db	'nopqrstuvwxyz{} '
nums	db	'0123456789'

oDispM	db	0
