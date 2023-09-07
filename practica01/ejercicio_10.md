# Ejercicio 10
## g)
Probemos que sucede al ejecutar el siguiente código:

```c
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
```
El resultado que nos arroja es el siguiente:
```console
> gcc -Wall -g -o salida .\infintoMasUno.c
> .\salida.exe
El resultado de sumar uno a infinito es: inf       
El resultado de sumar 0x7F7FFFFF a infinito es: inf
```
Por lo tanto podemos concluir que cuando uno de los operandos en una suma de flotantes es $+\infty$ y el otro un número real, el resultado es $+\infty$.