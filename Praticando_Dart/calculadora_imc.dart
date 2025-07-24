// Importando a biblioteca necessária
import 'dart:io';

void main() {
  // Solicitando ao usuário que digite seu peso
  stdout.write('Digite seu peso em kg: ');
  double? peso = double.tryParse(stdin.readLineSync()!);

  // Solicitando ao usuário que digite sua altura
  stdout.write('Digite sua altura em metros: ');
  double? altura = double.tryParse(stdin.readLineSync()!);

  // Verificando se os valores são válidos
  if (peso == null || altura == null || peso <= 0 || altura <= 0) {
    print(
      'Valores inválidos. Por favor, insira números válidos para peso e altura.',
    );
    return; // Encerrando o programa se os valores forem inválidos
  }

  // Calculando o IMC
  double imc = peso / (altura * altura);
  // Exibindo o resultado do IMC
  print(
    'Seu IMC é: ${imc.toStringAsFixed(2)}',
  ); // Formata o IMC para duas casas decimais

  // Classificando o IMC
  if (imc < 18.5) {
    print('Classificação: Abaixo do peso');
  } else if (imc < 24.9) {
    print('Classificação: Peso normal');
  } else if (imc < 29.9) {
    print('Classificação: Sobrepeso');
  } else if (imc < 34.9) {
    print('Classificação: Obesidade grau I');
  } else if (imc < 39.9) {
    print('Classificação: Obesidade grau II');
  } else {
    print('Classificação: Obesidade grau III');
  }
}
