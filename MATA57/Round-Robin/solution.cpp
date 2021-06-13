#include <stdio.h>
#include <stdlib.h>

int main () {
    int N, M, P=0, A=0;
    scanf("%d%d\n",&N,&M);

    if (M==1) {
        printf("game over");
        return 0;
    }

    //scanf("\n");
    char V[N][4];
    for (int i=0; i<N; i++) {
        scanf("%s",V[A]);
        if (A != 0 && V[A][0]!=V[A-1][0] && V[A][1]!=V[A-1][1] && V[A][2]!=V[A-1][2]) {
            P+=20;
            A--;
        } else {
            A++;
            if (A==M) {
                printf("game over");
                return 0;
            }
        }
    }
    
    printf("%d",P);

    return 0;
}