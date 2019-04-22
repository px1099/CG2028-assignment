   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 2566200A 		.ascii	"%f \012\000"
  21      00
  22              		.global	__aeabi_i2d
  23              		.global	__aeabi_ddiv
  24 0005 000000   		.align	2
  25              	.LC0:
  26 0008 0A000000 		.word	10
  27 000c 50000000 		.word	80
  28 0010 05000000 		.word	5
  29 0014 05000000 		.word	5
  30 0018 0A000000 		.word	10
  31 001c 14000000 		.word	20
  32 0020 1E000000 		.word	30
  33 0024 32000000 		.word	50
  34 0028 0A000000 		.word	10
  35 002c 0A000000 		.word	10
  36 0030 14000000 		.word	20
  37 0034 A0000000 		.word	160
  38 0038 00000000 		.word	0
  39 003c 00000000 		.word	0
  40 0040 00000000 		.word	0
  41 0044 32000000 		.word	50
  42              		.section	.text.main,"ax",%progbits
  43              		.align	2
  44              		.global	main
  45              		.thumb
  46              		.thumb_func
  48              	main:
  49              	.LFB0:
  50              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** 
   3:../src/main.c **** extern int pdm(int* base, int ncol, int index);
   4:../src/main.c **** 
   5:../src/main.c **** // CG2028 Assignment 1, Sem 1, AY 2018/19
   6:../src/main.c **** // (c) CK Tham, ECE NUS, 2018
   7:../src/main.c **** 
   8:../src/main.c **** // Dimension of confusion matrix, i.e. MxM square matrix
   9:../src/main.c **** // Note: pdm() must work for different values of M, e.g. M=10
  10:../src/main.c **** #define M 4
  11:../src/main.c **** 
  12:../src/main.c **** int main(void)
  13:../src/main.c **** {
  51              		.loc 1 13 0
  52              		.cfi_startproc
  53              		@ args = 0, pretend = 0, frame = 72
  54              		@ frame_needed = 1, uses_anonymous_args = 0
  55 0000 B0B5     		push	{r4, r5, r7, lr}
  56              	.LCFI0:
  57              		.cfi_def_cfa_offset 16
  58              		.cfi_offset 14, -4
  59              		.cfi_offset 7, -8
  60              		.cfi_offset 5, -12
  61              		.cfi_offset 4, -16
  62 0002 92B0     		sub	sp, sp, #72
  63              	.LCFI1:
  64              		.cfi_def_cfa_offset 88
  65 0004 00AF     		add	r7, sp, #0
  66              	.LCFI2:
  67              		.cfi_def_cfa_register 7
  14:../src/main.c **** 	// Variable definitions
  15:../src/main.c **** 	int index;
  16:../src/main.c **** 	// Note: different initialisation list is needed for different M
  17:../src/main.c **** 	int CM[M][M]={{10,80,5,5},{10,20,30,50},{10,10,20, 160}, {0, 0, 0, 50}};
  68              		.loc 1 17 0
  69 0006 40F20003 		movw	r3, #:lower16:.LC0
  70 000a C0F20003 		movt	r3, #:upper16:.LC0
  71 000e 07F10404 		add	r4, r7, #4
  72 0012 1D46     		mov	r5, r3
  73 0014 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  74 0016 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  75 0018 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  76 001a 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  77 001c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  78 001e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  79 0020 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
  80 0024 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  18:../src/main.c **** 
  19:../src/main.c **** 	// PDm: Call assembly language function pdm() for each class m
  20:../src/main.c **** 	// note: index = m - 1
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
  81              		.loc 1 21 0
  82 0028 4FF00003 		mov	r3, #0
  83 002c 7B64     		str	r3, [r7, #68]
  84 002e 21E0     		b	.L2
  85              	.L3:
  22:../src/main.c **** 		printf("%f \n", pdm((int*)CM, M, index)/10000.0);
  86              		.loc 1 22 0 discriminator 2
  87 0030 40F20004 		movw	r4, #:lower16:.LC1
  88 0034 C0F20004 		movt	r4, #:upper16:.LC1
  89 0038 07F10403 		add	r3, r7, #4
  90 003c 1846     		mov	r0, r3
  91 003e 4FF00401 		mov	r1, #4
  92 0042 7A6C     		ldr	r2, [r7, #68]
  93 0044 FFF7FEFF 		bl	pdm
  94 0048 0346     		mov	r3, r0
  95 004a 1846     		mov	r0, r3
  96 004c FFF7FEFF 		bl	__aeabi_i2d
  97 0050 0246     		mov	r2, r0
  98 0052 0B46     		mov	r3, r1
  99 0054 1046     		mov	r0, r2
 100 0056 1946     		mov	r1, r3
 101 0058 0FA3     		adr	r3, .L5
 102 005a D3E90023 		ldrd	r2, [r3]
 103 005e FFF7FEFF 		bl	__aeabi_ddiv
 104 0062 0246     		mov	r2, r0
 105 0064 0B46     		mov	r3, r1
 106 0066 2046     		mov	r0, r4
 107 0068 FFF7FEFF 		bl	printf
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
 108              		.loc 1 21 0 discriminator 2
 109 006c 7B6C     		ldr	r3, [r7, #68]
 110 006e 03F10103 		add	r3, r3, #1
 111 0072 7B64     		str	r3, [r7, #68]
 112              	.L2:
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
 113              		.loc 1 21 0 is_stmt 0 discriminator 1
 114 0074 7B6C     		ldr	r3, [r7, #68]
 115 0076 032B     		cmp	r3, #3
 116 0078 DADD     		ble	.L3
 117              	.L4:
  23:../src/main.c **** 
  24:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  25:../src/main.c **** 	volatile static int loop = 0;
  26:../src/main.c **** 	while (1) {
  27:../src/main.c **** 		loop++;
 118              		.loc 1 27 0 is_stmt 1 discriminator 1
 119 007a 40F20003 		movw	r3, #:lower16:loop.3818
 120 007e C0F20003 		movt	r3, #:upper16:loop.3818
 121 0082 1B68     		ldr	r3, [r3, #0]
 122 0084 03F10102 		add	r2, r3, #1
 123 0088 40F20003 		movw	r3, #:lower16:loop.3818
 124 008c C0F20003 		movt	r3, #:upper16:loop.3818
 125 0090 1A60     		str	r2, [r3, #0]
  28:../src/main.c **** 	}
 126              		.loc 1 28 0 discriminator 1
 127 0092 F2E7     		b	.L4
 128              	.L6:
 129 0094 AFF30080 		.align	3
 130              	.L5:
 131 0098 00000000 		.word	0
 132 009c 0088C340 		.word	1086556160
 133              		.cfi_endproc
 134              	.LFE0:
 136              		.bss
 137              		.align	2
 138              	loop.3818:
 139 0000 00000000 		.space	4
 140              		.text
 141              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:19     .rodata:00000000 $d
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:20     .rodata:00000000 .LC1
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:25     .rodata:00000008 .LC0
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:43     .text.main:00000000 $t
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:48     .text.main:00000000 main
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:138    .bss:00000000 loop.3818
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:131    .text.main:00000098 $d
C:\Users\admin\AppData\Local\Temp\ccBHIOKZ.s:137    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
__aeabi_i2d
__aeabi_ddiv
pdm
printf
