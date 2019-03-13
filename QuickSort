#include<stdio.h>

#define MaxN 10000

int A[MaxN], n;

void Input() {
	scanf("%d",&n);
	for (int i = 0 ; i < n ; i++) scanf("%d",&A[i]);
}

void QuickSort(int S, int T) {
	
	if (S >= T) return;
	
	int i = S;
	int j = T;
	int lock = A[(i+j)/2];
	
	do {
		
		while (A[i] < lock) i++;
		while (A[j] > lock) j--;
		
		if (i <= j) {
			int temp = A[i];
			A[i] = A[j];
			A[j] = temp;
			i++;
			j--;
		}
		
	} while (i <= j);
	
	QuickSort(S,j);
	QuickSort(i,T);
	
}

void Output() {
	for (int i = 0 ; i < n ; i++) printf("%d ",A[i]);
	printf("\n");
}

int main() {
	Input();
	QuickSort(0,n-1);
	Output();
	return 0;
}
