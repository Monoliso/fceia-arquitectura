# 10000000 00000000 10000000 00000000 == (1 << 31) | (1 << 15)

.global main
main:
  movl $1, %eax
  shl $31, %eax

  movl $1, %ebx
  shl $15, %ebx

  orl %ebx, %eax

  ret