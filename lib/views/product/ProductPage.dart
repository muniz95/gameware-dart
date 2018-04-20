import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/redux/app/app_state.dart';

import 'package:gameware/views/product/ProductViewModel.dart';
import 'package:gameware/widgets/Drawer.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ProductViewModel>(
      distinct: true,
      converter: (store) => ProductViewModel.fromStore(store),
      builder: (context, viewModel) => new ProductPageContent(context, viewModel),
    );
  }
}

class ProductPageContent extends StatelessWidget {
  ProductPageContent(this.context, this.viewModel);
  
  final ProductViewModel viewModel;
  final BuildContext context;

  Future<Null> _logout() async {
    viewModel.logout();
    Navigator.of(context).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${viewModel.user.username}"),
      ),
      drawer: buildDrawer(context),
      body: new Center(
        child: new Text("Welcome product, ${viewModel.user.name}!"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.exit_to_app),
        onPressed: _logout,
      ),
    );
  }

}