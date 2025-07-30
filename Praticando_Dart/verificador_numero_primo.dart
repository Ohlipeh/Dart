import 'dart:io';

void main() {
  // Solicita um número ao usuário
  stdout.write("Digite um número inteiro positivo: ");
  int? numero = int.tryParse(stdin.readLineSync()!);

  // Validação da entrada
  if (numero == null || numero <= 0) {
    print("Número inválido. Digite um inteiro positivo.");
    return;
  }

  bool ehPrimo = true; // Assume que é primo ate provar o contrário

  // Tratamento especial para o número 1 (que não é primo)
  if (numero == 1) {
    ehPrimo = false;
  } else {
    // Verifica divisibilidade do número
    for (int i = 2; i <= numero / 2; i++) {
      // Se encontrar algum divisor, não é primo
      if (numero % i == 0) {
        ehPrimo = false;
        break; // Não precisa continuar verificando
      }
    }
  }
  // Exibe o resultado
  if (ehPrimo) {
    print("$numero é um número primo.");
  } else {
    print("$numero não é um número primo.");
  }
}
