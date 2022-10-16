import 'dart:io';
//Classe Excecao:
class Excecao implements Exception {
  String causa;
  Excecao(this.causa);
}
//Classe Lista:
class Lista {
  var lista = [];
  var exp = "";
  //Construtor:
  Lista() {
    this.lista = [];
  }
  //funçao Push:
  void push(var add) {
    this.lista = this.lista + [add];
    this.exp = this.exp + " ${add}";
  }
  //funçao PushOperador:
  void pushOperador(var add) {
    for(int y = 0; y < add.lista.length; y++){
      this.exp = this.exp + " ${add.lista[y]}";
    }
  }
  //função Pop:
  pop() {
    var temp = this.lista;
    var retorno = this.lista[lista.length - 1];
    this.lista = [];
    for (int t = 0; t < temp.length - 1; t++) {
      this.lista = this.lista + [temp[t]];
    }
    return retorno;
  }
  // Função Get:
  get() {
    return lista[0];
  }
}
//Função Principal:
void main() {
 // Declarando Pilha de Número:
  Lista pilhaNum = Lista();
  //Entrada de Dados:
  print("Informe uma expressão matematica pos-fixa:");
  final entrada = stdin.readLineSync();
  List expressao = entrada!.split(" ");
 //pegar o "("
  convercao(pilhaNum, expressao);
}

//Converção pra pos-fixo:
convercao(var pilhaNum, var expressao){
  var espera = Lista();
  for(int t = 0; t < expressao.length; t++){
    if(expressao[t] == "("){
      print("deu bom!!");
    }
    if (expressao[t] == "+" ||
        expressao[t] == "-" ||
        expressao[t] == "*" ||
        expressao[t] == "/") {
       espera.push(expressao[t]);
    } else {
      pilhaNum.push(expressao[t]);
    }
  }
  pilhaNum.pushOperador(espera);
  print('Resultadado: ${pilhaNum.exp}');
}