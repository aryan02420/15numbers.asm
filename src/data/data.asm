gWidth	equ	4
gHeight	equ	4
gSize	equ	16
gEmpty	db	3,3		;row:col => little endian
gMoves	dw	0
marker	db	"here"
gState	db	64 dup (0)
gSymb	db	'123456789ABCDEFG'
	db	'HIJKLMNOPQRSTUVW'
	db	'XYZabcdefghijklm'
	db	'nopqrstuvwxyz{} '


oDispM	db	0


stck	dw	128 dup (0)
stckPtr	dw	0
