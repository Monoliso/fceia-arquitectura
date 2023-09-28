.data

N3: .byte -63
N4: .byte -56

.text
.global main

main:

movb N3(%rip), %al
movb N4(%rip), %bl
addb %bl, %al
ret
