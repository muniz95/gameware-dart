import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginViewState();  
}

class _LoginViewState extends State<LoginView> {
  bool _logged = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        title: new Text('Login'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(this._logged ? 'Autenticado' : 'Não autenticado'),
            new IconButton(
              icon: new Icon(Icons.input),
              color: Colors.red,
              onPressed: () {
                setState(() => this._logged = !this._logged);
              },
            )
          ]
        ),
      ),
    );
  }
  
}