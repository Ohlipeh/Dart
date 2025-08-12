import 'package:mysql_client/mysql_client.dart';

Future<void> main() async {
  // Criar conexão
  final conn = await MySQLConnection.createConnection(
    host: "localhost",
    port: 3306,
    userName: "root", // seu usuário MySQL
    password: "29150290", // sua senha
    databaseName: "petvida", // seu banco
  );

  await conn.connect();
  print("✅ Conectado ao MySQL!");

  // SELECT
  var result = await conn.execute("SELECT * FROM cliente");
  for (final row in result.rows) {
    print("ID: ${row.colAt(0)}, Nome: ${row.colAt(1)}");
  }

  // INSERT
  var insert = await conn.execute(
    "INSERT INTO cliente (id_cliente, nome_cliente, cpf_cliente, telefone_cliente, email_cliente, endereco_cliente, status_cliente) "
    "VALUES (:idcliente, :nome, :cpf, :telefone, :email, :endereco, :status)",
    {
      "idcliente": 4,
      "nome": "Ana Souza",
      "cpf": "98765432100",
      "telefone": "99999-2222",
      "email": "ana@mail.com",
      "endereco": "Rua B, 456",
      "status": 4,
    },
  );
  print("Novo cliente inserido com ID: ${insert.lastInsertID}");

  await conn.execute("COMMIT");
}
