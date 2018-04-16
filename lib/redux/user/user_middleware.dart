import 'dart:async';

import 'package:gameware/redux/app/app_state.dart';
import 'package:gameware/redux/user/user_actions.dart';
import 'package:redux/redux.dart';

class UserMiddleware extends MiddlewareClass<AppState> {
  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    if(
      action is SettingUserAction ||
      action is UserLoginAction ||
      action is ErrorSettingUserAction
    ) {
      await _handleUserSet(store, action, next);
    }
  }

  Future<Null> _handleUserSet(Store<AppState> store, action, NextDispatcher next) async {
    next(new SettingUserAction(user: action));
  }

}