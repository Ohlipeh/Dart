// ignore: unused_import
import 'dart:io';

// Definição da classe Produto
class Produto {
  String nome;
  double _preco;
  int quantidade;

  // Construtor da classe Produto
  Produto(this.nome, this._preco, this.quantidade);

  // Getter para obter o preço do produto
  double get preco => _preco;

  // Setter para definir o preço do produto
  set preco(double valor) {
    if (valor < 0) {
      print("Preço não pode ser negativo.");
    } else {
      _preco = valor;
    }
  }

  // Método para exibir informações do produto
  void exibirInfo() {
    print("Nome: $nome");
    print("Preço: \$$_preco");
    print("Quantidade: $quantidade");
  }
}

// Função principal para testar a classe Produto
void main() {
  // Função para criar um objeto da classe Produto
  Produto meuProduto = Produto("Notebook", 2500.00, 5);
  Produto outroProduto = Produto("Smartphone", 1500.00, 10);

  // Exibindo as informações do produto
  meuProduto.exibirInfo();
  outroProduto.exibirInfo();

  // Testando o setter de preço
  meuProduto.preco = 10000.00;
  outroProduto.preco = -500.00; // Tentativa de definir um preço negativo

  // Usanddo o getter para obter o preço atualizado
  print("Preço atualizado: \$${meuProduto.preco}");
  print("Preço atualizado: \$${outroProduto.preco}");
  print("--------------------------------------------------\n");
}
