.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10
format: .asciz "La suma es %d, el menor es %d, el mayor es %d, y el promedio es %d\n"

.text

.global main
main:

  xorq %rcx, %rcx
  movb length, %cl # cant de elementos
  movq $0, %rax # valor inicial suma
  lea list, %rdi # = movq $list, %rdx

  # suma(eax=valor inicial, rdi=lista de valores a sumar, rcx=cant. elementos)
  # devuelve la suma en eax, el mayor en edx y el menor en esi (cant.elementos queda en r11d)
  call sumaInt
  pushq %rax # guardamos la suma en la pila

  movl %edx, %ecx # 4to argumento de printf
  xorq %rdx, %rdx
  idivl %r11d # el promedio se guarda en eax

  xorq %r8, %r8
  movl %eax, %r8d # 5to argumento de printf
  movl %esi, %edx # 3er argumento de printf
  popq %rsi # 2do argumento de printf

  pushq %rbp
  movq $format, %rdi # El primer argumento es el formato.
  xorq %rax, %rax # Cantidad de valores de punto flotante.
  call printf
  popq %rbp

  
  ret

sumaInt:
  xorq %r11, %r11 # = 0
  xorl %edx, %edx # = 0
  movl $0x7FFFFFFF, %esi # mayor numero posible en 32 bits

loopSumaInt:
  movl (%rdi, %r11, 4), %r10d # guardamos un valor del array en r10d
  addl %r10d, %eax # lo sumamos

  cmpl %r10d, %esi # lo comparamos con el menor
  jle noMin # jump si esi(minimo) es menor o igual a r10d(actual)

  movl %r10d, %esi
noMin:
  cmpl %r10d, %edx
  jge noMax # jump si edx(maximo) es mayor o igual a r10d(actual)

  movl %r10d, %edx
noMax:
  incq %r11 # r11++
  loop sumaInt # reduce rcx en 1 y salta a "suma" hasta que sea igual a 0

  ret
