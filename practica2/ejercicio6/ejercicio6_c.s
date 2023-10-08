.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10
format: .asciz "La suma es %d, el mayor es %d, el menor es %d, y el promedio es %d\n"

.text

.global main
main:
  lea list, %rdi # = movq $list, %rdx
  xorq %rsi, %rsi
  movb length, %sil # cant de elementos
  call sumaInt
  pushq %rax # guardamos el resultado para imprimir

  lea list, %rdi # = movq $list, %rdx
  xorq %rsi, %rsi
  movb length, %sil # cant de elementos
  call maxInt
  pushq %rax # guardamos el resultado para imprimir

  lea list, %rdi # = movq $list, %rdx
  xorq %rsi, %rsi
  movb length, %sil # cant de elementos
  call minInt
  pushq %rax # guardamos el resultado para imprimir

  lea list, %rdi # = movq $list, %rdx
  xorq %rsi, %rsi
  movb length, %sil # cant de elementos
  call promedioInt

  movq %rax, %r8 # 4to dato a imprimir (resultado de promedioInt)
  popq %rcx # 3er dato a imprimir
  popq %rdx # 2do dato a imprimir
  popq %rsi # 1er dato a imprimir

  pushq %rbp
  movq $format, %rdi # El primer argumento es el formato.
  xorq %rax, %rax # Cantidad de valores de punto flotante.
  call printf
  popq %rbp

  xorq %rax, %rax
  ret

# ----------------------------
# sumaInt(rdi=lista de valores a sumar, rsi=cant. elementos)
# devuelve la suma en eax
sumaInt:
  movq %rsi, %rcx
  xorq %r11, %r11 # = 0
  xorl %eax, %eax # = 0

loopSumaInt:
  movl (%rdi, %r11, 4), %r10d # guardamos un valor del array en r10d
  addl %r10d, %eax # lo sumamos

  incq %r11 # r11++
  loop loopSumaInt # reduce rcx en 1 y salta a "loopSumaInt" hasta que sea igual a 0

  ret

# ----------------------------
# maxInt(rdi=lista de valores a comparar, rsi=cant.elementos)
# devuelve en eax el mayor elemento de la lista
maxInt:
  movq %rsi, %rcx
  xorq %r11, %r11 # = 0
  xorl %eax, %eax # = 0

loopMaxInt:
  movl (%rdi, %r11, 4), %r10d # guardamos un valor del array en r10d

  cmpl %r10d, %eax
  jge noMax # jump si eax(maximo) es mayor o igual a r10d(actual)

  movl %r10d, %eax
noMax:
  incq %r11 # r11++
  loop loopMaxInt # reduce rcx en 1 y salta a "loopMaxInt" hasta que sea igual a 0

  ret

# ----------------------------
# minInt(rdi=lista de valores a comparar, rsi=cant.elementos)
# devuelve en eax el menor elemento de la lista
minInt:
  movq %rsi, %rcx
  xorq %r11, %r11 # = 0
  movl $0x7FFFFFFF, %eax # mayor numero posible en 32 bits

loopMinInt:
  movl (%rdi, %r11, 4), %r10d # guardamos un valor del array en r10d

  cmpl %r10d, %eax
  jle noMin # jump si eax(minimo) es menor o igual a r10d(actual)

  movl %r10d, %eax
noMin:
  incq %r11 # r11++
  loop loopMinInt # reduce rcx en 1 y salta a "loopMinInt" hasta que sea igual a 0

  ret

# ----------------------------
promedioInt:
  call sumaInt # obtenemos la suma en rax

  xorq %rcx, %rcx
  movb length, %cl

  xorq %rdx, %rdx # dividimos edx:eax por ecx y el resultado queda en eax
  idivl %ecx

  ret
