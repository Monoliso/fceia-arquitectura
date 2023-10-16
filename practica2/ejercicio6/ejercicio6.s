.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10

.text

.global main
main:
  xorq %rsi, %rsi
  movb length, %sil
  lea list, %rdi # movq $list, %rdi

  call sumaInt

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
