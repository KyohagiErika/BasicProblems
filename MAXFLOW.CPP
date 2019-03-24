#include<stdio.h>

#define MAXN 10000

int n,m,s,t,x[MAXN],c[MAXN][MAXN],g[MAXN][MAXN],flow;

void Input() {
  scanf("%d%d%d%d",&n,&m,&s,&t);
	for (int i = 1 ; i <= m ; i++) {
		int u, v, val;
		scanf("%d%d%d",&u,&v,&val);
		c[u][v] = val;
	}
	flow = 0;
}

void Update(int x[], int k) {
	int min = MAXN;
	for (int i = 1 ; i < k ; i++)
		if (c[x[i]][x[i+1]] < min) min = c[x[i]][x[i+1]];
	for (int i = 1 ; i < k ; i++) {
		g[x[i]][x[i+1]] = g[x[i]][x[i+1]] + min;
		c[x[i]][x[i+1]] = c[x[i]][x[i+1]] - min;
	}
	flow = flow + min;
}

void Process(int i) {
	if (i == 1) {
		x[i] = s;
		Process(i+1);
	} else
		for (int xi = 1 ; xi <= n ; xi++) 
			if (c[x[i-1]][xi] != 0) {
				x[i] = xi;
				if (x[i] == t) Update(x,i); else Process(i+1);
				x[i] = 0;
			}
}

void Output() {
	printf("%d\n",flow);
	for (int i = 1 ; i <= n ; i++) {
		for (int j = 1 ; j <= n ; j++) fprintf(opf,"%d:%d ",c[i][j],g[i][j]);
		printf("\n");
	}
}

int main() {
	Input();
	Process(1);
	Output();
	return 0;
}
