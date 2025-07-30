import 'dart:io';

void main() {
  // Solicita um número ao usuário
  stdout.write("Digite um número inteiro não negativo: ");
  int? numero = int.tryParse(stdin.readLineSync()!);

  // Validação da entrada
  if (numero == null || numero < 0) {
    print("Número inválido. Digite um inteiro não negativo.");
    return;
  }

  int fatorial = 1; // Inicializa o fatorial como 1

  // Calcula o fatorial do número
  for (int i = 2; i <= numero; i++) {
    fatorial *= i; // Multiplica o fatorial pelo número atual
  }

  // Exibe o resultado
  print("O fatorial de $numero é $fatorial.");
}
