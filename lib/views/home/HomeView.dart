import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/redux/app/app_state.dart';

import 'package:gameware/views/home/HomePresenter.dart';

import '../../Assets.dart';
import '../../widgets/Header.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomePresenter>(
      distinct: true,
      converter: (store) => HomePresenter.fromStore(store),
      builder: (_, presenter) => new HomeViewContent(presenter),
    );
  }
}

class HomeViewContent extends StatelessWidget {
  BuildContext _ctx;
  HomeViewContent(this.presenter);
  final HomePresenter presenter;

  Future<Null> _logout() async {
    // var db = new DatabaseHelper();
    // await db.saveUser(user);
    // var authStateProvider = new AuthStateProvider();
    // authStateProvider.notify(AuthState.LOGGED_OUT);
    presenter.logout();
    Navigator.of(_ctx).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${presenter.user.username}"),
        actions: <Widget>[
          new PopupMenuButton<IconButton>(
            itemBuilder: (BuildContext context) {
              Assets.buttons.map((button) {
                return new PopupMenuItem<IconButton>(
                    value: button,
                    child: new Text(''),
                  );
              });
            },
          )
        ],
      ),
      body: new Center(
        child: new Text("Welcome home, ${presenter.user.username}!"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.outlined_flag),
        onPressed: _logout,
      ),
    );
  }

}