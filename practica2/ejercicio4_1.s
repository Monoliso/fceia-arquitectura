# 10000000 00000000 00000000 00000000 == 1 << 31

.global main
main:
  movl $1, %eax
  shl $31, %eax

  ret
