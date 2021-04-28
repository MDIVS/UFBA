#include <stdio.h>

int factorial(int x) {
    int y = x--;
    for (int i=x; i!=0; i--) {y *= x--;}
    return y;
}

int main() {
    int a;
    scanf("%d",&a);
    printf("%d",factorial(a));
    return 0;
}