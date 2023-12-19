.data
count: .long 0
format: .asciz "%d %d\n"

.text
foo:
    incl count
    movl count, %eax
    ret

.global main
main:
    call foo
    movl %eax, %edx
    call foo
    movl %eax, %esi
    leaq format, %rdi
    xorq %rax, %rax
    call printf
    movq $0, %rax
    ret
