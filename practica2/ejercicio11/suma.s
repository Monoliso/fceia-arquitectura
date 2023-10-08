
.text
.global suma
suma:
  movq %rdi, %rcx
  xorq %r8, %r8
  xorq %rax, %rax
  
loopSuma:
  movl (%rsi, %r8, 4), %r9d
  incq %r8

  imull %r9d, %r9d
  addl %r9d, %eax

  loop loopSuma

  ret
  