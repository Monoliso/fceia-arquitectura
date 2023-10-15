## Apartado a

Utilizando la flag "-S" para visualizar el código del programa en X86_64, pudimos observar que:  
Al ejecutarse esta llamada al la funcion:
``` C
return f('1', 2, '3', 4, '5', 6, 7, 8);
```
El contenido de la pila es el siguiente:  

|     Direccion    | Contenido |    Espacio   |
|       :---       |   :---:   |      ---:    |
|  0X7fffffffe030  |      7    |    8 bytes   |
|  0X7fffffffe038  |      8    |    8 bytes   |

  Cuando se llega hasta esta linea de código:
```C
printf("a: %p\n");

```
se cargó lo siguiente:

|     Direccion    | Contenido |    Espacio   |
|       :---       |   :---:   |      ---:    |
|  0X7fffffffe004  |    %ax    |    2 bytes   |
|  0X7fffffffe008  |   %rcx    |    8 bytes   |
|  0X7fffffffe010  |   %dl*    |    8 bytes   |
|  0X7fffffffe014  |    %dl    |    1 bytes   |
|  0X7fffffffe018  |   %esi    |    4 bytes   |
|  0X7fffffffe01c  |    %cl    |    4 bytes   |
|  0X7fffffffe020  |   %rbp    |    8 bytes   |

Los dos valores previamente guardados pasan a estar antes del nuevo valor de %rbp por lo que estan fuera de marco de activación.  
(*): dl se almacena luego de realizar "movl %esi, %edx". Por lo que no es el mismo valor que se almacena previamente.  
En varios casos, tamaño de algunos registros no se corresponde con el espacio que ocupa en la pila. 
Durante el resto de la ejecución de la función, no se modifican los punteros %rbp y %rsp. Tampoco se modifica el contenido de la pila.

## Apartado b

La dirección de retorno de f se encuentra "debajo" de la dirección %rbp del marco/scope del main. Esta dirección es la : "0X7fffffffe028". (Esto fue verificado con GDB)