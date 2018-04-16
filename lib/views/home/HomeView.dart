import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/redux/app/app_state.dart';

import 'HomeViewModel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeViewModel>(
      distinct: true,
      converter: (store) => HomeViewModel.fromStore(store),
      builder: (_, viewModel) => new HomeViewContent(viewModel),
    );
  }
}

class HomeViewContent extends StatelessWidget {
  BuildContext _ctx;
  HomeViewContent(this.viewModel);
  final HomeViewModel viewModel;

  _logout() async {
    // var db = new DatabaseHelper();
    // await db.saveUser(user);
    // var authStateProvider = new AuthStateProvider();
    // authStateProvider.notify(AuthState.LOGGED_OUT);
    viewModel.logout();
    Navigator.of(_ctx).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${viewModel.user.username}"),
      ),
      body: new Center(
        child: new Text("Welcome home, ${viewModel.user.username}!"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.outlined_flag),
        onPressed: _logout,
      ),
    );
  }

}