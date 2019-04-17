import 'package:flutter/material.dart';
import 'package:gameware/bloc/login_bloc.dart';
import 'package:gameware/bloc/provider.dart';

class HomePartial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return new Container(
      child: new Center(
        child: new Text("Welcome home, ${bloc.loggedUser.name}!"),
      ),
    );
  }
}