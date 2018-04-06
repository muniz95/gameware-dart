import 'package:flutter/material.dart';
import 'package:gameware/routes.dart';

void main() => runApp(new GamewareApp());

class GamewareApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: routes,
    );
  }
}
