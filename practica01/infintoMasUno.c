#include <stdio.h>
#include <math.h>

int main()
{
  float infinitoMasUno = INFINITY + 1;
  printf("El resultado de sumar uno a infinito es: %f\n", infinitoMasUno);
  infinitoMasUno = infinitoMasUno + 0x7F7FFFFF; // Número real más grande representable en punto flotante simple
  printf("El resultado de sumar 0x7F7FFFFF a infinito es: %f\n", infinitoMasUno);
  return 0;
}