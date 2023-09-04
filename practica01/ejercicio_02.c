#include <stdio.h>

int is_one(long n, int b) {
    return (n & (1 << b)) != 0;
}

int main() {
    printf("%d\n", is_one(3, 2));
    return 0;
}