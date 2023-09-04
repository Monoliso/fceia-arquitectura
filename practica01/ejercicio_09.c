#include <stdlib.h>
#include <stdio.h>
#include <ieee754.h>

typedef union
{
  float f;
  long i;
} FIUnion;

void notacion_flotantes(FIUnion);

int main()
{
  FIUnion a;
  a.f = -3;
  printf("antes %d\n", a.i);
  printf("durante %d\n", (a.i << 2));
  printf("despues %d\n", a.i);
  notacion_flotantes(a);

  return 0;
}

void notacion_flotantes(FIUnion a)
{
  printf("Exponente: %ld ", ((a.i >> 23) & 0xFF) - 127);
  a.i = (a.i & 0X7FFFFF) | 0x3F800000;
  printf("Fraccion: %f.", a.f);
}