import 'dart:ui' as DartUI;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameware/bloc/login_bloc.dart';
import 'package:gameware/bloc/provider.dart';
import 'package:gameware/utils/db.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  _LoginScreenState();

  _submit(LoginBloc bloc) {
    final form = formKey.currentState;
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    setState(() => _isLoading = true);

    if (form.validate()) {
      form.save();
      setState(() => _isLoading = false);
      var db = new DatabaseHelper();
      String username = bloc.username;
      String password = bloc.password;
      db.isLoggedIn(username, password)
      .then((loggedUser) {
        if (loggedUser != null) {
          bloc.authenticate(loggedUser);
          Navigator.of(context).pushReplacementNamed("/home");
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
    LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
    RaisedButton loginBtn = new RaisedButton(
      onPressed: () => _submit(_bloc),
      child: new Text("Login", style: const TextStyle(color: Colors.black),),
      color: Color(0XFF514689),
    );
    RaisedButton signupBtn = new RaisedButton(
      onPressed: () {
        Navigator.of(context).pushNamed("/signup");        
      },
      child: new Text("Registrar", style: const TextStyle(color: Colors.black),),
      color: Color(0XFFA7A4E0),
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
                  onSaved: _bloc.setUsername,
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
                  onSaved: _bloc.setPassword,
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
          color: Color(0XFFB2B4B2),
        ),
        child: new Center(
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new DartUI.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                child: loginForm,
                height: 300.0,
                width: 300.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}