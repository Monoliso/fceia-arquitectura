#include <stdio.h>
#include <stdlib.h>

void printbin(unsigned long n)
{
    if (n == 0)
    {
        printf("El número en binario es: 0b0\n");
        return;
    }
    char binario[65], *ref = binario;
    binario[64] = '\0';

    for (int i = 63; i >= 0; i--)
    {
        binario[i] = (n & 1) + '0';
        n = n >> 1;
    }

    for (int i = 0, condicion = 0; i < 64 && !condicion; i++, ref++)
    {
        if (binario[i] == '1')
            condicion = 1;
    }
    printf("El número en binario es: 0b%s\n", ref - 1);
}

int main(int argc, char *argv[])
{

    printbin(0xFF);
    return 0;
}