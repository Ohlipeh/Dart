class Aluno {
  String nome;
  List<double> _notas = []; // Atributo privado para armazenar as notas

  // Construtor
  Aluno(this.nome);

  // Getter para acessar as notas (apenas leitura)
  List<double> get notas => _notas;

  // Método para adicionar uma nota
  void adicionarNota(double nota) {
    if (nota >= 0 && nota <= 10) {
      _notas.add(nota);
      print('Nota $nota adicionada para o aluno $nome.');
    } else {
      print('Nota inválida. Deve estar entre 0 e 10.');
    }
  }

  // Método para calcular a média das notas
  double calcularMedia() {
    if (_notas.isEmpty) {
      return 0.0;
    }

    // soma todas as notas e divide pelo número de notas
    double soma = _notas.reduce((a, b) => a + b);
    return soma / _notas.length;
  }

  // Método para verificar se o aluno foi aprovado com base em uma média de corte
  bool verificarAprovacao(double mediaCorte) {
    return calcularMedia() >= mediaCorte;
  }
}

// Função principal para testar a classe Aluno
void main() {
  var aluno1 = Aluno('João');

  // Adicionando notas através do método público
  // aluno1._notas.add(10); // ISSO DARIA ERRO! O encapsulamento protege.
  aluno1.adicionarNota(8.5);
  aluno1.adicionarNota(7.0);
  aluno1.adicionarNota(9.0);

  // Calculando e exibindo a média
  double media = aluno1.calcularMedia();
  print('\nAs notas do ${aluno1.nome} são: ${aluno1.notas}');
  print('A média final do ${aluno1.nome} é: ${media.toStringAsFixed(2)}');

  // Verificando aprovação com média de corte 7.0
  bool foiAprovado = aluno1.verificarAprovacao(7.0);
  if (foiAprovado) {
    print('Situação: Aprovado');
  } else {
    print('Situação: Reprovado');
  }
}
