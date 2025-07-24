import 'dart:io'; // Importando a biblioteca de entrada e saída
import 'dart:math'; // Importando a biblioteca de números aleatórios

void main() {
  final random = Random(); // Criando um Random para gerar números aleatórios
  int numeroSecreto =
      random.nextInt(100) + 1; // Gerando um número secreto entre 1 e 100
  int tentativas = 0; // Contador de tentativas
  int? palpite; // Variável para armazenar o palpite do usuário

  print("Bem-vindo ao jogo de adivinhação!");
  print("Tente adivinhar o número secreto entre 1 e 100.");

  // Loop que continua até que o usuário adivinhe o número
  do {
    stdout.write("Digite seu palpite: "); // Solicita o palpite do usuário
    palpite = int.tryParse(
      stdin.readLineSync()!,
    ); // Lê o palpite e tenta convertê-lo para um inteiro

    // Verifica se o palpite é válido
    if (palpite == null || palpite < 1 || palpite > 100) {
      print("Por favor, digite um número válido entre 1 e 100.");
      continue; // Pula para a próxima iteração do loop
    }
    tentativas++; // Incrementa o contador de tentativas

    // Verifica se o palpite é menor, maior ou igual ao número secreto
    if (palpite < numeroSecreto) {
      print("Tente um número MAIOR!");
    } else if (palpite > numeroSecreto) {
      print("Tente um número MENOR!");
    }
  } while (palpite !=
      numeroSecreto); // Continua até que o palpite seja igual ao número secreto

  // Mensagem de sucesso quando o usuário adivinha o número
  print(
    "Parabéns! Você adivinhou o número secreto $numeroSecreto em $tentativas tentativas.",
  );
  print("Obrigado por jogar!"); // Mensagem de agradecimento
}
