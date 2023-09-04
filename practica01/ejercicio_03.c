#include <stdio.h>
#include <stdlib.h>

void printbin(unsigned long n) {
    char binario[33];
    binario[32] = '\0';

    for(int i = 31; i >= 0; i--) {
        binario[i] = (n & 1) + '0';
        n = n >> 1;
    }
    
    printf("El número en binario es: %s\n", binario);
}

int main(int argc, char* argv[]) {
    
    printbin(2);
    return 0;
}