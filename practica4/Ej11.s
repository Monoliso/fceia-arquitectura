.data
format: .asciz "Determinante: %f\n"
a: .float 3.0
b: .float 1.0
c: .float 2.0
d: .float 4.0

.text
.global main
main:
    push {ip, lr}

    ldr r0, =a
    vldr.f32 s0, [r0]
    ldr r0, =b
    vldr.f32 s1, [r0]
    ldr r0, =c
    vldr.f32 s2, [r0]
    ldr r0, =d
    vldr.f32 s3, [r0]
    bl determinante

    vcvt.f64.f32 d2, s0
    vmov.f64 r2, r3, d2
    ldr r0, =format
    bl printf

    mov r0, #0
    pop {ip, lr}
    bx lr


determinante:
    vmul.f32 s0, s0, s3
    vmul.f32 s1, s1, s2
    vsub.f32 s0, s0, s1

    bx lr
    