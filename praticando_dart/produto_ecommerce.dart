// produto_ecommerce.dart
import 'dart:io';

/// Classe que representa um produto em um e-commerce.
class ProdutoEcommerce {
  String nome;
  double preco;
  int estoque;

  // Construtor da classe
  ProdutoEcommerce(this.nome, this.preco, this.estoque);

  // Método para mostrar os detalhes do produto
  void mostrarDetalhes() {
    print(
      "Produto: $nome, Preço: R\$${preco.toStringAsFixed(2)}, Estoque: $estoque unidades.",
    );
  }
}

// Função principal para executar o código
void main() {
  print("Digite o nome do produto:");
  String? nome = stdin.readLineSync();

  print("Digite o preço do produto:");
  double preco = double.parse(stdin.readLineSync()!);

  print("Digite a quantidade em estoque:");
  int estoque = int.parse(stdin.readLineSync()!);

  ProdutoEcommerce produto = ProdutoEcommerce(nome!, preco, estoque);
  produto.mostrarDetalhes();
}
