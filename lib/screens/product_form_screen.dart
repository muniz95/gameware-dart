import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gameware/bloc/login_bloc.dart';
import 'package:gameware/bloc/product_bloc.dart';
import 'package:gameware/bloc/provider.dart';
import 'package:gameware/models/product_model.dart';
import 'package:gameware/utils/db.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _code;
  int _quantity;
  ProductCategory _category;
  ProductBloc _productBloc = new ProductBloc();

  _ProductFormScreenState();

  void _submit() {
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    final form = formKey.currentState;
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (form.validate()) {
      form.save();
      Product product = new Product(
        name: _name,
        quantity: _quantity,
        category: _category,
        code: _code,
        user: _loginBloc.loggedUser,
      );

      setState(() => _isLoading = false);
      var db = new DatabaseHelper();
      db.saveProduct(product)
      .then((res) {
        _productBloc.addToList(product);
        _showSnackBar('Produto cadastrado com sucesso!');
        new Future.delayed(new Duration(seconds: 3)).then((_) {
          Navigator.of(_ctx).pop("/home");
        });
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
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Salvar"),
    );
    var loginForm = _buildLoginForm(loginBtn);

    return new Scaffold(
      appBar: new AppBar(),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                child: loginForm,
                height: 400.0,
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

  Column _buildLoginForm(RaisedButton loginBtn) {
    return new Column(
      children: <Widget>[
        new Text(
          "Novo produto",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _name = val,
                  validator: (val) {
                    return val.length < 1
                        ? "Name must have atleast 1 chars"
                        : null;
                  },
                  decoration: new InputDecoration(labelText: "Nome"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _quantity = int.parse(val),
                  decoration: new InputDecoration(labelText: "Quantidade"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _code = val,
                  decoration: new InputDecoration(labelText: "Cód; produto"),
                ),
              ),
            ],
          ),
        ),
        _isLoading ? new CircularProgressIndicator() : loginBtn
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}