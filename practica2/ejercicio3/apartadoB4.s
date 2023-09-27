.data 
N2: .byte 120
N4: .byte -56

.text
.global main
main:

movb N2(%rip), %al
movb N4(%rip), %bl
subb %bl, %al

ret
