.data

.text
.global main
main:
    push {lr}

    mov r0, #6
    bl potMov

    mov r0, #0
    pop {lr}
    bx lr

potMov:
    mov r1, r0 @ guardamos i en r1
    mov r0, #1 @ arrancamos la iteracion con r0 = 1

loopPotMov: @ i=2 => potMov = ((1*2)*2) = 4
    mov r0, r0, LSL #1

    subs r1, #1 @ evalua si r1 = 0 al mismo tiempo que resta
    bgt loopPotMov

    bx lr
