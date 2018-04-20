import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/redux/app/AppState.dart';

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
    return new Container(
      child: new Center(
        child: new Text("Welcome product, ${viewModel.user.name}!"),
      ),
    );
  }

}