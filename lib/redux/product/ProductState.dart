import 'package:gameware/models/Product.dart';
import 'package:meta/meta.dart';

@immutable
class ProductState {
  ProductState({
    @required this.product,
    @required this.products,
  });

  final Product product;
  final List<Product> products;

  factory ProductState.initial() {
    return new ProductState(
      product: new Product(),
      products: <Product>[],
    );
  }

  ProductState copyWith({
    Product product,
    List<Product> products,
  }) {
    return new ProductState(
      product: product ?? this.product,
      products: products ?? this.products,
    );
  }

  @override
  bool operator == (Object other) =>
    identical(this, other) || other is ProductState &&
      product == other.product &&
      products == other.products;

  @override
  int get hashCode =>
    product.hashCode ^
    products.hashCode;
}