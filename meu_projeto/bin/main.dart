import 'dart:math'; // Usado para gerar números aleatórios
import 'package:mysql_client/mysql_client.dart'; // Biblioteca para conectar ao MySQL

// Criando um gerador de números aleatórios
final random = Random();

// ----------------------
// LISTAS DE DADOS PRÉ-DEFINIDOS
// ----------------------

// Lista de nomes possíveis para clientes
final nomesClientes = [
  "Carlos Silva",
  "Fernanda Souza",
  "Jefferson Lima",
  "Mariana Costa",
  "Ricardo Alves",
  "Patrícia Mendes",
  "João Pedro",
  "Sofia Martins",
  "André Ribeiro",
  "Luciana Torres",
  "Bruno Carvalho",
  "Tatiane Rocha",
  "Felipe Gomes",
  "Juliana Barros",
  "Eduardo Pires",
  "Vanessa Andrade",
];

// Lista de endereços possíveis
final enderecos = [
  "Rua A, 123",
  "Avenida Brasil, 1000",
  "Rua das Flores, 200",
  "Travessa Central, 45",
  "Alameda das Palmeiras, 300",
  "Rua do Comércio, 78",
  "Rua XV de Novembro, 120",
  "Estrada Velha, 450",
];

// Lista de espécies de animais
final especies = [
  "Cachorro",
  "Gato",
  "Coelho",
  "Pássaro",
  "Hamster",
  "Tartaruga",
];

// Lista de portes dos animais
final portes = ["Pequeno", "Médio", "Grande"];

// Lista de raças de cachorro
final racasCachorro = [
  "Labrador",
  "Poodle",
  "Bulldog",
  "SRD",
  "Pastor Alemão",
  "Golden Retriever",
  "Chow Chow",
  "Shih Tzu",
  "Beagle",
];

// Lista de raças de gato
final racasGato = ["Persa", "Siamês", "SRD", "Angorá", "Maine Coon", "Sphynx"];

// Lista de possíveis nomes para animais
final nomesAnimais = [
  "Rex",
  "Mia",
  "Luna",
  "Thor",
  "Bella",
  "Simba",
  "Nina",
  "Max",
  "Mel",
  "Fred",
  "Boris",
  "Pipoca",
  "Bidu",
  "Snow",
  "Bolt",
  "Lola",
];

// Tipos de pelo
final pelos = ["Curto", "Médio", "Longo"];

// Lista de veterinários
final veterinarios = [
  "Dr. João",
  "Dra. Ana",
  "Dr. Paulo",
  "Dra. Carla",
  "Dr. Renato",
  "Dra. Fabiana",
];

// Lista de descrições para consultas
final descricoes = [
  "Consulta de rotina",
  "Vacinação",
  "Exame de sangue",
  "Tratamento de ferimento",
  "Check-up",
  "Cirurgia",
  "Avaliação odontológica",
  "Exame de imagem",
];

// ----------------------
// FUNÇÕES AUXILIARES
// ----------------------

// Gera um CPF aleatório (apenas números, sem validação real)
String gerarCpf() {
  return List.generate(11, (_) => random.nextInt(10)).join();
}

// Gera um telefone aleatório no formato 99999-9999
String gerarTelefone() {
  return "${random.nextInt(90000) + 10000}-${random.nextInt(9000) + 1000}";
}

// Gera uma data aleatória nos últimos "anosAtras" anos
String gerarDataAleatoria({int anosAtras = 3}) {
  final hoje = DateTime.now();
  final inicio = DateTime(hoje.year - anosAtras, 1, 1);
  final dias = hoje.difference(inicio).inDays;
  final dataAleatoria = inicio.add(Duration(days: random.nextInt(dias)));
  return "${dataAleatoria.year}-${dataAleatoria.month.toString().padLeft(2, '0')}-${dataAleatoria.day.toString().padLeft(2, '0')}";
}

// Gera um horário aleatório no formato HH:mm:ss
String gerarHoraAleatoria() {
  return "${random.nextInt(23).toString().padLeft(2, '0')}:${random.nextInt(60).toString().padLeft(2, '0')}:00";
}

