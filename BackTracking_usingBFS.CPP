#include<stdio.h>

#define MaxN 10000

int stack[MaxN], x[MaxN], n, last, front;

void Input() {
	scanf("%d",&n);
	last = 0;
	front = 0;
}

void Output(int x[], int k) {
	for (int i = 1 ; i <= k ; i++) printf("%d ",x[i]);
	printf("\n");
}

void push(int p) {
	stack[++last] = p;
}

int pop() {
	return stack[last--];
}

int get() {
	int returnValue = stack[++front];
	for (int i = front ; i <= last ; i++) stack[i-1] = stack[i];
	last--;
	front--;
	return returnValue;
}

void Process(int k, int i) {
	x[i] = pop(); //get()
	if (i == k) Output(x,k); else
		for (int xi = 1 ; xi <= n ; xi++) {
			bool ok = true;
//			for (int j = 1 ; j <= i ; j++)
//				if (xi <= x[j]) { //xi == x[j]
//					ok = false;
//					break;
//				}
			if (ok) {
				push(xi);
				Process(k,i+1);
			}
		}
}

int main() {
	Input();
	for (int k = 1 ; k <= n ; k++)
		for (int i = 1 ; i <= n ; i++) {
			push(i);
			Process(k,1);
		}
	return last;
}
