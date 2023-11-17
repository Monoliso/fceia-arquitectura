.data
array: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text

.global main
main:

    ldr r2, =array
    mov r1, #30

    @ a) x = array[7] + y;
    mov r4, #7
    ldr r0, [r2, r4, LSL #2]
    add r0, r1

    @ b) array[10] = array[8] + y;
    mov r4, #8
    ldr r3, [r2, r4, LSL #2]
    add r3, r1
    mov r4, #10
    str r3, [r2, r4, LSL #2]

    bx lr
