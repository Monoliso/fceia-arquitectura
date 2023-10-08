.data


.text

.global main
main:
  movq $0xFFFFFFFFFFFFFFFF, %rax
  ror $32, %rax


  xorq %rdi, %rdi
  xorq %r8, %r8
  movq $64, %rcx
loopConteo:
  ror $1, %rax
  adc %r8, %rdi

  loop loopConteo

  ret
