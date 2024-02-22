//import 'package:crud_app/data/standard_produto.dart';
//import 'dart:math';
import 'package:crud_app/models/produto.dart';
import 'package:crud_app/services/produto_service.dart';
import 'package:flutter/material.dart';

class ProdutoProvider with ChangeNotifier {
  final ProdutoService _service = ProdutoService();

  Map<String, Produto> _itens = {};

  ProdutoProvider() {
    _service.encontrar().then((value) => {_itens = value, notifyListeners()});
  }

  List<Produto> get todos {
    return [..._itens.values];
  }

  int get contador {
    return _itens.length;
  }

  Produto peloIndice(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Produto produto) async {
    await _service.salvar(produto);
    _service.encontrar().then((value) => {_itens = value, notifyListeners()});
  }

/*   void remove(String id) {
    _itens.remove(id);
    notifyListeners();
  } */

  void remove(String id) {
    _service.remover(id).then((value) => {_itens = value, notifyListeners()});
  }
}