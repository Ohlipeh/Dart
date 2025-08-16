// Atributos de uma classe em Dart
class UmaPessoa {
  String nome;
  int idade;
  int altura;
  // Construtor da classe
  UmaPessoa(this.nome, this.idade, this.altura);

  // Método para apresentar a pessoa
  void apresentar(){
    print("Olá, meu nome é $nome, tenho $idade anos e minha altura é $altura cm.");
  }
}

// Função principal para executar o código
void main(){
  UmaPessoa pessoa = UmaPessoa("João", 30, 175);
  UmaPessoa pessoa2 = UmaPessoa("Maria", 25, 165);

  // Chama o método para apresentar a pessoa
  pessoa.apresentar();
  pessoa2.apresentar();
}
