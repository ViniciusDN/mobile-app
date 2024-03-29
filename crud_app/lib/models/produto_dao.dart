import 'produto.dart';

abstract class ProdutoDAO {
  salvar(Produto produto);
  Future<Map<String, Produto>> remover(dynamic id);
  Future<Map<String, Produto>> encontrar();
}