//Classe Excecao:
class Excecao implements Exception {
  String causa;
  Excecao(this.causa);
}
//Classe Lista:
class Lista {
  var lista = [];
  //Construtor:
  Lista() {
    this.lista = [];
  }
  //funçao Push:
  void push(var add) {
    this.lista = this.lista + [add];
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
void main() {
	print('Testando Repositorio!!!');
  print('Testando se Branch está funcionado!!!!');
}
