# 00000000 00000000 00000101 00000000 == 5 << 8

.global main
main:
  movl $5, %eax
  shl $8, %eax

  ret