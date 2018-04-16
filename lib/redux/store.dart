import 'dart:async';

import 'package:gameware/redux/app/app_state.dart';
import 'package:gameware/redux/app/app_reducer.dart';
import 'package:gameware/redux/user/user_middleware.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return new Store(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
    middleware: [
      new UserMiddleware(),
    ]
  );
}