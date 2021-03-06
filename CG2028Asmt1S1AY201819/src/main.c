// Saif Uddin Mahmud 	[A0170896N]
// Pham Quang Minh 		[A0170723L]

#include "stdio.h"

extern int pdm(int* base, int ncol, int index);

// CG2028 Assignment 1, Sem 1, AY 2018/19
// (c) CK Tham, ECE NUS, 2018

// Dimension of confusion matrix, i.e. MxM square matrix
// Note: pdm() must work for different values of M, e.g. M=10
#define M 4

int main(void)
{
	// Variable definitions
	int index;
	// Note: different initialisation list is needed for different M
	int CM[M][M]={{10,80,5,5},{10,20,30,50},{10,10,20, 160}, {0, 0, 0, 50}};

	// PDm: Call assembly language function pdm() for each class m
	// note: index = m - 1
	for ( index=0; index<M; index++ )
		printf("%f \n", pdm((int*)CM, M, index)/10000.0);

	// Enter an infinite loop, just incrementing a counter
	volatile static int loop = 0;
	while (1) {
		loop++;
	}
}
