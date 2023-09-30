
# Ejercicio 02

Dos posibles formas para obtener el código de salida de un programa son:
 - El comando `echo $?`.
 - Corriendo el programa con gdb.

En el primer caso dicho comando imprime en la consola el código de salida (en decimal).

En el segundo caso, luego de terminar la ejecución del programa, gdb nos indica el código de salida (en octal).

En ambos casos, el código de salida es el valor almacenado en el registro %al (los 8 bits menos significativos de %rax).