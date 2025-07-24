import 'dart:io';

void main() {
  //Solicita a temperatura a ser convertida
  stdout.write("digite a temperatura: ");
  double? temp = double.tryParse(stdin.readLineSync()!);

  // Pede a unidade de origem (Celsius, Fahrenheit ou Kelvin)
  stdout.write("Converter de (C/F/K): ");
  String? de = stdin.readLineSync();

  // Pede a unidade de destino
  stdout.write("Converter para (C/F/K): ");
  String? para = stdin.readLineSync();

  // Validação das entradas
  if (temp == null || de == null || para == null) {
    print("Entrada inválida. Tente novamente.");
    return;
  }

  double? resultado;

  // Primeiro converte a temperatura para Celsius (para facilitar a conversão)
  double tempC;
  switch (de.toUpperCase()) {
    case "C":
      tempC = temp; // Já está em Celsius
      break;
    case "F":
      tempC = (temp - 32) * 5 / 9; // Converte de Fahrenheit para Celsius
      break;
    case "K":
      tempC = temp - 273.15; // Converte de Kelvin para Celsius
      break;
    default:
      print("Unidade de origem inválida. Use C, F ou K.");
      return;
  }

  // Agora converte de Celsius para a unidade de destino
  switch (para.toUpperCase()) {
    case "C":
      resultado = tempC; // Já está em Celsius
      break;
    case "F":
      resultado = (tempC * 9 / 5) + 32; // Converte de Celsius para Fahrenheit
      break;
    case "K":
      resultado = tempC + 273.15; // Converte de Celsius para Kelvin
      break;
    default:
      print("Unidade de destino inválida. Use C, F ou K.");
      return;
  }

  // Exibe o resultado da conversão
  print("Resultado: ${resultado.toStringAsFixed(2)} $para");
}
