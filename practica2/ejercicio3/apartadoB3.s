.data
N3: .byte -63
N5: .byte -91

.text
.global main
main:

movb N3(%rip), %al
movb N5(%rip), %bl
addb %bl, %al
ret
