gWidth	db	?
gHeight	db	?
gSize	dw	?
gEmpty	db	2 dup (?)		; row:col => little endian
gMoves	db	4 dup (?)		; sparse BCD ; 1089 = 0x 01 00 08 09
gState	db	64 dup (?)
gSymb	db	'123456789ABCDEFG'
	db	'HIJKLMNOPQRSTUVW'
	db	'XYZabcdefghijklm'
	db	'nopqrstuvwxyz{} '
gDebug	db	?

oDispM	db	?
