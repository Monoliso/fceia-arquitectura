#include <stdio.h>
#include <math.h>

int mantisa(float f)
{
    int n = *((int *)&f);
    n = (n & 0X7FFFFF);
    return n;
}

int exponente(float f)
{
    int n = *((int *)&f);
    return ((n >> 23) & 0xFF) - 127;
}

int myisnan(float f)
{
    return exponente(f) == 128 && mantisa(f) != 0;
}

int myisnan2(float f)
{
    return !(INFINITY >= f);
}

int main()
{
    float g = 0.0;
    float f = 0.0 / g;
    if (myisnan(f))
    {
        printf("myisNaN dice que sí\n");
    }
    if (myisnan2(f))
    {
        printf("myisNaN2 dice que sí\n");
    }
    if (isnan(f))
    {
        printf("isNaN dice que sí\n");
    }

    // Ocurre lo mismo con +inf?
    // f = 10.0 / g; // +inf
    // printf("+inf?: %d\n", INFINITY == f);
    // printf("+inf?: %d\n", -1*INFINITY == f);
    // printf("+inf?: %d\n", INFINITY > 1);
    // printf("+inf?: %d\n", -1*INFINITY > 1);
    printf("\nComparamos con nan\n");
    printf("inf == nan: %d\n", INFINITY == NAN);
    printf("inf != nan: %d\n", INFINITY != NAN);
    printf("inf > nan: %d\n", INFINITY > NAN);
    printf("inf < nan: %d\n", INFINITY < NAN);
    // comparar con nan siempre retorna falso, excepto al ver si son distintos

    // infinito +- 1 = infinito?
    printf("+inf + 1?: %f\n", INFINITY + 1);
    printf("+inf - 1?: %f\n", INFINITY - 1);

    return 0;
}