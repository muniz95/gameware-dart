import 'package:flutter/material.dart';
import 'package:gameware/views/product/ProductViewModel.dart';

class ProductListContainer extends StatelessWidget {
  ProductListContainer(this.context, this.viewModel);
  
  final ProductViewModel viewModel;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text("Welcome home, ${viewModel.currentProduct.name}!"),
      ),
    );
  }
}