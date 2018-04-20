import 'package:gameware/redux/product/ProductState.dart';
import 'package:gameware/redux/user/UserState.dart';
import 'package:meta/meta.dart';

class AppState {
  AppState({
    @required this.userState,
    @required this.productState,
  });

  final UserState userState;
  final ProductState productState;

  factory AppState.initial() {
    return new AppState(
      userState: new UserState.initial(),
      productState: new ProductState.initial(),
    );
  }

  AppState copyWith({
    UserState userState,
    ProductState productState,
  }) {
    return new AppState(
      userState: userState,
      productState: productState,
    );
  }

  @override
  bool operator == (Object other) =>
    identical(this, other) || other is AppState &&
      userState == other.userState &&
      productState == other.productState;

  @override
  int get hashCode =>
    userState.hashCode ^
    productState.hashCode;
}