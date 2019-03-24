#include <stdio.h>

#define MAXN 10000
#define	MAXM 15000
#define IPFNAME "C:/PascalFiles/PRIM.INP"
#define OPFNAME "C:/PascalFiles/PRIM.OUT"

int n, m, c[MAXN][MAXM],g[MAXN][MAXM],total;
bool checked[MAXN];

void Input() {
	FILE *ipf = fopen(IPFNAME,"r");
	fscanf(ipf,"%d%d",&n,&m);
	for (int i = 1 ; i <= m ; i++) {
		int u, v, value;
		fscanf(ipf,"%d%d%d",&u,&v,&value);
		c[u][v] = value;
		c[v][u] = value;
	}
	fclose(ipf);
}

void Init() {
	checked[1] = true;
	total = 0;
}

void Process() {
	do {
		bool stop = true;
		for (int i = 1 ; i <= n ; i++)
			if (!checked[i]) {
				stop = false;
				break;
			}
		if (stop) break;
		int min = MAXM;
		int u, v;
		for (int i = 1 ; i <= n ; i++)
			if (checked[i]) 
				for (int j = 1 ; j <= n ; j++)
					if (!checked[j] && c[i][j] != 0 && c[i][j] < min) {
						min = c[i][j];
						u = i;
						v = j;
					}
		g[u][v] = min;
		g[v][u] = min;
		total = total + min;
		checked[v] = true;
	} while (true);
}

void Output() {
	FILE *opf = fopen(OPFNAME,"w");
	fprintf(opf, "%d\n", total);
	for (int i = 1 ; i <= n ; i++)
		for (int j = 1 ; j <= n ; j++)
			if (i <= j && g[i][j] != 0) fprintf(opf, "%d %d %d\n", i,j,g[i][j]);
	fclose(opf);
}

int main()
{
	Input();
	Init();
	Process();
	Output();
	return 0;
}
