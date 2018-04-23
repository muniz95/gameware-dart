import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gameware/data/DBHelper.dart';
import 'package:gameware/models/Product.dart';
import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/redux/product/ProductActions.dart';

class ProductForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _code;
  int _quantity;
  ProductCategory _category;

  _ProductFormState();

  void _submit() {
    final form = formKey.currentState;
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (form.validate()) {
      form.save();
      Product product = new Product(
        name: _name,
        quantity: _quantity,
        category: _category,
        code: _code
      );

      setState(() => _isLoading = false);
      var db = new DatabaseHelper();
      db.saveProduct(product)
      .then((res) {
        var store = StoreProvider.of<AppState>(context);
        store.dispatch(new AddProductToList(product));
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
    var loginForm = new Column(
      children: <Widget>[
        new Text(
          "Signup App",
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
}