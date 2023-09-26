# 11111111 11111111 11111110 11111111 == -1 & (not (1 << 8))

.global main
main:
  movl $1, %eax
  shl $8, %eax

  not %eax

  and $-1, %eax

  ret