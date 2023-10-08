.data
cadena: .asciz "123456"

.text
.global main
main:
  movq $cadena, %rdi
  movb $'3', %sil # Probar luego con diferentes valores (1,a,5....)

.global busca
busca:
# completar aqui
# si el char está en la cadena en rax debe quedar
# la dirección en donde se encontró el char.
# Si no, en rax debe quedar el valor -1
  xorq %rcx, %rcx
  xorq %r10, %r10
loopBusca:
  movb (%rdi, %rcx, 1), %r10b

  cmpb %r10b, %sil
  je salidaEncontrado

  cmpb $0, %r10b
  je salidaNoEncontrado

  incq %rcx
  jmp loopBusca

salidaEncontrado:
  movq %rcx, %rax

  ret

salidaNoEncontrado:
  movq $-1, %rax

  ret
