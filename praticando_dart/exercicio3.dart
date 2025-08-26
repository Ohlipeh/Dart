// Classe PAI
class Funcionario {
  String nome;
  double salarioBase;

  Funcionario(this.nome, this.salarioBase);

  double calcularBonusAnual() {
    // Bônus padrão de 10%
    return salarioBase * 0.10;
  }
}

// Classe FILHA 1
class Gerente extends Funcionario {
  double bonusPorMeta;

  // 'super' chama o construtor da classe pai
  Gerente(String nome, double salarioBase, this.bonusPorMeta)
    : super(nome, salarioBase);

  @override
  double calcularBonusAnual() {
    // Lógica específica do Gerente
    return (salarioBase * 0.15) + bonusPorMeta;
  }
}

// Classe FILHA 2
class Programador extends Funcionario {
  int linhasDeCodigoPorDia;

  Programador(String nome, double salarioBase, this.linhasDeCodigoPorDia)
    : super(nome, salarioBase);

  @override
  double calcularBonusAnual() {
    // Lógica específica do Programador
    return salarioBase * 0.20;
  }
}

void main() {
  // Criando uma lista do tipo mais genérico (Funcionario)
  List<Funcionario> funcionarios = [
    Funcionario('Ana', 3000.0), // Funcionário comum
    Gerente('Carlos', 8000.0, 2000.0), // Gerente
    Programador('Bia', 5000.0, 500), // Programador
  ];

  // Polimorfismo em ação!
  // O mesmo chamado de método (f.calcularBonusAnual()) se comporta de formas diferentes
  for (var f in funcionarios) {
    // f.runtimeType mostra a classe real do objeto (Gerente, Programador, etc)
    print('Funcionário: ${f.nome} (${f.runtimeType})');
    print('Bônus Anual: R\$ ${f.calcularBonusAnual()}');
    print('---');
  }
}
