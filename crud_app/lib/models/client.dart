class Client {
  final String id;
  final String nome;
  final String sobrenome;
  final String email;
  final String avatarUrl;

  const Client({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.avatarUrl,
  });

  static Object? toJson(Client cliente) {
    return {
      'id': cliente.id.isEmpty ? null : cliente.id,
      'nome': cliente.nome,
      'sobrenome': cliente.sobrenome,
      'email': cliente.email,
      'avatarUrl': cliente.avatarUrl
    };
  }
}