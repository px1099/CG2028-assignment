 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func

pdm:
@ write the code for pdm(CM,M,index) here

	@ using a stack to store register states
	PUSH {R3-R10}

	@ Loading nmm into R3
	LSL R2, R2 #2
	MLA R0, R1, R2, R0
	ADD R3, R0, R2
	LDR R3, [R3]

	@ Calculate sum of row
	MOV R4, #0
	MOV R5, #0

loop:
	LDR R6, [R0]
	ADD R4, R4, R6
	ADD R0, R0, #4
	ADD R5, #1
	CMP R5, R1
	BLT loop

	@ Calculate PDm
	MOVW R11, #10000
	MUL R3, R11
	SDIV R0, R3, R4

	@ Restoring Stack
	POP {R3-R10}

	@ Return
	BX	LR
