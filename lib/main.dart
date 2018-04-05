import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:gameware/redux/actions/actions.dart';
import 'package:gameware/redux/state.dart';
import 'package:gameware/redux/reducers/user_reducer.dart';
import 'package:gameware/redux/middlewares/user_middleware.dart';
import 'package:gameware/routes.dart';
import 'package:redux_epics/redux_epics.dart';

void main() => runApp(new GamewareApp());

class GamewareApp extends StatelessWidget {
  final store = new Store<AppState>(
    appStateReducer,
    initialState: new AppState(),
    middleware: [new EpicMiddleware(allEpics)],
  );
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
