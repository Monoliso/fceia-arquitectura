#include <stdio.h>

#define SESGO 30000

typedef struct _MyFloat{
  unsigned signo :1;
  unsigned exponente : 16;
  unsigned significante : 18;
} MyFloat;


// Se asume que el nuevo exponente es mayor al exponente actual
MyFloat mover_exponente(MyFloat op, unsigned nuevoExp){
  
  op.significante = op.significante >> 1;
  op.significante = (op.significante | 0x20000); 
  op.exponente++;
  while(op.exponente != nuevoExp){
    op.exponente++;
    op.significante = op.significante >> 1;
  }
  return op;
}

MyFloat suma(MyFloat op1, MyFloat op2){
  MyFloat resultado;
  if(op2.exponente < op1.exponente){
    op2 = mover_exponente(op2, op1.exponente);
  } else if(op1.exponente < op2.exponente){
    op1 = mover_exponente(op1, op2.exponente);
  }
  unsigned exponente = op1.exponente;
  unsigned significante = (op1.significante + op2.significante) >= 0x3FFFF ? 0 : (op1.significante + op2.significante);
  return resultado;
}

MyFloat mult(MyFloat op1, MyFloat op2) {

    int signo = (op1.signo + op2.signo) != 0 ? 1 : 0;
    int exponente = op1.exponente +  (op2.exponente - SESGO);
    
    float significante = op1.significante * op2.significante;
    while(significante > 2) significante = significante / 2;

    MyFloat producto = {.signo = signo, .exponente = exponente, .significante = significante};
    return producto;
}

int main() {
    MyFloat a = {.signo = 0, .exponente = 0xFFFF, .significante = 0xFFFF};
    MyFloat b = {.signo = 0, .exponente = 0xFFFF, .significante = 0x2FFFF};
    // suma(a, b);
    // MyFloat a;
    // a.significante = 0x3FFFF;
    // MyFloat b;
    // b.significante = 0x3FFFF;
    // MyFloat c;
    // c.significante = a.significante + b.significante;
    // printf("el resultado de la suma es: %x\n", c.significante);
    MyFloat c = mult(a, b);
    return 0;
}