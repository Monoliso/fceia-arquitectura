.data
a: .word -1
b: .byte 0xaa, 99
c: .float 1.5
str: .asciz "Hola mundo\n"

.text
.global main
main:
  leaq a, %rdx
  movw (%rdx), %ax # ax = 0xffff
  movb 3(%rdx), %al # al = (0x63)16 = (99)10
  movl 8(%rdx), %esi # esi = "Hola"
  mocl 4(%rdi), %edi # edi = 0x3fc00000
  movl %esi, (%rdx)
retq