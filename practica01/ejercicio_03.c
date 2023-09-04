#include <stdio.h>
#include <stdlib.h>

void printbin(unsigned long n) {
    char binario[65];
    binario[64] = '\0';

    for(int i = 63; i >= 0; i--) {
        binario[i] = (n & 1) + '0';
        n = n >> 1;
    }
    
    printf("El número en binario es: %s\n", binario);
}

int main(int argc, char* argv[]) {
    
    printbin(2);
    return 0;
}