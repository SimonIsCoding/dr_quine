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

extern	dprintf
extern	snprintf
extern	printf

%macro open 3
	mov	rax, 2
	lea	rdi, %1
	mov	rsi, %2
	mov	rdx, %3
	syscall
%endmacro

%macro write 3
	mov	rax, 1
	mov	rdi, %1
	lea	rsi, %2
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

	lea		rdi, [string]
	lea		rsi, [fileName]
	call	printf wrt ..plt
	
	open	[fileName], 0x441, 644o

	pop		rbp
	ret

section	.data ;variables initialisees
counter:	dq	5
name:		db	"Sully_%d.s", 0
string:		db	"%s", 0

section .bss ;variables non initialisees
fileName:	resb	32