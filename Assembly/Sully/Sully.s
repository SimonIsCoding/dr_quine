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

extern	snprintf
extern	dprintf
extern	system

default	rel	
global	main

section	.text
main:
	push	rbp

.loop:
	lea		rdi, [fd]
	mov		rsi, 32
	lea		rdx, [filename]
	mov		rcx, [counter]
	xor		rax, rax
	call	snprintf wrt ..plt

;	lea		rdi, [fd]
;	mov		rsi, 32
;	lea		rdx, [executable]
;	mov		rcx, [counter]
;	xor		rax, rax
;	call	snprintf wrt ..plt

	open	[fd], 0x241, 644o
	mov		rdi, rax
	lea		rsi, [code]
	call	dprintf wrt ..plt
	close	[fd]

	mov		rax, [counter]
	dec		rax
	mov		[counter], rax

	lea		rdi, [command]
	mov		rsi, 32
	lea		rdx, 

;	lea		rdi, [command]
;	mov		rsi, 32
;	lea		rdx, [command]
;	call	system

;int snprintf(name_command, sizeof(name_command), "nasm -f elf64 %s -o %s && gcc %s -o %s", filename, objectFile, objectFile, executable); // 65 characters

	lea		rdi, [command2execute]
	mov		rsi, 65
	lea		rdx, [command]
	lea		rcx, [filename]
	lea		r8, [objectFile]
	lea		r9, [objectFile]
	lea		r10, [executable]
	call	snprintf wrt ..plt

	xor		rax, rax
	pop		rbp
	ret

section	.data
filename:	db	"Sully_%d.s", 0
objectFile:	db	"Sully_%d.0", 0
executable:	db	"Sully_%d", 0
code:		db	"myCode", 0
counter:	dq	5
command:	db	"nasm -f elf64 %s -o %s && gcc %s -o %s", 0

section	.bss
fd:			resb	32
file_size:	resb	32
command2execute:	resb	65

; definit les arguments de system()
; tu crois creer la variable command, que l'on va lancer dans system
; ensuite tu dois appeler system et executer le fichier Sully_5.s et executer Sully_5
; Ensuite je ne sais pas comment on va gerer la decrementation du X 
; ni faire en sorte de commencer avec X - 1
; Essaie de ne pas utiliser l'IA sinon ca sert a rien de le faire

; J'y ai mis toutes les bibliotheques
; J'ai definit une macro code qui contient tout le code a auto imprimer
; J'ai ecris tout le code dans le main
; La difficulte: faire decrementer le fichier_X et que son enfant contienne le code necessaire pour creer le fichier_{X - 1}, etc...