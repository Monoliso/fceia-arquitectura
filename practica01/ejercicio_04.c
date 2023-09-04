#include <stdio.h>

void rotar(int a, int b, int c) {

    printf("Valores originales: a=%d, b=%d y c=%d\n", a, b, c);

    a = a ^ b ^ c;
    b = b ^ c ^ a; // a
    c = c ^ a ^ b; // b
    a = a ^ b ^ c; // c 

    printf("Nuevos valores: a=%d, b=%d y c=%d\n", a, b, c);
}

int main() {
    rotar(1, 2, 3);
    return 0;
}