.data
resulelto: .asciz "Los resultados son x = %f, y = %f\n"
no_resuleto: .asciz "El sitema no tiene solucion\n"
x: .float 0
y: .float 0

.text
solve:
  pushq %rbp
  movq %rsp, %rbp

  # Calculamos el determinante
  movss %xmm0, %xmm6
  mulss %xmm4, %xmm6
  movss %xmm3, %xmm7
  mulss %xmm1, %xmm7
  subss %xmm7, %xmm6
  movl $0, %ecx
  cvtsi2ss %ecx, %xmm7
  ucomiss %xmm7, %xmm6

  # Si alguno de los operandos es nan
  jp irresoluble
  # Si el sistema no tiene solucion
  jz irresoluble

  ucomiss %xmm7, %xmm4
  jz intercambiar
  movl $0, %eax

resolver_primero:
  
  # Calculamos X

  # b * f / e = res
  movss %xmm1, %xmm6 # xmm6 = b
  mulss %xmm5, %xmm6 # xmm6 = b * f
  divss %xmm4, %xmm6 # xmm6 = res

  # c - res
  movss %xmm2, %xmm7 # xmm7 = c
  subss %xmm6, %xmm7 # xmm7 = c - res

  # d * b / e = res'
  movss %xmm3, %xmm6 # xmm6 = d
  mulss %xmm1, %xmm6 # xmm6 = d * b
  divss %xmm4, %xmm6 # xmm6 = res'

  # a - res'
  movss %xmm0, %xmm8 # xmm8 = a
  subss %xmm6, %xmm8 # xmm8 = a - res'

  # (c - res) / (a - res') = X
  divss %xmm8, %xmm7 # xmm7 = X

  # dependiendo de si intercambiamos o no
  # guardamos en la direccion de x o la direccion de y
  cmpl $0, %eax
  je guardar_primero_x

# en xmm7 se encuentra el valor calculado
guardar_primero_y:
  movss %xmm7, (%rsi)
  jmp resolver_segundo
guardar_primero_x:
  movss %xmm7, (%rdi)

resolver_segundo:
  
  # (f - d * X) / e = Y
  mulss %xmm3, %xmm7 # xmm7 = d * X
  movss %xmm5, %xmm6 # xmm6 = f
  subss %xmm7, %xmm6 # xmm6 = f - d * X
  divss %xmm4, %xmm6 # xmm6 = Y

  # decidimos donde guardar Y
  cmpl $0, %eax
  je guardar_segundo_y

# en xmm6 se encuentra el valor calculado
guardar_segundoo_x:
  movss %xmm6, (%rdi)
  jmp finalizar
guardar_segundo_y:
  movss %xmm6, (%rsi)

finalizar:
  movl $0, %eax
  jmp epilogo
  
intercambiar:
  # intercambiamos "a" con "b"
  movss %xmm0, %xmm6
  movss %xmm1, %xmm0
  movss %xmm6, %xmm1

  # intercambiamos "d" con "e"
  movss %xmm3, %xmm6
  movss %xmm4, %xmm3
  movss %xmm6, %xmm4
  movl $1, %eax
  jmp resolver_primero

irresoluble:
  movl $-1, %eax

epilogo:
  movq %rbp, %rsp
  popq %rbp
  ret

imprimir_resultado:
  pushq %rbp
  movq %rsp, %rbp
  cmpl $0, %edi
  jne else_if
  pushq %rbp
  leaq resulelto, %rdi
  movss x, %xmm0
  movss y, %xmm1
  cvtss2sd %xmm0, %xmm0
  cvtss2sd %xmm1, %xmm1
  movq $2, %rax
  call printf
  popq %rbp
  jmp epilogo_print

else_if:
  leaq  no_resuleto, %rdi
  xorq %rax, %rax
  call printf

epilogo_print:
  movq %rbp, %rsp
  popq %rbp
  ret
.global main
main:
  movl $1, %ecx
  cvtsi2ss %ecx, %xmm0
  movl $3, %ecx
  cvtsi2ss %ecx, %xmm1
  movl $14 , %ecx
  cvtsi2ss %ecx, %xmm2
  movl $1, %ecx
  cvtsi2ss %ecx, %xmm3
  movl $0, %ecx
  cvtsi2ss %ecx, %xmm4
  movl $1, %ecx
  cvtsi2ss %ecx, %xmm5
  leaq x, %rdi
  leaq y, %rsi
  call solve
  movl %eax, %edi
  call imprimir_resultado
  ret
