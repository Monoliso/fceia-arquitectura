    .data
format: .asciz "%ld\n"
format01: .asciz "%x\n"
i: .quad 0xDEADBEEF

    .text
    .global main
main:
    movq $format, %rdi # El primer argumento es el formato.
    movq $1234, %rsi # El valor a imprimir.
    xorq %rax, %rax # Cantidad de valores de punto flotante.
    call printf

    # a)
    movq $format, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    # b)
    movq $format01, %rdi
    leaq format, %rsi
    xorq %rax, %rax
    call printf

    # c)
    movq $format01, %rdi
    movq $format, %rdi
    xorq %rax, %rax
    call printf

    # d)
    movq (%rsp), %rsi
    movq $format, %rdi
    xorq %rax, %rax
    call printf

    # e)
    movq 8(%rsp), %rsi
    movq $format, %rdi
    xorq %rax, %rax
    call printf

    # f)
    movq i, %rsi
    movq $format01, %rdi
    xorq %rax, %rax
    call printf

    # g)
    leaq i, %rsi
    movq $format01, %rdi
    xorq %rax, %rax
    call printf

    ret
