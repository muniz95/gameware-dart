import 'dart:async';

import 'package:gameware/redux/app/AppState.dart';
// import 'package:gameware/redux/product/ProductActions.dart';
import 'package:redux/redux.dart';

class ProductMiddleware extends MiddlewareClass<AppState> {
  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    // if(action is AddProductToList) {
    //   next(new AddProductToList(action.product));
    // }

    // if(action is RemoveProductFromList) {
    //   next(new RemoveProductFromList(action.product));
    // }

    // if(action is SetCurrentProduct) {
    //   next(new SetCurrentProduct(action.product));
    // }

    // if(action is UnsetCurrentProduct) {
    //   next(new UnsetCurrentProduct());
    // }

    // if(action is RemoveAllProducts) {
    //   next(new RemoveAllProducts());
    // }

    // if(action is ErrorSettingProductAction) {
    //   next(new ErrorSettingProductAction());
    // }
  }

}