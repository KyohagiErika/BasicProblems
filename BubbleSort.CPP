#include<stdio.h>

#define MaxN 10000

int A[MaxN], n;

void Input() {
	scanf("%d",&n);
	for (int i = 0 ; i < n ; i++) scanf("%d",&A[i]);
}

void BubbleSort() {
	for (int i = 0 ; i < n-1 ; i++)
		for (int j = i+1 ; j < n ; j++) 
			if (A[i] > A[j]) {
				int temp = A[i];
				A[i] = A[j];
				A[j] = temp;
			}
}

void Output() {
	for (int i = 0 ; i < n ; i++) printf("%d ",A[i]);
	printf("\n");
}

int main() {
	Input();
	BubbleSort();
	Output();
	return 0;
}
