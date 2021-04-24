import 'dart:math';

class Aluno {

  String nome;
  String sobrenome;
  double nota1;
  double nota2;

  Aluno(this.nome, this.sobrenome, this.nota1, this.nota2);

  double mediaAritmetica() {
    var media = (this.nota1 + this.nota2) / 2 ;
    print('média: ${media}');
    return media;
  }

  @override
  String toString() {
    return 'Aluno: ${this.nome} ${this.sobrenome}\nNota1 : ${this.nota1}\nNota2 : ${this.nota2}\nMedia:${this.mediaAritmetica()}';
  }
}