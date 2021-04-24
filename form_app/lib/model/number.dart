import 'dart:math';

class Number {

  double number1;
  double number2;

  Number(this.number2, this.number1);

  double somar(){
    var soma = this.number1 + this.number2 ;
    print('soma: $soma');
    return soma;
  }
  double multiplicar(){
    var mult = this.number1 * this.number2 ;
    print('multiplicação: $mult');
    return mult;
  }
  double dividir(){
    var div =this.number1 / this.number2 ;
    print('dividir: $div');
    return div;
  }
  double subtrair(){
    var sub = this.number1 - this.number2 ;
    print('subtração: $sub');
    return sub;
  }
  @override
  String toString() {
    return 'Number:\nNumber1: $number1\nNumber2: $number2\n';
  }
}