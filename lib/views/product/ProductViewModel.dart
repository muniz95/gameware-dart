import 'package:gameware/models/Product.dart';
import 'package:gameware/redux/app/AppState.dart';
import 'package:gameware/redux/product/ProductActions.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class ProductViewModel {
  ProductViewModel({
    @required this.currentProduct,
    @required this.products,
    @required this.setCurrentProduct,
  });

  final Product currentProduct;
  final List<Product> products;
  final Function setCurrentProduct;

  static ProductViewModel fromStore(Store<AppState> store) {
    return new ProductViewModel(
      currentProduct: store.state.productState.product,
      products: store.state.productState.products,
      setCurrentProduct: (product) => store.dispatch(new SetCurrentProduct(product)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductViewModel &&
              runtimeType == other.runtimeType &&
              currentProduct == other.currentProduct &&
              products == other.products &&
              setCurrentProduct == other.setCurrentProduct;

  @override
  int get hashCode =>
      currentProduct.hashCode ^
      products.hashCode ^
      setCurrentProduct.hashCode;
}
