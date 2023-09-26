# 10101010 00000000 00000000 10101010 == 0xAA | (0xAA << 24)

.global main
main:
  movl $0xAA, %eax
  shl $24, %eax

  orl $0xAA, %eax

  ret