#include<stdio.h>

#define MaxN 10000

int n, m, A[MaxN], F[MaxN][MaxN];

void Input() {
	scanf("%d%d",&n,&m);
	for (int i = 0 ; i < n ; i++) scanf("%d",&A[i]);
}

int max(int a, int b) {
	if (a > b) return a; else return b;
}

void Process() {
	
	for (int j = 1 ; j <= m ; j++) F[0][j] = 0;
	for (int i = 1 ; i <= n ; i++) F[i][0] = 0;
	
	for (int i = 1 ; i <= n ; i++)
		for (int j = 1 ; j <= m ; j++)
			if (A[i-1] > j) F[i][j] = F[i-1][j]; else
				F[i][j] = max(F[i-1][j-A[i-1]]+A[i-1],F[i-1][j]);
	
}

void Output() {
	printf("%d",F[n][m]);
}

int main() {
	Input();
	Process();
	Output();
	return 0;
}
