.model tiny
.286
.data
;;DATA;;
stck	dw	128 dup (0)
stckPtr	dw	0
.code
.startup
lea	ax, stckPtr
mov	sp, ax
;;CODE;;
.exit
;;PROCS;;
end
