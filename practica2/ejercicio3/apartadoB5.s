.data

N5: .byte -91
N2: .byte 120

.text
.global main
main:

movb N5, %al
movb N2, %bl
subb %bl, %al

ret
