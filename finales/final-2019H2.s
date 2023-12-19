.data
a:  .byte 0x41
    .word 0x159
f:  .quad 0x1122334455667788

.text
.global main
main:
    movq $a, %rax
    movq $f, %rbx
    ret
