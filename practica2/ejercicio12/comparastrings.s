.data
cadenalarga: .asciz "123456"
cadenacorta: .asciz "123" # =>1 , 124=>0, 456=>0

.text
.global main
main:
  movq $cadenalarga, %rdi
  movq $cadenacorta, %rsi
  movl $3,%edx # debe ser la longitud de cadenacorta

.global compara
compara:
  movl %edx, %ecx
  movq $0, %r8
  movq $0, %r9

  movq $0, %r10
loopCompara:
  movb (%rdi, %r10, 1), %r8b
  movb (%rsi, %r10, 1), %r9b

  cmpb %r8b, %r9b
  jne comparaDistintos

  incq %r10
  loop loopCompara

  movq $1, %rax
  ret

comparaDistintos:
  movq $0, %rax

  ret
