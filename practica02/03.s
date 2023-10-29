.text

.global main
main:
    movb $100, %al
    addb $120, %al # S1 - Banderas: OF
    movb $-63, %al
    addb $-56, %al # S2 - Banderas: CF
    movb $-63, %al
    addb $-91, %al # S3 - Banderas: CF y OF
    movb $120, %al
    subb $-56, %al # S4 - Banderas: CF y OF
    movb $-91, %al
    subb $120, %al # S5 - Banderas: OF
    ret
