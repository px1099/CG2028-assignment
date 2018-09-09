 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func

pdm:
@ write the code for pdm(CM,M,index) here

	.equ SCALING, 10000
	
	@ using a stack to store register states
	PUSH {R3, R4}

	@ Loading nmm into R3
	LSL R2, R2, #2
	MLA R0, R1, R2, R0
	ADD R3, R0, R2
	LDR R3, [R3]

	@ Calculate sum of row
	MOV R4, #0

loop:
	LDR R2, [R0], #4
	ADD R4, R2
	SUBS R1, #1
	BNE loop

	@ Calculate PDm
	MOVW R1, SCALING
	MUL R3, R1
	SDIV R0, R3, R4

	@ Restoring Stack
	POP {R3, R4}

	@ Return
	BX	LR
