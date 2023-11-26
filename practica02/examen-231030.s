.data

.text
.global suma
suma:
    pushq %rbp
    movq %rsp, %rbp

    # edi, esi, dl, cx, r8, xmm0, r9, xmm1, 16(rbp), 24(rbp)
    xorl %eax, %eax
    addl %edi, %eax # eax += a
    movsbl %dl, %edx
    addl %edx, %eax # eax += c
    movswl %cx, %ecx
    addl %ecx, %eax # eax += d
    addl (%r8), %eax # eax += *e
    addl 16(%rbp), %eax # eax += i
    addl 24(%rbp), %eax # eax += j

    movq %rbp, %rsp
    popq %rbp
    ret
