// clima_hoje.dart
// Classe para representar o clima atual de uma cidade
class ClimaHoje {
  String cidade;
  double temperatura;
  String condicao;
  DateTime dataHora;

  // Construtor da classe ClimaHoje
  ClimaHoje(this.cidade, this.temperatura, this.condicao, this.dataHora);
}

// Exemplo de uso da classe ClimaHoje
void main() {
  // Criando uma instância da classe ClimaHoje
  ClimaHoje clima = ClimaHoje("Blumenau", 17, "Nublado", DateTime.now());

  // Exibindo os detalhes do clima
  print("Cidade: ${clima.cidade}");
  print("Temperatura: ${clima.temperatura}°C");
  print("Condição: ${clima.condicao}");
  print("Data e Hora: ${clima.dataHora}");
}
