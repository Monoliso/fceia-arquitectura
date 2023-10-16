.data
arreglo: .asciz "probando prueba"
length: .byte 15
format: .asciz "%s\n"

.text
.global main
main:
  leaq arreglo, %rdi
  
  xorq %rsi, %rsi
  movb length, %sil

  call invertir

  # # pushq %rbp
  # leaq format, %rdi
  # leaq arreglo, %rsi
  # xorq %rax, %rax
  # call printf
  # # popq %rbp

  xorq %rax, %rax
  ret

# invertir recibe la direccion de un arreglo de bytes en %rdi,
# su longitud en %rsi, y devuelve el arreglo invertido en la direccion origen
invertir:
  movq $0, %r10 # inicio de la lista
  movq %rsi, %r8 # final de la lista + 1
  subq $1, %r8

  xorq %r9, %r9
  xorq %r11, %r11

  movq %rsi, %rcx 
  shrq $1, %rcx # como leo el inicio y el final de la lista al mismo tiempo, hago la mitad de iteraciones
invertirLoop:
  movb (%rdi, %r10, 1), %r11b
  movb (%rdi, %r8, 1), %r9b

  movb %r11b, (%rdi, %r8, 1)
  movb %r9b, (%rdi, %r10, 1)

  incq %r10
  decq %r8
  loop invertirLoop

  ret
