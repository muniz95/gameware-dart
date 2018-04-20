import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/redux/product/ProductReducer.dart';
import 'package:gameware/redux/user/UserReducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    userState: userReducer(state.userState, action),
    productState: productReducer(state.productState, action),
  );
}