.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10

.text

.global main
main:
  xorq %rcx, %rcx
  movb length, %cl

  movq $0, %rax
  movq $0, %r11
  lea list, %rdx # movq $list, %rdx
suma:
  movl (%rdx, %r11, 4), %r10d
  addl %r10d, %eax

  incq %r11
  loop suma

  ret
