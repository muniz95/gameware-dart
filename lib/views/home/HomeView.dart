import 'package:flutter/material.dart';
import 'package:gameware/auth.dart';

class HomeView extends StatelessWidget {
  BuildContext _ctx;

  _logout() async {
    // var db = new DatabaseHelper();
    // await db.saveUser(user);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_OUT);
    Navigator.of(_ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    this._ctx = context;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Home"),),
      body: new Center(
        child: new Text("Welcome home!"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.outlined_flag),
        onPressed: _logout,
      ),
    );
  }

}