// ----------------------
// PROGRAMA PRINCIPAL
// ----------------------
Future<void> main() async {
  // Criando a conexão com o MySQL
  final conn = await MySQLConnection.createConnection(
    host: "localhost", // Endereço do servidor MySQL
    port: 3306, // Porta padrão do MySQL
    userName: "root", // Usuário do banco
    password: "29150290", // Senha do banco
    databaseName: "petvida", // Nome do banco de dados
  );

  // Conectando ao banco
  await conn.connect();
  print("✅ Conectado ao MySQL!");

  // Iniciando uma transação
  await conn.execute("START TRANSACTION");

  // Laço para inserir vários registros
  for (var i = 0; i < 20; i++) {
    // ----------------------
    // INSERIR CLIENTE
    // ----------------------
    var nomeCliente = nomesClientes[random.nextInt(nomesClientes.length)];
    var cpf = gerarCpf();
    var telefone = gerarTelefone();
    var email = "${nomeCliente.split(' ')[0].toLowerCase()}@mail.com";
    var endereco = enderecos[random.nextInt(enderecos.length)];
    var status = "1"; // Ativo

    // Inserindo no banco de dados
    var clienteRes = await conn.execute(
      "INSERT INTO cliente (nome_cliente, cpf_cliente, telefone_cliente, email_cliente, endereco_cliente, status_cliente) "
      "VALUES (:nome, :cpf, :telefone, :email, :endereco, :status)",
      {
        "nome": nomeCliente,
        "cpf": cpf,
        "telefone": telefone,
        "email": email,
        "endereco": endereco,
        "status": status,
      },
    );

    // Pegando o ID do cliente recém inserido
    var clienteId = clienteRes.lastInsertID;
    print("👤 Cliente inserido: $nomeCliente (ID: $clienteId)");

    // ----------------------
    // INSERIR ANIMAL
    // ----------------------
    var especie = especies[random.nextInt(especies.length)];
    var raca = especie == "Cachorro"
        ? racasCachorro[random.nextInt(racasCachorro.length)]
        : especie == "Gato"
        ? racasGato[random.nextInt(racasGato.length)]
        : "SRD"; // Para outros animais usamos "Sem Raça Definida"

    var nomeAnimal = nomesAnimais[random.nextInt(nomesAnimais.length)];
    var idade = (random.nextInt(15) + 1).toString(); // Idade entre 1 e 15 anos

    var animalRes = await conn.execute(
      "INSERT INTO animal (nome_animal, idade_animal, especie, porte_animal, raca, pelo, id_cliente) "
      "VALUES (:nome_animal, :idade, :especie, :porte, :raca, :pelo, :id_cliente)",
      {
        "nome_animal": nomeAnimal,
        "idade": idade,
        "especie": especie,
        "porte": portes[random.nextInt(portes.length)],
        "raca": raca,
        "pelo": pelos[random.nextInt(pelos.length)],
        "id_cliente": clienteId,
      },
    );

    // Pegando o ID do animal recém inserido
    var animalId = animalRes.lastInsertID;
    print("🐾 Animal inserido: $nomeAnimal (ID: $animalId)");

    // ----------------------
    // INSERIR CONSULTA
    // ----------------------
    await conn.execute(
      "INSERT INTO consulta (data_consulta, hora_consulta, veterinario_responsavel, descricao_consulta, id_animal, id_veterinario) "
      "VALUES (:data, :hora, :vet_resp, :descricao, :id_animal, :id_veterinario)",
      {
        "data": gerarDataAleatoria(), // Data aleatória
        "hora": gerarHoraAleatoria(), // Hora aleatória
        "vet_resp": veterinarios[random.nextInt(veterinarios.length)],
        "descricao": descricoes[random.nextInt(descricoes.length)],
        "id_animal": animalId,
        "id_veterinario": 1, // Aqui estou fixando para um veterinário ID 1
      },
    );

    print("📅 Consulta registrada para animal $animalId");
  }

  // Confirmando a transação no banco
  await conn.execute("COMMIT");

  // Fechando a conexão
  await conn.close();
  print("🚪 Conexão encerrada.");
}
