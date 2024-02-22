// product_list.dart
import 'package:crud_app/components/product_widget.dart';
import 'package:crud_app/providers/produto_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: use_key_in_widget_constructors
class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProdutoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.FORMULARIO_PRODUTO);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.contador,
        itemBuilder: (context, index) {
          final product = productProvider.peloIndice(index);
          return ProductWidget(product: product);
        },
      ),
    );
  }
}
