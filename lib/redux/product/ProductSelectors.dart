import 'package:gameware/models/Product.dart';
import 'package:gameware/redux/app/AppState.dart';

Product productSelector(AppState state) {
  var product = state.productState.product;

  return product;
}