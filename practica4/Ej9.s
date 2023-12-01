@ unsigned int campesino_ruso(unsigned int i, unsigned int j)

.data
i: .long 35
j: .long 10
format: .asciz "Resultado: %d\n"

.text
.global main
main:
    push {lr}

    ldr r3, =i
    ldr r0, [r3] @ r0 = i
    ldr r3, =j
    ldr r1, [r3] @ r1 = j

    bl campesino_ruso

    mov r1, r0
    ldr r0, =format
    bl printf

    mov r0, #0
    pop {lr}
    bx lr

campesino_ruso:
    mov r2, r0 @ movemos el i a r2
    mov r0, #0
    @ r1 = j
    @ r2 = i

    cmp r1, #1 @ comparacion inicial
    movle r0, r2 @ si falla apenas inicia devolvemos r2
    bxle lr
    
loop_campesino:
    @ se ejecuta si j > 1
    tsthi r1, #1 @ j & 1
    addne r0, r2 @ bit 0 es 1
    subne r1, #1

    LSLeq r2, #1 @ bit 0 es 0
    LSReq r1, #1

    cmp r1, #1 @ while(j > 1)
    bhi loop_campesino

    @ final del loop
    add r0, r2

    bx lr
