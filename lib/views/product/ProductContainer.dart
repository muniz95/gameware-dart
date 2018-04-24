import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/views/product/ProductForm.dart';

import 'package:gameware/views/product/ProductViewModel.dart';

class ProductContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ProductViewModel>(
      distinct: true,
      converter: (store) => ProductViewModel.fromStore(store),
      builder: (context, viewModel) => new ProductContainerContent(context, viewModel),
    );
  }
}

class ProductContainerContent extends StatelessWidget {
  ProductContainerContent(this.context, this.viewModel);
  
  final ProductViewModel viewModel;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(10.0),
        child: new ListView.builder(
          itemCount: viewModel.products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = viewModel.products[index];

            return new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: new Text(
                          product.name,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Text(
                        'Código: ${product.code}',
                        style: new TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                new Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                new Text(product.quantity.toString()),
                new Divider(
                  height: 50.0,
                )
              ],
            );
          },
        )
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new ProductForm()
          ));
        },
      ),
    );
  }

}