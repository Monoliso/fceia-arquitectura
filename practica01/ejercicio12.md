

# Ejercicio 12

$N_1 = (100000)_{10},\ N_2 = (0.2)_{10},\ N_3 = (0.1)_{10}$  
  



1.  $N_1 = (100000)_{10} = (11000011010100000)_2$  
    $N_1 = (-1)^0 \times (1.1000011010100000)_2 \times 2^{16}$  
    $e = 16$  
    $E = e + 127 = (143)_{10} = (10001111)_2$  
    Entonces:  
    $N_1 = (0\ 10001111\ 10000110101000000000000)_{IEEE\ 754}$

2.  $N_2 = (0.2)_{10} = (0.\overline{0011})_2$  
    $N_2 = (-1)^0 \times (1.\overline{0011}) \times 2^{-3}$  
    $e = -3$  
    $E = e + 127 = (124)_{10} = (01111100)_2$  
    Entonces:  
    $N_2 = (0\ 01111100\ 10011001100110011001101)_{IEEE\ 754}$  
    Fue necesario redondear la última cifra del significante.

3.  $N_3 = (0.1)_{10} = (0.0\overline{0011})_2$
    $N_3 = (-1)^0 \times (1.1\overline{0011}) \times 2^{-2}$  
    $e = -4$  
    $E = e + 127 = (125)_{10} = (01111011)_2$  
    Entonces:  
    $N_3 = (0\ 01111011\ 10011001100110011001101)_{IEEE\ 754}$  
    Fue necesario redondear la última cifra del significante.

## a)

$N_1 \otimes (N_2 \oplus N_3) =$  
$N_1 \otimes ((1.10011001100110011001101)_2 \times 2^{-3} \oplus (1.10011001100110011001101)_2 \times 2^{-4}) =$  
$N_1 \otimes ((1.10011001100110011001101)_2 \times 2^{-3} \oplus (0.110011001100110011001101)_2 \times 2^{-3}) =$  
$N_1 \otimes ( (10.011001100110011001100111)_2 \times 2^{-3}) = $  
(normalizamos el numero antes de seguir operando)  
$N_1 \otimes ( (1.00110011001100110011010)_2 \times 2^{-2}) = $   
$((1.10000110101000000000000)_2 \times 2^{16}) \otimes ( (1.00110011001100110011010)_2 \times 2^{-2}) = $  
$ (1.11010100110000000000001)_2 \times 2^{14}$  
$N_1 \otimes (N_2 \oplus N_3) = (0\ 10001101 \ 11010100110000000000001)_{IEEE\ 754}$  


## b)

$(N_1 \otimes N_2) \oplus (N_1 \otimes N_3) = $  
$(1.00111000100000000000000)_2 \times 2^{14} \oplus (1.00111000100000000000000)_2 \times 2^{13}$  
$(1.11010100110000000000000)_2 \times 2^{14}$  
$(N_1 \otimes N_2) \oplus (N_1 \otimes N_3) = (0\ 010001101\ 11010100110000000000000)_{IEEE\ 754}$  

## c)

 1. $N_1 = (100000)_{10} = (11000011010100000)_2$  
    $N_1 = (-1)^0 \times (1.1000011010100000)_2 \times 2^{16}$  
    $e = 16$  
    $E = e + 1023 = (1039)_{10} = (10000001111)_2$  
    Entonces:  
    $N_1 = (0\ 10000001111\ 1000011010100000000000000000000000000000000000000000)_{IEEE\ 754\ DOUBLE}$

  2. $N_2 = (0.2)_{10} = (0.\overline{0011})_2$  
    $N_2 = (-1)^0 \times (1.\overline{0011}) \times 2^{-3}$  
    $e = -3$  
    $E = e + 1023 = (1020)_{10} = (01111111100)_2$  
    Entonces:  
    $N_2 = (0\ 01111111100\ 1001100110011001100110011001100110011001100110011010)_{IEEE\ 754\ DOUBLE}$  
    Fue necesario redondear la última cifra del significante.

3.  $N_3 = (0.1)_{10} = (0.0\overline{0011})_2$
    $N_3 = (-1)^0 \times (1.1\overline{0011}) \times 2^{-2}$  
    $e = -4$  
    $E = e + 1023 = (1019)_{10} = (01111111011)_2$  
    Entonces:  
    $N_3 = (0\ 01111111011\ 1001100110011001100110011001100110011001100110011010)_{IEEE\ 754\ DOUBLE}$  
    Fue necesario redondear la última cifra del significante.

### c.1)

$N_1 \otimes (N_2 \oplus N_3) =$  
$N_1 \otimes ((1.0011001100110011001100110011001100110011001100110100)_2 \times 2^{-2}) = $  
$(1.1000011010100000000000000000000000000000000000000000) \times 2^{16} \otimes (1.0011001100110011001100110011001100110011001100110100)_2 \times 2^{-2} = $  
$(1.1101010011000000000000000000000000000000000000000001)_2 \times 2^{14}$  
$(0\ 10000001101\ 1101010011000000000000000000000000000000000000000001)_{IEEE\ 754\ DOUBLE}$

### c.2)

$(N_1 \otimes N_2) \oplus (N_1 \otimes N_3) = $  
$(1.0011100010000000000000000000000000000000000000000000)_2 \times 2^{14} \oplus (1.0011100010000000000000000000000000000000000000000000)_2 \times 2^{13}$  
$(1.1101010011000000000000000000000000000000000000000000)_2 \times 2^{14}$  
$(N_1 \otimes N_2) \oplus (N_1 \otimes N_3) = (0\ 10000001101\ 1101010011000000000000000000000000000000000000000000)_{IEEE\ 754\ DOUBLE}$

## d)

En ambos casos, presición simple y presición doble, ambas operaciones difieren en el resultado final. En este caso resulta ser más precisa la segunda operación ( $(N_1 \otimes N_2) \oplus (N_1 \otimes N_3)$ ) ya que el resultado es 30.000 y en la primera operación es un número cercano a 30.000. Esto sucede porque 0,1 y 0,2 son dos números muy próximos, entonces al sumarlos primero ocurre un error por redondeo. 
En el caso de la primera operación, el resultado en presición doble resulta ser más cercano al valor real de la operación que el resultado de la primera operación. Esto sucede porque el bit menos significativo de ambos resultados está encendido, y como la en representación de doble presición el bit menos significativo representa un valor menor que en el caso del resultado en simple presición, la distancia o erorr con respecto al resultado correcto es menor.