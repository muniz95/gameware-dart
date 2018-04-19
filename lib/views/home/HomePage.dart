import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/redux/app/app_state.dart';

import 'package:gameware/views/home/HomeViewModel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeViewModel>(
      distinct: true,
      converter: (store) => HomeViewModel.fromStore(store),
      builder: (context, viewModel) => new HomePageContent(context, viewModel),
    );
  }
}

class HomePageContent extends StatelessWidget {
  HomePageContent(this.context, this.viewModel);
  
  final HomeViewModel viewModel;
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
      body: new Center(
        child: new Text("Welcome home, ${viewModel.user.name}!"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.exit_to_app),
        onPressed: _logout,
      ),
    );
  }

}