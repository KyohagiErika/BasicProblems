#include<stdio.h>

#define MaxN 10000

int n, m, S, F, c[MaxN][MaxN], trace[MaxN];
bool Free[MaxN];

void Input() {
	int u, v, temp;
	scanf("%d%d%d%d",&n,&m,&S,&F);
	for (int i = 0 ; i < m ; i++) {
		scanf("%d%d%d",&u,&v,&temp);
		c[u][v] = temp;
	}
	for (int i = 1 ; i <= n ; i++) {
		Free[i] = true;
		trace[i] = S;
	}
	for (int i = 1 ; i <= n ; i++) 
		for (int j = 1 ; j <= n ; j++) 
			if (c[i][j] == 0) c[i][j] = MaxN;	
	c[S][S] = 0;
}

void Process() {
	do {
		int u = 0;
		int min = MaxN;
		for (int i = 1 ; i <= n ; i++)
			if (Free[i] && c[S][i] < min) {
				min = c[S][i];
				u = i;
			}
		if (u == 0 || u == F) break;
		Free[u] = false;
		for (int v = 1 ; v <= n ; v++)
			if (Free[v] && c[S][v] > c[S][u] + c[u][v]) {
				c[S][v] = c[S][u] + c[u][v];
				trace[v] = u;
			}
	} while (true);
}

void Output() {
	if (c[S][F] == MaxN) {
		printf("There is no path from %d to %d.",S,F);
		return;
	}
	printf("Distance from %d to %d: %d\n",S,F,c[S][F]);
	while (F != S && F != 0) {
		printf("%d<-",F);
		F = trace[F];
	}
	printf("%d",S);
}

int main() {
	Input();
	Process();
	Output();
	return 0;
}
