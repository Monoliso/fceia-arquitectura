#include <stdio.h>
#include <stdlib.h>

// Otra solución para pasar de int a char:
// https://stackoverflow.com/questions/190229/where-is-the-itoa-function-in-linux

void printbin(unsigned long n) {
    if (n == 0) {
        puts("0");
        return;
    }
    
    for (int i = 63, primer_bit = 0; i >= 0; i--) {
        char bit = (char) ((n >> i) & 1) + '0';
        if (bit == '1' || primer_bit) {
            printf("%c", bit);
            primer_bit = 1;
        }
    }
    puts("");
}


int main(int argc, char *argv[]) {
    printbin(0xF);
    return 0;
}