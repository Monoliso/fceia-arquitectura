
# Ejercicio 1

| Segmento | Inicio | Tamaño | Permisos  |
| :------: | :----: | :----: | :-------: |
|     0    |  240   |  600   |    rx     |
|     1    |  2300  |  16    |    r      |
|     2    |  90    |  100   |    rw     |
|     3    |  1320  |  950   |    rw     |
|     4    |  -     |  96    |    rx     |


Para cada una de las siguientes solicitudes indicar qué dirección física
correspondería o -de ser el caso- qué excepción se genera:

dirección física : inicio del segmento y desplazamiento

## a) Lectura, 0-430
240 + 430 = 670
dirección física a la que queremos acceder = 670. Esta dirección se encuentra dentro del segmento 0.
Como este segmento permite la lectura, esta operación es válida.

## b) Escritura, 0-150
En este caso, el segmento 0 no tiene permisos de escritura, por lo que se generaría una excepción de permisos denegados.

## c) Lectura, 1-15
2300+15 = 2315
dirección física = 2315.
Además, el segmento 1 permite lectura.

## d) Escritura, 2-130
En este caso el desplazamiento es mayor al tamaño del segmento, por lo que la dirección es inválida y devuelve una excepción de Segmentation Fault.

## e) Ejecución, 4-25
dirección física = 25
Además, el segmento 4 permite ejecución
