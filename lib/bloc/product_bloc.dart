import 'package:gameware/bloc/provider.dart';
import 'package:gameware/models/product_model.dart';
import 'package:gameware/services/product_service.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc extends BlocBase {
  ProductService _service;

  ProductBloc() {
    _service = ProductService();
  }

  final BehaviorSubject<List<Product>> _products = BehaviorSubject<List<Product>>.seeded([]);
  final _product = BehaviorSubject<Product>();

  Function(Product) get addToList => (product) {
    _products.sink.add(_products.value..add(product));
  };

  Stream<List<Product>> get products => _products.stream;
  Product get product => _product.value;

  init() async {
    await _service.init();
    _products.add(await _service.getAll());
  }

  @override
  void dispose() {
    _products.close();
    _product.close();
  }
  
}