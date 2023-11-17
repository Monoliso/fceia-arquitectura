# Ejercicio 2

Programa A = 4300 bytes
Programa B = 3068 bytes

tamaño de pagina = 128 bytes
direcciones virtuales y físicas de 16 bits.

## a) Cuántas páginas requerirá como mínimo cada proceso?
Programa A requiere:
$\frac{4300}{128} = 34$ paginas

Programa B requiere:
$\frac{3068}{128}= 24$ paginas

## b) Cuánto espacio se desperdicia como mínimo por fragmentación interna y externa en cada programa?

## Fragmentación interna:
Programa A:
$\frac{4300}{128}$ bytes por pagina = 33.59375 paginas = espacio real ocupado.

Fragmentacion = $(34-33.59375) \cdot 128$ bytes = 52 bytes.

Programa B:
$\frac{3068}{128}$ = 23.96875 paginas.

Fragmentacion = $(24-23.96875) \cdot 128$ bytes = 4 bytes.

Total = 56 bytes por fragmentación interna

## Fragmentación externa: 
En este caso, el sistema operativo acomoda los programas uno al lado del otro de modo que no hay fragmentación externa, sólo interna.


## c) Suponiendo que se usa una tabla de paginación de un sólo nivel. Qué tamaño tendrá una tabla si cada entrada ocupa 8 bytes?

La tabla de paginación es de 128 bytes, entonces si cada entrada ocupa 8 el tamaño es $128 \div 8 = 16$.
