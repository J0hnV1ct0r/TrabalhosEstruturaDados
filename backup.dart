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
    for (int y = add.lista.length - 1; y >= 0; y--) {
      this.exp = this.exp + " ${add.pop()}";
      //if (add.lista[y] != "(") {
        //this.exp = this.exp + " ${add.pop()}";
      //} else {
        //add.pop();
      //}
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
    return lista[lista.length - 1];
  }
}

//  Função principal:
void main() {
  // Declarando Pilha de Número:
  Lista pilhaSaida = Lista();
  //Entrada de Dados:
  print("Informe uma expressão matematica infixa:");
  final entrada = stdin.readLineSync();
  List expressao = entrada!.split(" ");
  //pegar o "("
  convercao(pilhaSaida, expressao);
}

//conversão pra pos-fixo:
convercao(var pilhaSaida, var expressao) {
  var pilhaOperador = Lista();
  var pilhaParanteses = Lista();
  var parenteses; 
  for (int t = 0; t < expressao.length; t++) {

    if (expressao[t] == "("){
      parenteses = true;
    }else if(expressao[t] == ")"){
      parenteses = false;
      pilhaSaida.pushOperador(pilhaParanteses);
    }

    if (parenteses == true){
      if (expressao[t] == "+" ||
          expressao[t] == "-" ||
          expressao[t] == "*" ||
          expressao[t] == "/") {
        
        if (pilhaParanteses.lista.length >= 1){
          precedencia(expressao[t],pilhaParanteses,pilhaSaida);
         } else {
          pilhaParanteses.push(expressao[t]);
         }
       
       } else {
        if (expressao[t] == "(" || expressao[t] == ")") {
          //pilhaSaida.push(expressao[t]);
        }else{
           pilhaSaida.push(expressao[t]);
        } 
      }
      
    } else {
      if (expressao[t] == "+" ||
          expressao[t] == "-" ||
          expressao[t] == "*" ||
          expressao[t] == "/") {
        
         if (pilhaOperador.lista.length >= 1){
          precedencia(expressao[t],pilhaOperador, pilhaSaida);
         }else{
          pilhaOperador.push(expressao[t]);
         }
      } else {
        if (expressao[t] == "(" || expressao[t] == ")") {
        }else{
          pilhaSaida.push(expressao[t]);
        } 
      }
    }
  }
  pilhaSaida.pushOperador(pilhaOperador);
  print('Formula convertida: ${pilhaSaida.exp}');
}

//Teste de precedencia:
precedencia(var operadorNovo, var pilhaOperador, var pilhaSaida) {
  var listaOper = pilhaOperador.lista[pilhaOperador.lista.length - 1];
  // alcançou ')':
  //if (operadorNovo == ")"){
    //pilhaSaida.pushOperador(pilhaOperador);
  //}
  //opredaor novo '+' ou '-'
  if (operadorNovo == "+" || operadorNovo == "-") {
    if (listaOper == "+" || listaOper == "-") {
      //jogar operdor do topo da pilha na pilha de saida
      pilhaSaida.push(pilhaOperador.pop());
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "*") {
      //colocar o operdor novo na pilha de operadores
      pilhaSaida.pushOperador(pilhaOperador);
      pilhaOperador.push(operadorNovo);
    }else if (listaOper == "/"){
      pilhaOperador.push(operadorNovo);
    }    
  }
  //opredor novo é '/'
  if (operadorNovo == "/") {
    if (listaOper == "+" || listaOper == "-") {
      //coloco todos os operadores da lista de opreradores na pilha de saida
      pilhaSaida.pushOperador(pilhaOperador);
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "/") {
      //jogar operdor do topo da pilha de operadores na pilha de saida e coloca o novo operador na pilha de operadores
      pilhaSaida.push(pilhaOperador.pop());
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "*") {
      //coloco o operador novo na pilha de operadores
      pilhaSaida.pushOperador(pilhaOperador);
      pilhaOperador.push(operadorNovo);
    }
  }
  //opredor novo é '*'
  if (operadorNovo == "*") {
    if (listaOper == "+" || listaOper == "-" || listaOper == "/") {
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "*") {
      //jogar operdor do topo da pilha de operadores na pilha de saida e coloca o novo operador na pilha de operadores
      pilhaSaida.push(pilhaOperador.pop());
      pilhaOperador.push(operadorNovo);
    }
  }
} import 'dart:io';

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
    for (int y = add.lista.length - 1; y >= 0; y--) {
      this.exp = this.exp + " ${add.pop()}";
      //if (add.lista[y] != "(") {
        //this.exp = this.exp + " ${add.pop()}";
      //} else {
        //add.pop();
      //}
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
    return lista[lista.length - 1];
  }
}

