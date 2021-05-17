gWidth	equ	4
gHeight	equ	4
gSize	equ	16
gEmpty	db	3,3		;row:col => little endian
gMoves	dw	0
gState	db	0,1,2,3
	db	4,5,6,7
	db	8,9,10,11
	db	12,13,14,15
gSymb	db	'123456789ABCDEFG'
	db	'HIJKLMNOPQRSTUVW'
	db	'XYZabcdefghijklm'
	db	'nopqrstuvwxyz{} '
oDispM	db	0
