import 'package:gameware/models/Product.dart';
import 'package:gameware/redux/product/ProductActions.dart';
import 'package:gameware/redux/product/ProductState.dart';
import 'package:redux/redux.dart';

final productReducer = combineReducers<ProductState>([
  new TypedReducer<ProductState, AddProductToList>(_addProductToList),
  new TypedReducer<ProductState, LoadProductList>(_loadProductList),
  new TypedReducer<ProductState, RemoveProductFromList>(_removeProductFromList),
  new TypedReducer<ProductState, SetCurrentProduct>(_setCurrentProduct),
  new TypedReducer<ProductState, UnsetCurrentProduct>(_unsetCurrentProduct),
  new TypedReducer<ProductState, RemoveAllProducts>(_removeAllProducts),
  new TypedReducer<ProductState, ErrorSettingProductAction>(_errorSettingProductAction),
]);

ProductState _addProductToList(ProductState state, AddProductToList action) {
  List<Product> products = state.products;
  products.add(action.product);
  return state.copyWith(products: products);
}

ProductState _loadProductList(ProductState state, LoadProductList action) {
  return state.copyWith(products: action.products);
}

ProductState _removeProductFromList(ProductState state, RemoveProductFromList action) {
  return state.copyWith(product: action.product);
}

ProductState _setCurrentProduct(ProductState state, SetCurrentProduct action) {
  return state.copyWith(product: new Product());
}

ProductState _unsetCurrentProduct(ProductState state, UnsetCurrentProduct action) {
  return state.copyWith(product: null);
}

ProductState _removeAllProducts(ProductState state, RemoveAllProducts action) {
  return state.copyWith(product: new Product());
}

ProductState _errorSettingProductAction(ProductState state, ErrorSettingProductAction action) {
  return state.copyWith(product: null);
}