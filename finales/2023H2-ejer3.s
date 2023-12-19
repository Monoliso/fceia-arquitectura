.data
c1: .asciz "El resultado es: %d\n"

.text
.global main
main:
    push {lr}
    bl suma
    pop {lr}
    bx lr

suma:

    @ Intento de hacer correctamente el 3er ejercicio del final.
    @ No funca, aunque tampoco tengo la referencia del ejercicio.
    @ Pero la idea era que se pide espacio en la pila. Para qué? 
    @ Para guardar allí las variables locales. Quería replicar esa idea.


    sub sp, #20
    mov a1, #0xa
    str a1, [sp, #0x10] @ a = 10
    
    mov a2, #80
    vmov.f32 s1, a2
    vcvt.f32.s32 s1, s1
    vstr.f32 s1, [sp, #0xc] @ b = (float) 80

    vmov.f32 s0, a1
    vcvt.f32.s32 s0, s0
    vmul.f32 s2, s0, s1
    vcvt.s32.f32 s2, s2
    vstr.f32 s2, [sp, #0x8] @ c = 800

    add sp, #20
    bx lr
