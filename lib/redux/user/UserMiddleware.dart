import 'dart:async';

import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/redux/user/UserActions.dart';
import 'package:redux/redux.dart';

class UserMiddleware extends MiddlewareClass<AppState> {
  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    // next(action);

    if(action is SettingUserAction) {
      next(new SettingUserAction(action.user));
    }

    if(action is UserLoginAction) {
      next(new UserLoginAction(action.user));
    }

    if(action is ErrorSettingUserAction) {
      next(new ErrorSettingUserAction());
    }

    if(action is UserLogoutAction) {
      next(new UserLogoutAction());
    }
  }

}