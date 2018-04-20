import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameware/redux/app/app_state.dart';
import 'package:gameware/redux/common_actions.dart';
import 'package:gameware/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:gameware/routes.dart';
import 'package:flutter_redux/flutter_redux.dart';

Future<Null> main() async {
  var store = await createStore();
  runApp(new GamewareApp(store));
}

class GamewareApp extends StatefulWidget {
  GamewareApp(this.store);
  final Store<AppState> store;

  @override
  State<StatefulWidget> createState() => new _GamewareAppState();

}

class _GamewareAppState extends State<GamewareApp> {
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(new InitAction());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primaryColor: const Color(0XFF4F43AE),
        ),
        routes: routes,
      )
    );
  }
}
