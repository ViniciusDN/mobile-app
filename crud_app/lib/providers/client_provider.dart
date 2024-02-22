import 'package:crud_app/models/client.dart';
import 'package:crud_app/services/client_service.dart';
import 'package:flutter/material.dart';

class ClientProvider with ChangeNotifier {

  final ClientService _service = ClientService();

  Map<String, Client> _itens = {};
  ClientProvider() {
    _service.encontrar().then((value) => {_itens = value, notifyListeners()});
  }
  List<Client> get todos {
    return [..._itens.values];
  }
  int get contador {
    return _itens.length;
  }

  Client peloIndice(int i) {
    return _itens.values.elementAt(i);
  }
  void put(Client cliente) async {
    await _service.salvar(cliente);
    _service.encontrar().then((value) => {_itens = value, notifyListeners()});
  }

  void remove(String id) {
    _service.remover(id).then((value) => {_itens = value, notifyListeners()});
  }
}