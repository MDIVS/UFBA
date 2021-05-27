#include <stdio.h>
#include <stdlib.h>

int main () {
    int N;
    scanf("%d",&N);
    char V[N][51];
    scanf("\n");

    for (int i=0; i<N; i++) {
        scanf("%[^\n]%*c",V[i]);
    }

    for (int i=0; i<N/2; i++) {
        printf("%s X %s\n",V[i],V[N-i-1]);
    }

    return 0;
}