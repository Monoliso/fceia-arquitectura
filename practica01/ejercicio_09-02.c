#include <stdio.h>

float mantisa(float f) {
    int n = *((int *) &f);
    n = (n & 0X7FFFFF) | 0x3F800000;
    return *((float *) &n);
}

int exponente(float f) {
    int n = *((int *) &f);
    return ((n >> 23) & 0xFF) - 127;
}

int main() {
    float f = -3;
    printf("El exponente del número %.4f es %i y la mantisa es %.4f\n", f, exponente(f), mantisa(f));
}