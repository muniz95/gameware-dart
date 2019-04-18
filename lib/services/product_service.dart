import 'package:gameware/models/product_model.dart';
import 'package:gameware/utils/db.dart';
import 'package:sqflite/sqflite.dart';

class ProductService {
  Database _db;

  ProductService() {
    DatabaseHelper().db.then((database) => _db = database);
  }

  Future init() async {
    _db = await DatabaseHelper().db;
  }

  Future<List<Product>> getAll() async {
    List<Product> products = new List<Product>();
    List<Map> productRaw = await _db.query("Product");
    
    if (productRaw.length > 0) {
      productRaw.forEach((product) {
        products.add(new Product.map(product));
      });
    }

    return products;
  }
}