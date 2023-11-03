# 1) Escribir una función en Assembler x86-64 para realizar la conversión h=f*1.5+c. 
# Su signatura equivalente en C es la siguiente:

.data
constante: .double 1.5

.text

.global convert
convert:
    movsd constante, %xmm1
    cvtsi2sd %rdi, %xmm2
    mulsd %xmm1, %xmm0
    addsd %xmm2, %xmm0
ret
