resDispM proc near
	mov	ah, 08h
rdm_x1:	int	21h
	cmp	al,'Q'		;PRESS 'Q' FOR EXIT
	jnz	rdm_x1

	mov	al, oDispM
	mov	ah, 0
	int	10h

	ret
resDispM endp
