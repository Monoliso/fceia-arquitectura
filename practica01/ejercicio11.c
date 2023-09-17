#include <stdio.h>
#include <ieee754.h>
#include <math.h>

/* Practicca 1 ejercicio 11
.225 x 2 = .45 => 0
.45 x 2 = .9 => 0
.9 x 2 = 1.8 => 1
.8 x 2 = 1.6 => 1
.6 x 2 = 1.2 => 1
.2 x 2 = .4 => 0
.4 x 2 = .8 => 0
y se repite infinitamente

representacion de la parte decimal es:
.001[1100] (la parte en corchetes son el periodo del numero)
la parte entera del numero es 6, entonces (6)10 = (110)2
por lo tanto el numero (6.225)10 = (110.001[1100])2
como el numero es periodico, vamos a tener que redondear al numero mas cercano.
En float de precision simple el numero es:
(110.001[1100]) = (-1)^0 * (1.10001110011001100110011) * 2^(10000001) + error.
Por lo tanto (110.001[1100])2 = (01000000110001110011001100110011)ieee754 = (1.556249976158142*(2^2))10 = (6.22499990463)10 y 
    el error es de (0.00000009537)10
y en double:
(-1)^0 * (1.1000111001100110011001100110011001100110011001100110) * 2^(10000000001) + error.
Luego: (110.001[1100])2 = (0100000000011000111001100110011001100110011001100110011001100110)ieee754Double = 
(6.22499999999999964472863211995)10, por lo que el error es de (0.00000000000000035527136788005)10
*/

int main(){
    union ieee754_float numero;
    union ieee754_double elMismoNumero;
    numero.f = 6.225;
    elMismoNumero.d = 6.225;

    printf("flotante de simple precision:\n");
    printf("El signo: %d, el exponente: %d, ", numero.ieee.negative, numero.ieee.exponent);
    numero.ieee.exponent = 127;
    numero.ieee.negative = 0;
    printf("la mantisa: %f\n", numero.f);

    printf("Nuestro intento de flotante simple:\n");
    printf("El signo: 0, el exponente: 129, la mantisa: 1.556250\n");

    printf("flotante de doble precision:\n");
    printf("El signo: %d, el exponente: %d, ", elMismoNumero.ieee.negative, elMismoNumero.ieee.exponent);
    elMismoNumero.ieee.exponent = 1023;
    elMismoNumero.ieee.negative = 0;
    printf("la mantisa: %f\n", elMismoNumero.d);

    printf("Nuestro intento de flotante doble:\n");
    printf("El signo: 0, el exponente: 1025, la mantisa: 1.556250\n");

    return 0;
}

