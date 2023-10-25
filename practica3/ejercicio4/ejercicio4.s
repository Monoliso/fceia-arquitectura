.data
.align 16
a: .float 0.5, 2.0, 3.2, 4.0, 5.0, 10.5, 21.3, 50.0, 125.0, 300.12345
.align 16
b: .float 9.5, 8.0, 6.8, 6.0, 5.0, 89.5, 28.7, 50.0, 275.5, 699.87655
len: .long 10


.text
main:
  leaq a, %rdi
  leaq b, %rsi
  xorq %rdx, %rdx
  movl len, %edx
  call sum_simd

  ret


.global sum_simd
# sum(rdi = vector float, rsi = vector float, rdx = largo de los vectores)
# devuelve la suma de a pares de los valores en los vectores en la direccion de rdi
sum_simd:
  movq %rdx, %rcx # para usar loop
  movq $0, %r8
  cvtsi2ss %r8, %xmm0
  cvtsi2ss %r8, %xmm1

sum_loop:
  cmp $4, %rcx
  jl sum_ss

sum_aps:
  movaps (%rdi, %r8, 4), %xmm0
  movaps (%rsi, %r8, 4), %xmm1

  addps %xmm1, %xmm0
  movaps %xmm0, (%rdi, %r8, 4)

  addq $4, %r8
  subq $3, %rcx
  loop sum_loop

  jmp end_loop

sum_ss:
  movss (%rdi, %r8, 4), %xmm0
  movss (%rsi, %r8, 4), %xmm1

  addss %xmm1, %xmm0
  movss %xmm0, (%rdi, %r8, 4)

  incq %r8
  loop sum_ss

end_loop:
  ret
