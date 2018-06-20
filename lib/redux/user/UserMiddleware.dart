import 'dart:async';

import 'package:gameware/data/DBHelper.dart';
import 'package:gameware/models/Product.dart';
import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/redux/user/UserActions.dart';
import 'package:redux/redux.dart';

import '../product/ProductActions.dart';

class UserMiddleware extends MiddlewareClass<AppState> {
  UserMiddleware(this.db);

  final DatabaseHelper db;

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    // if(action is SettingUserAction) {
    //   next(new SettingUserAction(action.user));
    // }

    if(action is UserLoginAction) {
      List<Product> products = await db.getProductsByUser(action.user.id);
      next(new LoadProductList(products));
    }

    // if(action is ErrorSettingUserAction) {
    //   next(new ErrorSettingUserAction());
    // }

    // if(action is UserLogoutAction) {
    //   next(new UserLogoutAction());
    // }
  }

}