.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10

.text

.global main
main:
  xorq %rcx, %rcx
  movb length, %cl

  movq $0, %rax
  movq $1, %r11
  movq $list, %rdx
suma:
  movq (%rdx, %r11, 8), %r10
  addq %r10, %rax

  incq %r11
  loop suma

  ret
