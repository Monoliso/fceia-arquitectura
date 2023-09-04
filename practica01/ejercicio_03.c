#include <stdio.h>
#include <stdlib.h>

void printbin(unsigned long n) {

    unsigned long m = n;
    char binario[65], *ref = binario;
    binario[64] = '\0';

    for(int i = 63; i >= 0; i--) {
        binario[i] = (n & 1) + '0';
        n = n >> 1;
    }

    for(int i = 0, condicion = 0; i < 64 && !condicion; i++, ref++) {
        if (binario[i] == '1') condicion = 1;
    }
    printf("El número en binario es: %s\n", !m ? "0" : ref-1);
}

int main(int argc, char* argv[]) {
    
    printbin(0xFF);
    return 0;
}