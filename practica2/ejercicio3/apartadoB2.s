.data

N3: .byte -63
N4: .byte -56

.text
.global main

main:

movb N3, %al
movb N4, %bl
addb %bl, %al
ret
