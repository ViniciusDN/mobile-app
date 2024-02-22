class Produto {
  final String id;
  final String nome;
  final String descricao;
  final String preco;
  final String data_atualizado;

  const Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.data_atualizado,
  });

  static Object? toJson(Produto produto) {
    return {
      'id': produto.id.isEmpty ? null : produto.id,
      'Nome': produto.nome,
      'Descricao': produto.descricao,
      'Preco': produto.preco,
      'data_atualizado': produto.data_atualizado
    };
  }
}