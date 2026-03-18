extern	printf
default rel

global	main

;comment outside the entrypoint

section .text
Colleen:
	lea		rdi, [quine]
	mov		rsi, 34
	mov		rdx, 10
	lea		rcx, [quine]
	call	printf wrt ..plt
	ret

main:
;My comment inside the main
	call	Colleen
	xor		rax, rax
	ret

section	.data
quine:		db "extern printf%2$cdefault rel%2$c%2$cglobal main%2$c%2$c;comment outside the entrypoint%2$c%2$csection .text%2$cColleen:%2$c	lea	rdi [quine]%2$c	lea	rsi [quine]%2$c	call	printf wrt ..plt%2$c	ret%2$c%2$cmain:%2$c;My comment inside the main%2$c	call	Colleen%2$c	xor	rax rax%2$c	ret%2$c%2$csection .data%2$cquine: db		%1$c%s%1$c, 0", 0