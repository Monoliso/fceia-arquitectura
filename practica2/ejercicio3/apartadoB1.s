.data
N1: .byte 100
N2: .byte 120

.text

.global main
# En mi computadora está siendo necesario colocar (%rip) para poder compilar correctamente el código
main:
movb N1(%rip), %al
movb N2(%rip), %bl
addb %bl, %al
ret
