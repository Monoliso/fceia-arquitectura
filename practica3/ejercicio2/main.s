.data
resuelto: .asciz "Los resultados son x = %f, y = %f\n"
no_resuelto: .asciz "El sistema no tiene solucion\n"
x: .float 0
y: .float 0
# NaN: .long 0xFFFFFFFF
Inf: .long 0x7F800000
menosInf: .long 0xFF800000

.text
# checkeamos si algun termino independiente es nan/inf
checkNaN:
  movss Inf, %xmm11
  movss menosInf, %xmm12

  ucomiss %xmm11, %xmm2
  je irresoluble
  jp irresoluble # si xmm2 es NaN
  ucomiss %xmm11, %xmm5
  je irresoluble
  jp irresoluble # si xmm5 es NaN
  ucomiss %xmm12, %xmm2
  je irresoluble
  ucomiss %xmm12, %xmm5
  je irresoluble

  jmp notANaN

solve:
  pushq %rbp
  movq %rsp, %rbp

  # checkeamos si algun termino independiente es nan/inf
  jmp checkNaN
notANaN:

  # Calculamos el determinante para saber si el sistema tiene solucion unica
  movss %xmm0, %xmm6
  mulss %xmm4, %xmm6
  movss %xmm3, %xmm7
  mulss %xmm1, %xmm7
  subss %xmm7, %xmm6 # xmm6 = determinante

  movl $0, %ecx
  cvtsi2ss %ecx, %xmm7
  ucomiss %xmm7, %xmm6 # comparamos el determinante con 0

  # Si el determinante es nan
  jp irresoluble
  # Si el sistema no tiene solucion unica
  jz irresoluble

  # comprobamos si el determinante es inf o -inf
  movss Inf, %xmm15
  ucomiss %xmm15, %xmm6
  je irresoluble
  movss menosInf, %xmm15
  ucomiss %xmm15, %xmm6
  je irresoluble

  # si el valor "e" es 0, intercambiamos "a" con "b", y "d" con "e"
  # para resolver la matriz escalonada
  ucomiss %xmm7, %xmm4
  jz intercambiar # desde intercambiar saltamos a resolver_primero (y %eax=1)

  movl $0, %eax # si no intercambiamos, %eax=0

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

  # dependiendo de si intercambiamos o no %eax vale 1 o 0 y
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
  # dependiendo de si se realizo un intercambio
  cmpl $0, %eax # si no se intercambia nada
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
  ret # retornamos al main desde "solve" o "imprimir_resultado"

imprimir_resultado:
  pushq %rbp # prologo
  movq %rsp, %rbp

  cmpl $0, %edi
  jne else_if

  pushq %rbp
  leaq resuelto, %rdi
  movss x, %xmm0
  movss y, %xmm1
  cvtss2sd %xmm0, %xmm0
  cvtss2sd %xmm1, %xmm1
  movq $2, %rax
  call printf
  popq %rbp

  xorq %rax, %rax # si hubo solucion main retorna 0
  jmp epilogo

else_if:
  pushq %rbp
  leaq  no_resuelto, %rdi
  xorq %rax, %rax
  call printf
  popq %rbp

  movq $-1, %rax # si no hubo solucion main retorna -1
  jmp epilogo

.global main
main:
  movl $1, %ecx
  cvtsi2ss %ecx, %xmm0 # a = 1
  movl $3, %ecx
  cvtsi2ss %ecx, %xmm1 # b = 3
  movl $14, %ecx
  cvtsi2ss %ecx, %xmm2 # c = 14
  movl $1, %ecx
  cvtsi2ss %ecx, %xmm3 # d = 1
  movl $0, %ecx
  cvtsi2ss %ecx, %xmm4 # e = 0
  # movss Inf, %xmm4 # e = inf
  movl $1, %ecx
  cvtsi2ss %ecx, %xmm5 # f = 1
  # movss NaN, %xmm5 # probamos NaN
  # movss menosInf, %xmm5 # probamos -inf
  leaq x, %rdi
  leaq y, %rsi
  call solve
  movl %eax, %edi
  call imprimir_resultado

  ret
