# 11111111 11111111 11111111 00000000 == -1 & 0xFFFFFF00

.global main
main:
  movl $0xFFFFFF00, %eax
  andl $-1, %eax

  ret