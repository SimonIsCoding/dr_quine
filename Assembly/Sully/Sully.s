;Ce qui devrait rester
;En réalité, la structure de Sully devrait ressembler beaucoup à Grace, avec seulement deux différences :
; - Le nom du fichier est dynamique (avec %d)
; - La compilation et l'exécution du fichier enfant s'ajoutent à la fin

; 1. Construire le nom du fichier enfant (Sully_4.s)
; 2. Ouvrir ce fichier
; 3. Ecrire TOUT le code source dedans (comme Grace)
; 4. Fermer le fichier
; 5. system("nasm ...")
; 6. system("gcc ...")
; 7. system("./Sully_4")  ← mais seulement sous quelle condition ?
; extern	printf

extern	dprintf
extern	snprintf

%macro open 3
	mov	rax, 2
	lea	rdi, %1
	mov	rsi, %2
	mov	rdx, %3
	syscall
%endmacro

%macro close 1
	mov	rax, 3
	mov	rdi, %1
	syscall
%endmacro

global main

section	.text
main:
	push	rbp
	xor		rax, rax

	lea 	rdi, [fileName]
	mov		rsi, 32
	lea		rdx, [name]
	mov		rcx, [counter]
	call	snprintf wrt ..plt

	mov		rax, [counter]
	dec		rax
	mov		[counter], rax
	
	open	[fileName], 0x241, 644o

	mov		[fd], rax
	mov		rdi, [fd]
	lea		rsi, [code]
	lea		rdx, 10
	mov		rcx, 34
	mov		r8, [counter]
	mov		r9, [code]
	xor		rax, rax
	call	dprintf wrt ..plt

	close	[fd]

	pop		rbp
	ret

section .bss
fileName:	resb	32
fd:			resb	32

section	.data
counter:	dq	5
name:		db	"Sully_%d.s", 0
code:		db	"extern	dprintf%1$cextern	snprintf%1$c%1$c%%macro open 3%1$c	mov	rax, 2%1$c	lea	rdi, %%1%1$c	mov	rsi, %%2%1$c	mov	rdx, %%3%1$c	syscall%1$c%%endmacro%1$c%1$c%%macro close 1%1$c	mov	rax, 3%1$c	mov	rdi, %%1%1$c	syscall%1$c%%endmacro%1$c%1$cglobal main%1$c%1$csection	.text%1$cmain:%1$c	push	rbp%1$c	xor		rax, rax%1$c%1$c	lea 	rdi, [fileName]%1$c	mov		rsi, 32%1$c	lea		rdx, [name]%1$c	mov		rcx, [counter]%1$c	call	snprintf wrt ..plt%1$c%1$c	mov		rax, [counter]%1$c	dec		rax%1$c	mov		[counter], rax%1$c%1$c	open	[fileName], 0x241, 644o%1$c%1$c	mov		[fd], rax%1$c	mov		rdi, [fd]%1$c	lea		rsi, [code]%1$c	lea		rdx, 10%1$c	mov		rcx, 34%1$c	mov		r8, [counter]%1$c	mov		r9, [code]%1$c	xor		rax, rax%1$c	call	dprintf wrt ..plt%1$c%1$c	close	[fd]%1$c%1$c	pop		rbp%1$c	ret%1$c%1$csection .bss%1$cfileName:	resb	32%1$cfd:			resb	32%1$c%1$csection	.data%1$ccounter:	dq	5%1$cname:		db	%2$cSully_%%d.s%2$c, 0%1$c", 0