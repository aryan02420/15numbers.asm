	call	setDispM

m_l1:	call	drawGrid
	call	getKey
	cmp	al, 'w'
	je	m_m1
	cmp	al, 'a'
	je	m_m2
	cmp	al, 's'
	je	m_m3
	cmp	al, 'd'
	je	m_m4
	cmp	al, 'q'
	je	m_e1
	jmp	m_l1:

m_m1:	call	moveUp
	jmp	m_l1
m_m2:	call	moveLt
	jmp	m_l1
m_m3:	call	moveDn
	jmp	m_l1
m_m4:	call	moveRt
	jmp	m_l1

m_e1:	call	resDispM
