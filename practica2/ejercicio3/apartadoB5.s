.data

N5: .byte -91
N2: .byte 120

.text
.global main
main:

movb N5(%rip), %al
movb N2(%rip), %bl
subb %bl, %al

ret
