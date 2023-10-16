.data


.text

.global main
main:
  # a)
  movq $0x00000000FFFFFFFF, %rax
  ror $32, %rax # rax = 0xFFFFFFFF00000000

  # b)
  movq $0x00000000FFFFFFFF, %rax
  xorq %rdi, %rdi

  movq $64, %rcx
loopConteo:
  ror $1, %rax
  adc $0, %rdi

  loop loopConteo

  ret
