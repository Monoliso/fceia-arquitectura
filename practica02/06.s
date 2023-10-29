# Fuentes:
# https://stackoverflow.com/questions/46881279/how-exactly-does-the-x86-loop-instruction-work

.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10

.text

.global main
main:
    leaq list, %rdi
    movq length, %rsi
    call suma
    leaq list, %rdi
    movq length, %rsi
    call menor
    leaq list, %rdi
    movq length, %rsi
    call mayor
    leaq list, %rdi
    movq length, %rsi
    call promedio
ret

promedio:
    push %rbp
    movq %rsp, %rbp

    pushq %rsi
    call suma
    popq %rsi

    xorq %rdx, %rdx
    divq %rsi

    movq %rbp, %rsp
    popq %rbp
ret

suma:
    push %rbp
    movq %rsp, %rbp
    
    movq %rsi, %rcx
    decq %rcx # Esto lo hago porque no utilizo loop.

    xorq %rax, %rax
    suma_lp1:
        addl (%rdi, %rcx, 4), %eax

        decq %rcx
        cmpq $0, %rcx
        jge suma_lp1
        # loop suma_lp1

    # addl (%rdi), %eax # Me falta una iteración. No entiendo por qué funciona así el loop.

    movq %rbp, %rsp
    popq %rbp
ret

menor:
    push %rbp
    movq %rsp, %rbp

    movl $0x7FFFFFFF, %eax
    movq %rsi, %rcx
    decq %rcx

    menor_lp1:
        movl (%rdi, %rcx, 4), %edx
        cmpl %eax, %edx
        jg menor_if1
            movl %edx, %eax
        menor_if1:
        decq %rcx
        cmpq $0, %rcx
        jge menor_lp1

    movq %rbp, %rsp
    popq %rbp
ret

mayor:
    push %rbp
    movq %rsp, %rbp

    xorl %eax, %eax
    movq %rsi, %rcx
    decq %rcx

    mayor_lp1:
        movl (%rdi, %rcx, 4), %edx
        cmpl %eax, %edx
        jl mayor_if1
            movl %edx, %eax
        mayor_if1:
        decq %rcx
        cmpq $0, %rcx
        jge mayor_lp1

    movq %rbp, %rsp
    popq %rbp
ret
