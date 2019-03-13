#include<stdio.h>

#define MaxN 10000

int n, x[MaxN];

void Input() {
	scanf("%d",&n);
}

void Output(int x[], int k) {
	for (int i = 0 ; i < k ; i++) printf("%d ",x[i]);
	printf("\n");
}

void Process(int k, int i) {
	
	int Si[MaxN];
	int nSi = 0;
	
	for (int xi = 0 ; xi < n ; xi++) {
		
		bool ok = true;
		
		//unclock this
		
//		for (int j = 0 ; j < i ; j++) 
//			if (xi == x[j]) {	// xi <= x[j]
//				ok = false;
//				break;
//			}
		
		if (ok) Si[nSi++] = xi;
	}
	
	for (int j = 0 ; j < nSi ; j++) {
		x[i] = Si[j];
		if (i == k-1) Output(x,k); else Process(k,i+1);
		x[i] = 0;
	}
	
}

int main() {
	Input();
	for (int k = 1 ; k <= n ; k++) Process(k,0);
	return 0;
}
