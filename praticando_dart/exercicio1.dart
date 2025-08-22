// exercicio1.dart
class Produto {
  // Atributos
  String nome;
  double preco;
  int quantidadeEmEstoque;

  // Construtor
  Produto(this.nome, this.preco, this.quantidadeEmEstoque);

  // Método para adicionar unidades ao estoque
  void adicionarEmEstoque(int quantidade) {
    if (quantidade > 0) {
      quantidadeEmEstoque += quantidade;
      print('$quantidade unidade() de "$nome" adicionada(s) ao estoque.');
    }
  }

  // Método para remover unidades do estoque
  void removerEstoque(int quantidade) {
    // Verifica se a quantidade a ser removida é válida
    if (quantidade > 0) {
      if (quantidade >= quantidadeEmEstoque) {
        // Tentativa de remover mais do que o disponível
        print(
          'Tentativa de remover $quantidade, mas só havia $quantidadeEmEstoque. Estoque zerado.',
        );
        quantidadeEmEstoque = 0;

        // Estoque não pode ser negativo
      } else {
        quantidadeEmEstoque -= quantidade; // Remoção válida
        print('$quantidade unidade(s) de "$nome" removida(s) do estoque.');
      }
    }
  }

  // Método para calcular o valor total do estoque
  double calcularValorTotal() {
    return preco * quantidadeEmEstoque; // Retorna o valor total do estoque
  }
}

// Função principal para testar a classe Produto
void main() {
  // Criando objetos da classe Produto
  var caneta = Produto('Caneta', 2.5, 100);
  var caderno = Produto('Caderno', 15.0, 50);

  // Exibindo informações iniciais
  print('--- Situação Inicial ---');
  print(
    'Valor total em canetas: \$${caneta.calcularValorTotal()}',
  ); // Exibe o valor total das canetas em estoque
  print(
    'Valor total em cadernos: \$${caderno.calcularValorTotal()}',
  ); // Exibe o valor total dos cadernos em estoque
  print('--------------------------------------------------\n');

  // Manipulando os objetos
  caneta.removerEstoque(30); // Removendo 30 canetas
  caderno.adicionarEmEstoque(20); // Adicionando 20 cadernos
  caneta.removerEstoque(80); // Tentativa de remover mais do que o estoque

  // Exibindo informações finais
  print('\n--- Situação Final ---');
  print(
    'Estoque final de canetas: ${caneta.quantidadeEmEstoque}',
  ); // Exibe a quantidade final de canetas em estoque
  print(
    'Valor total em canetas: \$${caneta.calcularValorTotal()}',
  ); // Exibe o valor total das canetas em estoque

  print(
    'Estoque final de cadernos: ${caderno.quantidadeEmEstoque}',
  ); // Exibe a quantidade final de cadernos em estoque
  print(
    'Valor total em cadernos: \$${caderno.calcularValorTotal()}',
  ); // Exibe o valor total dos cadernos em estoque
  print('--------------------------------------------------');
}
