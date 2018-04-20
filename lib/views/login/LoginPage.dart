import 'dart:ui' as DartUI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/data/DBHelper.dart';
import 'package:gameware/redux/app/AppState.dart';

import 'package:gameware/redux/user/UserActions.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;

  _LoginPageState();

  void _submit() {
    final form = formKey.currentState;
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    setState(() => _isLoading = true);

    if (form.validate()) {
      form.save();
      setState(() => _isLoading = false);
      var db = new DatabaseHelper();
      db.isLoggedIn(_username, _password)
      .then((loggedUser) {
        if (loggedUser != null) {
          var store = StoreProvider.of<AppState>(context);
          store.dispatch(new UserLoginAction(loggedUser));
          Navigator.of(_ctx).pushReplacementNamed("/home");
        } else {
          _showSnackBar('Usuário ou senha incorretos!');
        }
      })
      .catchError((err) {
        _showSnackBar('Error: $err');
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    RaisedButton loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login", style: const TextStyle(color: Colors.black),),
      color: Colors.primaries[0],
    );
    RaisedButton signupBtn = new RaisedButton(
      onPressed: () {
        Navigator.of(_ctx).pushNamed("/signup");        
      },
      child: new Text("Registrar", style: const TextStyle(color: Colors.black),),
      color: Colors.primaries[0],
    );
    var loginForm = new Column(
      children: <Widget>[
        new Text(
          "Gameware",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  validator: (val) {
                    return val.length < 1
                        ? "Username must have atleast 1 chars"
                        : null;
                  },
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  obscureText: true,
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              ),
            ],
          ),
        ),
        new ButtonTheme.bar(
          child: new ButtonBar(
            children: <Widget>[
              _isLoading ? new CircularProgressIndicator() : loginBtn,
              signupBtn,
            ],
            alignment: MainAxisAlignment.center,
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    return new Scaffold(
      appBar: null,
      key: scaffoldKey,
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/login_background.jpg"),
              fit: BoxFit.cover),
        ),
        child: new Center(
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new DartUI.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                child: loginForm,
                height: 300.0,
                width: 300.0,
                decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.2)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}