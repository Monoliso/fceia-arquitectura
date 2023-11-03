.text

.global main
main:
    pushq $257
    movl (%rsp), %eax
    addq $8, %rsp
ret
