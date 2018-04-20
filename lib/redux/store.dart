import 'dart:async';

import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/redux/app/AppReducer.dart';
import 'package:gameware/redux/product/ProductMiddleware.dart';
import 'package:gameware/redux/user/UserMiddleware.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return new Store(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
    middleware: [
      new ProductMiddleware(),
      new UserMiddleware(),
    ]
  );
}