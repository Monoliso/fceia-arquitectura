#include <stdio.h>

float fraccion(float f)
{
    int n = *((int *)&f);
    n = (n & 0X7FFFFF) | 0x3F800000;
    return *((float *)&n);
}

int exponente(float f)
{
    int n = *((int *)&f);
    return ((n >> 23) & 0xFF) - 127;
}

int main()
{
    float f = -3;
    printf("El exponente del número %.4f es %d y la fraccion es %.4f\n", f, exponente(f), fraccion(f));
}