.data
a: .float 0.5, 2.0, 3.2, 4.0, 5.0
b: .float 9.5, 8.0, 6.8, 6.0, 5.0
len: .long 5


.text
.global main
main:
  leaq a, %rdi
  leaq b, %rsi
  xorq %rdx, %rdx
  movl len, %edx
  call sum

  ret


.global sum
# sum(rdi = vector float, rsi = vector float, rdx = largo de los vectores)
# devuelve la suma de a pares de los valores en los vectores en la direccion de rdi
sum:
  movq %rdx, %rcx # para usar loop
  movq $0, %r8
  
sum_loop:
  movss (%rdi, %r8, 4), %xmm0
  movss (%rsi, %r8, 4), %xmm1

  addss %xmm1, %xmm0

  movss %xmm0, (%rdi, %r8, 4)
  incq %r8

  loop sum_loop

  xorq %rax, %rax
  ret
