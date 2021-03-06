@ Saif Uddin Mahmud 	[A0170896N]
@ Pham Quang Minh 		[A0170723L]

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

	@ Loading n[m,m] into R3
	LSL R2, R2, #2
	MLA R0, R1, R2, R0	@ 0x00200211
	ADD R3, R0, R2		@ 0x00803002
	LDR R3, [R3]		@ 0x04933000

	@ Calculate sum of row
	MOV R4, #0			@ 0x03A44000

loop:
	LDR R2, [R0], #4	@ 0x04902000
	ADD R4, R2			@ 0x00844002
	SUBS R1, #1			@ 0x02511001
	BNE loop			@ 0x18000010

	@ Calculate PDm
	MOVW R1, SCALING
	MUL R3, R1			@ 0x00003113
	SDIV R0, R3, R4

	@ Restoring Stack
	POP {R3, R4}

	@ Return
	BX	LR
