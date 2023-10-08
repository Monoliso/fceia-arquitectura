#include <stdio.h>
#include <stdlib.h>

int suma(int argc, int* nums);

int main(int argc, char* argv[]){
    int* nums, sum;
    if (argc == 1){
        printf("Ingrese al menos un argumento...\n");
        exit(1);
    }

    printf("Cantidad de argumentos ingresados: %d. ", argc-1);

    nums = malloc((argc-1)*sizeof(int));
    for (int i = 1; i < argc; i++){
        nums[i-1] = atoi(argv[i]);
    }
    
    sum = suma(argc-1, nums);
    printf("La suma es %d.\n", sum);

    return 0;
}