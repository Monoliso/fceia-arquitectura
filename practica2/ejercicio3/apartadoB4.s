.data 
N2: .byte 120
N4: .byte -56

.text
.global main
main:

movb N2, %al
movb N4, %bl
subb %bl, %al

ret
