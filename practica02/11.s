.data

cartel1: .asciz "Cantidad de argumentos ingresados: %d. La suma es %d.\n"
cartel2: .asciz "Ingrese al menos un argumento\n"

.text

.global main
main:
    cmpq $1, %rdi
    jg main_if1
        lea cartel2, %rdi
        xorq %rax, %rax
        call printf
        ret
    main_if1:
    pushq %rdi
    call suma
    lea cartel1, %rdi
    popq %rsi
    decq %rsi
    movl %eax, %edx
    xorq %rax, %rax
    call printf
ret

.global suma
suma:
    push %rbp
    pushq %rbx
    movq %rsp, %rbp

    xorq %rbx, %rbx # Convención
    movq $1, %rcx
    pushq %rdi
    pushq %rsi # Convención

    suma_for1:
        pushq %rcx
        movq (%rsi, %rcx, 8), %rdi
        call atoi
        popq %rcx
        movq (%rsp), %rsi
        movl 8(%rsp), %edi
        imull %eax, %eax
        addl %eax, %ebx
        incl %ecx
        cmpl %edi, %ecx
        jb suma_for1

    movl %ebx, %eax
    movq %rbp, %rsp
    pop %rbx
    popq %rbp
ret
