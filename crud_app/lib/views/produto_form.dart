import 'package:crud_app/models/produto.dart';
import 'package:crud_app/providers/produto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioProduto extends StatefulWidget {
  const FormularioProduto({super.key});

  @override
  State<FormularioProduto> createState() => _FormulaireState();
}

class _FormulaireState extends State<FormularioProduto> {
  final _formulario = GlobalKey<FormState>();
  final Map<String, String> _dadosFormulario = {};

  void _carregaDadosFormulario(Produto produto) {
    _dadosFormulario['id'] = produto.id;
    _dadosFormulario['nome'] = produto.nome;
    _dadosFormulario['descricao'] = produto.descricao;
    _dadosFormulario['preco'] = produto.preco;
    _dadosFormulario['data_atualizado'] = produto.data_atualizado;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Object? produto = ModalRoute.of(context)!.settings.arguments;
    if (produto != null) {
      _carregaDadosFormulario(produto as Produto);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Object? produto = ModalRoute.of(context)!.settings.arguments;
    if (produto != null) {
      _carregaDadosFormulario(produto as Produto);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text('Adicionar, Editar ou Remover Produtos'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  if (_formulario.currentState!.validate()) {
                    _formulario.currentState!.save();
                    Provider.of<ProdutoProvider>(context, listen: false).put(
                      Produto(
                          id: _dadosFormulario['id'] ?? '',
                          nome: _dadosFormulario['nome'] ?? '',
                          descricao: _dadosFormulario['descricao'] ?? '',
                          preco: _dadosFormulario['preco'] ?? '',
                          data_atualizado:
                              _dadosFormulario['data_atualizado'] ?? ''),
                    );
                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(Icons.save, size: 35))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formulario,
          child: Column(children: <Widget>[
            TextFormField(
              initialValue: _dadosFormulario['nome'],
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (valor) {
                if (valor == null || valor.trim().isEmpty) {
                  return 'Nome Inválido';
                }
                if (valor.trim().length < 3) {
                  return "Nome muito pequeno. No mínimo 3 letras";
                }
                if (valor.trim().length > 25) {
                  return "Nome muito grande. No máximo 25 letras";
                }
                return null;
              },
              onSaved: (valor) => _dadosFormulario['nome'] = valor!,
            ),
            TextFormField(
              initialValue: _dadosFormulario['descricao'],
              decoration:
                  const InputDecoration(labelText: 'Descrição do Produto'),
              validator: (valor) {
                if (valor == null || valor.trim().isEmpty) {
                  return 'Descrição Inválida';
                }
                if (valor.trim().length < 3) {
                  return "Descrição muito pequena. No mínimo 3 letras";
                }
                if (valor.trim().length > 25) {
                  return "Descrição muito grande. No máximo 25 letras";
                }
                return null;
              },
              onSaved: (valor) => _dadosFormulario['descricao'] = valor!,
            ),
            TextFormField(
              initialValue: _dadosFormulario['preco'],
              decoration: const InputDecoration(labelText: 'Preço'),
              validator: (valor) {
                if (valor == null || valor.trim().isEmpty) {
                  return 'Preço inválida, valor deve ser um número positivo e menor do que 120.';
                }
                if (int.parse(valor) < 0) {
                  return "Preço não pode ser menor que zero.";
                }
                if (int.parse(valor) > 120) {
                  return "Preço não pode ser superio a 120.";
                }
                return null;
              },
              onSaved: (valor) => _dadosFormulario['preco'] = valor!,
            ),
            TextFormField(
              initialValue: _dadosFormulario['data_atualizado'],
              decoration:
                  const InputDecoration(labelText: 'Data da Atualização'),
              onSaved: (valor) => _dadosFormulario['data_atualizado'] = valor!,
            ),
          ]),
        ),
      ),
    );
  }
}
