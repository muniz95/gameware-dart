import 'package:gameware/bloc/provider.dart';
import 'package:gameware/models/product_model.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc extends BlocBase {
  final _products = BehaviorSubject<List<Product>>.seeded([]);
  final _product = BehaviorSubject<Product>();

  Function(Product) get addToList => (product) {
    _products.sink.add(_products.value..add(product));
  };

  Product get product => _product.stream.value;

  @override
  void dispose() {
    _products.close();
    _product.close();
  }
  
}