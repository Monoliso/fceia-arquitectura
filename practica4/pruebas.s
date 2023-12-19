.data
array: .byte 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
xd: .space 11
valFloat: .word 0x3fe00000 @1.75
valFloat2: .word 0x40000000 @2.0

.text
.global main

main:
    @ Queremos probar: 
    @ multi pusheo/popeo
    @ usar flotantes
    @ valores inmediatos
    ldr r0, =array
    ldmfd r0!, {v1-v4}
    ldr r0, =xd
    stmea r0!, {v1-v4}
    
    ldr r0, =valFloat
    vldr s0, [r0]

    ldr r0, =valFloat2
    vldr s1, [r0]

    vmul.f32 s2, s0, s1 @ s2=s0*s1=3.5


    bx lr @ r14

