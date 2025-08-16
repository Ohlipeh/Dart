// postagem_redesocial.dart
class PostagemRedesocial {
  String texto;
  String usuario;
  DateTime dataHora;
  int curtidas;

  // Construtor da classe PostagemRedesocial
  PostagemRedesocial(this.texto, this.usuario, this.dataHora, this.curtidas);
}

// Exemplo de uso da classe PostagemRedesocial
void main() {
  PostagemRedesocial postagem = PostagemRedesocial(
    "Aprendendo Dart é divertido!",
    "usuario123",
    DateTime.now(),
    10,
  );

  // Exibindo os detalhes da postagem
  print("Postagem: ${postagem.texto}");
  print("Usuário: ${postagem.usuario}");
  print("Data e Hora: ${postagem.dataHora}");
  print("Curtidas: ${postagem.curtidas}");
}
