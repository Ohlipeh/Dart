// ignore: unused_import
import 'dart:io';
// Definição da classe Carro
class Carro {
  String modelo;
  String marca;
  int ano;

  // Construtor da classe Carro
  Carro(this.modelo, this.marca, this.ano);

  // Método para exibir informações do carro
  void exibirInfo() {
    print("Modelo : $modelo");
    print("Marca : $marca");
    print("Ano : $ano");
  }
}

// Função principal para testar a classe Carro
void main() {
  // Criação de um objeto da classe Carro
  Carro meuCarro = Carro("Civic", "honda", 2018);

  // Exibindo as informações do carro
  meuCarro.exibirInfo();
}
