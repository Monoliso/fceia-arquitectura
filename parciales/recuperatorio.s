#include <stdio.h>

; int main() {
;     int i = 0;
;     if (5 > i){
;         //blah 
;     } else if(5 < i){
;         // blah
;     } else {
;         // blah
;     }
;     return 0;
; }

.data
i: .long 0

.text

; a c b

; cmp b a = a - b

main:
    movq i, %eax
    movq $5, %edx
    cmp %eax, %edx # 5 - 1 = 

    jg mayor
    jl menor
    je igual
    mayor:
        # blah
        jmp epilogo
    menor:
        # blah
        jmp epilogo
    igual:
        # blah
    epilogo:

; enter 
; leave

; Probando cómo hacer el producto
; 5 * 6

; 00000101
; x
; 00000110
; --------
;   00000000
;  00000101
; 00000101
; -----------
;   00011110 = 30 = 5 * 6 ✅