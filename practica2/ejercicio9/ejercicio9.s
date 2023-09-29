.data
arreglo: .byte 'H','o','l','a',' ','m','u','n','d','o','\0'
length: .byte 10

.text
.global main
main:
  movq $arreglo, %rdi
  
  xorq %rsi, %rsi
  movb length, %sil

  call invertir

  xorq %rax, %rax
  ret

# invertir recibe la direccion de un arreglo de bytes en %rdi,
# su longitud en %rsi, y devuelve el arreglo invertido en la direccion origen
invertir:
  movq $0, %r10
  movq %rsi, %r8
  subq $1, %r8

  xorq %r9, %r9
  xorq %r11, %r11

  movq %rsi, %rcx
  shrq $1, %rcx
invertirLoop:
  movb (%rdi, %r10, 1), %r11b
  movb (%rdi, %r8, 1), %r9b

  movb %r11b, (%rdi, %r8, 1)
  movb %r9b, (%rdi, %r10, 1)

  incq %r10
  decq %r8
  loop invertirLoop

  ret
