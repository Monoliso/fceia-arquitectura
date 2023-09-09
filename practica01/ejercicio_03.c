#include <stdio.h>
#include <stdlib.h>

void printbin(unsigned long n)
{
    char binario[65];
    int bit_significativo = 63;
    binario[64] = '\0';

    for (int i = 63, x = 1; i >= 0; i--)
    {
        if ((n & x) != 0) {
            binario[i] = '1';
            if (i < bit_significativo) bit_significativo = i;
        } else {
            binario[i] = '0';
        }
        x = x << 1;
    }
    printf("El número en binario es: 0b%s\n", binario + bit_significativo);
}

int main(int argc, char *argv[])
{

    printbin(0);
    return 0;
}