#include <stdio.h>
#include <math.h>

float mantisa(float f) {
    int n = *((int *) &f);
    n = (n & 0X7FFFFF) | 0x3F800000;
    return *((float *) &n);
}

int exponente(float f) {
    int n = *((int *) &f);
    return ((n >> 23) & 0xFF) - 127;
}

int myisnan(float f) {
    return exponente(f) == 128 && mantisa(f) != 0;
}

struct campo {
    unsigned s : 1;
    unsigned e : 8;
    unsigned m : 23;
};

union mynan {
    float f;
    struct campo c;
};

int myisnan2(float f) {
    // union mynan x = {.f = f};
    return f > 0x7F800000;
    // 01111111100000000000000000000000
    // 01111111100000000000000000000000

    // 01111111100000000000000000000000
    // 11111111100000000000000000000000

}

int main() {
    float g = 0.0;
    float f = 0.0 / g;
    if (myisnan(f)) {
        printf("myisNaN dice que sí\n");
    }
    if (myisnan2(f)) {
        printf("myisNaN2 dice que sí\n");
    }
    if (isnan(f)) {
        printf("isNaN dice que sí\n");
    }
    return 0;
}