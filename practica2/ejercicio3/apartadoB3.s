.data
N3: .byte -63
N5: .byte -91

.text
.global main
main:

movb N3, %al
movb N5, %bl
addb %bl, %al
ret
