# 1) Escribir una función en Assembler x86-64 para realizar la conversión h=f*1.5+c. 
# Su signatura equivalente en C es la siguiente:

.data
constante: .double 1.5

.text
# double convert(double f, int c)
# devuelve: f*1.5 + c
.global convert
convert:
    movsd constante, %xmm1
    cvtsi2sd %rdi, %xmm2 # convert (int)c to (double)c
    mulsd %xmm1, %xmm0 # f * 1.5
    addsd %xmm2, %xmm0 # (f*1.5) + c
    ret