//  Função principal:
void main() {
  // Declarando Pilha de Número:
  Lista pilhaSaida = Lista();
  //Entrada de Dados:
  print("Informe uma expressão matematica infixa:");
  final entrada = stdin.readLineSync();
  List expressao = entrada!.split(" ");
  //pegar o "("
  convercao(pilhaSaida, expressao);
}

//conversão pra pos-fixo:
convercao(var pilhaSaida, var expressao) {
  var pilhaOperador = Lista();
  var pilhaParanteses = Lista();
  var parenteses; 
  for (int t = 0; t < expressao.length; t++) {

    if (expressao[t] == "("){
      parenteses = true;
    }else if(expressao[t] == ")"){
      parenteses = false;
      pilhaSaida.pushOperador(pilhaParanteses);
    }

    if (parenteses == true){
      if (expressao[t] == "+" ||
          expressao[t] == "-" ||
          expressao[t] == "*" ||
          expressao[t] == "/") {
        
        if (pilhaParanteses.lista.length >= 1){
          precedencia(expressao[t],pilhaParanteses,pilhaSaida);
         } else {
          pilhaParanteses.push(expressao[t]);
         }
       
       } else {
        if (expressao[t] == "(" || expressao[t] == ")") {
          //pilhaSaida.push(expressao[t]);
        }else{
           pilhaSaida.push(expressao[t]);
        } 
      }
      
    } else {
      if (expressao[t] == "+" ||
          expressao[t] == "-" ||
          expressao[t] == "*" ||
          expressao[t] == "/") {
        
         if (pilhaOperador.lista.length >= 1){
          precedencia(expressao[t],pilhaOperador, pilhaSaida);
         }else{
          pilhaOperador.push(expressao[t]);
         }
      } else {
        if (expressao[t] == "(" || expressao[t] == ")") {
        }else{
          pilhaSaida.push(expressao[t]);
        } 
      }
    }
  }
  pilhaSaida.pushOperador(pilhaOperador);
  print('Formula convertida: ${pilhaSaida.exp}');
}

//Teste de precedencia:
precedencia(var operadorNovo, var pilhaOperador, var pilhaSaida) {
  var listaOper = pilhaOperador.lista[pilhaOperador.lista.length - 1];
  // alcançou ')':
  //if (operadorNovo == ")"){
    //pilhaSaida.pushOperador(pilhaOperador);
  //}
  //opredaor novo '+' ou '-'
  if (operadorNovo == "+" || operadorNovo == "-") {
    if (listaOper == "+" || listaOper == "-") {
      //jogar operdor do topo da pilha na pilha de saida
      pilhaSaida.push(pilhaOperador.pop());
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "*") {
      //colocar o operdor novo na pilha de operadores
      pilhaSaida.pushOperador(pilhaOperador);
      pilhaOperador.push(operadorNovo);
    }else if (listaOper == "/"){
      pilhaOperador.push(operadorNovo);
    }    
  }
  //opredor novo é '/'
  if (operadorNovo == "/") {
    if (listaOper == "+" || listaOper == "-") {
      //coloco todos os operadores da lista de opreradores na pilha de saida
      pilhaSaida.pushOperador(pilhaOperador);
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "/") {
      //jogar operdor do topo da pilha de operadores na pilha de saida e coloca o novo operador na pilha de operadores
      pilhaSaida.push(pilhaOperador.pop());
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "*") {
      //coloco o operador novo na pilha de operadores
      pilhaSaida.pushOperador(pilhaOperador);
      pilhaOperador.push(operadorNovo);
    }
  }
  //opredor novo é '*'
  if (operadorNovo == "*") {
    if (listaOper == "+" || listaOper == "-" || listaOper == "/") {
      pilhaOperador.push(operadorNovo);
    } else if (listaOper == "*") {
      //jogar operdor do topo da pilha de operadores na pilha de saida e coloca o novo operador na pilha de operadores
      pilhaSaida.push(pilhaOperador.pop());
      pilhaOperador.push(operadorNovo);
    }
  }
}
}