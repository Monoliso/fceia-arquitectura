.data
  format: .asciz "factorial de %d es igual a %d\n"
  fact: .long 5

.text
.global main
main:
  # factorial recibe en %esi el valor al que le haremos factorial
  # y devuelve en %eax el factorial de ese numero
  xorq %rsi, %rsi
  movl fact, %esi
  call factorial

  pushq %rbp
  movq $format, %rdi # El primer argumento es el formato.
  movl fact, %esi # El valor a imprimir
  movl %eax, %edx # segundo valor a imprimir
  # movq $1234, %rsi # El valor a imprimir.
  xorq %rax, %rax # Cantidad de valores de punto flotante.
  call printf
  popq %rbp

  movq $0, %rax
  ret

factorial:
  movq $1, %rax
  movl %esi, %ecx

loopFact:
  mull %ecx

  subl $1, %ecx
  cmpl $1, %ecx
  jne loopFact

  ret
